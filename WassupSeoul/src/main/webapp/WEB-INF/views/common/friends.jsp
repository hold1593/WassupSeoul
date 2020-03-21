<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Poor+Story&display=swap');

.container2 {
	/* margin-top: 300px;
      margin-right: 90px;
      padding-right: 15px;
      padding-left: 15px; */
	position: fixed;
	bottom: 70px;
	right: 10px;
	display : none;
}

.messengerbox {
	width: 400px;
	height: auto;
}

.nav-item {
	text-align: center;
}

.col-md-4 {
	padding-right: 0px;
	padding-left: 0px;
}

.tab-pane p {
	text-align: center;
}

.tab-content22 {
	border: 2px solid black;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	max-width: 100%;
	width: auto;
}

.iconImg {
	width: 50px;
	height: 50px;
	padding: 0;
	border: none;
	/* margin-top: 840px;
      margin-right: 30px; */
	position: fixed;
	bottom: 10px;
	right: 10px;
	z-index: 2;
	box-sizing: border-box;
	
}

#chat {
	display : none;
}

	/* .back {
      height: 1500px;
    } */
    
/* #myTabContent {
	z-index: 1;
	position: absolute;
	top: 0;
	right: 0;
} */
</style>

<script>

	// 말풍선 눌러서 목록 뜨게 하는 함수
	var iconStatus = true;
 	$(function() {

		$('button.iconImg').click(function() {
			if (iconStatus == true) {
				$('.container2').show(200);
				iconStatus = false;
			} else {
				$('.container2').hide(200);
				iconStatus = true;
			}
			console.log(iconStatus)
		});
	}); 
	

 	// 대화목록에서 대화방으로 들어가는 함수
	var chatclick = false;
	$(function() {
		$(".chatCt").dblclick(function() {
			if (chatclick == false) {
				$(".chat").show();
				$("#chatList").hide();
				chatclick = true;
			}
		});
	});

	
	// 대화방에서 대화목록으로 나오는 함수
	$(document).ready(function() {
		$(".xBtn").click(function() {
			$("#chatList").show();
			$(".chat").hide();
			chatclick = false;
		});

	});
	
	
</script>





