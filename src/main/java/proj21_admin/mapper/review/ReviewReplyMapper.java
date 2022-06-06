package proj21_admin.mapper.review;

import java.util.List;

import proj21_admin.dto.review.ReviewDTO;
import proj21_admin.dto.review.ReviewReplyDTO;

public interface ReviewReplyMapper {
	/*삭제나 수정하기전 아이디 비교*/
	ReviewReplyDTO selectMemberIdAndReRepNum(ReviewReplyDTO reviewReply);
	
	/* 후기 목록*/
	List<ReviewDTO> selectReviewByProNum(int proNum);
	
	/*후가하나에 댓글 목록*/
	List<ReviewReplyDTO> selectReviewReply(int reviewNo);
	
	/*댓글 추가*/
	int insertReviewReply(ReviewReplyDTO reviewReply);
	
	/*댓글 수정*/
	int updateReviewReply(ReviewReplyDTO reviewReply);
	
	/*댓글 삭제*/
	int deleteReviewReply(ReviewReplyDTO reviewReply);
}
