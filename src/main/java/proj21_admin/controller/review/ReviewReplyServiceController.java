package proj21_admin.controller.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import proj21_admin.dto.review.ReviewReplyDTO;
import proj21_admin.service.review.ReviewReplyService;

@RestController
@RequestMapping("/api")
public class ReviewReplyServiceController {
	@Autowired
	private ReviewReplyService service;
	
	/*제품별 후기 목록*/
	@GetMapping("/selectReviewByProNum/{proNum}")
	public ResponseEntity<Object> selectReviewByProNum(@PathVariable int proNum){	
		return ResponseEntity.ok(service.selectReviewByProNum(proNum));
	}
	
	/* 후기하나에 댓글 목록 */
	@GetMapping("/selectReviewReply/{reviewNo}")
	public ResponseEntity<Object> selectReviewReply(@PathVariable int reviewNo){
		return ResponseEntity.ok(service.selectReviewReply(reviewNo));
	}
	
	/* 댓글 추가 */
	@PostMapping("/insertReviewReply")
	public ResponseEntity<Object> insertReviewReply(@RequestBody ReviewReplyDTO reviewReply){
		return ResponseEntity.ok(service.insertReviewReply(reviewReply));
		
	}
	
	/* 댓글 수정 */
	@PatchMapping("/updateReviewReply/{reviewReplyNo}")
	public ResponseEntity<Object> updateReviewReply(@RequestBody ReviewReplyDTO reviewReplyNo){
		return ResponseEntity.ok(service.updateReviewReply(reviewReplyNo));
	}
	
	/* 댓글 삭제 */
	@PostMapping("/deleteReviewReply")
		public ResponseEntity<Object> deleteReviewReply(@RequestBody ReviewReplyDTO reviewReply){
			return ResponseEntity.ok(service.deleteReviewReply(reviewReply));
		}
	
	

}
