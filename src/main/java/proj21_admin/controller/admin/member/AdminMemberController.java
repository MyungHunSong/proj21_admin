package proj21_admin.controller.admin.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/member/")
public class AdminMemberController {
	
	@RequestMapping("listMembers")
	public ModelAndView listMembers(HttpServletRequest request,HttpServletResponse response ) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/member/listMembers");
		return mav;
	}
	
	@RequestMapping("viewMember")
	public ModelAndView viewMember(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/member/viewMember");
		
		return mav;
	}
}