<div class="back">


	<button type="button" class="iconImg">
		<img src="${contextPath}/resources/img/msgicon2.png" alt=""
			width="50px">
	</button>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- 토글 메뉴 -->	
	<div class="container2">
		<div class="messengerbox">
			<div class="bs-component tabBox">
				<ul class="nav nav-tabs nanum">
					<li class="nav-item col-md-4"><a class="nav-link active"
						data-toggle="tab" href="#friendsList">친구목록</a></li>
					<li class="nav-item col-md-4"><a class="nav-link"
						data-toggle="tab" href="#chatList">친구대화</a></li>
					<li class="nav-item col-md-4"><a class="nav-link"
						data-toggle="tab" href="#friendReq">친구요청</a></li>
				</ul>
			</div>
			
			<script>
				$(".nav-item.col-md-4").on("click",function(){
					var index = $(".nav-item.col-md-4").index(this);
					
					for(var i=0 ; i<$(".nav-item.col-md-4").length ; i++){
						if(i == index){
							$(".tgl:eq("+i+")").show();
						}else{
							$(".tgl:eq("+i+")").hide();
						}
					}
					
					/*if(index == 0){
						$(".tgl:eq(0)").show();
						$(".tgl:eq(1)").hide();
						$(".tgl:eq(2)").hide();
					}else if(index == 1){
						$(".tgl:eq(0)").hide();
						$(".tgl:eq(1)").show();
						$(".tgl:eq(2)").hide();
					}else if(index == 2){
						$(".tgl:eq(0)").hide();
						$(".tgl:eq(1)").hide();
						$(".tgl:eq(2)").show();
					}*/
				});
			
			</script>
			
			
			
			
			<div id="myTabContent" class="tab-content22"
				style="overflow: auto; height: 500px;">
				
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- 친구 목록 -->	
				<div class="tab-pane fade active show tgl" id="friendsList">
					<div class="nanum">
						<br> 
						<img src="${contextPath}/resources/img/usericon.png"
							width="40px" height="40px" class="ml-3" data-toggle="modal"
							data-target="#profilePicture" style="cursor: pointer"> &nbsp;
						<span class="" style="font-size: 20px;">안중하</span> &nbsp;
						<button type="button"
							class="btn btn-outline-danger btn-sm nanum float-right mr-3"
							data-toggle="modal" data-target="#blockBtn">차단</button>
						<button type="button"
							class="btn btn-outline-info btn-sm nanum float-right mr-3"
							id="chatBtn">대화</button>
					</div>
					<hr>
				</div>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- 대화방 목록 -->		
				<div class="tab-pane fade tgl" id="chatList">
					<div class="nanum mt-3 ml-3">
						<div class="chatPf" style="display: inline-block;">
							<img src="${contextPath}/resources/img/usericon.png" width="40px"
								height="40px" class="chatProfile" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer">&nbsp;
						</div>
						<div class="chatCt" style="display: inline-block;">
							<span>김지원</span> <span class="mr-0">: 영준아 누나가 많이 아낀다</span>
						</div>
						<span class="badge badge-pill badge-danger float-right mr-3 mt-2">5</span>
					</div>
					
					<hr>

					<div class="nanum ml-3">
						<div class="chatPf" style="display: inline-block;">
							<img src="${contextPath}/resources/img/usericon.png" width="40px"
								height="40px" class="chatProfile" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer">&nbsp;
						</div>
						<div class="chatCt" style="display: inline-block;">
							<span>강지예</span> <span>: 오빠 힘내</span>
						</div>
						<span class="badge badge-pill badge-danger float-right mr-3 mt-2">3</span>
					</div>
					<hr>
					
					<div class="nanum mt-3 ml-3">
						<div class="chatPf" style="display: inline-block;">
							<img src="${contextPath}/resources/img/usericon.png" width="40px"
								height="40px" class="chatProfile" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer">&nbsp;
						</div>
						<div class="chatCt" style="display: inline-block;">
							<span>조미현</span> <span class="mr-0">: ㅉㅉ</span>
						</div>
						<span class="badge badge-pill badge-danger float-right mr-3 mt-2">5</span>
					</div>
					<hr>
					<div class="nanum mt-3 ml-3">
						<div class="chatPf" style="display: inline-block;">
							<img src="${contextPath}/resources/img/usericon.png" width="40px"
								height="40px" class="chatProfile" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer">&nbsp;
						</div>
						<div class="chatCt" style="display: inline-block;">
							<span>김제연</span> <span class="mr-0">: 형아 힘내</span>
						</div>
						<span class="badge badge-pill badge-danger float-right mr-3 mt-2">4</span>
					</div>
					<hr>
					
					<div class="nanum mt-3 ml-3">
						<div class="chatPf" style="display: inline-block;">
							<img src="${contextPath}/resources/img/usericon.png" width="40px"
								height="40px" class="chatProfile" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer">&nbsp;
						</div>
						<div class="chatCt" style="display: inline-block;">
							<span>김세진</span> <span class="mr-0">: 괜찮아 그럴 수도 있지. 힘내 칭구얌</span>
						</div>
						<span class="badge badge-pill badge-danger float-right mr-3 mt-2">3</span>
					</div>
					<hr>
					
					<div class="nanum mt-3 ml-3">
						<div class="chatPf" style="display: inline-block;">
							<img src="${contextPath}/resources/img/usericon.png" width="40px"
								height="40px" class="chatProfile" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer">&nbsp;
						</div>
						<div class="chatCt" style="display: inline-block;">
							<span>김태훈</span> <span class="mr-0">: 형, 이정도는 혼자 하면 안돼?</span>
						</div>
						<span class="badge badge-pill badge-danger float-right mr-3 mt-2">2</span>
					</div>
					
					
				</div> 
				
				
				
				<!-- 대화방 목록 끝 -->


