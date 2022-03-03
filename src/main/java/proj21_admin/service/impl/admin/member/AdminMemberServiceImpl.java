package proj21_admin.service.impl.admin.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_admin.mapper.admin.member.AdminMemberMapper;
import proj21_admin.service.admin.member.AdminMemberService;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	@Override
	public Map<String, Object> listMembers(Map<String, Object> paginMap) {
		
		return null;
	}

	@Override
	public Map<String, Object> viewMember(Map searchMap) {
		
		return null;
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
		// TODO Auto-generated method stub
		return 0;
	}

}
