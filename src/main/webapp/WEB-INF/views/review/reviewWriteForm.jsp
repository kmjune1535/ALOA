<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 작성</title>
<link rel="stylesheet" href="/style/min_style/reviewWrite.css">
<script>
/* 평점 */
function clickImg(mode){
	var gg = document.getElementById('good');
	var ss = document.getElementById('soso');
	var bb = document.getElementById('bad');
	if(mode==1){
		document.getElementById("grade-score").value="5";
		gg.style['background-image'] = "url('/resources/images/min_image/good_on.png')";
		ss.style['background-image'] = "url('/resources/images/min_image/soso_off.png')";
		bb.style['background-image'] = "url('/resources/images/min_image/bad_off.png')";
	}else if(mode==2){
		document.getElementById("grade-score").value="3";
		gg.style['background-image'] = "url('/resources/images/min_image/good_off.png')";
		ss.style['background-image'] = "url('/resources/images/min_image/soso_on.png')";
		bb.style['background-image'] = "url('/resources/images/min_image/bad_off.png')";
	}else if(mode==3){
		document.getElementById("grade-score").value="1";
		gg.style['background-image'] = "url('/resources/images/min_image/good_off.png')";
		ss.style['background-image'] = "url('/resources/images/min_image/soso_off.png')";
		bb.style['background-image'] = "url('/resources/images/min_image/bad_on.png')";
	}
}

/* 파일추가*/
var count = 1;
function addFile(){
	//count++;
	if(count<5){
		var newFile = document.createElement("div");
		count++;
		newFile.setAttribute("id","fileItem");
		alert(count);
		 
		var html = '<input type="file" name="imagelist" id="itemList"/>'
		+'<input type="button" value="-" onclick="removeFile()"/>';
		
		newFile.innerHTML = html;
		
		var newFileList = document.getElementById('file_section');
		
		newFileList.appendChild(newFile); 
	}else{
		alert("이미지를 5개이상 등록하실수 업습니다.");
	}
	
}
function removeFile(){
	var fileItem = document.getElementById("fileItem");
	count--;
	if(fileItem !=null){
		fileItem.parentNode.removeChild(fileItem); 
	}
}

function checkReviewWrite(){
	if(document.getElementById("grade-score").value=="0"){
		alert("점수를 등록하세요");
	}else{
		alert("리뷰가 등록되엇습니다.");
		document.reviewWriteForm.submit();
		window.close();
	}
	
}

function checkReviewWrite(){
	if(document.reviewWriteForm.content_section.value == ""){
		alert("내용을 입력하세요")
	}else{
		alert("등록되었습니다")
		document.reviewWriteForm.submit();
	}
}

</script>
</head>
<body>
	<form name="reviewWriteForm" method="POST" enctype="multipart/form-data" action="/reviewWrite">
		<div id="main_section">
			<input type="hidden" name="resno" value="${resno}">
			<input type="hidden" name="email" value="<sec:authentication property="principal.email"/>">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" id="grade-score" name="grade" value="0">
			
			<div id="name">파씨오네에 대한 리뷰를 작성해주세요 !</div>
			<div id="grade">
				<div id="grade_text">파씨오네를 다녀온 당신의 점수는 ?</div>
				<div id="grade_img">
					<div id="good" onclick="clickImg(1)"></div>
					<div id="soso" onclick="clickImg(2)"></div>
					<div id="bad" onclick="clickImg(3)"></div>
				</div>
			</div>
			
			<div id="content_section">
				<textarea name="content"rows="10" placeholder="300자 내외로 작성해주세요." maxlength="300" ></textarea>
			</div>
		
			<div id="file_section">		
				<input type="file" name = "imagelist" id="itemList" /><input type="button" value="+" onclick="addFile()" />
			</div>
			
			<div id="button_section">
				<div id="write" onclick = "checkReviewWrite()">작성</div>
				<div id="cancel">취소</div>
			
		</div>
	</form>
</body>
</html>