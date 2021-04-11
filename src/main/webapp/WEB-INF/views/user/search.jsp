<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <script>
			$(document).ready(function(){
				
	    		$("#example-table-1 tr").dblclick(function(){
				
				var str = ""
				// 현재 클릭된 Row(<tr>)
				var tr = $(this).children();
				var td = tr.children();
				// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
				
				var userName = td.eq(0).text();
			    var contact = td.eq(1).text();
			    var email = td.eq(2).text();
			    var userID = td.eq(3).text();
			    document.searchId.userID.value=userID;
				document.searchId.submit();
				});
	 		});
		</script>
		<script>
			function searchFunction(){
				
				var userName = $('#userName').val();
			 	var Contact = $('#contact').val();

	
			 	var postData = {'UserName' : userName , 'Contact' : Contact};//자바스크립트 객체로 만드는 방법
				$.ajax({
			        url : '/user/getUser',
			        type:'POST',
			        data: postData,
			        dataType : "json", 
			        success:function (data){
			        	var userID=data.userID;
			        	$('#xx').text(data.userName);
			        	$('#yy').text(data.contact);
			        	$('#zz').text(data.email);
			        	$('#dd').text(data.userID);
			        	$("#hideTable").show();
			        	$("#example-table-1").show();
			        	
			        	
			        	//성공시에 data값을 받아와 아래를 실행 
			         /*    $(".get_User").attr("href", res[0].value); */  // .attr : jQuery함수 아래에서 설명 
			                        //DB테이블에서 내가 필요한 값은  value값이다. 
			                       //.attr() 함수는 선택된 요소들 중에서 제일 처음 요소의 속성값을 가지고 오는 함수이기 때문에
			                       //[0], [1] 이라고 알려주는 것 같다
			        },
			        error: function (XMLHttpRequest, textStatus, errorThrown){
	
			        	alert('정보를 다시 입력해주시길 바랍니다.' );
			        }
			    });
			}
			$(document).on('click','#getUser',function(){
				
			});			
			function selectId(){
				document.searchId.userID.value=$('#dd').val();
				//alert($('#dd').val);
				document.searchId.submit();
			}		
		</script>
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
		<div class="container">		
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: hsla(208, 100%, 75%, 0.6); text-align:left;">조회조건  (※ 이름과 전화번호를 모두 바르게 입력하세요.)</th>
					</tr>
				</thead>
			</table>
			<div class="form-group row pull-left">
				<form class="form-inline" >
					<div class="form-group" style = "padding: 0px 0px 0px 15px;">
						<label>이름 </label>
						<input class="form-control" id="userName" type="text" size="20">
					</div>
					<div class="form-group">
						<label>전화번호</label>
						<input class="form-control" id="contact" type="text" size="20" placeholder="숫자만 입력하세요.">
					</div>
					<button class="btn btn-outline-info" style="font-weight: bold ;" onclick="searchFunction();" type="button">조회</button>
				</form>
			</div>
			<table class="table" id="hideTable" style="text-align: center; display:none; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: hsla(208, 100%, 75%, 0.6); text-align:left;">조회결과  (※ 더블 클릭 시 상세페이지로 이동합니다.)</th>
					</tr>
				</thead>
			</table>
			<table class="table" id="example-table-1" style="text-align: center; display:none; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #fafafa; text-align: center;">이름</th>
						<th style="background-color: #fafafa; text-align: center;">전화번호</th>
						<th style="background-color: #fafafa; text-align: center;">이메일</th>
					</tr>
				</thead>
				<tbody title="더블클릭 하세요." onMouseover="this.style.color='red',this.style.textDecoration='underline';" onMouseout="this.style.color='black', this.style.textDecoration='none';">
					<tr>
						<td style="background-color: #fafafa; text-align: center;"><span id="xx"></span></td>					
						<td style="background-color: #fafafa; text-align: center;"><span id="yy"></span></td>
						<td style="background-color: #fafafa; text-align: center;"><span id="zz"></span></td>
						<td class="td_class" style="background-color: #fafafa; text-align: center;display:none;"><span id="dd"></span></td>						
					</tr>
				</tbody>				
			</table>			
		</div>
		<form name="searchId" id="searchId" action="/user/searchDetail" method="get">
			<input type="hidden" id="userID" name="userID">
		</form>
		<%@include file="../includes/footer.jsp"%>
	</body>
</html>