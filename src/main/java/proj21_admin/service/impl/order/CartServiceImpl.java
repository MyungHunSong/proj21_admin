package proj21_admin.service.impl.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_admin.dto.cart.CartDTO;
import proj21_admin.exception.MemberNotLoginException;
import proj21_admin.mapper.order.CartMapper;
import proj21_admin.service.order.CartService;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartMapper mapper;
	
	@Override
	public List<CartDTO> showCartsByMemberID(CartDTO memId) {
		
		if(memId== null) {
			throw new MemberNotLoginException();
		}
		
		List<CartDTO> list = mapper.selectCartByMemberId(memId);
		return list;
	}

	/*장바구니에서 선택된 항목 주문페이지로 검색(선택된 항목들만 주문페이지로 이동할수 있도록 함)*/
	@Override
	public List<CartDTO> chooseCartByMemberID(List<Integer> cartNum) {		
		return mapper.chooseCartByMemberId(cartNum);
	}

	/* 장바구니 항목 추가 */
	@Override
	public int insertCart(CartDTO cart) {
		int result = mapper.insertCart(cart);
		return result;
	}

	/* 장바구니 개별 삭제 */
	@Override
	public int deleteCart(int CartNum) {
		int result = mapper.deleteCart(CartNum);
		return result;
	}

	/*장바구니 수량 수정*/
	@Override
	public int updateCart(CartDTO cart) {		
		return mapper.updateCart(cart);
	}

	/*바로 구입하기 버튼을 사용할 경우
	 * (회원 아이디로 제품이 있나 검색한후 있으면 장바구니의 제품을 업데이트(수량만) 없으면 장바구니안에 인서트후 구매페이지로 이동 )*/
	@Override
	public List<Integer> useProductOrderBtn(CartDTO cart) {
		if(!mapper.selectCartByMemberId(cart).isEmpty()) {
			List<CartDTO> upCartNum = mapper.selectCartByMemberId(cart);
			// 0으로 cartNum을 초기화 시켜준다
			cart.setCartNum(upCartNum.get(0).getCartNum());
			mapper.updateCart(cart);
		}else {
			mapper.insertCart(cart);
		}
		
		List<CartDTO> searchCartNum = mapper.selectCartByMemberId(cart);
		List<Integer> cartNum = new ArrayList<Integer>();
		
		cartNum.add(searchCartNum.get(0).getCartNum());
		
		
		
		return cartNum;
	}
	
	/*장바구니 번호를 리스트로 받아 한꺼번에 삭제*/
	@Override
	public int deleteCarts(List<Integer> list) {
		
		return mapper.deleteCarts(list);
	}

}
