package proj21_admin.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_admin.dto.member.LoginCommand;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@GetMapping
	public String form(LoginCommand loginCommand) {
		return "/member/login/loginForm";
	}
}
