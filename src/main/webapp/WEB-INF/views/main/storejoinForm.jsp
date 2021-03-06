<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/style/h_style/storejoin.css" />
</head>
<body>
<form name="storejoin" method="post"  class="form_horizontal ng-pristine ng-valid ng-valid-maxlength ng-valid-email" >

<div id="container">

<div id="header"><h1 align="center" ><br><br><br>Ex)가맹점 신청     </h1></div>

<div id="content">

	<div class="wrap_right">
						<div class="section_booking_form">
							
							
							
							<bk-input-form >
							<h3 class="out_tit">
							
							
								<span> <span >가맹점정보입력</span>
								</span> <span class="help_txt"> <i class="spr_book ico_nessasary" aria-hidden="true"></i> <span>예시사항</span>
								</span>
							</h3>
							
							
							<div class="booking_form_wrap">
								
									<div class="inline_form">
										<label class="label" for="resname" > <span >이름</span> 
										</label>
										
										
										<div class="inline_control">
											<input type="text" name="resname" id="resname" class="text ng-pristine ng-untouched ng-valid ng-valid-maxlength ng-not-empty"  maxlength="17" value="가게이름입력"   readonly="readonly"/>
										</div>
									</div> <!-- resName -->
									
									
									
									<div class="inline_form">
										<label class="label" > <span>주소</span> <!---->
										
										<!---->
										</label>
										<div class="inline_control">
											<input type="text" name="resaddress" id="resaddress" class="tel text ng-pristine ng-untouched ng-valid ng-not-empty"  value="서울시 성북구 정릉3동 아이티뱅크"  readonly="readonly">
										</div>
									</div><!-- resAddress -->
									
									
									<div class="inline_form" ng-show="$ctrl.isShowEmailForm" >
										<label class="label" > <span>연락처</span> <!----></label>
										<div class="inline_control">
											<input type="text" name="restel" id="restel" class="email text ng-pristine ng-untouched ng-valid ng-valid-email ng-valid-maxlength ng-not-empty" value="112" maxlength="50" readonly="readonly">
										</div>
									</div><!-- resTel -->
									
									
									<div class="inline_form" ng-show="$ctrl.isShowEmailForm" >
										<label class="label" > <span>음식종류</span> <!----></label>
										<div class="inline_control">
											<input type="text" name="reskind" id="reskind" class="email text ng-pristine ng-untouched ng-valid ng-valid-email ng-valid-maxlength ng-not-empty" value="한식" maxlength="30" readonly="readonly">
										</div>
									</div><!-- resKind -->
									
									<div class="inline_form" ng-show="$ctrl.isShowEmailForm" >
										<label class="label" > <span>평균가격대</span> <!----></label>
										<div class="inline_control">
											<input type="text" name="resprice" id="resprice" class="email text ng-pristine ng-untouched ng-valid ng-valid-email ng-valid-maxlength ng-not-empty" value="100,000원" maxlength="50" readonly="readonly">
										</div>
									</div><!-- resPrice -->
									
									<div class="inline_form" ng-show="$ctrl.isShowEmailForm" >
										<label class="label" > <span>주차 여부</span> <!----></label>
										<div class="inline_control">
											<input type="text" name="resparking" id="resparking" class="email text ng-pristine ng-untouched ng-valid ng-valid-email ng-valid-maxlength ng-not-empty" value="발렛파킹" maxlength="50" readonly="readonly">
										</div>
									</div><!-- resParking -->
									
									<div class="inline_form" ng-show="$ctrl.isShowEmailForm" >
										<label class="label" > <span>영업 시간</span> <!----></label>
										<div class="inline_control">
											<input type="text" name="ressaletime" id="ressaletime" class="email text ng-pristine ng-untouched ng-valid ng-valid-email ng-valid-maxlength ng-not-empty" value="09:00~22:00" maxlength="50" readonly="readonly" >
										</div>
									</div><!-- resSaletime -->
									
									<div class="inline_form" ng-show="$ctrl.isShowEmailForm" >
										<label class="label" > <span>쉬는 시간</span> <!----></label>
										<div class="inline_control">
											<input type="text" name="resrest" id="resrest" class="email text ng-pristine ng-untouched ng-valid ng-valid-email ng-valid-maxlength ng-not-empty" value="15:00~18:00" maxlength="50" readonly="readonly">
										</div>
									</div><!-- resRest -->
															
									<div class="inline_form" ng-show="$ctrl.isShowEmailForm" >
										<label class="label" > <span>휴일</span> <!----></label>
										<div class="inline_control">
											<input type="text" name="resholiday" id="resholiday" class="email text ng-pristine ng-untouched ng-valid ng-valid-email ng-valid-maxlength ng-not-empty" value="매주 월요일" maxlength="50" readonly="readonly">
										</div>
									</div><!-- resRest -->
			
									<div class="inline_form" >
										<label class="label" for="request">요청 사항</label>
										<div class="inline_control">
											<textarea name="request" id="request" cols="30" rows="10" class="textarea text ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" readonly="readonly" maxlength="300" value="업체에 요청하실 내용을 적어주세요." ></textarea>
										</div>
									</div>
									<!---->
									<br>
									<h3>입점신청은 위와 같은 형식으로 sbxjdnjs10@naver.com으로 문의해주시기 바랍니다.</h3>
									<h5>가게에 관련한 사진 5장을 첨부하셔야 등록이 가능합니다.</h5>
									<h5>회원가입하신 이메일을 기재하셔야 등록이 가능합니다.</h5>
							</div>
							</bk-input-form>
						</div><!-- section_booking_form -->
</div><!-- content -->
</div><!-- container -->
</form>
</body>
</html>