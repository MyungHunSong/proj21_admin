package proj21_admin.service.admin.product;

import java.util.Map;

import proj21_admin.dto.product.ProductDTO;

public interface AdminProductService {
	// 전체 테이블 리스트 뽑아오기 
	Map<String, Object> listProducts(Map<String, Object> paginMap);
	
	// 제품 추가
	int addNewProduct(Map<String, Object> newProdcutMap);
	
	// 제품 수정
	int modfiyModel(ProductDTO product);
	int changeProduct(Map<String, Object> changeMap);
	
	// 제품 삭제
	int deleteProducts(Map<String, Object> deleteMap);
	
	// 제품 변화
	Map<String, Object> getProductStatics();
}
