package proj21_admin.service.admin.review;

import java.util.Map;

public interface AdminReviewService {
	Map<String, Object> listReviews(Map<String, Object> pagingMap);
	
	int deleteReviews(Map<String, Object> deleteMap);
}
