<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 조회</title>
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
        <script>
        $(document).ready(function() {
	    		$("input:radio[name=Select]").click(function() 
	    			    { 
	    			var rowData = new Array();
	    			var tdArr = new Array();
	    			var checkbox = $("input[name=Select]:checked");
	    			
	    			// 체크된 체크박스 값을 가져온다
	    			checkbox.each(function() {
	    	
	    				// checkbox.parent() : checkbox의 부모는 <td>이다.
	    				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
	    				var tr = checkbox.parent().parent();
	    				var td = tr.children();

	    				// 체크된 row의 모든 값을 담는다.
	    				rowData.push(td.text());
	    				
	    				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
	    				var userName = td.eq(1).text();	    				
	    				var userID = td.eq(2).text();	    				
	    				var avaPnt = td.eq(3).text();
	    				
	    				
	    				$('input[name=userName]').attr('value',userName);
	    				$('input[name=userID]').attr('value',userID);
	    				$('input[name=avaPnt]').attr('value',avaPnt);
	    				});
	    			});
	    			
	    			    }) ;
			function searchFunction(){
				
				var userName = $('#userName').val();
			 	var Contact = $('#contact').val();
	
			 	var postData = {'UserName' : userName , 'Contact' : Contact};
				$.ajax({
			        url : '/user/getUser',
			        type:'POST',
			        data: postData,
			        dataType : "json", 
			        success:function (data){
			        	var userID=data.userID;
			        	$('#xx').text(data.userName);
			        	$('#dd').text(data.userID);
			        	$('#zz').text(data.avaPnt);
			        	$("#Select").show();
			        	$("#Select2").show();
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
			
			function setParentText(){
	             opener.document.getElementById("userName").value = document.getElementById("userName").value;
	             opener.document.getElementById("userID").value = document.getElementById("userID").value;
	             opener.document.getElementById("avaPnt").value = document.getElementById("avaPnt").value;
	             close();
	        }

	    		
			$(document).on('click','#getUser',function(){
				
			});		
			
/* 			function selectId(){
				document.searchId.userID.value=$('#dd').val();
				//alert($('#dd').val);
				document.searchId.submit();
			} */	
			
			
			
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
    <b><font size="5" color="gray"> &nbsp;&nbsp;회원조회</font></b>
    <br><br>
    <div class="container">  
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
					&nbsp;
					<button class="btn btn-outline-info" style="font-weight: bold ;" onclick="searchFunction();" type="button">조회</button>
				</form>
			</div>
   			<table class="table" id="Select2" style="text-align: center; border: 1px solid #dddddd; display:none;">
				<thead>
					<tr>
						<th style="background-color: #fafafa; text-align: center;">선택</th>
						<th style="background-color: #fafafa; text-align: center;">이름</th>
						<th style="background-color: #fafafa; text-align: center;">회원번호</th>
						<th style="background-color: #fafafa; text-align: center;">가용포인트</th>
					</tr>
				</thead>
				<tbody onMouseout="this.style.color='black', this.style.textDecoration='none';">
					<tr>
						<td style="background-color: #fafafa; text-align: center;"><input style="display:none;"id="Select" name="Select" type="radio"></td>
						<td style="background-color: #fafafa; text-align: center;"><span id="xx"></span></td>					
						<td style="background-color: #fafafa; text-align: center;"><span id="dd"></span></td>
						<td style="background-color: #fafafa; text-align: center;"><span id="zz"></span></td>					
					</tr>
				</tbody>				
			</table>
			</div>
			<input type="hidden" id="userID" name="userID" >
			<input type="hidden" id="userName" name="userName">
			<input type="hidden" id="avaPnt" name="avaPnt">
    <center><button class="btn btn-outline-info" style="font-weight: bold ;" onclick="setParentText();"type="button">확인</button></center>
</body>
</html>