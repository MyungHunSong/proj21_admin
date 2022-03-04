package proj21_admin.controller.admin.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_admin.service.admin.member.AdminMemberService;

@Controller
@RequestMapping("/admin/member/")
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping("listMembers")
	public ModelAndView listMembers(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="memberTotalBuy", required = false) String memberTotalBuy,
			@RequestParam(value="memberTotalOrder", required = false) String memberTotalOrder,
			@RequestParam(value="memberGender", required = false) String memberGender,
			@RequestParam(value="keyword", required = false) String keyword) {
		
		// 1. return 타입이 ModelAndView 이기에 ModelAndView 선언
		ModelAndView mav = new ModelAndView();
		// 2. side_menu 사용을 위해서 side_menu 선언
		HttpSession session = request.getSession();
		if(!(session.getAttribute("side_menu") == null) ){
			session.removeAttribute("side_menu");
		}
		
		
		// 3. 가져올 데이터 (from MemberServiceImpl) 사용
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		
		// 4. session에 css유지 -> 올려주기
		session.setAttribute("side_menu","side_menu");
		session.setAttribute("width", "600");
		
		// 5. Map 타입에 맞춰서 데이터 담아 주기
		// 5-1. 우선 paging 맵에 담기
		pagingMap.put("memberTotalBuy", memberTotalBuy);
		pagingMap.put("memberTotalOrder", memberTotalOrder);
		pagingMap.put("memberGender", memberGender);
		pagingMap.put("keyword", keyword );
		
		System.out.printf("=== 5번 첫번째 담김 Map ==== %n "
				+ "memberTotalBuy : %s%n,"
				+ " memberTotalOrder : %s%n, "
				+ "memberGender : %s%n,"
				+ " keyword : %s%n " , memberTotalBuy, memberTotalOrder, memberGender, keyword);
		
		// 6. 5에서 담은것을 최종적으로 다시 담아주기 -> 진짜 사용하는 데이터
		Map<String, Object> membersMap = adminMemberService.listMembers(pagingMap);
		
		membersMap.put("memberTotalBuy", memberTotalBuy);
		membersMap.put("memberTotalOrder", memberTotalOrder );
		membersMap.put("memberGender", memberGender);
		membersMap.put("keyword", keyword );
		
		System.out.printf("=== 6번 최종 Map ==== %n "
				+ "memberTotalBuy : %s%n,"
				+ " memberTotalOrder : %s%n, "
				+ "memberGender : %s%n,"
				+ " keyword : %s%n " , memberTotalBuy, memberTotalOrder, memberGender, keyword);
		
		mav.addObject("membersMap", membersMap);
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
