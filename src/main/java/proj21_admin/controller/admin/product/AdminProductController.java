package proj21_admin.controller.admin.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import proj21_admin.controller.order.CustomCollectionValidator;
import proj21_admin.dto.product.ProductDTO;
import proj21_admin.dto.product.ProductImageDTO;
import proj21_admin.service.admin.product.AdminProductService;

@Controller
@RequestMapping("/admin/product/")
public class AdminProductController {
	private static final String CURR_IMAGE_REPO_PATH = "D:\\admin\\file_repo";
	private final CustomCollectionValidator customCollectionValidator = new CustomCollectionValidator();
	
	// 1. 사용할 Service 자동 get, set 생성
	@Autowired
	private AdminProductService adminProductService;
	
	@RequestMapping("listProducts")
	public ModelAndView listProducts(HttpServletRequest request, HttpServletResponse response, HttpSession session
			,@RequestParam(value="total", required = false) String total 
			,@RequestParam(value="proName", required = false) String keyword
			,@RequestParam(value="proStatus", required = false) String proStatus
			,@RequestParam(value="proCategory", required = false) String proCategory
			,@RequestParam(value="proPrice", required = false) String proPrice 
			,@RequestParam(value="proSalesRate", required = false) String proSalesRate
			,@RequestParam(value="proHits", required = false) String proHits
			,@RequestParam(value="proSold", required = false) String proSold
			) {
		session = request.getSession();
		if(session.getAttribute("side_menu") != null) {
			session.removeAttribute("side_menu");
		}else {
			session.setAttribute("side_menu", "side_product");
		}
		
		// 사용할 모델 선언 (return 을 위해서)
		ModelAndView mav = new ModelAndView();
		
		// 데이터를 삽입할 Map 선언 1. 페이징 데이터 2. 일반 productMaps
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		Map<String, Object> productsMap = new HashMap<String, Object>();
		
		
		// paging을 위한 section, pagieNum 선언후 사용
		String _section = (String)request.getParameter("section");
		String _pageNum = (String)request.getParameter("pageNum");
		
		int section = Integer.parseInt((_section == null) ? "1" : _section);
		int pageNum = Integer.parseInt((_pageNum == null) ? "1" : _pageNum);
		
		// paging 데이터 
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("total", total);
		pagingMap.put("keyword", keyword);
		pagingMap.put("proStatus", proStatus);
		pagingMap.put("proCategory", proCategory);
		pagingMap.put("proPrice", proPrice);
		pagingMap.put("proSalesRate", proSalesRate);
		pagingMap.put("proHits", proHits);
		
		// productsMap 에 사용할 Service.listProducts 가져오기
		productsMap = adminProductService.listProducts(pagingMap);
		
		productsMap.put("section", section);
		productsMap.put("pageNum", pageNum);
		productsMap.put("keyword", keyword);
		productsMap.put("proSold", proSold);		
		productsMap.put("proCategory", proCategory);
		productsMap.put("proPrice", proPrice);
		productsMap.put("proSalesRate", proSalesRate);
		productsMap.put("proHits", proHits);
		productsMap.put("proStatus", proStatus);
		
		// addObject시 View에서 사용가능 
		mav.addObject("prodcutsMap", productsMap);
		mav.setViewName("admin/product/listProducts");
		
		return mav;
	}
	
	// 제품 추가
	@RequestMapping("addNewProductForm")
	public ModelAndView addNewProductForm(HttpServletResponse response, HttpServletRequest request) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/product/addNewProductForm");
		
		return mav;
	}
	
	// 제품 사진 폴더 생성
	private List<ProductImageDTO> upload(MultipartHttpServletRequest multipartRequest) throws IOException{
		// 1. multipartRequest에 있는 제품이름을 가져오기
		Iterator fileName2 = multipartRequest.getFileNames();
		while(fileName2.hasNext()) {
			// 1. 파일 이름 2. 다른 그릇에 담아주기 3. 오리지널 파일 이름
			String fileName = (String) fileName2.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
		}
		
		// 가져온 파일을 리스트에 넣어주기
		List<ProductImageDTO> fileList = new ArrayList<ProductImageDTO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			ProductImageDTO productImageDTO = new ProductImageDTO();
			
			String fileName = fileNames.next();
			productImageDTO.setProImgState(Integer.parseInt(fileName));
			
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			
			productImageDTO.setProImageFileName(originalFileName);
			fileList.add(productImageDTO);
			
			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
			// 조건 확인
			if(mFile.getSize() != 0) {
				
				// 위치가 존재하지 않으면 폴더 생성후 -> 파일이 생성된다
				if(!file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				} 
				// FileInputStream 사용하지 않아도 transferTo() 로 간단하게 사용가능
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName ));
			}
		}		
		return fileList;
	}
	
	@RequestMapping(value="upModel", method = RequestMethod.POST)
	public ResponseEntity upModel(HttpServletResponse response,
							HttpServletRequest request) {
		
		Map<String, Object> productMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			productMap.put(name, value);
		}
		ProductDTO product = new ProductDTO();
		
		product.setProNum(0);
		return null;
	}
}
