package proj21_admin.dto.review;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import proj21_admin.dto.product.ProductDTO;
import proj21_admin.dto.product.ProductImageDTO;

public class ReviewDTO {
	private String memberId;
	private int proNum;
	private ProductDTO proName;
	private int reviewNum;
	private ProductImageDTO proImageFileName;
	private String reviewContent;
	private String reviewImageFileName1;
	private String reviewImageFileName2;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date ReviewDate;
	private int reviewReplyCount;
	private int reviewStar;
	private List<ReviewReplyDTO> reviewReplys;
	
	
	
	
	public ReviewDTO() {
		super();
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public ProductDTO getProName() {
		return proName;
	}
	public void setProName(ProductDTO proName) {
		this.proName = proName;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public ProductImageDTO getProImageFileName() {
		return proImageFileName;
	}
	public void setProImageFileName(ProductImageDTO proImageFileName) {
		this.proImageFileName = proImageFileName;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewImageFileName1() {
		return reviewImageFileName1;
	}
	public void setReviewImageFileName1(String reviewImageFileName1) {
		this.reviewImageFileName1 = reviewImageFileName1;
	}
	public String getReviewImageFileName2() {
		return reviewImageFileName2;
	}
	public void setReviewImageFileName2(String reviewImageFileName2) {
		this.reviewImageFileName2 = reviewImageFileName2;
	}
	public Date getReviewDate() {
		return ReviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		ReviewDate = reviewDate;
	}
	public int getReviewReplyCount() {
		return reviewReplyCount;
	}
	public void setReviewReplyCount(int reviewReplyCount) {
		this.reviewReplyCount = reviewReplyCount;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public List<ReviewReplyDTO> getReviewReplys() {
		return reviewReplys;
	}
	public void setReviewReplys(List<ReviewReplyDTO> reviewReplys) {
		this.reviewReplys = reviewReplys;
	}
	@Override
	public String toString() {
		return String.format(
				"ReviewDTO [memberId=%s, proNum=%s, proName=%s, reviewNum=%s, proImageFileName=%s, reviewContent=%s, reviewImageFileName1=%s, reviewImageFileName2=%s, ReviewDate=%s, reviewReplyCount=%s, reviewStar=%s, reviewReplys=%s]",
				memberId, proNum, proName, reviewNum, proImageFileName, reviewContent, reviewImageFileName1,
				reviewImageFileName2, ReviewDate, reviewReplyCount, reviewStar, reviewReplys);
	}
	
	
}
