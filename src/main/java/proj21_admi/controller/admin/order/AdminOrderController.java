package proj21_admi.controller.admin.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminOrderController {
	
	@GetMapping
	public String searchMember() {
		
		return "/order/orderStatics";
	}
}
