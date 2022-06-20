<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- 사용할 jquery, script 기능들 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/main/main.css">
<link rel="stylesheet"
	href="${contextPath}/resources/product/css/productDetail.css">
<link rel="stylesheet"
	href="${contextPath}/resources/product/css/star.css" />

<!-- ResponseEntity -> ajax를 사용하여 json데이터 테이블 구현 -->
<script>
/* 상단 1. ProductLoad 2. ProductRight에 적용될 데이터 + 박스 구현 */
	$(function(){
		/*숫자 증가 감소*/
		var useNum = 0;
		
		/*재고 수량에 맞춰 올라가는 함수 (넘을시 입력x)*/
		function count(useNum){
			$('.btn').on('click', function(){
				var status = $(this).val();
				console.log("status : ", status)
				/*[0부터 시작 <= 재고 수량만큼] 변수*/
				/*id = result 밑의. text를 변수로 쓴다 (0이다)*/
				var num = $('#result').text();
				
				<!-- 수량 파악 -->
				/*intNum = parseInt("0") -> 정수로 변환된다*/
				var intNum = parseInt(num);
				console.log("intNum : ", intNum)
				var quantity = $("#size option:checked").text();
				var colon = quantity.indexOf(':');
				console.log(colon+2)
				/*text 의 XS 남은 수량 : 10에서 substring을 사용하여 (:의 인덱스 번호 부터 나오는 숫자)*/
				useNum = quantity.substring(colon + 2)
				console.log("useNum : ", useNum)
				
				
				if(status == '+' && intNum < useNum){
					intNum++;
					console.log(intNum)
				}else if(status == '-' && intNum > 0){
					intNum--;
					console.log(intNum)
				}
				$('#result').text(intNum)
			});			
		}
		/*재고 수량에 맞춰 올라가는 함수 -end-*/
		
		
		
		
		count(useNum)
		/* 사용할 데이터들 가져와 저장하기*/
		var contextPath = "${contextPath}";
		var proNum = ${proNum};
		var memberId = "${authInfo.id}";
		var proSize = ["0","XS","S","M","L","XL"];
		var proColor =["0","white", "ivory", "gray", "pink", "yellow", "mint", "green", "purple", "navy", "10", "black", "brown", "orange", "blue", "red", "basic"];
		var num = 0;
		
		/*스타일 후기 보기*/
		var notice = ['별로에요', '보통이에요', '그냥 그래요', '맘에 들어요', '아주 좋아요'];
		
		
			
		/* 제품 번호를 배열로 받아와 제품 상세 검색 (배열로 받은 이유 : 재고량을 각각 표시하기 위해서)*/
		$.get(contextPath + "/api/productDetail/" + proNum,
			function(json){
				console.log(json)
				
				var proSalerate = json[0].proSalesrate;
				console.log("proSalerate -> ", proSalerate)
				var proPrice = parseInt(json[0].proPrice);
				console.log("proPrice -> ", proPrice)
				/*세일 공식*/
				var salePrice = proPrice * ((100-proSalerate)/100) 
				
				
				/*가격을 정규식으로 찍어 내기위해 (###,###) 이런식*/
				var temp = proPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				var add = salePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				
				/* 후기숫자 */
				var reCount = 0;
				for(i = 0; i < json.length; i++){
					reCount += json[i].reReplyCount;
					console.log(reCount);
				}
					
				var sCont = "";
				/*ProductLoad박스 안*/
				sCont += "<div class='productImage'><img src="+contextPath+"/resources/product/images/"+json[0].proImgFileName+"></div>";
				sCont += "<div class = 'productInfo'>";
				sCont += "<div class = 'productInfoName'>";
				sCont += "<strong>" + json[0].proName + "</strong>";
				if(reCount == 0){
					sCont += "<span class = 'review'>작성된 리뷰가 없습니다.</span>";
				}else{
					sCont += "<span class = 'review'>"+ json[0].reReplyCount +"개 리뷰 보기</span>";
				}
				sCont += "</div>";
				sCont += "<p> 조회수 : "+ json[0].proHits +"</p>";			
				sCont += "<p>"+ json[0].proContent + "</p>";
				sCont += "<p>"+ json[0].proStatus + "</p>";
				sCont += "<p class='proPrice'>"+ temp + "원</p>";
				sCont += "<span class='proSalerate'>"+ proSalerate +"% </span>";
				sCont += "<span class='proPriceSale'>"+ add +"원 </span>";
				sCont += "<p> <select id='size'> <option value='size01'>사이즈를 선택해주세요</option>";
				for(i = 1; i < json.length + 1; i++){
					if(json[i-1].proQuantity == 0){
						sCont += "<option value = "+ i + " style = 'color:red' >"+proSize[json[i-1].proSize] + "남은 수량: " + json[i-1].proQuantity+ "</option>";
					}else{
						sCont += "<option value = " + i + ">" + proSize[json[i-1].proSize] + " 남은 수량: " + json[i-1].proQuantity + "</option>";
					}
				}
				sCont += "</div>"				
				
				$("#ProductLoad").append(sCont);
				var proNum = json[2].proNum + "";
				console.log("json[2].proNum + '' : ",proNum)
				var imgCont = "";
				
				for(j=1; j<3; j++){
					imgCont += "<img class='detailImg' src="+ contextPath +"/resources/product/images/"+proNum+"-" + j +".jpg><br>"
				}
				imgCont += "<img class = 'detailImg' src="+contextPath+"/resources/product/sizeImages/"+json[0].proCategory+".jpg>";
				$("#productDetailImg").append(imgCont);
				
				$(".review").on('click', function(){
					$('html, body').animate({scrollTop:$('#productReview').position().top}, 'slow');
				});
			}); /*ProductLoad 영역 완료*/
			
		
		
			/* 장바 구니 만약 size 선택 않함? 돌아가. 만약 수량 선택 않함? 돌아가.*/
			$("#cart").on("click",function(){
				console.log($('#size').val())
				if($('#size').val() == "size01"){
					return alert("사이즈를 선택해주세요")
				}
				
				if(parseInt($('#result').text())==0){
					return alert("수량을 선택해주세요");
				}
				
				selectCartByMemberIdAndProNum(memberId, proNum)				
			});
			
			/*장바구니 내에서 회원아이디, 제품 번호로 검색 있으면 update 없으면 insert (method)*/
			function selectCartByMemberIdAndProNum(memberId, proNum){
				/* 이런식으로 변수를 줘서 사용할수도 있다.*/
				var selectProNum = $.ajax({
					url : contextPath + "/api/selectCartByIdAndProNum/" + memberId + "/" + parseInt(proNum+$('#size').val()),
					type:'get',
					datatype: 'json',
					cache : false,
					success : function(res){
						if(selectProNum.responseJSON.length == 0){
							insertCart();
							window.close();
							window.location.href= contextPath + "/cart?memId=${authInfo.id}";
						}else if(selectProNum.responseJSON.length == 1){
							var cartNum = selectProNum.responseJSON[0].cartNum
							var cN = parseInt($('#result').text())
							updateCart(cartNum, cN)
							window.close()
							window.location.href = contextPath + "/cart?memId=${authInfo.id}";
						}
					},
					error : function(request, status, error){
						alert("로그인이 필요한 서비스입니다. 로그인 창으로 이동하겠습니다.")
						window.location.href = contextPath +  "/login"
					}
				})
			}
			
			
			/* 장바구니 추가 function*/
			function insertCart(){
				var newCart = {
				
						"memberId" : {
							"memberId" : memberId
						},
						"cartProNum" : {
							"proNum" : parseInt(${proNum} + $('#size').val())
						},
						"cartProQuantity" : parseInt($('#result').text())
				}
				$.ajax({
					url:contextPath + "/api/memberProductCart/",
					type:"Post",
					contentType : "application/json; charset=utf-8",
					datatype : "json",
					cache : false,
					data : JSON.stringify(newCart),
					success : function(res){
						console.log(newCart)
					},
					error : function(request, status, error){
						alert("에러 에러.")
						window.location.href= contextPath + "/login"
					}
					
				})
			}
			
			/* 장바구니 이미 있는 옷일때는 update(function)*/
			function updateCart(cartNum, cN){
				var cartItem = {
						  "cartNum": cartNum,
						  "cartProQuantity": cN
						}
				$.ajax({
					url : contextPath + "/api/memberProductCart/" + cartNum,
					type : 'Patch',
					contextType : "application/json; charset=utf-8",
					datatype : "json",
					data: JSON.stringify(cartItem),
					success : function(cartItem){},
					error:function(request, status, error){
						alert("code:" + request.status+"\n" + "message:" 
								+ request.reponseText + "\n" + "error:" + error);
					}
				})
			}
			
			/* 구입하기 버튼 */
			$('#purchase').on("click", function(){
				if($('#size').val() == "size01"){
					return alert("사이즈를 선택해주세요")
				}
				
				if(parseInt($('#result').text())==0){
					return alert("수량을 선택해주세요");
				}
				
				if(!confirm("바로 구매하시겠습니까")){
					
				}else {
					useOrderBtn()
				}
			});
			
			/*바로 구매하기 버튼을 사용해서 주문 페이질 넘어가기 위한 함수*/
			function useOrderBtn(){
				var orderProd = {
						"cartProQuantity":parseInt($('#result').text()),
						"memberId" : {
							"memberId" : memberId
						},
						"cartProNum" : {
							"proNum" : parseInt(${proNum} + $('#size').val())
						}
				}
				$.ajax({
					url:contextPath + '/api/useOrderProductBtn',
					type:'Post',
					contentType : "application/json; charset=utf-8",
					datatype: "json",
					data: JSON.stringify(orderProd),
					success: function(res){
						console.log(res)
						selectOrderProduct(res);
					},
					error : function(request, status, error){
						alert("로그인창으로 이동하겠습니다.")
						window.location.href=contextPath + "/login"
					}
				})
			}
			
			/*장바구니번호를 검색후 주문페이지로 이동*/
			function selectOrderProduct(cartNums){
				$.ajax({
					url:contextPath + "/api/chooseProductCarts",
					type:'Post',
					contentType : "application/json; charset=utf-8",
					datatype : "json",
					data: JSON.strigify(cartNums),
					success:function(res){
						window.location.href = contextPath + "/order?memId=${authInfo.id}";
					},
					error:function(request, status, error){
						alert("code:" + request.status + "\n" + "message:"
								+request.responseText + "\n" + "error:" + error);
					}
				})
			}
			
	/*제품별 후기 검색 (후기 controller -> DTO접근 -> mapper와 일치한 DB 데이터 접근 -> 데이터 가져와 Service에서 작업 -> 컨트롤러 -> 후기 View)*/
	/* ResultFull을 사용한 View Jquery 기본형 $.get(데이터 주소, fucntion(json){View딴 데이터를 가진 front작업})*/
	$.get(contextPath + "/api/selectReviewByProNum/" + proNum,
			function(json){
			sCont = "";
			if(json.length != 0){
				for(i = 0; i < json.length; i++){
					sCont += "<div class = 'reviewMembers'>";
					sCont += "	<hr style='border-radius:10%; border-style:dashed; color: #ccc'>"
					sCont += "		<h1 class='memberId'> ID : " + json[i].memberId+ "</h1>";
					sCont += "			<div class='starRate'>";
					sCont += "				<div class='star-rating'>";
					sCont += "					<div class = 'stars'>";
					if(json[i].reviewStar != 0){
						for(j= 1; j < json[i].reviewStar + 1; j++){
							$('.print').html('<img src= "images/star-lv' + j + '.png">')
							sCont += "<i class='s" +j + "fa fa-statr active'></i>";
						}						
						
						for(j=1; j < 5-json[i].reviewStar+1; j++){
							sCont += "<i class='s" +j + "fa fa-statr'></i>";
						}
					}
					sCont += "						<div class='print'></div>";
					sCont += " 			</div>";
					sCont += "		</div>";
					sCont += "	</div>";
					sCont += "<div class='reviewList'>";
					sCont += " <img class = 'prodImg' src='${contextPath}/resources/product/images/" + json[i].proImageFilename.proImageFilename + "' width = '70'>"
					sCont += "  <div class='proAndMemInfo'>";
					sCont += " 		<span>" + json[i].proName.proName + "</span><br>";
					sCont += "		<span>" + proColor [json[i].proName.proColor] + "/" + proSize[json[i].proName.proSize] + "</span><br>";
					sCont += " </div>";
					sCont += "	<div class='reviewContent'>" + json[i].reviewContent + "</div><br>";
					sCont += " <div class='reviewImg'>";
					if(json[i].reviewImageFileName1 == null || json[i].reviewImageFileName == ""){
						json[i].reviewImageFileName1 = "noimage.jpg";
					}
					sCont += "				<img src='${contextPath}/resources/review/images/" + json[i].reviewImagefilename1 + "'>"
					if(json[i].reviewImagefilename2 == null || json[i].reviewImagefilename2 == ""){
						json[i].reviewImagefilename2 = "noimage.jpg" 
					}
					sCont += "			<img src='${contextPath}/resources/review/images/" + json[i].reviewImagefilename2 + "' width = '70'>"
					sCont += " 	</div>"
					sCont += " </div>"
					sCont += "			<div class='replyGroup'>"
					sCont += "				<input type='hidden' class = 'rno' name='rno' value="+json[i].reviewNum+"/>";
					sCont += "				<input type='text' class='replyContent' name='replyContent' placeholder='내용을 입력하세요.'>";
					sCont += "	    	<button class = 'commentInsertBtn' name='commentInsertBtn'>댓글</button>"
					sCont += " 			</div>"
					
					<!-- (댓글 달시 보이는 테이블) 리뷰가 1개 이상이면 보일 테이블 -->
					if(json[i].reviewReplys[0].reRepNum != 0){
						for(j = 0; j < json[i].reviewReplys.length; i++){
							sCont += "<div class='commentArea'>";
							sCont += "	<div class='commentUser'>" + json[i].reviewReplys[j].reRepMember + "</div>";
							sCont += "	<div class='commentContentAndBtns'>";
							sCont += "  	<div class='commentContent'>" + json[i].reviewReplys[j].reRepContent + "</div>";
							sCont += "			<div class='commentBtns'>"
							sCont += "				<input type= 'hidden' class = 'rrno' name= 'rrno' value="+json[i].reviewReplys[j].reRepNum+"/>"
							sCont += "				<button class='commentBtn updateBtn'>수정</button>"
							sCont += "				<button class='commentBtn deleteBtn'>삭제</button>"
							sCont += "			</div>"
							sCont += "		</div>"
							sCont += "</div>"
						}
					}
					sCont += "</div>";
				}/*for문 끝*/
				
				<!-- 후기로 올라 온거싱 없다면 이게 뜨도록 -->
			}else{
				$('.star-rating').text("");
				sCont += "<p class='noReview'>작성된 후기가 없습니다.</p>";
			}
			$("#productReview").append(sCont);
			
			/*후기 댓글 등록 버튼 클릭*/
			$('.commentInsertBtn').on("click", function(){
				var pReviewNum = $(this).prev().prev().val();
				
				
				/*후기에 댓글달 후기 번호*/
				var userNum = pReviewNum.substring(0, pReviewNum.length - 1);
				console.log(" pReviewNum.subString(0, pReviewnum.length - 1) : ", userNum)
				var replyContent = $(this).prev().val();
				var reRepNum = $(this).parent().parent().children('.updateMem').children().next().children('.commentBtns').children().val()+"";
				var useReRepNum = reRepNum.substring(0,reRepNum.length-1)
				
				var reply ={
					"reNum" : useNum,
					"reRepMember" : memberId,
					"reRepContent" : replyContent
				}
				
				var reviewReply = {
					"reRepNum" : useReRepNum,
					"reRepMember" : memberId,
					"reRepContent" : replyContent
				}
				
				if($(this).text() == '댓글'){
					insertReivewReply(reply);
					var sCont = "";
					sCont += "<div class='commentArea'>"
						sCont += "		<div class='commentUser'>"+memberId+"</div>"
						sCont += "		<div class='commentContentAndBtns'>"
						sCont += "			<div class='commentContent'>"+replyContent +"</div>"
						sCont += "			<div class='commentBtns'>"
						sCont += "				<input type= 'hidden' class = 'rrno' name= 'rrno' value="+maxNum+"/>"
						sCont += "				<button class='commentBtn updateBtn'>수정</button>"
						sCont += "				<button class='commentBtn deleteBtn'>삭제</button>"
						sCont += "			</div>"
						sCont += "		</div>"
						sCont += "</div>"
						$(this).parent().before(sCont);
						$(this).prev().val('')
				}else if($(this).text() == '수정'){
					updateReviewReply(reviewReply)
					
					$(this).prev().val();
					
					/*수정 버튼을 누르면 형제중에 updateMem이 생기고 그걸 찾는다.*/
					$(this).parent().parent().children('.updateMem').children().next().children('.commentContent').text($(this).prev().val())
					$(this).text('댓글')
					$(this).prev().val('')
					$(this).parent().parent().children().removeClass('updateMem')
					alert("수정완료하였습니다.")
				}
							
			});/*후기 댓글 등록 버튼 클릭 -end-*/
	$('.updateBtn').on('click', function(){
		var useNum = $(this).prev().val();
		var reRepNum = useNum.substring(0, useNum.length-1);
		var replyContent = $(this).parent().parent().parent().next().children().next().val();
		var commentInsertBtn = $(this).parent().parent().parent().parent().next().next().text();
		var id = $(this).parent().parent().prev().text();
		
		if(id == memberId){
			/*댓글 옆 수정버튼을 누르면 댓글버튼이 수정으로 이름이 바뀐다.*/
			$(this).parent().parent().parent().parent().children('.replyGroup').children('.replyContent').next().text('수정');
			
			/*세팅되는 곳 '.replyContent' , ()안은 세팅 할 값*/
			$(this).parent().parent().parent().parent().children('.replyGroup').children('.replyContent').val($(this).parent().prev().text());
			
			/*수정 버튼 누르면 class 생성*/
			$(this).parent().parent().parent().addClass('updateMem')
		}else{
			alert('자신의 글만 수정할 수 있습니다.')
		}
		
	});
			/*삭제버튼 클릭*/
			$('deleteBtn').on('click', function(){
				var useNum = $(this).prev().prev().prev().val()
				var reRepNum = useNum.substring(0, useNum.length-1);
				var delItem = {
						"reRepMember" : memberId,
						"reRepNum" : reRepNum
				}
				
				deleteReviewReply(delItem)
				
				var id = $(this).parent().parent().prev().text()
				
				if(id == memberId){
					$(this).parent().parent().parent().prev().text()
				}else{
					alert("자산이 쓴 글만 삭제 하실수 있습니다.")
				}
			}); /*삭제버튼 클릭 -end-*/	
			
	});  /*제품별 후기 검색 -end- */
	
	/*댓글 인서트 메서드 -ajax로 처리-*/
	function insertReviewReply(reply){
		$.ajax({
			url : contextPath + '/api/insertReviewReply',
			type : 'Post',
			contentType : "application/json; chartset=utf-8",
			datatype : "json",
			data : JSON.stringify(reply),
			success: function(res){
				window.location.reload()
			},
			error: function(request, status, error){
				console.log(request)
				alert(status);
			}
		}); /*댓글 인서트 메서드 -ajax로 처리 end-*/
	}
	/*댓글 업데이트(수정) 메서드 -ajax로 처리-*/
	function updateReviewReply(reviewReply){
		
		$.ajax({
			url: contextPath + "/api/updateReviewReply/" + reviewReply.reRepNum,
			type : 'Patch',
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data: JSON.stringify(reviewReply),
			success : function(res){
				console.log(reivewReply)
				
			},
			error:function(request, status, error){
				console.log(request)
				alert(status);
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})		
	}/*댓글 업데이트(수정) 메서드 -ajax로 처리 end-*/
	
	/* 댓글 삭제 */
	function delteReviewReply(delItem){
		console.log(delItem)
		$.ajax({
			url : contextPath + '/api/deleteReviewReply',
			type : 'Post',
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data: JSON.stringify(delItem),
			success: function(res){
				
			},
			error : function(request, status, error){
				
			}
		})
	}/* 댓글 삭제 -end-*/	
	
	
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="box">
		<!-- productDetailItem 영역 -->
		<!-- 1. 박스 -->
		<section id="ProductLoad"></section>
		<!-- 1. 박스 (끝) -->

		<!-- 2. 박스 -->
		<div class="productRight">
			<div class="calculator">
				<input class="cal btn plus" type="button" value='-' />
				<div class="cal" id="result">0</div>
				<input class="cal btn minus" type="button" value='+' />
			</div>

			<div class="submitBtns">
				<input type="submit" id="cart" style="cursor: pointer;" value='장바구니' />
				<input type="submit" id="purchase" style="cursor: pointer;"
					value='구매하기' />
			</div>
		</div>
		<!-- 2. 박스 (끝) -->



		<!-- 3. 박스 -->
		<section id="productDetailImg"></section>
		<!-- 3. 박스 (끝) -->

		<!-- 4. 박스 -->
		<section id="productReview">
			<p class="menuTitle">REVIEW</p>
		</section>
		<!-- 4. 박스 (끝) -->
	</div>
</body>
</html>