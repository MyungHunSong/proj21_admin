package proj21_admin.controller.order;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import proj21_admin.dto.cart.CartDTO;
import proj21_admin.dto.member.MemberDTO;
import proj21_admin.dto.product.ProductDTO;
import proj21_admin.service.order.CartService;

@RestController
@RequestMapping("/api")
public class CartServiceController {
	
	@Autowired
	private CartService service;
	
	/*장바구니*/
	
	/*장바구니 목록*/
	@GetMapping("/memberProductCart/{memId}")
	public ResponseEntity<Object> getCarts(@PathVariable String memId){
		/*선언후 set으로 저장*/
		MemberDTO mem = new MemberDTO();
		mem.setMemberId(memId);
		
		/*cart.setMember(MemberDTO memberId) 이니 매게변수 일치 시켜주기*/
		CartDTO cart = new CartDTO();
		cart.setMemberId(mem);
		
		List<CartDTO> list = service.showCartsByMemberID(cart);
				
		/*리스트에 담은 목록을 반환해준다 그럼 view Jquery로 사용가능*/
		return ResponseEntity.ok(list);
	}
	
	/*장바구니 삭제 PathVariable 해줘야한다 변화 하는 값이 + GetMapping에서 알아 채야하니.*/ 
	@DeleteMapping("/memberProductCart/{cartNum}")
	public ResponseEntity<Object> delCartByCartNum(@PathVariable int cartNum){
	
		return ResponseEntity.ok(service.deleteCart(cartNum));
	}
	
	/*장바구니 항목 리스트로 검색 후 삭제 (여러개 선택시)*/
	/*자 Post 와 Get 차이점  은 자원 다 표시해줌, Post 자원 숨겨줌 대신 뒤에 목록 찍어줄 매게변수는 존재 해야함*/
	@PostMapping("/memberProductCarts")
	public ResponseEntity<Object> delCartByCartNums(@RequestBody List<Integer> cartNum){
		/*배열로 했기에 cartNum = [1, 2, 3 ...] 이런 식으로 찍힌다*/
		System.out.println("Cart Controller의 delCartByCartNuis not applicablems 함수 (여러개 삭제용 ) : " + cartNum.toString());
		return ResponseEntity.ok(service.deleteCarts(cartNum));
	}
	
	/*장바구니 추가*/
	@PostMapping("/memberProductCart/")
	public ResponseEntity<Object> insertCart(@RequestBody CartDTO cart){
		service.insertCart(cart);		
		/*내가 유추 했을때는 insert위쪽 PostMapping후 (자원 경로 파트) 에서 /후에 와야할 값이 빠졋다
		 * 이 URI 클래스의 URI.create(String);의 기능은 /후에 나와줄 인수를 (경로 + 후 붙여주는 역할을 하는거 같다) 
		 * */
		URI uri = URI.create("/api/memberProductCart" + cart.getMemberId().getMemberId());
		
		/*저렇게 명시해준후 반환값에 created 메서드 사용후 body로 cart 밑의 memberDTO의 memberId를 가져온다*/
		return ResponseEntity.created(uri).body(cart.getMemberId().getMemberId());
	}
	/*장바구니 수량 변경*/
	@PatchMapping("/memberProductCart/{cartNum}")
	public ResponseEntity<Object> updateCartByProductName(@PathVariable int cartNum, @RequestBody CartDTO cartDTO){
		cartDTO.setCartNum(cartNum);
		
		return ResponseEntity.ok(service.updateCart(cartDTO));
	}
	
	/*장바구니 버튼 사용할 경우
	 *장바구니 내에서 회원아이디, 제품 번호로 검색 있으면 update 없으면 insert를 하기위해 만든 검색문
	 *장바구니에서 회원아이디로 검색 한 목록(로그인 안한경우 MemberNotLoginException 예외 생성)
	 * */
	@GetMapping("/selectCartByIdAndProNum/{memberId}/{proNum}")
	public ResponseEntity<Object> selectCartByIdAndProNum(@PathVariable String memberId, @PathVariable int proNum){
		MemberDTO member = new MemberDTO();
		member.setMemberId(memberId);
		
		ProductDTO product = new ProductDTO();
		product.setProNum(proNum);
		
		CartDTO cart = new CartDTO();
		cart.setMemberId(member);
		cart.setCartProNum(product);
		
		return ResponseEntity.ok(service.showCartsByMemberID(cart));	
	}
	
	
}
