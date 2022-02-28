package proj21_admin.service.admin.order;

import java.util.Map;

public interface AdminOrderService {
	Map<String, Object> getOrderStatics();
	
	Map<String, Object> getOrderList(Map<String, Object> paginMap);
	
	int changeDelivery(Map<String, Object> changeMap);
	
	void addRefund(Map<String, Object> requestMap);
}
