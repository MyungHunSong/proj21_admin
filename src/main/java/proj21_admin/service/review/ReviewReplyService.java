package proj21_admin.service.review;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_admin.dto.review.ReviewDTO;
import proj21_admin.dto.review.ReviewReplyDTO;

@Service
public interface ReviewReplyService {

	/* 후기 목록 */
	List<ReviewDTO> selectReviewByProNum(int proNum);
	
	/* 후기하나에 댓글 목록 */
	List<ReviewReplyDTO> selectReviewReply(int reviewNo);
	
	/* 댓글 추가 */
	int insertReviewReply(ReviewReplyDTO reviewReply);
	
	/* 댓글 수정 */
	int updateReviewReply(ReviewReplyDTO reviewReply);
	
	/* 댓글 삭제 */
	int deleteReviewReply(ReviewReplyDTO reviewReply);

}
