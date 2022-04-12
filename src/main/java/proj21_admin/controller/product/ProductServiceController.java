package proj21_admin.controller.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_admin.dto.product.ProductDTO;
import proj21_admin.service.product.ProductListService;

// ResController 사용 이유 jsp에서 json데이터를 사용하기 위해서
// 일단 프레임워크가 쉽고 간편하다. 대신 mainPage에서 사용해야 할것들이 많다.
@RestController
@RequestMapping("/api")
public class ProductServiceController {
	@Autowired
	private ProductListService service;
	
	/* 옷 상세보기 */
	/*productDetailItem1,2 용 (하나는 정규 페이지, 하나는 팝업용)*/
	@GetMapping("/productDetail/{proNum}")
	public ResponseEntity<Object> productDetail(@PathVariable int proNum){
		service.updateProhits(Integer.parseInt(proNum + "1"));
		List<ProductDTO> product = service.showProductDetailByProNum(proNum);
		System.out.println("[ProductserviceController]/productDetail/{proNum} 영역 >>>: " + product);
		
		return ResponseEntity.ok(product);
	}
	
	/*메인화면에서 여러조건(new, sale, recommend, best)으로 옷목록*/
	@GetMapping("/selectProductsMain/{proStatus}")
	public ResponseEntity<Object> selectProductMain(@PathVariable String proStatus){
		Map<String, Object> condition = new HashMap();
		condition.put("proStatus", proStatus);		
		return ResponseEntity.ok(service.selectProductMain(condition));
	}
	
	/*옷목록 화면 검색 및 조건별 정렬, 위치 : productList.jsp 의 .get(contextPath/api/ 블라블라)*/
	/*세일인 옷은 페이징 까지 포함 ? 다른거는*/ 
	/*제품목록화면에서 여러조건(orderKind,priceRange,proCategory)으로 옷목록 검색 및 페이징*/
	@GetMapping("/selectProductsSale/{proCategory}/{section}/{pageNum}/{priceRange}/{orderKind}/{search}")
	public ResponseEntity<Object> selectProductsList(@PathVariable Integer proCategory,
													@PathVariable Integer section,
													@PathVariable Integer pageNum,
													@PathVariable Integer priceRange,
													@PathVariable String orderKind,
													@PathVariable String search){
		Map<String, Object> saleProduct = new HashMap<String, Object>();
		// 데이터 뿌리는 곳에서 데이터 저장을 해준다 MAP에다가
		saleProduct.put("search", search);
		saleProduct.put("proCategory", proCategory);
		saleProduct.put("section", section);
		saleProduct.put("pageNum", pageNum);
		saleProduct.put("priceRange", priceRange);
		saleProduct.put("orderKind", orderKind);
		
		System.out.println("ProductServiceController.selectProductList 'key' => proCategory : " + proCategory);
		System.out.println("ProductServiceController.selectProductList 'key' => section : "+  section);
		System.out.println("ProductServiceController.selectProductList 'key' => pageNun : "+ pageNum);
		System.out.println("ProductServiceController.selectProductList 'key' => priceRange : "+ priceRange);
		System.out.println("ProductServiceController.selectProductList 'key' => orderKind : "+ orderKind);
		System.out.println("ProductServiceController.selectProductList 'key' => search : " + search );
		
		System.out.println("ProductServiceController.selectProductList 'key' => saleProduct : " + saleProduct);
		
		return ResponseEntity.ok(service.selectProductSale(saleProduct));
	}
	
	/*페이징 : 총 검색 결과 수 구하기*/
	@GetMapping("/selectCountByProductSale/{priceRange}/{search}")
	public ResponseEntity<Object> countProductList(@PathVariable int priceRange, @PathVariable String search ){
		HashMap<String, Object> condition = new HashMap<String, Object>();
		
		condition.put("search", search);
		condition.put("priceRange", priceRange);
		
		return ResponseEntity.ok(service.selectCountByProductSale(condition));
	}
	
}
