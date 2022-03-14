package proj21_admin.controller.order;

import java.util.Collection;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.executable.ExecutableValidator;
import javax.validation.metadata.BeanDescriptor;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.SpringValidatorAdapter;
/* Collection 타입의 객체를 검사하기 위해 생성했다.*/
@Component
public class CustomCollectionValidator implements Validator{
	
	private SpringValidatorAdapter validator;
	
	

	public CustomCollectionValidator() {
		this.validator = 
				new SpringValidatorAdapter(Validation.buildDefaultValidatorFactory().getValidator());
		
	}

	@Override
	public boolean supports(Class clazz) {
		
		return Collection.class.isAssignableFrom(clazz);
	}

	/* 기존의 validation도 vaild 가능하게 해준다.*/
	@Override
	public void validate(Object target, Errors errors) {
		if(target instanceof Collection) {
			Collection collection = (Collection) target;
			
			for(Object object : collection) {
			validator.validate(object, errors);	
			}
		}else {
			validator.validate(target, errors);
		}
		
	}


}
