package proj21_admin.controller.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	
	/*장바구니 페이지 매핑주소 : /cart, view 위치와 이름 : order/memberProductCart
	 * @RequestParam(value="memId") 설정으로 주소창에 (contextPath + /cart?memId = 아이디
	 * */
	@GetMapping("/cart")
	public ModelAndView getMemberProductCart(@RequestParam(value = "memId") String memberId) {
		ModelAndView mav = new ModelAndView("/order/memberProductCart", "memId", memberId);
		
		return mav;
		
	}
}
