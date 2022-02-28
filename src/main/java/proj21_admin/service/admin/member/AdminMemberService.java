package proj21_admin.service.admin.member;

import java.util.Map;

public interface AdminMemberService {

	// 모든 member 뽑아오기
	Map<String, Object> listMembers(Map<String, Object> paginMap);
	
	//member 삭제
	Map<String, Object> viewMember(Map searchMap);
	
	//차트 정보
	Map<String, Object> getMemberStatics();
	
	// 반품했을 시 수정되는 정보
	int changeMember(Map<String, Object> changeMap);
}
