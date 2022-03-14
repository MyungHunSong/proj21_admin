package proj21_admin.service.impl.admin.product;

import java.util.Map;

import org.springframework.stereotype.Service;

import proj21_admin.dto.product.ProductDTO;
import proj21_admin.service.admin.product.AdminProductService;

@Service
public class AdminProductServiceImpl implements AdminProductService {

	@Override
	public Map<String, Object> listProducts(Map<String, Object> paginMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addNewProduct(Map<String, Object> newProdcutMap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modfiyModel(ProductDTO product) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int changeProduct(Map<String, Object> changeMap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProducts(Map<String, Object> deleteMap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> getProductStatics() {
		// TODO Auto-generated method stub
		return null;
	}

}
