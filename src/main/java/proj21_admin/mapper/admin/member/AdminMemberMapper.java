package proj21_admin.mapper.admin.member;

import java.util.List;
import java.util.Map;

import proj21_admin.dto.member.MemberDTO;

public interface AdminMemberMapper {

	List<MemberDTO> selectAllMembersList(Map<String, Object> pagingMap);
	
	// 전체수
	int selectTotalMembers();
	// 남자만
	int selectAllMemberMen();
	// 여자만
	int selectAllMemberWomen();
	
	int selectedMembers(Map<String, Object> pagingMap);
	
	int deleteMember(String memberId);
	
	MemberDTO selectMemberByCertain(Map<String, Object> searchMap);
	
	int updateMember(Map<String, Object> changeMap);
}
