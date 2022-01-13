package proj21_admin.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@GetMapping
	public String form() {
		System.out.println("로그인 페이지 탔음.");
		return "/member/login/loginForm";
	}
}
