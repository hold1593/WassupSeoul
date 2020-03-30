<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">

<title>타임라인 글작성 영역</title>
</head>
<style>
	#selectMember:hover{
		cursor : pointer;
	}
	
	.box {
        width: 100%;
        height: 500px;
        float: left;
        margin-right: 10px;
    }
	.au {
        overflow: auto;
     }

</style>
<body>

				<!-- 1/N 나누기 모달 -->
					<div class="modal fade" id="divideModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="divideModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 500px;">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="divideModalLabel"
										style="font-weight: bold; color:black;">1 / N 나누기 </h2>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- content start -->
									<textarea class=" nanum" id="writePostArea" rows="6" placeholder="게시글내용을 입력하세요."	
									  style="border: 1px solid black; color: black; font-size: 17px; height: 100px; padding-bottom: 20px; width:100%"></textarea><br>	
									<select id="vote" style="display: inline-block; height: 30px; " >
									<option value="KOR">KOR ₩</option>
									<option value="USD">USD $</option>
									<option value="USD">EUR €</option>
									<option value="CNY">CNY ¥</option>
									</select>
									<input type="text" id="originMoney" placeholder="총 금액을 입력해 주세요" 
											style="width:81%;  height: 30px; margin-left: 12px; margin-bottom:10px;"><br>	
	
									<div>
									<span>
										 <img src="${contextPath}/resources/img/team.png" style="width: 30px; height: 30px; "> 
									</span>
									<span>
										<span id="selectMember" style="margin-left: 15px;"  >멤버선택 ></span>	
									</span>
									</div>
									<div id="divideMemberList" class="box au">
									
									
									
									</div>	
										
									<button type="button" id="divideSubmitBtn" style="width: 15%; height: 30px; font-size: 17px; float: right; margin: 0px">작성</button>
 
									<!-- content end -->
								</div>
							</div>

							<!-- content end -->
						</div>
					</div>
					<!-- end -->
					
<script>
	// 숫자입력 콤마 생성
	/* function numberWithCommas(x) {
	  x = x.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	  x = x.replace(/,/g,'');          // ,값 공백처리
	  $("#originMoney").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 정규식을 이용해서 3자리 마다 , 추가 
	} */
	
	function addCommas(x) {
		  return x.toString.replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
	}
	
	$("#originMoney").on('keyup',function(event){
		addCommas($(this).val().replace(/[^0-9]/g,''));
	})
	
	
	//멤버선택시 멤버 보기 
 	$("#selectMember").on("click",function(){
 		$("#divideMemberList").empty();
 		
 		$.ajax({
 			url : "selectdivideMember",
 			type : "post",
 			dataType : "json",
 			success : function(selectDevideMember){
 				console.log(selectDevideMember)
      			// 골목 회원 리스트 
 				var $divPlus = $("#divideMemberList");
      		
 				for(var i=0; i<selectDevideMember.length; i++){
 					//alert(selectDevideMember[i].memberNickName);
 				
					var html = '<div style="border: 1px solid #ced4da; height: 45px;"><img src="${contextPath}/resources/img/'
							 +  selectDevideMember[i].memberProfileUrl
							 + '" style="width: 30px; height: 30px; margin-left: 3px; margin-top: 7px;" class="'
							 +  selectDevideMember[i].memberNickName +'">'		
						     + '<label style="width: 260px; margin-left: 30px; margin-bottom: 30px; font-size:17px;">'
						     +  selectDevideMember[i].memberNickName
						     + '<input type="checkbox" class="memberSelect" name="'
						     +  selectDevideMember[i].memberNo
						     + '" style="margin-bottom: 10px; width:20px; height:20px; float:right;"/></label></div>'
					//console.log(html)
 					$("#divideMemberList").append(html); 
 					
 				}
 			},
 			error : function(e){
     			console.log("ajax 통신 실패");
     			console.log(e);
     		}
 		});
 	});
	
 	document.getElementById('voteSubmitBtn').addEventListener('click', function(){ 	
 			// 1/N 게시글 내용
 			var postContent = $(this).parent().find("textarea").val();	
 			
 			// 나눌 금액
 			var originMoney = $("#originMoney").val();
 			
 			// 선택된 인원 수 
 			//var checkedCount = $("input:checkbox[class='memberSelect']:checked").length
 		
			var memArray = new Array();
			
			/* $(".memberSelect").is(":checked").each(function() {
				var memberNo = $(this).attr("name");  
				memArray.push(memberInfo);
			});
			
			for(var i=0; i<memArray.length; i++){
	 			alert(memArray[i]);
			}  , "memArray" : memArray */
			
		$.ajax({
			url : "postDivide",
			data : {"postContent" : postContent, "originMoney" : originMoney,
					"checkedCount" : checkedCount
				   },
			type : "post",
			success : function(result) {
				
				if (result == "true") {
					alert("1/N 게시글 작성 성공");
					console.log("1/N 게시글 작성 성공");
					$("#voteCloseBtn").trigger("click");
				} else {
					alert("1/N 게시글 작성 실패");
					console.log("1/N 게시글 작성 실패");
				}
			},
			error : function(e) {
				console.log("ajax 통신 실패");
				console.log(e);
			}
		});
		 refreshList()
 	});
	
</script>		
			
</body>
</html>