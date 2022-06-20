package proj21_admin.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogOutController {
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		
		session.invalidate();
		System.out.println("이까지 탄다");
		String goMain = "main";
		
		return "redirect:" + "/" + goMain;		
	}
}
