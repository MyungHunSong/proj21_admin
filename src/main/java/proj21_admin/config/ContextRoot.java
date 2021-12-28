package proj21_admin.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({ContextDataSource.class, ContextSqlSession.class, MvcConfig.class})
@ComponentScan(basePackages = {
	    "proj21_admin.service"
	  , "proj21_admin.controller"
		})
public class ContextRoot {
	
}
