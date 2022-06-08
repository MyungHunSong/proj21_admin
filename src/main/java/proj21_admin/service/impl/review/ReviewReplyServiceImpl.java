package proj21_admin.service.impl.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_admin.dto.review.ReviewDTO;
import proj21_admin.dto.review.ReviewReplyDTO;
import proj21_admin.exception.MemberNotFoundException;
import proj21_admin.exception.MemberNotLoginException;
import proj21_admin.exception.NoReplyContentAndIDException;
import proj21_admin.mapper.review.ReviewReplyMapper;
import proj21_admin.service.review.ReviewReplyService;

@Service
public class ReviewReplyServiceImpl implements ReviewReplyService{
	
	@Autowired 
	private ReviewReplyMapper mapper;

	@Override
	public List<ReviewDTO> selectReviewByProNum(int proNum) {
		
		return mapper.selectReviewByProNum(proNum);
	}

	@Override
	public List<ReviewReplyDTO> selectReviewReply(int reviewNo) {
		
		return mapper.selectReviewReply(reviewNo);
	}

	@Override
	public int insertReviewReply(ReviewReplyDTO reviewReply) {
		if(reviewReply.getReRepMember().isEmpty()) {
			throw new MemberNotLoginException("로그인이 필요한 서비스입니다.");
		}
		if(reviewReply.getReRepContent().isEmpty()) {
			throw new NoReplyContentAndIDException("내용을 적어 주세요");
		}
		
		return mapper.insertReviewReply(reviewReply);
	}

	@Override
	public int updateReviewReply(ReviewReplyDTO reviewReply) {
		ReviewReplyDTO review = new ReviewReplyDTO();
		review.setReRepContent(reviewReply.getReRepContent());
		review.setReRepNum(reviewReply.getReRepNum());
		
		/* 자신이 쓴 글만 수정하게끔 하는 기능이다. 실상 view에서 삭제기능 업데이트 기능이 "나가" 아니라면 숨길수 있게 할수도 있다.*/
		if(mapper.selectMemberIdAndReRepNum(review) == null) {
			throw new MemberNotFoundException("자신이 쓴 글만 수정 할 수 있습니다.");
		}
		
		return mapper.updateReviewReply(reviewReply);
	}

	@Override
	public int deleteReviewReply(ReviewReplyDTO reviewReply) {
		ReviewReplyDTO review = new ReviewReplyDTO();
		
		review.setReRepMember(reviewReply.getReRepMember());
		review.setReRepNum(reviewReply.getReRepNum());
		
		if(mapper.selectMemberIdAndReRepNum(review) == null) {
			throw new MemberNotFoundException("자신이 쓴 글만 삭제 할 수 있습니다.");
		}
		return mapper.deleteReviewReply(reviewReply);
	}

}
