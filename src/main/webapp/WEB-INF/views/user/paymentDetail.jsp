<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래이력 상세조회</title>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

		<style type="text/css">

        	.btn-outline-info:hover {
			    color: hsla(208, 100%, 51%, 1);
			    background-color: hsla(208, 100%, 75%, 0.6);
			    border-color: hsla(208, 100%, 75%, 0.6);
			}
			.btn-outline-info {
			    color: hsla(208, 100%, 75%, 0.6);
			    background-color: transparent;
			    background-image: none;
			    border-color: hsla(208, 100%, 75%, 0.6);
			}
		</style>
	</head>
<body>
    <br>
    <b><font size="5" color="gray"> &nbsp;&nbsp;거래이력 상세조회</font></b>
    <br><br>
    <div class="container">  
    <div class="form-group row pull-left">
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #fafafa; text-align: center;">적립일자</th>
						<th style="background-color: #fafafa; text-align: center;">적립일시</th>
						<th style="background-color: #fafafa; text-align: center;">프로모션명</th>
						<th style="background-color: #fafafa; text-align: center;">프로모션코드</th>
						<th style="background-color: #fafafa; text-align: center;">적립포인트</th>
					</tr>
				</thead>
				<tbody>				
				<c:forEach var="point" items="${paymentDetail}">
			            <tr class="ab">
							<th style="text-align: center;">${point.HISDATE}</th>
							<th class="col-xs-3" style="text-align: center;">${point.HISTIME}</th>
							<th class="col-xs-3" style="text-align: center;">${point.PNAME}</th>
							<th class="col-xs-3" style="text-align: center;">${point.PCODE}</th>
							<th style="text-align: center;">${point.SAVPNT}</th>
						</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
    <center><button class="btn btn-outline-info" style="font-weight: bold ;" onclick="setParentText();"type="button">닫기</button></center>
</body>
</html>