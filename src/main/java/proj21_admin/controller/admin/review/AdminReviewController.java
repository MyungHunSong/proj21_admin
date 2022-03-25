package proj21_admin.controller.admin.review;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import proj21_admin.service.admin.review.AdminReviewService;

@Controller("adminReviewController")
@RequestMapping("/admin/review/")
public class AdminReviewController {
	
	@Autowired
	private AdminReviewService adminReviewService;

	@RequestMapping("listReviews")
	public ModelAndView listReviews(
			HttpServletRequest request
		   ,HttpServletResponse response
		   ,@RequestParam(value="memberId", required = false) String memberId
		   ,@RequestParam(value="proNum", required = false) String proNum) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("side_menu") != null) {
			session.removeAttribute("side_menu");
		}
		session.setAttribute("side_menu", "side_product");		
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		Map<String, Object> reviewsMap = new HashMap<String, Object>();
		
		String _pageNum = (String)request.getParameter("pageNum");
		String _section = (String)request.getParameter("section");
		
		int section = Integer.parseInt(((_section == null) ? "1" : _section));
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
		
		
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("memberId", memberId);
		pagingMap.put("proNum", proNum);
		
		// AdminReviewService에서 가져와 선언된 reviewsMap에 담아줌
		reviewsMap = adminReviewService.listReviews(pagingMap);
		
		reviewsMap.put("section", section);
		reviewsMap.put("pageNum", pageNum);
		reviewsMap.put("memberId", memberId);
		reviewsMap.put("proNum", proNum);
		
		// addObject를 사용함으로 jsp페이지 에서 받아 오기가능 
		//(ServiceImpl에 담겨 있는 selectedReviews, selectAllReviews 도 사용가능)
		// 단 거기서도 map.put("selectedReviews", selectedReviews) 되어 있을시
		mav.addObject("reviewsMap", reviewsMap);
		mav.setViewName(""
				+ "admin/review/listReviews");
		return mav;
	}
	
	@GetMapping("listReviews2")
	public ModelAndView listReviews(
			@RequestParam(value = "memberId", required = false) String memberId,
			@RequestParam(value = "proNum", required = false) String proNum) {
	ModelAndView mav = new ModelAndView();
	mav.addObject("memberId", memberId);
	mav.addObject("proNum", proNum);
	mav.setViewName("admin/review/listReviews2");
	return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteReviews", method = RequestMethod.POST)
	public ResponseEntity deleteProducts(
			HttpServletRequest request
		   ,HttpServletResponse response
		   ,String[] _delete_val
			) {
		ArrayList<String> deleteList = new ArrayList<String>();
		
		for(String value : _delete_val) {
			System.out.println(value);
			deleteList.add(value);
		}
		
		String message = null;
		ResponseEntity resEnt = null;
		
		HttpHeaders responseHeaders = new HttpHeaders();
		Map<String, Object> deleteMap = new HashMap<String, Object>();
		
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			adminReviewService.deleteReviews(deleteMap);
			message="<script> ";
			message+=" alert('선택한 제품 삭제를 완료하였습니다.');";
			message+=" location.href='"+request.getContextPath()+"/admin/review/listReviews'; ";
			message+=" </script>";
		}catch (Exception e) {
			message="<script> ";
			message+=" alert('제품 삭제를 실패하셨습니다..');";
			message+=" location.href='"+request.getContextPath()+"/admin/product/listProducts'; ";
			message+=" </script>";
			resEnt = new ResponseEntity(message,responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
}
