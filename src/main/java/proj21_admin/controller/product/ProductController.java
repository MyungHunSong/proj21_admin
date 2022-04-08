package proj21_admin.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	/*!RestFull controller는 일반적 페이지만 들어가는 용도다 data를 가져와 뿌려주는건 restfull에서 진행한다*/
	/*내가 사용할 매핑주소 : /productlist , view 위치와 이름 : product/productList */
	/*@RequestParam proCategory,section,pageNum,priceRange,orderKind,search */
	@RequestMapping("productList")
	public ModelAndView getProductListByPorCategory(
			@RequestParam(value="proCategory") Integer proCategory,
			@RequestParam(value="section") Integer section,
			@RequestParam(value="pageNum") Integer pageNum,
			@RequestParam(value="priceRange") Integer priceRange,
			@RequestParam(value="orderKind") String orderKind,
			@RequestParam(value="search") String search
			) {
		ModelAndView mav = new ModelAndView("/product/productList", "proCategory", proCategory);
		mav.addObject("section", section);
		mav.addObject("pageNum",pageNum);
		mav.addObject("priceRange", priceRange);
		mav.addObject("orderKind", orderKind);
		mav.addObject("search", search);
			
		return mav;	
	}
	/*사용할 매핑주소 : /productlist, view 위취와 이름 : product/productlist */
}
