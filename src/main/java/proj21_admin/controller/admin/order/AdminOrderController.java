package proj21_admin.controller.admin.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {
	
	@RequestMapping("/orderStatics")
	public String searchMember() {
		
		return "admin/order/orderStatics";
	}
}
