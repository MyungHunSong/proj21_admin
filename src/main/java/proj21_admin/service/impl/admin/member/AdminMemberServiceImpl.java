package proj21_admin.service.impl.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_admin.dto.cart.CartDTO;
import proj21_admin.dto.member.MemberDTO;
import proj21_admin.dto.order.OrderDTO;
import proj21_admin.mapper.admin.member.AdminMemberMapper;
import proj21_admin.mapper.admin.order.AdminOrderMapper;
import proj21_admin.mapper.order.CartMapper;
import proj21_admin.service.admin.member.AdminMemberService;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	@Autowired
	private AdminOrderMapper adminOrderMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	// 회원 정보출력
	@Override
	public Map<String, Object> listMembers(Map<String, Object> paginMap) {
		
		Map<String, Object> membersMap = new HashMap();
		List<MemberDTO> membersList = null;
		
		int allMen = 0;
		int allWomen = 0;
		int totMembers = 0;
		int selectedMembers = 0;
		
		
		// 1. 남자회원
		allMen = adminMemberMapper.selectAllMemberMen();
		// 2. 여자회원
		allWomen = adminMemberMapper.selectAllMemberWomen();
		// 3. 총 회원
		totMembers = adminMemberMapper.selectTotalMembers();
		// 4. memberList 가져오기
		membersList = adminMemberMapper.selectAllMemberList(paginMap);
		// 5. memberList 가져온 사람 수
		selectedMembers = adminMemberMapper.selectedMembers(paginMap);
		
		
		System.out.println("4. 멤버 list : " + membersList);
		System.out.println("5. SQL 가져온 사람수 : " + selectedMembers);
		
		membersMap.put("allMen", allMen);
		membersMap.put("allWomen", allWomen );
		membersMap.put("totMembers", totMembers );
		membersMap.put("membersList", membersList);
		membersMap.put("selectedMembers", selectedMembers);
		return membersMap;
	}

	
	// 여기엔 cartMapper도 사용된다
	@Override
	public Map<String, Object> viewMember(Map searchMap) {
		Map<String, Object> returnMap = new HashMap();
		
		int averageOrder = 0;
		String onDelivery = null;
		String onCart = null;
		String onRefund = null;
		List<CartDTO> cartList = null;
		List<OrderDTO> orderList = null;
		List<OrderDTO> refundList = null;
		Map<String, Object> orderReturn = new HashMap();
		Map<String, Object> refundReturn = new HashMap();
		
		// 1. 멤버 관련 정보 가져오기
		MemberDTO member = adminMemberMapper.selectMemberByCertain(searchMap);
		// 2. 가져온 멤버에서 멤버 코드 가져오기
		// 2-1. 주문한 이력 있다면
		String MemberId = member.getMemberId();
		
		System.out.println("AdminMemberServiceImpl getMemberId ? : " + MemberId);
		String orderFlag = adminOrderMapper.haveOrdered(MemberId);
		
		System.out.println("배송 상태 : " + orderFlag);
		
		// 배송준비중인 제품들 출력 메서드
		orderStatusTrue(orderReturn, MemberId, orderFlag);
		
		refundReturn.put("orderMemberId", MemberId);
		refundReturn.put("deliveryStatus", "반품대기중");
		String refundFlag = adminOrderMapper.haveRefunded(refundReturn);
		System.out.println("refundFlag 반품 대기중 상품 : " + refundFlag);
		
		// 반품중 제품 출력 메서드
		refundStatusTrue(refundReturn, refundFlag);
		
		// 장바구니에 담은 상품 TRUE? + 메서드
		String cartFlag = cartMapper.flagInCart(MemberId);
		System.out.println("cartFlag 장바구니에 있으면 : " + cartFlag);
		cartStatusTrue(MemberId, cartFlag);
		
		returnMap.put("member", member);
		returnMap.put("averageOrder", averageOrder);
		returnMap.put("onDelivery", onDelivery);
		returnMap.put("onCart", onCart);
		returnMap.put("onRefund", onRefund);
		returnMap.put("cartList", cartList);
		returnMap.put("orderList", orderList);
		returnMap.put("refundList", refundList);
		
		return returnMap;
	}




	
	// 회원수 표시
	@Override
	public Map<String, Object> getMemberStatics() {
		
		Map<String, Object> viewMap = new HashMap();
		int memberMen = 0;
		int memberWomen = 0;
		int totalMember = 0;
		int totalNonMember = 0;
		
		// 남자회원수 -> 여자회원수 -> 전체회원수
		memberMen = adminMemberMapper.selectAllMemberMen();
		
		memberWomen = adminMemberMapper.selectAllMemberWomen();
		
		totalMember = adminMemberMapper.selectTotalMembers();
		
		viewMap.put("memberMen", memberMen);
		viewMap.put("memberWomen", memberWomen);
		viewMap.put("totalMember", totalMember);
		viewMap.put("totalNonMember", totalNonMember);		
		return viewMap;
	}

	@Override
	public int changeMember(Map<String, Object> changeMap) {
		return adminMemberMapper.updateMember(changeMap);
	}

	// 회원 삭제.
	@Override
	public void deleteMember(String memberId) {
		adminMemberMapper.deleteMember(memberId);
	}
	
	// viewMember 빼놓은 메서드
	private void cartStatusTrue(String MemberId, String cartFlag) {
		String onCart;
		List<CartDTO> cartList;
		if(cartFlag.equals("true")) {
			MemberDTO mem = new MemberDTO();
			mem.setMemberId(MemberId);
			
			CartDTO memId = new CartDTO();
			memId.setMemberId(mem);
			
			cartList = cartMapper.selectCartByMemberId(memId);
			onCart = cartMapper.selectCountCart(MemberId);
			
		}
	}


	private void refundStatusTrue(Map<String, Object> refundReturn, String refundFlag) {
		String onRefund;
		List<OrderDTO> refundList;
		if(refundFlag.equals("true")) {
			onRefund = adminOrderMapper.onRefund(refundReturn);
			System.out.println("onRefud 반품 대기중 : " + onRefund);
			
			// 반품중인 제품 출력
			refundList = adminOrderMapper.get_OrderList(refundReturn);
		}
	}


	private void orderStatusTrue(Map<String, Object> orderReturn, String MemberId, String orderFlag) {
		int averageOrder;
		String onDelivery;
		List<OrderDTO> orderList;
		if (orderFlag.equals("true")) {
			averageOrder = adminOrderMapper.selectAverageOrder(MemberId);
			orderReturn.put("orderMemberId", MemberId);
			orderReturn.put("deliveryStatus", "배송중");
			// 배송중인 상품 검색
			onDelivery = adminOrderMapper.onDelivery(orderReturn);
			System.out.println("onDelivery 배송중인것===== :" + onDelivery);
			if(onDelivery.equals("0")) {
				System.out.println("onDelivery 배송준비중인것");
				orderReturn.remove("deliveryStatus");
				orderReturn.put("deliveryStatus", "배송준비중");
				onDelivery = adminOrderMapper.onDelivery(orderReturn);
				System.out.println("onDelivery 배송준비중인것===== :" + onDelivery);
			}
			//배송중인 제품들 출력
			orderList = adminOrderMapper.get_OrderList(orderReturn);
			System.out.println("get_OrderList 주문 리스트===== :" + orderList);
		}
	}
	// 메서드 끝
	

}