<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- 친구요청 div -->
				<div class="tab-pane fade tgl" id="friendReq">
					<div class="nanum mt-3 ml-3" id="friendRequestArea">
						<input type="hidden" id="profileRoot" val="">
						<img class="rImg" src="${contextPath}/resources/img/usericon.png" width="40px"
							height="40px" data-toggle="modal" data-target="#profilePicture"
							style="cursor: pointer"> &nbsp;
							<span class="rUser">조미현님이 친구요청을 하셨습니다.</span>&nbsp;
						<button class="btn btn-info btn-sm nanum">수락</button>
						<button class="btn btn-danger btn-sm nanum" data-toggle="modal"
							data-target="#nopeBtn">거절</button>
					</div>
				</div>
				
				
				
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->			
				<!-- 대화창 -->
				<div class="tab-pane chat nanum" id="chat">
					<div id="div_chat">
						<button type="button" class="close xBtn">&times;</button>
						<br>
						<div class="nanum ml-3">
							<img src="${contextPath}/resources/img/usericon.png" width="30px"
								height="30px" data-toggle="modal" data-target="#profilePicture"
								style="cursor: pointer"> &nbsp; <span>김태훈</span> <br>
							<span style="margin-left: 50px;">테스트중입니다.</span>
						</div>

						<table id="table_chat">
							<colgroup>
								<col style="width: 300px;">
								<col style="width: 600px;">
							</colgroup>
							<thead></thead>
							<tbody></tbody>
						</table>
						<div id="menu_scroll_down">
							<button id="btn_scroll_down">↓</button>
						</div>
						<div id="menu_hide"></div>
					</div>

					<table id="append_table">
						<thead></thead>
						<tbody>
							<tr>
								<td><input type="text" id="add_msg" class="nanum"></td>
								<td><button type="button" class="btn btn-warning nanum"id="btn_append_row">전송</button></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				
				
				
				
				
			</div> <!-- #myTabContent 종료   -->
		</div> <!-- .messengerbox 종료 -->
	</div> <!-- .container2 종료  -->
</div> <!-- .back 종료 -->
				


				
				
				
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
													<!-- 모달 시작 -->					
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->			
				<!-- 친구요청 : 수락버튼 -->
				<div class="modal fade" id="yesBtn">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title nanum" style="font-size: 30px;">알림메세지</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="">
									<span class="nanum">친구 요청 메세지를 수락하셨습니다.</span> 
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary nanum"	data-dismiss="modal">삭제하기</button>
							</div>
						</div>
					</div>
				</div>				
				
				
				
				
				
				
				
				
				
				
				
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->			
				<!-- 친구요청 : 거절버튼 -->
				<div class="modal fade" id="noBtn">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title nanum" style="font-size: 30px;">알림메세지</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="">
									<span class="nanum">친구 요청 메세지를 거절하셨습니다.</span> 
									<span class="nanum" style="color: red;">차단</span> 
									<span class="nanum">목록에 추가하시겠습니까?</span>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger nanum">차단하기</button>
								<button type="button" class="btn btn-primary nanum"	data-dismiss="modal">삭제하기</button>
							</div>
						</div>
					</div>
				</div>






<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->			
				<!-- 친구목록 : 차단버튼 -->
				<div class="modal fade" id="blockBtn">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title nanum" style="font-size: 30px;">알림메세지</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" style="font-size: 20px;">
								<form action="">
									<span class="nanum" style="color: olivedrab;">안중하</span> <span
										class="nanum">님을 차단하셨습니다.</span>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger nanum">차단목록</button>
								<button type="button" class="btn btn-primary nanum"
									data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				
				
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->			
				<!-- 친구목록 : 프로필사진 -->
				<div class="modal fade" id="profilePicture">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title nanum" style="font-size: 30px;">미니 프로필</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" style="font-size: 20px;">
								<form action="">
									<div>
										<img src="${contextPath}/resources/img/usericon.png" width="200px"
											height="200px" class="ml-5 mr-5 mt-5 mb-3">
									</div>
									<div class="nanum text-center" style="font-size: 35px;">
										<span class="">안중하</span>
									</div>
									<div class="nanum text-center"
										style="font-size: 20px; color: darkblue;">
										<span class="">남성</span> <span class="">31세</span>
									</div>
									<br>
									<div class="nanum text-center"
										style="font-size: 20px; color: brown;">
										<span class="">#축구</span> <span class="">#영화</span> <span class="">#자전거</span>
									</div>
									<br>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary nanum"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>



