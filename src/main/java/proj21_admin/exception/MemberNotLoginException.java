package proj21_admin.exception;

// @SuppressWarnings("serial") 노랑색 박스가 뜨라고 bean에 알려주는거
@SuppressWarnings("serial")
public class MemberNotLoginException extends RuntimeException{

	public MemberNotLoginException() {
		super();		
	}
	
	public MemberNotLoginException(String arg0) {
		super(arg0);
	}
}
