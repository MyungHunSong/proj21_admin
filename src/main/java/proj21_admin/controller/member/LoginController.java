package proj21_admin.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_admin.dto.member.AuthInfo;
import proj21_admin.dto.member.LoginCommand;
import proj21_admin.exception.WrongIdPasswordException;
import proj21_admin.service.impl.AuthServiceImpl;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private AuthServiceImpl authServiceImpl;
	
	@GetMapping
	public String loginForm(LoginCommand loginCommand) {
		System.out.println("로그인 페이지 탔음.");
		return "/member/login/loginForm";
	}
	
	@PostMapping
	public String submit(LoginCommand loginCommand,Errors errors, HttpSession session, HttpServletResponse response) throws IOException {
		// 1. 아이디 비밀번호 에러시 1-1: 로그인 불일치, 1-2: loginForm으로 다시
		// 2. 로그인 완료시 2가지 패턴으로 2-1: 관리자 로그인시 관리자 페이지로, 2-2: 회원 로그인시 main 페이지로
		
		System.out.println("이까지 탄다");
		System.out.println("Command : " + loginCommand.toString());
		System.out.println("id: " + loginCommand.getId());
		System.out.println("password: " + loginCommand.getPassword());
		if(errors.hasErrors()) {
			return "/member/login/loginForm";
		}		
		try {
			AuthInfo authInfo = authServiceImpl.autuicate(loginCommand.getId(), loginCommand.getPassword());
			session.setAttribute("authInfo", authInfo); // 세션에 로그인 정보 저장
			System.out.println("id: " + loginCommand.getId());
			
			if(loginCommand.getId().equals("admin")) {
				System.out.println("loginCommand == "+ loginCommand.getId());
				return "redirect:/admin/order/orderStatics";
			}			
			return "redirect:/main";
		}catch (WrongIdPasswordException ex) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();
			return "/member/login/loginForm";
		}
	}
}
