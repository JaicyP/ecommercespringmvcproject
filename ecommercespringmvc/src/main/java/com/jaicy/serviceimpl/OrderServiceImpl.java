package com.jaicy.serviceimpl;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.Month;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jaicy.dao.AddressRepository;
import com.jaicy.dao.CartItemRepository;
import com.jaicy.dao.OrderItemRepository;
import com.jaicy.dao.OrderRepository;
import com.jaicy.dto.PlaceOrderDto;
import com.jaicy.entity.Address;
import com.jaicy.entity.CartItem;
import com.jaicy.entity.OrderItem;
import com.jaicy.entity.OrderStatus;
import com.jaicy.entity.Orders;
import com.jaicy.entity.PaymentStatus;
import com.jaicy.entity.User;
import com.jaicy.service.CartService;
import com.jaicy.service.OrderService;

import jakarta.servlet.http.HttpSession;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	AddressRepository addressRepository;
	 
	@Autowired
	CartService cartService;
	
	@Autowired
	CartItemRepository cartItemRepository;
	
	@Autowired
	OrderRepository orderRepository ;
	
	@Autowired
	OrderItemRepository orderItemRepository;
	
	@Override
	public void proceedToBuy(HttpSession session, Model model) {
		User user=null;
		if(session!=null) {
			user=(User) session.getAttribute("user");
		}
		List<Address> addressList=addressRepository.addressByUserId(user.getUserId());
		List<CartItem> cartItem = cartItemRepository.findCartItemByCartId(user.getCart().getCartId());
		Address address=null;
		for(Address adr:addressList) {
			if(adr.isDefault()) address=adr;
		}
		model.addAttribute("address",address);
		model.addAttribute("cartItem",cartItem);
	}

	@Override
	public void createOrder(int cartId, HttpSession session,Model model) {
		
		User user=null;
		Double totalPrice=null;
		if(session!=null) {
			user=(User) session.getAttribute("user");
		}
		List<Address> addressList=addressRepository.addressByUserId(user.getUserId());
		Map<String,Object> map=cartService.calculateTotalPrice(cartId);
		if (map != null || !map.isEmpty()) {
			totalPrice = (Double) map.values().iterator().next();
		}
		
		Address address=null;
		for(Address adr:addressList) {
			if(adr.isDefault()) address=adr;
		}
		Orders order=new Orders();
		order.setUser(user);
		order.setAddress(address);
		order.setTotalAmount(totalPrice);
		order.setOrderStatus(OrderStatus.PENDING);
		order.setPaymentStatus(PaymentStatus.PENDING);
		order.setCreatedAt(LocalDateTime.now());
		Orders savedOrder=orderRepository.save(order);
		StringBuffer deliveryDates=this.convertingTimeDate(savedOrder.getCreatedAt());
		List<OrderItem> orderItems=this.createOrderItems(user,savedOrder);
		model.addAttribute("address",address);
		model.addAttribute("orderItems", orderItems);
		model.addAttribute("order",savedOrder);
		model.addAttribute("dates",deliveryDates);
	}

	@Override
	public  List<OrderItem> createOrderItems(User user, Orders order) {
		List<CartItem> cartItem = cartItemRepository.findCartItemByCartId(user.getCart().getCartId());
		for(CartItem ci:cartItem) {
		  OrderItem orderItem=new OrderItem();
		  orderItem.setOrders(order);
		  orderItem.setProduct(ci.getProduct());
		  orderItem.setPrice(ci.getProduct().getPrice());
		  orderItem.setQuantity(ci.getQuantity());
		  orderItemRepository.save(orderItem);
		}
		List<OrderItem> newOrderItem =orderItemRepository.getOrderItemsByOrderId(order.getOrderId());
		return newOrderItem;
	}
	
	
	public StringBuffer convertingTimeDate(LocalDateTime date) {
		Random random=new Random();
		StringBuffer string=new StringBuffer();
		int randomNumber = random.nextInt(10) + 1;
	    int day=date.getDayOfMonth();
	    Month month=date.getMonth();
	    LocalDateTime addedDate=date.plusDays(randomNumber);
	    int newDay=addedDate.getDayOfMonth();
	    Month newMonth=addedDate.getMonth();
	    string.append(day+" ");
	    string.append(month.toString().subSequence(0,3).toString().toLowerCase()+" ");
	    string.append(" - ");
	    string.append(newDay+" ");
	    string.append(newMonth.toString().subSequence(0,3).toString().toLowerCase()+" ");
	    return string;
	}

	@Override
	public void removeIconFunction(int orderItemId,Model model) {
		OrderItem item=orderItemRepository.findById(orderItemId).get();
		Orders order=orderItemRepository.getOrderByOrderId(item.getOrderItemId());
		model.addAttribute("reitem", item);
		model.addAttribute("address",order.getAddress());
		model.addAttribute("orderItems",orderItemRepository.getOrderItemsByOrderId(order.getOrderId()) );
		model.addAttribute("order",order);
		model.addAttribute("dates",this.convertingTimeDate(order.getCreatedAt()));
	}

	@Override
	public void removeProductFromOrderItem(int orderItemId, Model model,HttpSession session) {
		Orders order=orderItemRepository.getOrderByOrderId(orderItemId);
		orderItemRepository.deleteById(orderItemId);
		User user=null;
		if(session!=null) {
			user=(User) session.getAttribute("user");
		}
		List<Address> addressList=addressRepository.addressByUserId(user.getUserId());

		Address address=null;
		for(Address adr:addressList) {
			if(adr.isDefault()) address=adr;
		}
		model.addAttribute("address",address);
		model.addAttribute("orderItems",orderItemRepository.getOrderItemsByOrderId(order.getOrderId()) );
		model.addAttribute("order",order);
		model.addAttribute("dates",this.convertingTimeDate(order.getCreatedAt()));
		
	}

	@Override
	public Map<String, Object> calculateTotalPrice(int orderId) {
		List<OrderItem> orderItem=orderItemRepository.findOrderItemByOrderId(orderId);
		double totalPrice=0;
		for(OrderItem oi:orderItem) {
//			if(oi.getProduct().getStockQuantity()==0) {
//				oi.setQuantity(0);
//			}
			totalPrice +=(oi.getProduct().getPrice()*oi.getQuantity());
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("total", totalPrice);
		return map;
	}

	@Override
	public void placeOrder(PlaceOrderDto placeOrderDto,Model model) {
		int orderId=placeOrderDto.getId();
		String paymentType=placeOrderDto.getPayment();
		Orders order=orderRepository.findById(orderId).get();
		if(order!=null) {
			order.setOrderStatus(OrderStatus.SHIPPED);
			order.setPaymentStatus(PaymentStatus.DONE);
			order.setPaymentMode(paymentType);
			orderRepository.save(order);
			System.out.println("hello");
		}
		model.addAttribute("id", orderId);
		System.out.println("updated");
	}

	@Override
	public void checkOut(int orderId, Model model) {
		Orders order=orderRepository.findById(orderId).get();
		model.addAttribute("orderItems",orderItemRepository.getOrderItemsByOrderId(orderId));
		model.addAttribute("order",order);
		model.addAttribute("dates",this.convertingTimeDate(order.getCreatedAt()));
		
	}
	


}
