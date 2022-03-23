package proj21_admin.service.impl.admin.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_admin.dto.review.ReviewDTO;
import proj21_admin.mapper.admin.review.AdminReviewMapper;
import proj21_admin.service.admin.review.AdminReviewService;

@Service("adminReviewService")
public class AdminReviewServiceImpl implements AdminReviewService{
	
	@Autowired
	private AdminReviewMapper adminReviewMapper;

	@Override
	public Map<String, Object> listReviews(Map<String, Object> pagingMap) {
		// mapper list 타입은 List 기에 매게 변수는 map
		List<ReviewDTO> listReviews = adminReviewMapper.selectAllReviews(pagingMap);
		int selectedReviews = adminReviewMapper.selectedTotalReviews(pagingMap);
		
		Map<String, Object> reviewsMap = new HashMap<String, Object>();
		
		reviewsMap.put("listReviews", listReviews);
		reviewsMap.put("selectedReviews", selectedReviews);
		
		return reviewsMap;
	}

	@Override
	public int deleteReviews(Map<String, Object> deleteMap) {		
		return adminReviewMapper.deleteReviews(deleteMap);
	}
	
}
