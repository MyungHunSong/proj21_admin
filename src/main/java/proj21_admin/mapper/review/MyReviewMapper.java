package proj21_admin.mapper.review;

import java.util.List;

import proj21_admin.dto.order.OrderDTO;
import proj21_admin.dto.qna.QnaDTO;
import proj21_admin.dto.review.ReviewDTO;

/*따로 MyPage에서 보는 용도임.*/
public interface MyReviewMapper {
	List<ReviewDTO> selectReviewByMember(String memberID);
	List<QnaDTO> selectQnaByMember(String memberId);
	List<ReviewDTO> selectDetailReviewByMember(ReviewDTO reviewDTO);
	List<OrderDTO> selectProductDetailByMember(OrderDTO orderDTO);
	int insertReview(ReviewDTO reviewDTO);
	int updateReview(ReviewDTO reviewDTO);
	ReviewDTO selectReviewByReviewNum(int reviewNum);
	int updateReviewCount(int proNum);
	List<QnaDTO> selectQnaContentByMember(QnaDTO qnaDTO);
}
