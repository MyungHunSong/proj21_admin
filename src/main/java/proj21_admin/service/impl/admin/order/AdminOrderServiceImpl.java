package proj21_admin.service.impl.admin.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_admin.dto.order.OrderDTO;
import proj21_admin.mapper.admin.member.AdminMemberMapper;
import proj21_admin.mapper.admin.order.AdminOrderMapper;
import proj21_admin.service.admin.order.AdminOrderService;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {

	@Autowired
	private AdminOrderMapper adminOrderMapper;
	
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	

	@Override
	public Map<String, Object> getOrderStatics() {
		
		Map<String, Object> viewMap = new HashMap<String, Object>();
		
		// 1. 총수익, 주문수, 총 제품 주문수, 환불 완료수
		int totalRevenue = 0;
		int totalOrderCount = 0;
		int totOrders = 0;
		int totDoneRefundDelivery = 0;
		
		String orderExist = adminOrderMapper.atLeastOneOrder();
		
		// order존재 true면
		if(orderExist.equals("true")) {
			totalRevenue = adminOrderMapper.getTotalRevenue();
			totalOrderCount = adminOrderMapper.getTotalOrderCount();
			totOrders = adminOrderMapper.selectTotalOrders();
			totDoneRefundDelivery = adminOrderMapper.selectAllDoneRefund();
		}
		
		viewMap.put("totalRevenue", totalRevenue);
		viewMap.put("totalOrderCount", totalOrderCount);
		viewMap.put("totOrders", totOrders);
		viewMap.put("totDoneRefundDelivery", totDoneRefundDelivery);
		return viewMap;
	}

	@Override
	public Map<String, Object> getOrderList(Map<String, Object> paginMap) {
		Map<String,Object> viewMap = new HashMap();
		
		int totOrders = 0;
		int totOnDelivery = 0;
		int totDoneDelivery = 0;
		int selectedTotal = 0;
		int totWaitingRefundDelivery =0; 
		int totDoneRefundDelivery = 0;
		int totWaitingDelivery=0;
		
		// orderList 가져오기
		List<OrderDTO> orderList = adminOrderMapper.selectOrderList(paginMap);
		
		totOrders=adminOrderMapper.selectTotalOrders();
		totOnDelivery = adminOrderMapper.selectAllOnDelivery();
		totWaitingDelivery = adminOrderMapper.selectAllWaitingDelivery();
		totDoneDelivery = adminOrderMapper.selectAllTotDoneDelivery();
		totWaitingRefundDelivery = adminOrderMapper.selectAllWaitingRefund();
		totDoneRefundDelivery = adminOrderMapper.selectAllDoneRefund();
		selectedTotal = adminOrderMapper.selectedTotal(paginMap);
		
		viewMap.put("orderList", orderList);
		viewMap.put("totOrders", totOrders);
		viewMap.put("totWaitingDelivery", totWaitingDelivery);
		viewMap.put("totOnDelivery", totOnDelivery);
		viewMap.put("totDoneDelivery", totDoneDelivery);
		viewMap.put("totWaitingRefundDelivery", totWaitingRefundDelivery);
		viewMap.put("totDoneRefundDelivery", totDoneRefundDelivery);
		viewMap.put("selectedTotal", selectedTotal);
		
		return viewMap;
	}

	@Override
	@Transactional
	public int changeDelivery(Map<String, Object> changeMap) {
		int res = adminOrderMapper.updateDelivery(changeMap);
		if(changeMap.get("change_deliveryStatus").equals("반품완료")) {
			res += adminMemberMapper.updateMember(changeMap);
			// res += adminProductMapper.updateProduct2(changeMap);
		}
		return res;
	}

	@Override
	public void addRefund(Map<String, Object> requestMap) {
		// 배송완료 -> 반품 대기중으로 변환
		String waitingRefund = "반품대기중";
		requestMap.put("waitingRefund", waitingRefund);
		adminOrderMapper.setUpRefund(requestMap);		
	}
	
}
