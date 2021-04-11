<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@include file="../includes/header.jsp"%>
</head>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
.datePicker {
	text-align: center;
	width: 80px;
}

.btn-outline-info {
	color: #fff;
	background-color: #CECEF6;
	border-color: #CECEF6;
}

.btn-outline-info:hover {
	color: #CECEF6;
	background-color: transparent;
	background-image: none;
	border-color: #CECEF6;
}
</style>
<script type="text/javascript">   
        function openChild()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("/user/child",
                    "회원조회", "width=570, height=350, resizable = no, scrollbars = no");    
        }
</script>
<script>
			function payment(){		
				var day=$("#day").val();
				var userID=$("#userID").val();
				var userName=$("#userName").val();
				var avaPnt=$("#avaPnt").val();
				var product=$("#product").val().replace(/[^\d]+/g, '');
				var point=$("#point").val().replace(/[^\d]+/g, '');
				
				//ajax
				var postData = {'userName' : userName , 'userID' : userID , 'product' : product, 'avaPnt' : avaPnt, 'point' : point , 'day' : day};//자바스크립트 객체로 만드는 방법
				$.ajax({
			        url : '/user/payment',
			        type:'POST',
			        data: postData,
			        dataType : "json", 
			        success:function (data){
			        	var userID=data.userID;
			        	$('#aa').text(data.avaPnt);
			        	$('#bb').text(data.point);
			        	$('#cc').text(data.savPnt);
			        	$('#dd').text(data.dayTime);
			        	$('#ee').text(data.userName);
			        	$("#hideTable").show();
			        	
			        },
			        error: function (XMLHttpRequest, textStatus, errorThrown){
	
			        	alert('정보를 다시 입력해주시길 바랍니다.' );
			        }
			    });
			}			
		</script>		
		<script>
				$(document).ready(function () {
		            $.datepicker.setDefaults($.datepicker.regional['ko']); 
		            $( "#day" ).datepicker({
		                 changeMonth: true, 
		                 changeYear: true,
		                 nextText: '다음 달',
		                 prevText: '이전 달', 
		                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                 dateFormat: "yymmdd",
		                 maxDate: "0",                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가) 		 
		            });   
		            
		            $("#point").on("propertychange change keyup paste input", function() { //실시간 값변경 감지
		                var avaPnt=$("#avaPnt").val(); 
		                var point=$("#point").val().replace(/[^\d]+/g, '');
		                avaPnt=parseInt(avaPnt);
		                point=parseInt(point);		                
		                if (avaPnt<point) { 
			                $("#errMsg").show();
			    			$("#errMsg").text("※사용포인트는 가용포인트보다 작아야합니다 !");
			    			event.preventDefault();
		                } else{
		    				$("#errMsg").hide();
		    			}
		            }) 
		    	});
			    
			    function inputNumberFormat(obj) { 
			        obj.value = comma(uncomma(obj.value)); 
			    } 

			    function comma(str) { 
			        str = String(str); 
			        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
			    } 

			    function uncomma(str) { 
			        str = String(str); 
			        return str.replace(/[^\d]+/g, ''); 
			    }

			</script>	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<body>
	<br>
	<div class="container">
			<table class="table table-hover" style="border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #CECEF6; text-align: center;">결제&nbsp;&nbsp;(*은
							필수입력항목입니다.)</th>
					</tr>
					<tr>
						<td style="width: 300px" align="right"><strong>*거래일</strong></td>
						<td style="width: 1000px" class="col-xs-2"><input
							class="col-xs-2" type="text" name="day" id="day"
							style="width: 150px; height: 30px; font-size: 13.3333px; font-family: 'Nanum Gothic'; text-align: left; border: solid 1px grey; border-radius: 8px;"
							placeholder="YYYYMMDD"></td>
					</tr>
				</thead>
				<tbody>
					<tr name="trStaff" class="table-info">
						<td style="width: 300px" align="right"><strong>*사용자</strong></td>
						<td style="width: 1000px" class="col-xs-2"><input
							class="col-xs-2" name="userID" placeholder="회원번호" type="text"
							id="userID"
							style="width: 150px; height: 30px; font-size: 13.3333px; font-family: 'Nanum Gothic'; text-align: right; border: solid 1px grey; border-radius: 8px; cursor: not-allowed; background-color: #eee;"
							disabled="disabled"> &nbsp;<input type="button"
							name="addStaff" onclick="openChild()"
							class="btn btn-outline-info" id="hide3" value="조회"></td>
					</tr>
					<tr name="trStaff" class="table-info">
						<td style="width: 300px" align="right"><strong>*이름</strong></td>
						<td style="width: 1000px" class="col-xs-2"><input
							class="col-xs-2" name="userName" type="text" id="userName"
							style="width: 150px; height: 30px; font-size: 13.3333px; font-family: 'Nanum Gothic'; text-align: left; border: solid 1px grey; border-radius: 8px; cursor: not-allowed; background-color: #eee;"
							disabled="disabled"></td>
					</tr>
					<tr name="trStaff" class="table-info">
						<td style="width: 50px" align="right"><strong>*가용포인트</strong></td>
						<td style="width: 1000px"><input
							class="col-xs-2" name="avaPnt" id="avaPnt" type="text"
							style="width: 150px; height: 30px; font-size: 13.3333px; font-family: 'Nanum Gothic'; text-align: right; border: solid 1px grey; border-radius: 8px; cursor: not-allowed; background-color: #eee;"
							disabled="disabled">&nbsp; point</td>
					</tr>
					<tr name="trStaff" class="table-info">
						<td style="width: 50px" align="right"><strong>*상품금액</strong></td>
						<td style="width: 1000px">
						<input name="product"
							id="product" onkeyup="inputNumberFormat(this)"
							style="width: 150px; height: 30px; font-size: 13.3333px; font-family: 'Nanum Gothic'; text-align: right; border: solid 1px grey; border-radius: 8px;"
							>&nbsp; 원</td>
					</tr>
					<tr name="trStaff" class="table-info">
						<td style="width: 50px" align="right"><strong>사용포인트</strong></td>
						<td style="width: 1000px">
						<input name="point"
							id="point" onkeyup="inputNumberFormat(this)"			
							style="width: 150px; height: 30px; font-size: 13.3333px; font-family: 'Nanum Gothic'; text-align: right; border: solid 1px grey; border-radius: 8px;"
							>&nbsp;point&nbsp;<span style="color:red;font-style:italic" class="error" id="errMsg"></span></td>
					</tr>
				</tbody>
			</table>
			<center>
				<button type="button" onclick="payment()" class="btn btn-outline-info" id="reg_submit">결제</button>
			</center>
			<br>
			<table class="table table-hover" id="hideTable" style="display:none; border: 1px solid #dddddd ">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #CECEF6; text-align: center;" >결제내역</th>
					</tr>
				</thead>
				<tbody>
					<tr name="trStaff" class="table-info">
						<td style="width: 50px" align="right"><strong>가용포인트</strong></td>
						<td style="width: 1000px background-color: #fafafa; text-align: left;"><span id="aa">&nbsp; point</span></td>
					</tr>
					<tr name="trStaff" class="table-info">
						<td style="width: 50px" align="right"><strong>사용포인트</strong></td>
						<td style="width: 1000px background-color: #fafafa; text-align: left;"><span id="bb">&nbsp; point</span></td>
					</tr>
					<tr name="trStaff" class="table-info">
						<td style="width: 50px" align="right"><strong>적립포인트</strong></td>
						<td style="width: 1000px background-color: #fafafa; text-align: left;"><span id="cc">&nbsp; point</span></td>
					</tr>
					<tr name="trStaff" class="table-info">
						<td style="width: 300px" align="right"><strong>거래일시</strong></td>
						<td style="width: 1000px background-color: #fafafa; text-align: left;"><span id="dd"></span></td>
					</tr>
					<tr name="trStaff" class="table-info">
						<td style="width: 300px" align="right"><strong>회원명</strong></td>
						<td style="width: 1000px background-color: #fafafa; text-align: left;"><span id="ee"></span></td>
					</tr>
				</tbody>
			</table>
			
		
		
		<%@include file="../includes/footer.jsp"%>
	</div>
</body>
</html>
