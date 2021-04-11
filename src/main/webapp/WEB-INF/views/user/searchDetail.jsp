<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../includes/header.jsp"%>
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <!-- Bootstrap -->
        <link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="/resources/image/icon/HalfLife.ico" rel="shortcuticon">
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="//code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="/resources/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="/resources/js/respond.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	</head>
	<body>
		<br>
		<div class="container" >
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: hsla(208, 100%, 75%, 0.6); text-align:left;">회원상세</th>
					</tr>
				</thead>
			</table>			
			<div class="form-group">
				<form class="form-inline">
					<div class="col-xs-3" style = "padding: 0px 0px 5px 35px;">
						<label>회원명 </label>
						<input class="form-control" id="userName" type="text" disabled="disabled" value="${list.userName}">
					</div>
					<div class="col-xs-3" style = "padding: 0px 0px 5px 14px;">
						<label>회원번호</label>
						<input class="form-control" id="userID" type="text" disabled="disabled" value="${list.userID}">
					</div>
				</form>
				<div class="row"></div>
					<form class="form-inline" >
						<div class="col-xs-3" style = "padding: 0px 0px 5px 49px;">
							<label>성별 </label>
							<input class="form-control" id="gender" type="text" size="20" disabled="disabled" value="${list.gender}">
						</div>
						<div class="col-xs-3" style = "padding: 0px 0px 5px 14px;">
							<label>전화번호</label>
							<input class="form-control" id="contact" type="text" size="20" disabled="disabled" value="${list.contact}">
						</div>
					</form>
				<div class="row"></div>
				<form class="form-inline" >
					<div class="col-xs-3" style = "padding: 0px 0px 5px 49px;">
						<label>나이 </label>
						<input class="form-control" id="age" type="text" size="20" disabled="disabled" value="${list.age}">
					</div>
					<div class="col-xs-3" style = "padding: 0px 0px 5px 28px;">
						<label>이메일</label>
						<input class="form-control" id="email" type="text" size="20" disabled="disabled" value="${list.email}">
					</div>
				</form>
				<div class="row"></div>
				<form class="form-inline" >
					<div class="col-xs-3" style = "padding: 0px 0px 5px 49px;">
						<label>직업 </label>
						<input class="form-control" id="job" type="text" size="20" disabled="disabled" value="${list.job}">
					</div>
					<div class="col-xs-3" style = "padding: 0px 0px 5px 14px;">
						<label>가입일자</label>
						<input class="form-control" id="regdate" type="text" size="20" disabled="disabled" value="${list.regdate}">
					</div>
				</form>
				<div class="row"></div>
				<form class="form-inline" >
					<div class="col-xs-3" style = "padding: 0px 0px 5px 7px;">
						<label>가용포인트 </label>
						<input class="form-control" id="avaPnt" type="text" size="20" disabled="disabled" value="${list.avaPnt}">
					</div>
					<div class="col-xs-3" style = "padding: 0px 0px 5px 0px;">
						<label>마케팅동의</label>
						<input class="form-control" id="agree" type="text" size="20" disabled="disabled" value="${list.agree}">
					</div>
				</form>
				<div class="row"></div>
				<form class="form-inline" >
					<div class="col-xs-3" style = "padding: 0px 0px 5px 7px;">
						<label>적립포인트 </label>
						<input class="form-control" id="savPnt" type="text" size="20" disabled="disabled" value="${list.savPnt}">
					</div>
					<div class="col-xs-3" style = "padding: 0px 0px 5px 42px;">
						<label>주소</label>
						<input class="form-control" id="address" type="text" size="20" disabled="disabled" value="${list.address}">
					</div>
				</form>
			</div>
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: hsla(208, 100%, 75%, 0.6); text-align:left;">거래이력</th>
					</tr>
				</thead>
			</table>
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #fafafa; text-align: center;">거래일자</th>
						<th style="background-color: #fafafa; text-align: center;">거래일시</th>
						<th style="background-color: #fafafa; text-align: center;">거래유형</th>
						<th style="background-color: #fafafa; text-align: center;">발생포인트</th>
					</tr>
				</thead>
				<tbody>				
				<c:forEach var="history" items="${userHistory}">
			            <tr class="ab">
							<th style="text-align: center;">${history.HISDATE}</th>
							<th class="col-xs-3" style="text-align: center;">${history.HISTIME}</th>
							<th style="text-align: center;">${history.PNTTYPE}</th>
							<th style="text-align: center;">${history.DPNT}</th>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<%@include file="../includes/footer.jsp"%>
	</body>
</html>