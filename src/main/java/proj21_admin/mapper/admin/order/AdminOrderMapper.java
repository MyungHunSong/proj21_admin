package proj21_admin.mapper.admin.order;

import java.util.List;
import java.util.Map;

import proj21_admin.dto.order.OrderDTO;

public interface AdminOrderMapper {
	
	// 주문이 있는지 없는지 확인
	String atLeastOneOrder();
	
	// 총 판매 금액
	int getTotalRevenue();
	
	// 총 주문 건수
	int getTotalOrderCount();
	
	// 총 주문 수
	int selectTotalOrders();
	
	// 배송 준부 중 수
	int selectAllWaitingDelivery();
	
	// 배송 중 수
	int selectAllOnDelivery();
	
	// 배송 완료 수
	int selectAllTotDoneDelivery();
	
	// 환불 완료 수
	int selectAllDoneRefund();
	
	// 환불 대기 수
	int selectAllWaitingRefund();
	
	List<OrderDTO> selectOrderList(Map<String, Object> pagingMap);
	
	//CRUD
	int updateDelivery(Map<String, Object> changeMap);
	
	int deleteOrder(Map<String, Object> requestMap);
	
	int setUpRefund(Map<String, Object> requestMap);
	
	int selectedTotal(Map<String, Object> pagingMap);
	
	int selectAverageOrder(String memberId);
	
	String haveOrdered(String orderMemberId);
	
	String onDelivery(Map<String, Object> map);
	
	List<OrderDTO> get_OrderList(Map<String, Object> map);
	
	String haveRefunded(Map<String, Object> map);
	
	String onRefund(Map<String, Object> map);	
}
