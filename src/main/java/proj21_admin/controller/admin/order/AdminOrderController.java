package proj21_admin.controller.admin.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_admin.service.admin.member.AdminMemberService;
import proj21_admin.service.admin.order.AdminOrderService;

@Controller
@RequestMapping("admin/order/")
public class AdminOrderController {
	
	protected static final Log log = LogFactory.getLog(AdminOrderController.class);
	
	@Autowired
	private AdminOrderService adminOrderService; 
	
	@Autowired
	private AdminMemberService adminMemberService;
		
	@RequestMapping("orderStatics")
	public ModelAndView searchMember(HttpServletRequest request, HttpServletResponse response){
		log.info("=== orderStatics() 진입. ===");
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> viewMap = adminOrderService.getOrderStatics();
		mav.setViewName("admin/order/orderStatics");
		
		// addObject로 지정한 viewMap은 jsp에서 사용할수 있음.
		mav.addObject("viewMap", viewMap);
		mav.addObject("viewMap2", adminMemberService.getMemberStatics());
		System.out.println(mav);
		return mav;
	}
	
	// 대망의 listOrders, listOrderPage를 위한
	@RequestMapping("listOrders")
	public ModelAndView listOrders(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="orderProNum", required=false) String orderProNum,
			@RequestParam(value="total", required=false) String total,
			@RequestParam(value="orderMemberName", required=false) String orderMemberName,
			@RequestParam(value="deliveryStatus", required=false) String deliveryStatus,
			@RequestParam(value="orderPrice", required=false) String orderPrice,
			@RequestParam(value="orderValue", required=false) String orderValue,
			@RequestParam(value="change_deliveryStatus", required=false) String change_deliveryStatus,
			@RequestParam(value="change_orderProNum", required=false) String change_orderProNum,
			@RequestParam(value="change_orderCode", required=false) String change_orderCode,
			@RequestParam(value="change_orderProQuantity", required=false) String change_orderProQuantity,
			@RequestParam(value="change_orderValue", required=false) String change_proNum,
			@RequestParam(value="change_orderValue", required=false) String change_orderValue,
			@RequestParam(value="change_orderMemberId", required=false) String change_orderMemberId
			) {
		log.info("==== listOrders() 진입 ====");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("side_menu") != null) {
			session.removeAttribute("side_menu");
		}
		session.setAttribute("side_menu", "side_order");
		System.out.printf("session에 %s가 들어왔다 : %n ", session.getAttribute("authInfo"));
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		
		int section= Integer.parseInt((_section == null) ? "1" : _section);
		int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);		
		
		// 배송상태 수정
		changeDelivery(change_deliveryStatus, change_orderProNum, change_orderCode, change_orderProQuantity,
				change_proNum, change_orderValue, change_orderMemberId);
		
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum );
		pagingMap.put("total", total );
		pagingMap.put("orderProNum", orderProNum);
		pagingMap.put("orderMemberName", orderMemberName );
		pagingMap.put("deliveryStatus", deliveryStatus );
		pagingMap.put("orderPrice", orderPrice );
		pagingMap.put("orderValue", orderValue );
		
		Map<String, Object> viewMap = adminOrderService.getOrderList(pagingMap);
		
		viewMap.put("orderProNum", orderProNum);
		viewMap.put("section", section );
		viewMap.put("pageNum", pageNum);
		viewMap.put("total", total );
		viewMap.put("orderMemberName", orderMemberName );
		viewMap.put("deliveryStatus", deliveryStatus );
		viewMap.put("orderPrice", orderPrice );
		viewMap.put("orderValue", orderValue);
		
		// viewMap.jsp 배송중인 상품 갯수
		mav.addObject("viewMap", viewMap);
		mav.setViewName("admin/order/listOrders");
		
		return mav;
	}
	
	
	//배송상태 수정 메서드
	private void changeDelivery(String change_deliveryStatus, String change_orderProNum, String change_orderCode,
			String change_orderProQuantity, String change_proNum, String change_orderValue,
			String change_orderMemberId) {
		if (change_deliveryStatus != null) {
			System.out.println("change_deliveryStatus : " + change_deliveryStatus );
			System.out.println("change_orderProNum  : " + change_orderProNum );
			System.out.println("change_orderCode  : " + change_orderCode);
			System.out.println("change_orderProQuantity  : " + change_orderProQuantity);
			System.out.println("change_proNum  : " + change_proNum);
			System.out.println("change_orderValue  : " + change_orderValue);
			
			Map<String, Object> changeMap = new HashMap<String, Object>();
			//배송상태 수정
			changeMap.put("change_deliveryStatus", change_deliveryStatus);
			//변경할 제품
			changeMap.put("change_orderCode", change_orderCode);
			changeMap.put("change_orderProNum", change_orderProNum);
			changeMap.put("change_orderProQuantity", change_orderProQuantity);
			changeMap.put("change_proNum", change_proNum);
			changeMap.put("change_orderValue", change_orderValue);
			changeMap.put("change_orderMemberId", change_orderMemberId);
			adminOrderService.changeDelivery(changeMap);		
		}
	}
}
