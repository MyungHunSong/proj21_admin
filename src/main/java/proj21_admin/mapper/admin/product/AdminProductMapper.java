package proj21_admin.mapper.admin.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import proj21_admin.dto.product.ProductDTO;
import proj21_admin.dto.product.ProductImageDTO;

public interface AdminProductMapper {
	// ===== Product view에 사용될 데이터 =====
	
	// 총 제품 수
	int selectTotalProducts();
	// 신상품 수
	int selectNewProducts();
	// 판매량이 많은 제품 수 
	int selectBestProducts();
	// 추천상품 수 
	int selectSteadyProducts();
	// 세일중인 제품 수
	int selectOffProducts();
	// 판매 중지된 상품 수
	int selectOutProducts();
	// 조건 별 제품 리스트 뽑아오기
	List<ProductDTO> selectAllProducts(Map<String, Object> paginMap);
	// 검색한 제품 수 
	int selectedTotalProducts(Map<String, Object> pagingMap);
	// 주문 상품수
	int selectOrderedTotal(Map<String, Object> pagingMap);
	
	// ====== 제품 추가 =====
	// 제품 추가
	int insertNewProduct(Map newProduct);
	// 제품 사진 추가
	void insertProductImageFile(ArrayList<ProductImageDTO> imageFileList);
	
	// ===== 재품 재입고 =====
	int deleteProducts(Map deleteMap);
	
	int selectAllTShirts();
	int selectAllLongT();
	int selectAllSlvless();
	int selectAllHood();
	int selectAllShirts();
	int selectAllSweater();
	
	// 제품 추가 (개수 업데이트)
	int updateProduct(ProductDTO product);
	int updateProdcut2(Map<String, Object> changeMap);
}
