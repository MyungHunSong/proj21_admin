package proj21_admin.controller.review;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ReviewReplyServiceController {
	
	@GetMapping("/selectReviewByProNum/{proNum}")
	public ResponseEntity<Object> selectReviewByProNum(@PathVariable int proNum){
		return ResponseEntity.ok(null);
	}
}