<script>


	$(function() {
		var isScrollUp = false;
		var lastScrollTop;
		var unreadCnt = 0;
		
		var divChat = document.getElementById('div_chat');
												//채팅방
		/* 전송 버튼 클릭 시 */
		$('#btn_append_row').on(
				"click",
				function() {
					// 라인 추가
					$('#table_chat').append(
							$('<tr>').append(
									$('<td>').append($('#add_name').val()),
									$('<td>').append($('#add_msg').val())));

					if (isScrollUp) {
						// 메뉴가 보이는 상태에서 새로운 라인 추가 시 안 읽은 수 표시
						unreadCnt++;
						$('#btn_scroll_down').html('↓ ' + unreadCnt);
					}

					// 기본적으로 스크롤 최하단으로 이동 (애니메이션 적용)
					if (!isScrollUp) {
						$('#div_chat').animate(
								{
									scrollTop : divChat.scrollHeight
											- divChat.clientHeight
								}, 100);
					}
				});

		/* 메뉴 스크롤 ↓ 버튼 클릭 시 */
		$('#btn_scroll_down').on('click', function() {
			// 마지막으로 보고 있었던 (스크롤을 올리기 시작했던) 위치로 이동
			$('#div_chat').animate({
				scrollTop : lastScrollTop
			}, 100);

			if (lastScrollTop == divChat.scrollHeight - divChat.clientHeight) {
				// 마지막 위치와 스크롤 최하단이 같다면 (새로 추가된 라인이 없다면) 메뉴 숨김
				$("#menu_scroll_down").css("top", "200px");
				isScrollUp = false;
				unreadCnt = 0;
				$('#btn_scroll_down').html('↓');
			} else {
				// 마지막 위치와 스크롤 최하단이 다르다면 (새로 추가된 라인이 있다면) 마지막 위치를 최하단으로 변경
				lastScrollTop = divChat.scrollHeight - divChat.clientHeight;
			}
		})

		/* 스크롤 이벤트 */
		$("#div_chat").on(
				'mousewheel DOMMouseScroll',
				function(e) {
					var E = e.originalEvent, delta = E.wheelDelta || -E.detail;

					// 메뉴를 숨겼을 때만 마지막 위치 저장
					if (!isScrollUp) {
						lastScrollTop = $(this).scrollTop();
					}

					// 스크롤이 생겼을 때
					if ($(this).scrollTop() > 0) {
						if (delta < 0) {
							// 스크롤 내리는 이벤트 중 최하단 도달 시 메뉴 숨김 (-1은 오차 제어)
							if ($(this).scrollTop() > divChat.scrollHeight
									- divChat.clientHeight - 1) {
								$("#menu_scroll_down").css("top", "200px");
								isScrollUp = false;
								unreadCnt = 0;
								$('#btn_scroll_down').html('↓');
							}
						} else {
							// 스크롤 올리는 이벤트 발생 시 메뉴 보임
							$("#menu_scroll_down").css("top", "150px");
							isScrollUp = true;
						}
					}
				});
	});
	
	
	
	
////////////////////////////////////////문영준 메신저 기능 시작 지점 ////////////////////////////////////////	

	// JS 최상위 주소 구하기
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	
	$(document).ready(function(){
		$("#profileRoot").val( getContextPath() );
	});
	
	



	/* 친구 요청 목록 조회 함수 */
 	function friendRequest(){
		$.ajax({
			url : "friendRequest",
			type : "POST",
			data : {},
			datatype : "json",
			success : function(result){
				var $friendReq = $("#friendReq");
				var $friendRequestArea = $("#friendRequestArea");
				var root = $("#profileRoot").val();
				var $savePath = root +"/resources/profileImage/";
				if(result == ''){
					$friendRequestArea.html("지금은 친구요청이 없네요.")
				}else {
					$friendRequestArea.html("") // 기존 html 내용 삭제
					
					$.each(result, function(i){
													//memberProfileUrl
						var $finalPath = $savePath + result[i].memberProfileUrl;
						var $rImg = $("<img>").prop("class", "rImg").prop("src", $finalPath).css({"width":"40px","height":"40px"});
						var $rUser = $("<span>").prop("class", "rUser").html(result[i].memberNickname + "님이 친구요청을 하셨습니다.");
						var $rOk = $("<button>").prop("class", "btn btn-info btn-sm nanum").prop("data-toggle", "modal").prop("data-target", "yesBtn").html("수락");
						var $rNo = $("<button>").prop("class", "btn btn-danger btn-sm nanum").html("거절");
						var $hr = $("<hr>");
						
						$friendRequestArea.append($rImg).append($rUser).append($rOk).append($rNo).append($hr);
						
						$friendReq.append($friendRequestArea)
						
					}); //$.each 끝
					
				} //else 끝
				
				
			},
			error : function(){
				console.log("친구 목록을 불러오는 aJax 실패");
			}
		});
	}; 
	
	
	
	/* 에이잭스 실행 함수 */
	 $(function(){
		friendRequest(); // 친구 요청 목록
		
		/* setInterval(function(){
			friendRequest(); 
		}, 10000); */
	}); 
	 
	
	
	
	
	
	
	
</script>




