package proj21_admin.mapper.member;

import java.util.List;

import proj21_admin.dto.member.MemberDTO;

// Mapper인터 페이스 서비스와 엮어서 사용할꺼임.
// 왜? 쓰는가 인터페이스를 규격을 정하고 유지 보수성을 높이기 위해서.
public interface MemberMapper {
	List<MemberDTO> selectAll();
	
	MemberDTO selectByLoginId(MemberDTO member);
	
	/* 아이디 명시 */
	MemberDTO selectById(String id);
	
	/*비번 명시*/
	MemberDTO selectByPwd(MemberDTO member);
	
	// 로그인 횟수 업데이트
	int updateTotalLogin(MemberDTO member);
}
