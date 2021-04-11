<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:로 시작하는 태그는 uri에 적힌 내용을 참조하여 해석 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- sql:로 시작하는 태그는 uri에 적힌 내용을 참조하여 해석 -->
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../includes/header.jsp"%>
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
        <style>
        	.btn-outline-info {
			    color: #fff;
			    background-color: hsla(208, 100%, 75%, 0.6);
			    border-color: hsla(208, 100%, 75%, 0.6);
			}
			.btn-outline-info:hover {
			    color: hsla(208, 100%, 75%, 0.6);
			    background-color: transparent;
			    background-image: none;
			    border-color: hsla(208, 100%, 75%, 0.6);
			}
        </style>
        <script>
        $(document).ready(function(){
            //현재HTML문서가 브라우저에 로딩이 끝났다면    
            $('[id=editBt]').click(function(){
            	$('[id=transDiv]').show();
       			$('[id=editDiv]').hide();
              });//click
        });
        </script>	
	</head>
	<body>
		<br>
		<div class="container" >
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: hsla(208, 100%, 75%, 0.6); text-align:left;">프로모션 조회&nbsp;(※ 수정버튼을 누르면 수정페이지로 이동합니다.)</th>
					</tr>
				</thead>
			</table>		
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #fafafa; text-align: center;">프로모션코드</th>
						<th style="background-color: #fafafa; text-align: center;">프로모션명&nbsp;</th>
						<th style="background-color: #fafafa; text-align: center;">시작일</th>
						<th style="background-color: #fafafa; text-align: center;">종료일</th>
						<th style="background-color: #fafafa; text-align: center;">비고</th>					
					</tr>
				</thead>
 				<tbody>

					<!-- 필드값 꺼내오기 -->
					<c:forEach var="prom" items="${promotion}" varStatus="status">
			            <tr class="ab">
							<th style="text-align: center;">${prom.PCode}</th>
							<th class="col-xs-3" style="text-align: center;">${prom.PName}</th>
							<th style="text-align: center;">${prom.stadate}</th>
							<th style="text-align: center;">${prom.enddate}</th>
							<th  style="text-align: center;">
							<div id="editDiv"><input type="button" id="editBt" class="btn btn-outline-info" value="수정" 
							onclick="location.href='promotionUpdate?pCode=${prom.PCode}';">
							</div>
							</th>											
						</tr>
						<script>
				            function trans(pCode){
				            	
				            	var tr = $('div.cd').parent();
				            	
				            	//alert("클릭한 Row의 모든 데이터 : "+tr.text());
				            }
						</script>
		            </c:forEach>		            			
				</tbody>
			</table>
		</div>
		<form action="/promotion/promotionUpdate" id="updateForm" name="updateForm" method="post">
			<input class="form-control" type="text" name="pCode"id="pCode" value="" style="visibility:hidden;">
			<input class="form-control" type="text" name="pName" id="pName" value="" style="visibility:hidden;">
			<input class="form-control" type="text" name="stadate" id="stadate" value="" style="visibility:hidden;">
			<input class="form-control" type="text" name="enddate" id="enddate" value="" style="visibility:hidden;">
			<input class="form-control" type="text" name="pntValue" id="pntValue" value="" style="visibility:hidden;">
			<input class="form-control" type="text" name="more" id="more" value="" style="visibility:hidden;">
			<input class="form-control" type="text" name="under" id="under" value="" style="visibility:hidden;">
		</form>
		<%@include file="../includes/footer.jsp"%>
	</body>
</html>