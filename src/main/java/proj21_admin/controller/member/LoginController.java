package proj21_admin.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_admin.dto.member.LoginCommand;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@GetMapping
	public String loginForm(LoginCommand loginCommand) {
		System.out.println("로그인 페이지 탔음.");
		return "/member/login/loginForm";
	}
}
