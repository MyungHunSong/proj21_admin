package proj21_admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_admin.dto.member.AuthInfo;
import proj21_admin.dto.member.MemberDTO;
import proj21_admin.exception.WrongIdPasswordException;
import proj21_admin.mapper.member.MemberMapper;

@Service
public class AuthServiceImpl{
	
	@Autowired
	private MemberMapper mapper;

	
	public AuthInfo autheniCate(String id, String password) {
		MemberDTO member = new MemberDTO();
		System.out.println("이까지도 옴: " + password);
		member.setMemberId(id);
		member.setMemberPwd(password);
		MemberDTO newMember = mapper.selectByLoginId(member);
		
		if(newMember == null) {
			throw new WrongIdPasswordException();
		}
		
		AuthInfo au = new AuthInfo(newMember.getMemberId(), newMember.getMemberName(), newMember.getMemberEmail());
		// 로그인시 로그인수 증가
		mapper.updateTotalLogin(newMember);
		return au;
	}
}
