package proj21_admin.service.impl.admin.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_admin.dto.product.ProductDTO;
import proj21_admin.dto.product.ProductImageDTO;
import proj21_admin.mapper.admin.product.AdminProductMapper;
import proj21_admin.service.admin.product.AdminProductService;

@Service("adminProdcutService")
public class AdminProductServiceImpl implements AdminProductService {
	@Autowired
	private AdminProductMapper adminProductMapper;
	
	//1. 전체 테이블 리스트
	@Override
	public Map<String, Object> listProducts(Map<String, Object> paginMap) {
		
		//1. collection map사용 선언 -> 사용할 mapper 가져와서 변수에 넣기 -> map.put("", );
		Map<String, Object> productsMap = new HashMap();	
		
		// 1. 전체 리스트 (모든 데이터 집계)
		List<ProductDTO> productsList = adminProductMapper.selectAllProducts(paginMap);
		
		int selectedProducts = adminProductMapper.selectedTotalProducts(paginMap);
		int totProducts = adminProductMapper.selectTotalProducts();
		int newProducts = adminProductMapper.selectNewProducts();
		int bestProducts = adminProductMapper.selectBestProducts();
		int steadyProducts = adminProductMapper.selectSteadyProducts();
		
		int offProducts = adminProductMapper.selectOffProducts();
		int outProducts = adminProductMapper.selectOutProducts();
		int orderedTotal = adminProductMapper.selectOrderedTotal(paginMap);
		
		productsMap.put("productsList", productsList);
		productsMap.put("totProducts", totProducts);
		productsMap.put("bestProducts", bestProducts);
		productsMap.put("newProducts", newProducts);
		productsMap.put("steadyProducts", steadyProducts);
		productsMap.put("offProducts", offProducts);
		productsMap.put("outProducts", outProducts);
		productsMap.put("orderedTotal", orderedTotal);
		productsMap.put("selectedProducts", selectedProducts);
		
		return productsMap;
	}

	@Override
	public int addNewProduct(Map<String, Object> newProductMap) {
		// 제품 추가
		adminProductMapper.insertNewProduct(newProductMap);
		
		int proNum = (int)newProductMap.get("proNum");
		System.out.println("AdminProductServiceImpl 의 proNum : " + proNum);
		
		ArrayList<ProductImageDTO> imageFileList = (ArrayList)newProductMap.get("imageFileList");
		
		// 확장 for문 productImageDTO 데이터형 접근 변수명 : 배열이나 컬렉션 변수명
		for(ProductImageDTO productImageDTO : imageFileList) {
			productImageDTO.setProNum(proNum);
		}
		adminProductMapper.insertProductImageFile(imageFileList);
		
		return proNum;
	}
	
	// 수정
	@Override
	public int modfiyModel(ProductDTO product) {
		return adminProductMapper.updateProduct(product);
	}

	@Override
	public int changeProduct(Map<String, Object> changeMap) {
		
		return adminProductMapper.updateProdcut2(changeMap);
	}

	@Override
	public int deleteProducts(Map<String, Object> deleteMap) {
		
		return adminProductMapper.deleteProducts(deleteMap);
	}

	@Override
	public Map<String, Object> getProductStatics() {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		
		
		int newProducts=adminProductMapper.selectNewProducts();
		int bestProducts=adminProductMapper.selectBestProducts();
		int steadyProducts=adminProductMapper.selectSteadyProducts();
		int offProducts=adminProductMapper.selectOffProducts();
		int outProducts=adminProductMapper.selectOutProducts();
		
		int totalTShirts=adminProductMapper.selectAllTShirts();
		int totalLongT=adminProductMapper.selectAllLongT();
		int totalslvless=adminProductMapper.selectAllSlvless();
		int totalhood=adminProductMapper.selectAllHood();
		int totalShirts=adminProductMapper.selectAllShirts();
		int totalSweater=adminProductMapper.selectAllSweater();
		
		returnMap.put("bestProducts", bestProducts);
		returnMap.put("newProducts", newProducts);
		returnMap.put("steadyProducts", steadyProducts);
		returnMap.put("offProducts", offProducts);
		returnMap.put("outProducts", outProducts);
		returnMap.put("totalTShirts", totalTShirts);
		returnMap.put("totalLongT", totalLongT);
		returnMap.put("totalslvless", totalslvless);
		returnMap.put("totalhood", totalhood);
		returnMap.put("totalShirts", totalShirts);
		returnMap.put("totalSweater", totalSweater);
	
		
		return returnMap;
	}

}
