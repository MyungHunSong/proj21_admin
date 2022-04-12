package proj21_admin.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	/*일반 controller는 일반적 페이지만 들어가는 용도다 data를 가져와 뿌려주는건 restfull에서 진행한다*/
	/*내가 사용할 매핑주소 : /productlist , view 위치와 이름 : product/productList */
	/*@RequestParam proCategory,section,pageNum,priceRange,orderKind,search */	
	@GetMapping("productList")
	public ModelAndView getProductListByPorCategory(
			@RequestParam(value="proCategory") Integer proCategory,
			@RequestParam(value="section") Integer section,
			@RequestParam(value="pageNum") Integer pageNum,
			@RequestParam(value="priceRange") Integer priceRange,
			@RequestParam(value="orderKind") String orderKind,
			@RequestParam(value="search") String search
			) {
		
		// override 필드 생성자에 사용법이 명시 되어있음
		// Model (view, "objectname", objectvalue)로 사용가능하다.
		//ModelAndView mav = new ModelAndView("/product/productList", "proCategory", proCategory);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/productList");
		// restController 에서 put을 해줬기에 여기선 addObject로 view에서 사용해주자 알아서 가지고 온다.
		mav.addObject("proCategory", proCategory);
		mav.addObject("section", section);
		mav.addObject("pageNum",pageNum);
		mav.addObject("priceRange", priceRange);
		mav.addObject("orderKind", orderKind);
		mav.addObject("search", search);
			
		return mav;	
	}
	/*productDetailItem 페이지 입장용 */
	@GetMapping("productDetail")
	public ModelAndView productDetailItem(@RequestParam(value = "proNum") Integer proNum) {
		ModelAndView mav = new ModelAndView("product/productDetail","proNum", proNum);
		return mav;
	};
	
	/*productDetailItem2 페이지 입장용 (팝업창)*/
	@GetMapping("productDetailItem2")
	public ModelAndView productDetailItem2(@RequestParam(value = "proNum") Integer proNum) {
		ModelAndView mav = new ModelAndView("product/productDetailItem2", "proNum", proNum);
				
		return mav;
	};
}
