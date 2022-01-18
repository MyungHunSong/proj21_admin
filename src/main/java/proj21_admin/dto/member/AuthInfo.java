package proj21_admin.dto.member;

public class AuthInfo {
	private String id;
	private String email;
	private String name;
	private int mPoint;
	
	
	public AuthInfo() {
		super();
	}


	public AuthInfo(String id, String email, String name) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getmPoint() {
		return mPoint;
	}


	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}


	@Override
	public String toString() {
		return String.format("AutoInfo [id=%s, email=%s, name=%s, mPoint=%s]", id, email, name, mPoint);
	}
	
	
	
	
}
