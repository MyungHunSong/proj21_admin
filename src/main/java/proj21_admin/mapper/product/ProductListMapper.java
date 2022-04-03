package proj21_admin.mapper.product;

import java.util.List;
import java.util.Map;

import proj21_admin.dto.product.ProductDTO;

public interface ProductListMapper {
	/* 옷 목록화면 리스트 */
	List<ProductDTO> selectProductByProImgState(int proCategory);
	
	/* 옷 상세 정보 보기 (같은 카테고리 같은 색상 이지만) 제품별 사이즈 & 재고량이 다르기 때문에 리스트로 받음*/
	List<ProductDTO> selectProductDetailByProNum(int proNum);
	
	/*옷 리스트 -> 상세보기로 들어오는 순간 옷 조회수 증가 (+1)*/
	int updateProHits(int proNum);
	
	/*메인화면 제품 목록(new, reccomend, mostview, new, best, sale*/
	List<ProductDTO> selectProductMain(Map<String, Object> condition);
	
	/*페이징*/
	/*세일하는 제품 목록*/
	List<ProductDTO> selectProductSale(Map<String, Object> saleProduct);
	
	/*전체 결과의 수를 검색*/
	Integer selectCountByProductSale(Map<String, Object> condition);
}
