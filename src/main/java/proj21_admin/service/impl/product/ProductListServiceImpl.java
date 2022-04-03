package proj21_admin.service.impl.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_admin.dto.product.ProductDTO;
import proj21_admin.mapper.product.ProductListMapper;
import proj21_admin.service.product.ProductListService;

@Service
public class ProductListServiceImpl implements ProductListService {
	
	@Autowired
	private ProductListMapper service;
	
	/* 옷목록화면 리스트 용 */
	@Override
	public List<ProductDTO> showProducts(int proCategory) {
		List<ProductDTO> list = service.selectProductByProImgState(proCategory);
		return list;
	}

	/* 옷 상세 정보 보기 */
	@Override
	public List<ProductDTO> showProductDetailByProNum(int proNum) {
		List<ProductDTO> list = service.selectProductDetailByProNum(proNum);
		return list;
	}
	
	/* 옷 리스트에서 상세보기로 들어오는 순간 옷 조회수 +1해준다.*/
	@Override
	public int updateProhits(int proNum) {
		
		return service.updateProHits(proNum);
	}
	
	/*메인화면 옷 목록*/
	@Override
	public List<ProductDTO> selectProductMain(Map<String, Object> condition) {
		
		return service.selectProductMain(condition);
	}
	/*페이징*/
	/*세일 제품 목록*/
	@Override
	public List<ProductDTO> selectProductSale(Map<String, Object> saleProduct) {		
		return service.selectProductSale(saleProduct);
	}
	
	/*전체 결과의 수를 검색*/
	@Override
	public Integer selectCountByProductSale(Map<String, Object> condition) {		
		return service.selectCountByProductSale(condition);
	}

}
