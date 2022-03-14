package proj21_admin.controller.admin.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_admin.controller.order.CustomCollectionValidator;

@Controller
@RequestMapping("/admin/product/")
public class AdminProductController {
	private static final String CURR_IMAGE_REPO_PATH = "D:\\admin\\file_repo";
	private final CustomCollectionValidator customCollectionValidator = new CustomCollectionValidator();
	
	@RequestMapping("listProducts")
	public ModelAndView listProducts(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session = request.getSession();
		if(session.getAttribute("side_menu") != null) {
			session.removeAttribute("side_menu");
		}else {
			session.setAttribute("side_menu", "side_product");
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/product/listProducts");
		
		return mav;
	}
}
