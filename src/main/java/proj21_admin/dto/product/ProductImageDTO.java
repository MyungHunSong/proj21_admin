package proj21_admin.dto.product;

public class ProductImageDTO {
	
	private int proNum;
	private int proImgCode;
	private String proImageFileName;
	private String proImageFileType;
	private int proImgState;
	
	
	public ProductImageDTO() {
	}
	
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public int getProImgCode() {
		return proImgCode;
	}
	public void setProImgCode(int proImgCode) {
		this.proImgCode = proImgCode;
	}
	public String getProImageFileName() {
		return proImageFileName;
	}
	public void setProImageFileName(String proImageFileName) {
		this.proImageFileName = proImageFileName;
	}
	public String getProImageFileType() {
		return proImageFileType;
	}
	public void setProImageFileType(String proImageFileType) {
		this.proImageFileType = proImageFileType;
	}

	public int getProImgState() {
		return proImgState;
	}

	public void setProImgState(int proImgState) {
		this.proImgState = proImgState;
	}
		
}
