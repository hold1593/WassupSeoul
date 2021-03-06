<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">

<script src="http://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>


<style>
@import
	url('https://fonts.googleapis.com/css?family=Poor+Story&display=swap');

.container2 {
	padding-right: 15px;
	padding-left: 15px;
	width: 100%;
	height: 100%;
	text-align: center;
	position: relative;
	z-index: 1;
}

.container2::after {
	width: 100%;
	height: 100%;
	content: "";
	background:
		url("${pageContext.request.contextPath}/resources/img/서울커버.jpg");
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	opacity: 0.6;
}

body {
	height: 1710px;
}

.infoBox {
	background-color: white;
	background-color: rgba(255, 255, 255, 0.5);
	width: 800px;
	height: auto;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.profile img {
	max-width: 100%;
}
.profileDiv{
	width: 200px;
    height: 200px;
    border-radius: 70%;
    overflow: hidden;
    margin-left: 25%;
}

/* number 태그 화살표 제거 */
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>

<script type="text/javascript">
	var sel_file;

	$(document).ready(function() {
		$("#profile_img").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sele_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>

<title>SignUp</title>
</head>

<body>
	<div class="container2">
		<div class="row">
			<div class="col-md-12">
				<h1 class="mt-5" style="font-size: 80px;">Who Are U?</h1>
				<br>

				<div class="infoBox mx-auto">

					<form method="POST"
						action="${pageContext.request.contextPath}/member/signUp"
						name="signUpForm" onsubmit="return validate();"
						enctype="multipart/form-data">
						<br>
						<br>

						<!-- 이메일 입력 -->
						<div class="row form-group">
							<div class="col-md-4">
								<label for="" class="nanum float-right" style="font-size: 25px; color: black;" >*이메일</label>
							</div>
							<div class="col-md-6">
								<input type="email" id="email" name="memberEmail"
									placeholder=" 사용하실 이메일을 입력해주세요"
									class="nanum form-control float-left" required> <input
									type="hidden" name="emailDup" id="emailDup" value="false">
								<div>
									<span id="checkEmail"></span>
								</div>
							</div>
						</div>

						<!-- 비밀번호 입력 -->
						<div class="row form-group">
							<div class="col-md-4">
								<label for="" class="nanum float-right" style="font-size: 25px; color: black;">*비밀번호</label>
							</div>
							<div class="col-md-6">
								<input type="password" id="pwd1" name="memberPwd"
									placeholder=" 영문대소문자+숫자 6자 이상"
									class="nanum form-control float-left" maxlength="20" required>
								<div>
									<span id="checkPwd1"></span>
								</div>
							</div>
						</div>

						<!-- 비밀번호 재확인 -->
						<div class="row form-group">
							<div class="col-md-4">
								<label for="" class="nanum float-right" style="font-size: 25px; color: black;">*비밀번호 확인</label>
							</div>
							<div class="col-md-6">
								<input type="password" id="pwd2" placeholder=" 비밀번호를 확인해주세요"
									class="nanum form-control float-left" maxlength="20" required>
								<div>
									<span id="checkPwd2"></span>
								</div>
							</div>
						</div>

						<!-- 이름 입력 -->
						<div class="row form-group">
							<div class="col-md-4">
								<label for="" class="nanum float-right" style="font-size: 25px;color: black;">*이름</label>
							</div>
							<div class="col-md-6">
								<input type="text" id="name" name="memberNm"
									placeholder=" 이름을 입력해주세요" class="nanum form-control float-left"
									maxlength="15" required>
								<div>
									<span id="checkName"></span>
								</div>
							</div>
						</div>

						<!-- 닉네임 입력 -->
						<div class="row form-group">
							<div class="col-md-4">
								<label for="" class="nanum float-right" style="font-size: 25px; color: black;">*닉네임</label>
							</div>
							<div class="col-md-6">
								<input type="text" id="nickName" name="memberNickname"
									placeholder=" 사용하실 닉네임을 설정해주세요"
									class="nanum form-control float-left" maxlength="10" required>
								<div>
									<span id="checknickName"></span>
								</div>
							</div>
						</div>

						<!-- 전화번호 입력 -->
						<div class="row form-group">
							<div class="col-md-4">
								<label for="" class="nanum float-right" style="font-size: 25px; color: black;">*전화번호</label>
							</div>
							<div class="col-md-2">
								<select class="form-control" id="phone1" name="phone1" required>
									<option selected>010</option>
									<option>011</option>
									<option>016</option>
									<option>016</option>
									<option>070</option>
									<option>019</option>
								</select>
							</div>
							<div class="col-md-2">
								<input type="number" class="form-control phone" id="phone2"
									name="phone2" maxlength="4" required>
							</div>
							<div class="col-md-2">
								<input type="number" class="form-control phone" id="phone3"
									name="phone3" maxlength="4" required>
							</div>
							
						<span id="checkPhone" style="margin-left:380px;" ></span> <br><br>
						</div>


						<!-- 성별 선택 -->
						 <div class="row form-group">
							<div class="col-md-4">
								<label for="" class="nanum float-right" style="font-size: 25px; color: black;">*성별</label>
							</div>
							
							<div class="col-md-3 custom-control custom-radio">
								<input type="radio" id="man" name="memberGender" value="M" class="custom-control-input"> 
								<label class="custom-control-label nanum" for="man" style="font-size: 25px; color: black;">남자</label>
							</div>
							<div class="col-md-3 custom-control custom-radio">
								<input type="radio" id="female" name="memberGender" value="F" class="custom-control-input"> 
								<label class="custom-control-label nanum" for="female" style="font-size: 25px; color: black;">여자</label>
							</div>
						</div> 

						<!-- 나이 입력 -->
						<div class="row form-group">
							<div class="col-md-4">
								<label for="" class="nanum float-right" style="font-size: 25px; color: black;">*나이</label>
							</div>

							<div class="col-md-6">
								<input type="number" name="memberAge" class="nanum form-control"
									maxlength="3" placeholder=" 나이를 입력해주세요(숫자만)">
							</div>
						</div>
						
						<!-- 관심분야 직접입력 -->
						<div class="row form-group">
							<div class="col-md-4">
								<label for="" class="nanum float-right" style="font-size: 25px; color: black;">*관심분야 작성</label>
							</div>
							<div class="col-md-4">
								<input type="text" class="nanum form-control border-primary" id="writeHobbyNm"
									placeholder="  관심분야 직접 입력">
							</div>
							<div class="col-md-2">
								<button class="nanum btn btn-primary" id="insertHobby" type="button"
									style="font-size: 19px;">선택</button>
							</div>
						</div>

						<!-- 관심분야 검색 -->
						<div class="row form-group">
							<div class="col-md-4">
								<label for="" class="nanum float-right" style="font-size: 25px; color: black;">*관심분야</label>
							</div>
							<div class="col-md-4">
								<input type="text" class="nanum form-control border-primary" id="searchHobbyNm"
									placeholder="  관심분야 검색">
							</div>
							<div class="col-md-2">
								<button class="nanum btn btn-primary" type="button" id="searchHobby"
									style="font-size: 19px;">검색</button>
							</div>
						</div>

						<!-- 관심분야 선택창 -->
						<div class="row form-group">
							<div class="col-md-4">
								<p class="nanum float-right" style="color: midnightblue;">(1개 이상의 선택을 권장합니다.)</p>
							</div>
							<div class="col-md-6" id="searchHobbyList" style="overflow: auto; max-height: 60px;">
								<li class="list-group-item">
									<h5 class="nanum">관심사를 검색하세요</h5>
								</li>
							</div>
						</div>

						<!-- 관심분야 3개 선택창 -->
						<div class="row form-group">
							<div class="col-md-4">
								<label for=""></label>
							</div>
							<div class="col-md-6">
								<div class="card" style="max-width: 30rem;">
									<div class="card-body" id="selectHobby">
										<!-- 지정된 관심사 출력부분 -->
									</div>
								</div>
							</div>
						</div>
						<br>
						<!-- 프로필 사진 영역 -->
						<div class="row form-group">
							<div class="col-md-4">
								<label for="" class="nanum float-right" style="font-size: 25px; color: black;">프로필사진</label><br>
								<br>
								<div>
									<span id="checkImg"></span>
								</div>
								<p class="nanum float-right" style="color: midnightblue;">(필수사항)</p>
							</div>
							<div class="col-md-6">
								<div class="profileDiv">
									<img id="img" class="profile" src="${pageContext.request.contextPath}/resources/img/wm1.png">
								</div>
									<input type="file" id="profile_img" name="originProfileUrl">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-4">
								<label for=""></label>
							</div>
							<div class="col-md-6">
							    <!-- <div class="custom-control custom-checkbox">
								      <input type="checkbox" class="custom-control-input" id="def_check" name="def_check">
								      <label class="custom-control-label" for="def_check" style="color: black;">기본 프로필 이미지 사용</label>
								      <input type="hidden" id="defaultImg" name="defaultImg">
								</div> -->
							</div>
						</div>
						<script>
						<!-- 기본이미지 설정할 경우 그 값 넘기는 함수 -->
						$("#def_check").change(
								function(){
									//체크박스 값에 따라 히든 값 변경
									if($("#def_check").is(":checked")){
										$("#defaultImg").val('Y');
									}else {
										$("#defaultImg").val('N');
									}
								}
							);
						
						</script>
						

						<br>
						<div class="row form-group">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<button type="submit" style="margin-bottom:50px"
									class="nanum btn btn-danger btn-lg btn-block">같이놀기</button>
							</div>
							<div class="col-md-2"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		// 각 유효성 검사 결과를 저장할 객체
		var signUpCheck = {
			"email" : false,
			"emailDup" : false,
			"pwd1" : false,
			"pwd2" : false,
			"name" : false,
			"nickName" : false,
			"phone" : false,
			"img" : false
			
		};
		
		/* 관심사 제거 버튼 클릭시 관심사 제거 */
    	$(document).on("click",".deleteHobby",function(){
    		$(this).parent().parent().remove();	
    	});
		
    	/* 관심사 직접 입력후 버튼 클릭시 관심사 추가 */
    	$(document).on("click","#insertHobby",function(){
    		// 지정관심사가 3개인 경우
    		if( $("input[name=hobbyNmArr]").length > 2) { 
    			alert("지정관심사는 최대 3개만 지정할 수 있습니다.");
    			$("#writeHobbyNm").val("");
    		} 
    		else if($("#writeHobbyNm").val() == "") {
    			alert("관심사를 입력하세요.");
    		}
    		// 지정관심사가 3개미만인 경우
    		else {
    			var inputs = $("#selectHobby").find("input");
    			var insertVal = "#" + $("#writeHobbyNm").val();
    			var count = 0;
    			$.each(inputs,function(index,item){
                    if(insertVal == $(item).val()) {
                        count++;
                    } 
                });
    			// 중복값이 있는 경우
    			if(count > 0){
    				alert("중복된 관심사를 지정할 수 없습니다.");
        			$("#writeHobbyNm").val("");
    			}
    			// 중복값이 없는 경우
    			else {
    				
    				// 중복값에 따라 취미번호 변경
    				var $hobbyNoPlus = $("<input>").prop({"type" : "hidden", "name" : "hobbyNoArr"});
    				
    				// ajax를 이용해서 중복값이 있으면 no가져오고 아니면 0으로 지정
    				$.ajax({
    					url : "hobbyDupCheck",
                		data : {hobbyName : $("#writeHobbyNm").val()},
                		type : "post",
                		success : function(result) {
                			console.log(result);
                			$hobbyNoPlus = $hobbyNoPlus.val(result);
                		},
                		error : function(e){
                			console.log("ajax 통신 실패");
                			console.log(e);
                		}
    				});
    				
    				var writeHobby = $("#writeHobbyNm").val();
                	var $divPlus = $("<div></div>").addClass("form-group row");
    	       		var $divPlus1 = $("<div></div>").addClass("col-sm-9");
    	       		var $divPlus2 = $("<div></div>").addClass("col-sm-3");
    	       		var $divPlus3 = $("<div></div>").addClass("col-sm-11").css({"background-color":"black","height":"2px"});
    	       		var inputPlus = $("<input></input>")
						.prop({"type":"text", "readonly":"true", "name":"hobbyNmArr"})
						.val("#" + writeHobby).addClass("form-control-plaintext nanum")
						.css({"font-size":"18px","color":"black"});
					var buttonPlus = $("<button></button>").prop("type","button").addClass("badge badge-pill badge-danger deleteHobby").html("X");		
					$divPlus1 = $divPlus1.append(inputPlus);
    	            $divPlus2 = $divPlus2.append(buttonPlus);
    	            $divPlus = $divPlus.append($divPlus1).append($divPlus2).append($divPlus3).append($hobbyNoPlus);
    	      			
                   $("#selectHobby").append($divPlus);
                   $("#writeHobbyNm").val("");
                   
    			}
    		}
    		 
        });
		
    	/* 관심사 검색 버튼 클릭시 검색결과 출력*/
	    $("#searchHobby").on("click",function(){
		    var $searchHobbyNm = $("#searchHobbyNm");
		    if($searchHobbyNm.val() == ""){
		    	alert("검색할 관심사를 입력하세요.");
		    }
		    else{
		    	$.ajax({
	           		url : "searchHobby",
	           		data : {searchHobbyContent: $searchHobbyNm.val() },
	           		type : "post",
	           		dataType : "json",
	           		success : function(list){
	           			
	   					var $searchHobbyList = $("#searchHobbyList");
	           			$searchHobbyList.html("");
	     					
	           			if(list.length > 0) {
	           			    $searchHobbyNm.val("");
	           				$.each(list,function(i){
	           					var liPlus = $("<li></li>").addClass("list-group-item");
	                   			var divPlus = $("<div></div>").addClass("form-group row").css("margin-bottom","0px");
	                   			var divPlus1 = $("<div></div>").addClass("col-sm-7");
	                   			var divPlus2 = $("<div></div>").addClass("col-sm-2");
	                   			var divPlus3 = $("<div></div>").addClass("col-sm-3");
	               				var inputPlus1 = $("<input></input>")
	       						 			 .prop({"type":"text", "readonly":"true"})
	         						 			 .addClass("form-control-plaintext nanum")
	         									 .css("color","black").val("#" + list[i].hobbyNm);
	       						var inputPlus2 = $("<input></input>")
	       		 							 .prop({"type":"text", "readonly":"true"})
	       									 .addClass("form-control-plaintext nanum").val(list[i].hobbyCount + "명");
	       						var buttonPlus = $("<button></button>").prop("type","button")
	   										 .addClass("btn btn-primary nanum insertSearchHobby").html("선택")
	   							var hobbyNoPlus = $("<input>").prop("type","hidden").val(list[i].hobbyNo);
	       						
	       						divPlus1 = divPlus1.append(inputPlus1);
	       						divPlus2 = divPlus2.append(inputPlus2);
	       						divPlus3 = divPlus3.append(buttonPlus);
	       						divPlus = divPlus.append(divPlus1).append(divPlus2).append(divPlus3);
	       						liPlus = liPlus.append(divPlus).append(hobbyNoPlus);
	       						$searchHobbyList.append(liPlus);
	               			});
	           				
	           			} else {
	           				var liPlus = $("<li></li>").addClass("list-group-item");
	           				var hPlus = "<h5 class='nanum'>검색결과가 없습니다</h5>";
	           				liPlus = liPlus.append(hPlus);
	           				$searchHobbyList.append(liPlus);
	           				
	           			}
	       				
	           		},
	           		
	           		error : function(e){
	           			console.log("ajax 통신 실패");
	           			console.log(e);
	           		}
	           	});
		    }
	        		
	    });
    	
	    /* 검색된 관심사 선택 버튼 클릭 시 지정관심사 추가 */
    	$(document).on("click",".insertSearchHobby",function(){
    		// 지정관심사가 3개인 경우
    		if( $("input[name=hobbyNmArr]").length > 2) { 
    			alert("지정관심사는 최대 3개만 지정할 수 있습니다.");
    		}
    		// 지정관심사가 3개미만인 경우
    		else {
    			var inputs = $("#selectHobby").find("input");
    			var searchHobbyVal = $(this).closest("li").find("input").first().val();
    			var searchHobbyNo = $(this).closest("li").find("input").eq(2).val();
    			var count = 0;
    			$.each(inputs,function(index,item){
                    if(searchHobbyVal == $(item).val()) {
                        count++;
                    } 
                });
    			// 중복값이 있는 경우
    			if(count > 0){
    				alert("중복된 관심사를 지정할 수 없습니다.");
    			}
    			// 중복값이 없는 경우
    			else{
    	       		var divPlus = $("<div></div>").addClass("form-group row");
    	       		var divPlus1 = $("<div></div>").addClass("col-sm-9");
    	       		var divPlus2 = $("<div></div>").addClass("col-sm-3");
    	       		var divPlus3 = $("<div></div>").addClass("col-sm-11").css({"background-color":"black","height":"2px"});
    	       		var inputPlus = $("<input></input>")
									.prop({"type":"text", "readonly":"true", "name":"hobbyNmArr"})
									.val(searchHobbyVal).addClass("form-control-plaintext nanum")
									.css({"font-size":"18px","color":"black"});
    	       		var buttonPlus = $("<button></button>").prop("type","button").addClass("badge badge-pill badge-danger deleteHobby").html("X");
    	       		var hobbyNoPlus = $("<input>").prop({"type": "hidden","name" : "hobbyNoArr"}).val(searchHobbyNo);
    	       		
    	            divPlus1 = divPlus1.append(inputPlus);
    	            divPlus2 = divPlus2.append(buttonPlus);
    	           	divPlus = divPlus.append(divPlus1).append(divPlus2).append(divPlus3).append(hobbyNoPlus);
    	      			
                   $("#selectHobby").append(divPlus);
    			}
    		}
    	});

		// 실시간 입력 형식 검사
		// 정규표현식
		$(document).ready(
				function() {

					// jQuery 변수 : 변수에 직접적으로 jQuery메소드를 사용할 수 있음.
					var $email = $("#email");
					var $emailDup = $("#emailDup");
					var $pwd1 = $("#pwd1");
					var $pwd2 = $("#pwd2");
					var $name = $("#name");
					var $nickName = $("#nickName");
					var $nickNameDup = $("#nickNameDup");
					var $phone2 = $("#phone2");
					var $phone3 = $("#phone3");
					var $profile_img = $("#profile_img");
					var $br = $("<br>");

					//!$("#def_check").prop("checked")
					//$profile_img.get(0).files.length === 0
					// 프로필 사진 유효성 검사
						
					
					
				 $profile_img.on("input" , function() {		
						if(	$profile_img.get(0).files.length === 0 ){
							signUpCheck.img = false;
						}else {
							$("#checkImg").html("");
							signUpCheck.img = true;
						}				
					}); 
					
					

					// 이메일 유효성 검사
					$email.on("input", function() {
						var regExp = /^[\w]{1,20}@[\w]+(\.[\w]+){1,3}$/;

						if (!regExp.test($email.val())) {
							$("#checkEmail").text("이메일 형식이 유효하지 않습니다.")
							.css("color", "red")
							.css("font-weight","bold");
							signUpCheck.email = false;
						} else {
							$("#checkEmail").text("유효한 이메일 형식입니다.")
							.css("color", "green")
							.css("font-weight","bold");
							signUpCheck.email = true;

							$.ajax({
								url : "emailDupCheck",
								data : {
									memberEmail : $email.val()
								},
								type : "post",
								success : function(result) {

									if (result == "true") {
										$("#checkEmail")
												.text("사용 가능한 이메일 입니다.").css({
													"color" : "green",
													"font-weight" : "bold"
												});
										signUpCheck.emailDup = true;
									} else {
										$("#checkEmail").text(
												"사용할 수 없는 이메일 입니다.").css({
											"color" : "red",
											"font-weight" : "bold"
										});
										signUpCheck.emailDup = false;
									}
								},

								error : function(e) {
									console.log("ajax 통신 실패");
									console.log(e);
								}
							});
						}
					});
					
					// 비밀번호  유효성 검사
					$pwd1.on("input", function(){
						//영어 대,소문자 + 숫자, 총 6~12글자
						var regExp = /^[A-Za-z0-9]{6,12}$/;
						if(!regExp.test($pwd1.val())){ 
					    	$("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.")
					    	.css("color","red")
					    	.css("font-weight","bold");
					    	signUpCheck.pwd1 = false;
					    }else{
					    	$("#checkPwd1").text("유효한 비밀번호 형식입니다.")
					    	.css("color","green")
					    	.css("font-weight","bold");   	
					    	signUpCheck.pwd1 = true;
					    }

					});
					
					// 비밀번호 일치 여부
					$pwd2.on("input", function(){
						if($pwd1.val().trim() != $pwd2.val().trim()){
							$("#checkPwd2").text("비밀번호 불일치")
							.css("color","red")
							.css("font-weight","bold");
							signUpCheck.pwd2 = false;
						}else{
							$("#checkPwd2").text("비밀번호 일치")
							.css("color","green")
							.css("font-weight","bold");
							signUpCheck.pwd2 = true;
						}
					});
					
					// 이름 유효성 검사
					$name.on("input", function(){
						var regExp =  /^[A-Za-z가-힣\s]{2,15}$/; // 한글 두 글자 이상
						if(!regExp.test($(this).val())){ 
							$("#checkName").text("올바르게 작성해주세요")
							.css("color","red")
							.css("font-weight","bold");
							signUpCheck.name = false;
						}else{
							$("#checkName").text("")
							.css("color","green")
							.css("font-weight","bold");
							signUpCheck.name = true;
						}
					});
					
					 // 닉네임  유효성 검사
					$nickName.on("input", function(){
						// 한글,영어 대,소문자 + 숫자, 총 1~5글자
						var regExp = /^[A-Za-z0-9가-힣\s]{1,5}$/;
						if(!regExp.test($nickName.val())){
					    	$("#checknickName").text("닉네임 형식이 유효하지 않습니다.").css({"color":"red","font-weight":"bold"});
					    	signUpCheck.nickName = false;
					    }else{
					    	signUpCheck.nickName = true;
					    	 $.ajax({
					    		url : "nickNameDupCheck",
					    		data : {memberNickname: $nickName.val() },
					    		type : "post",
					    		success : function(result){
					    			
					    			if(result == "true"){
					    				$("#checknickName").text("사용 가능한 닉네임 입니다.").css({"color":"green","font-weight":"bold"});
					    				signUpCheck.nickNameDup = true;
					    			}else{
					    				$("#checknickName").text("사용할 수 없는 닉네임 입니다.").css({"color":"red","font-weight":"bold"});
					    				signUpCheck.nickNameDup = false;
					    			}
					    		},
					    		error : function(e){
					    			console.log("ajax 통신 실패");
					    			console.log(e);
					    		}
					    	}); 
					    }
						
						
					});

					// 전화번호 관련
					$(".phone").on("input",function(){
						
						// 전화번호 input 태그에 4글자 이상 입력하지 못하게 하는 이벤트
					    if ($(this).val().length > $(this).prop("maxLength")){
					        $(this).val($(this).val().slice(0, $(this).prop("maxLength")));
					    }
					    
						// 전화번호 유효성 검사
					    var regExp1 =  /^\d{3,4}$/; // 숫자 3~4 글자
					    var regExp2 =  /^\d{4,4}$/; // 숫자 4 글자
					    
					    if(!regExp1.test($phone2.val()) || !regExp2.test($phone3.val())){
					    	$("#checkPhone").text("전화번호가 유효하지 않습니다.").css("color","red").css("font-weight","bold");
							signUpCheck.phone = false;
					    }else{
							$("#checkPhone").text("유효한 전화번호입니다.").css("color","green").css("font-weight","bold");
							signUpCheck.phone = true;
						}
					}); 
				});
		
		
		
		
		// submit 동작
		function validate() {

			for ( var key in signUpCheck) {
				if (!signUpCheck[key]) {
					alert("일부 입력값이 잘못되었습니다.");
					var id = "#" + key;
					$(id).focus();
					return false;
				}
			}
			
			// 지정 관심사가 0개인 경우
			if( $("input[name=hobbyNmArr]").length < 1) {
				alert("관심사를 최소 1개이상 지정해야 합니다.");
				return false;
			}
		}
		
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

</body>

</html>