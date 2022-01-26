package proj21_admin.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/logout")
public class LogOutController {
	
	@GetMapping
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
}
