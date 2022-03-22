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

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.message.MessageCollectionMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView listProducts(
			@RequestParam(value = "total", required = false) String total,
			@RequestParam(value = "proName", required = false) String keyword,
			@RequestParam(value = "proStatus", required = false) String proStatus,
			@RequestParam(value = "proCategory", required = false) String proCategory,
			@RequestParam(value = "proPrice", required = false) String proPrice,
			@RequestParam(value = "proSalesRate", required = false) String proSalesRate,
			@RequestParam(value = "proHits", required = false) String proHits,
			@RequestParam(value = "proSold", required = false) String proSold,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("side_menu") != null) {
			session.removeAttribute("side_menu");
		}
		session.setAttribute("side_menu", "side_product");

		System.out.println("RequestParam==keyword :" + keyword);
		System.out.println("RequestParam==proStatus :" + proStatus);
		System.out.println("RequestParam==proCategory :" + proCategory);
		System.out.println("RequestParam==proPrice :" + proPrice);
		System.out.println("RequestParam==proSalesRate :" + proSalesRate);
		System.out.println("RequestParam==proHits :" + proHits);

		ModelAndView mav = new ModelAndView();

		Map<String, Object> pagingMap = new HashMap();
		
		Map<String, Object> productsMap = new HashMap();
		
		// 자주 사용하는데 왜 섹션을 요청 하는거지? 모르겠다.
		String _section = (String) request.getParameter("section");
		String _pageNum = (String) request.getParameter("pageNum");

		int section = Integer.parseInt(((_section == null) ? "1" : _section));
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));

		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("total", total);
		pagingMap.put("keyword", keyword);
		pagingMap.put("proStatus", proStatus);
		pagingMap.put("proCategory", proCategory);
		pagingMap.put("proPrice", proPrice);
		pagingMap.put("proSalesRate", proSalesRate);
		pagingMap.put("proHits", proHits);

		productsMap = adminProductService.listProducts(pagingMap);
		System.out.println("key : " + productsMap.get("productsList"));
		productsMap.put("section", section);
		productsMap.put("pageNum", pageNum);
		productsMap.put("keyword", keyword);
		productsMap.put("proSold", proSold);
		
		productsMap.put("proCategory", proCategory);
		productsMap.put("proPrice", proPrice);
		productsMap.put("proSalesRate", proSalesRate);
		productsMap.put("proHits", proHits);
		productsMap.put("proStatus", proStatus);

		System.out.println("productsMap :section=" + section);
		System.out.println("productsMap :pageNum=" + pageNum);
		System.out.println("productsMap :keyword=" + keyword);
		System.out.println("productsMap :proSold=" + proSold);
		System.out.println("productsMap :proCategory=" + proCategory);
		System.out.println("productsMap :proPrice=" + proPrice);
		System.out.println("productsMap :proSalesRate=" + proSalesRate);
		System.out.println("productsMap :proHits=" + proHits);
		System.out.println("productsMap :proStatus=" + proStatus);
		
		// mav.addObject 덕에 이페이지 안에선 c:set ${productsMap.something} 사용 가능
		mav.addObject("productsMap", productsMap);
		mav.setViewName("admin/product/listProducts");

		return mav;
	}
	// 제품 인서트후.
	@RequestMapping(value="addNewProduct", method = RequestMethod.POST)
	public ResponseEntity addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String imageFileName = null;
		Map<String, Object> newProductMap1 = new HashMap<String, Object>();
		Map<String, Object> newProductMap2 = new HashMap<String, Object>();
		
		String message = null;
		String proNameCheck=multipartRequest.getParameter("proName").trim();
		String proPriceCheck=multipartRequest.getParameter("proPrice").trim();
		String proSalesrateCheck=multipartRequest.getParameter("proSalesrate").trim();
		String proQuantityCheck=multipartRequest.getParameter("proQuantity").trim();
		String proContentCheck=multipartRequest.getParameter("proContent").trim();
		String proNumCheck=multipartRequest.getParameter("proNum").trim();
		
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		if(proNameCheck.isEmpty() || proPriceCheck.isEmpty() ||proSalesrateCheck.isEmpty() ||proQuantityCheck.isEmpty() ||proContentCheck.isEmpty() ||proNumCheck.isEmpty() ) {
			message = "<script> ";
			message += " alert('빈칸이 존재합니다. 확인해 주세요.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/product/addNewProductForm';";
			message += " </script>";
		}else {
			Enumeration enu = multipartRequest.getParameterNames();
			
			while(enu.hasMoreElements()){
				String name = (String)enu.nextElement();
				String value = multipartRequest.getParameter(name);
				newProductMap2.put(name, value);
			}
			
			List<ProductImageDTO> imageFileList = upload(multipartRequest);
			
			newProductMap1.put("imageFileList", imageFileList);
			
			try {
				newProductMap1.put("proContent", multipartRequest.getParameter("proContent"));
				newProductMap1.put("proStatus", multipartRequest.getParameter("proStatus"));
				newProductMap1.put("proName", multipartRequest.getParameter("proName"));
				newProductMap1.put("proNum", Integer.parseInt(multipartRequest.getParameter("proNum")));
				newProductMap1.put("proCategory", Integer.parseInt(multipartRequest.getParameter("proCategory")));
				newProductMap1.put("proQuantity", Integer.parseInt(multipartRequest.getParameter("proQuantity")));
				newProductMap1.put("proSize", Integer.parseInt(multipartRequest.getParameter("proSize")));
				newProductMap1.put("proColor", Integer.parseInt(multipartRequest.getParameter("proColor")));
				newProductMap1.put("proSalesrate", Integer.parseInt(multipartRequest.getParameter("proSalesrate")));
				newProductMap1.put("proPrice", Integer.parseInt(multipartRequest.getParameter("proPrice")));
				adminProductService.addNewProduct(newProductMap1);
				
				String proNum = multipartRequest.getParameter("proNum");
				
				if(imageFileList != null && imageFileList.size() != 0) {
					for(ProductImageDTO productImageDTO : imageFileList) {
						imageFileName = productImageDTO.getProImageFileName();
						File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + imageFileName);
						File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + proNum);
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
					}
				}
				
				message = "<script>";;
				message += "alert('새상품이 등록되었습니다.'); ";
				message += "location.href ='" + multipartRequest.getContextPath() +"/admin/product/addNewProductForm';";
				message += "</script>";
			}catch (Exception e) {
				e.printStackTrace();
				if(imageFileList != null && imageFileList.size() != 0) {
					for(ProductImageDTO productImageDTO : imageFileList) {
						imageFileName = productImageDTO.getProImageFileName();
						File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + imageFileName);
						srcFile.delete();
					}					
				}
				message ="<script>";
				message += "alert('새상품 등록 실패 : 이미 있는 제품이거나, 사진이 없습니다.');";
				message += " location.href='" + multipartRequest.getContextPath() + "/admin/product/addNewProductForm';";
				message += " </script>";
			}	
		}
		
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		
		return resEntity;
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
		
		product.setProNum(Integer.parseInt(request.getParameter("proNum")));
		System.out.println("upModel 의 request.getParameter(proNum) : " + request.getParameter("proNum"));
		product.setProQuantity(Integer.parseInt(request.getParameter("proQuantity")));
		System.out.println("upModel 의 request.getParameter(proQuantity) : " + request.getParameter("proQuantity"));

		adminProductService.modfiyModel(product);
		
		String message = null;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		message="<script>";
		message += "alert('모델 추가 완료');";
		message += "self.close();";
		message += "opener.parent.location.reload();";
		message += "</script>";
		
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);

		return resEnt;
	}
	
	@RequestMapping("upModelForm")
	public ModelAndView addNewModelForm(@RequestParam(value="proNum") String proNum
			,@RequestParam(value="proCategory") String proCategory
			,@RequestParam(value="proColor") String proColor
			,@RequestParam(value="proSize") String proSize
			,HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("proNum", proNum);
		mav.addObject("proCategory", proCategory);
		mav.addObject("proColor", proColor);
		mav.addObject("proSize", proSize);

		mav.setViewName("admin/product/upModelForm");
		
		return mav;		
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteProducts", method = RequestMethod.POST)
	public ResponseEntity deleteProducts(String[] _delete_val
										,HttpServletRequest request
										,HttpServletResponse response ) {
		
		ArrayList<String> deleteList = new ArrayList<String>();
		for(String value : _delete_val) {
			System.out.println("deleteProdcuts 의 for 문 value : " + value);
			deleteList.add(value);
		}
		
		// ResponseEntity 의 사용 구조
		// 1. 선언부
		String message = null;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		
		// 2. 헤더에 추가 부. jsp에 찍어줄것들
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		Map<String, Object> deleteMap = new HashMap<String, Object>();
		
		deleteMap.put("deleteList", deleteList);
		try {
			adminProductService.deleteProducts(deleteMap);
			
			message="<scrpit>";
			message += ";";
			message += "alert('선택한 리뷰 삭제를 완료 하였습니다.);";
			message+=" location.href='"+request.getContextPath()+"/admin/review/listReviews'; ";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);		
		}catch (Exception e) {
			message="<script> ";
			message+=" alert('선택한 리뷰 삭제실패하셨습니다..');";
			message+=" location.href='"+request.getContextPath()+"/admin/review/listReviews'; ";
			message+=" </script>";
			
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		}
		return resEnt;
	}
	
	@RequestMapping("productStatics")
	public ModelAndView productStatics(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
				
		Map<String, Object> viewMap = adminProductService.getProductStatics();
		
		mav.addObject("viewMap", viewMap);
		mav.setViewName("admin/product/productStatics");
		
		return mav;
	}
}
