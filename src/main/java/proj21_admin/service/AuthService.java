package proj21_admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_admin.dto.member.AuthInfo;
import proj21_admin.dto.member.MemberDTO;
import proj21_admin.exception.WrongIdPasswordException;
import proj21_admin.mapper.member.MemberMapper;

@Service
public class AuthService {
	@Autowired
	private MemberMapper mapper;
	
	public AuthInfo authenicate(String id, String password) {
		MemberDTO member = new MemberDTO();
		member.setMemberId(id);
		member.setMemberPwd(password);
		
		// 폼에 입려한 아이디와 비밀번호가 일치하는 회원 검색
		MemberDTO newMember = mapper.selectByLoginId(member);
		
		 if(newMember == null) {
			 throw new WrongIdPasswordException();
		 }
		 
		 AuthInfo au = new AuthInfo(newMember.getMemberId(),  newMember.getMemberEmail(), newMember.getMemberName());
		 mapper.updateTotalLogin(newMember);
		 au.setmPoint(newMember.getMemberPoint());
		 System.out.println(au);
		 
		return null;
	}
}
