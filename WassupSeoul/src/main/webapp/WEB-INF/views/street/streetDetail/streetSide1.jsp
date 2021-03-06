<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    
<title>타임라인 사이드,네비바 </title>

</head>

<style>

</style>
<body>

	<!-- 컨텐츠영역-->
	<div class="container" style="margin-top: 10px;">

		<div class="row">
			<div class="col-md-12" id="devideArea">

				<!-- 사이드 1 시작 -->
				<div class="row" style="background-color: rgb(221, 233, 218);">
					<div class="card mb-3">
						<img style="height: 200px; width: 100%; display: block;"
							src="${contextPath}/resources/img/골목.jpg" alt="Card image">
						<div class="card-body">
							<input type="text" class="form-control-plaintext nanum"
								value="${street.streetNm}"
								style="font-size: 25px; font-weight: bold;">
							<div class="form-group row">
								<label class="col-sm-4 col-form-label nanum"
									style="font-weight: bold; font-size: 15px;">${street.streetMaxMember}</label>
								<div class="col-sm-8">
									<input type="text" readonly
										class="form-control-plaintext nanum" value="150"
										style="font-size: 15px;">
								</div>
								<label class="col-sm-4 col-form-label nanum"
									style="font-weight: bold; font-size: 15px;">골목대장</label>
								<div class="col-sm-8">
									<input type="text" readonly
										class="form-control-plaintext nanum" value="남궁민수"
										style="font-size: 15px;">
								</div>
							</div>
							<div class="col-sm-12">
								<textarea class="form-control nanum" rows="2" readonly
									style="resize: none;">${street.streetIntro}</textarea>
							</div>
							<br>
							<div class="col-md-12 golmokKeywordBox"
								style="background-color: #36be81; border-radius: 20px; margin-bottom: 5px;">
								<input type="text" readonly class="form-control-plaintext nanum"
									value="#우리골목의 키워드1입니다" style="color: white;">
							</div>
							<div class="col-md-12 golmokKeywordBox"
								style="background-color: #36be81; border-radius: 20px; margin-bottom: 5px;">
								<input type="text" readonly class="form-control-plaintext nanum"
									value="#우리골목의 키워드2입니다" style="color: white;">
							</div>
							<div class="col-md-12 golmokKeywordBox"
								style="background-color: #36be81; border-radius: 20px; margin-bottom: 5px;">
								<input type="text" readonly class="form-control-plaintext nanum"
									value="#우리골목의 키워드3입니다" style="color: white;">
							</div>
						</div>
						<div class="card-body">
							<button type="button"
								class="btn btn-secondary btn-lg btn-block nanum"
								style="font-size: 20px; font-weight: bold;"
								onclick="streetJoin()">골목 가입하기</button>
							<br>
							<script>
								function streetJoin() {
									if (confirm("가입을 신청하시겠습니까?")) {
										$.ajax({
											url : "${contextPath}/street/streetJoin",
											success : function(result) {
												if (result == -1) {
													alert("더 이상 골목에 가입할 수 없습니다");
												} else{
													alert("골목 가입 신청 완료");
												}
											},
											error : function() {
												alert("골목 가입 신청 과정 중 오류 발생");
											}
										})
									}
								}
							</script>
							<a href="#" class="card-link nanum">골목 탈퇴하기</a><br> <a
								href="#" class="card-link nanum">골목 변경하기</a> <a href="#"
								class="card-link nanum">활동보고서 작성</a>
						</div>
						<div class="card-footer text-muted nanum">
							누구나 골목을 검색해 찾을 수 있고, <br>게시물을 볼 수 있습니다.
						</div>
						<div class="card-footer text-muted nanum">이 골목은 누구나 검색해 찾을 수
							있지만, 게시물은 주민만 볼 수 있습니다.</div>
					</div>
				</div>
				<!-- 사이드 1 끝 -->

			</div>
		</div>
	</div>
	<!-- 컨텐츠영역 종료 -->


</body>
</html>