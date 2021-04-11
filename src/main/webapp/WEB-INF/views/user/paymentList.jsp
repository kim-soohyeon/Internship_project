<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<%@include file="../includes/header.jsp"%>
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <!-- Bootstrap -->
        <link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="/resources/image/icon/HalfLife.ico" rel="shortcuticon">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="//code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="/resources/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="/resources/js/respond.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
			$(document).ready(function(){
				
	    		$("#example-table-1 tr").dblclick(function(){
				alert("next 진입");
				
				var str = ""
				// 현재 클릭된 Row(<tr>)
				var tr = $(this).children();
				var td = tr.children();
				// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
				alert("클릭한 Row의 모든 데이터 : "+tr.text());
				
				var userName = td.eq(0).text();
			    var contact = td.eq(1).text();
			    var email = td.eq(2).text();
			    var userID = td.eq(3).text();
			    alert(userID);
			    document.searchId.userID.value=userID;
				document.searchId.submit();
				});
	    		
	    		 $.datepicker.setDefaults($.datepicker.regional['ko']); 
		            $( "#stadate" ).datepicker({
		                 changeMonth: true, 
		                 changeYear: true,
		                 nextText: '다음 달',
		                 prevText: '이전 달', 
		                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                 dateFormat: "yymmdd",
		                 maxDate: "",                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
		                 onClose: function( selectedDate ) {    
		                      //시작일(staDate) datepicker가 닫힐때
		                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
		                     $("#enddate").datepicker( "option", "minDate", selectedDate );
		                 }    
		 
		            });
		            $( "#enddate" ).datepicker({
		                 changeMonth: true, 
		                 changeYear: true,
		                 nextText: '다음 달',
		                 prevText: '이전 달', 
		                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		                 dateFormat: "yymmdd",
		                 maxDate: "",                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
		                 onClose: function( selectedDate ) {    
		                     // 종료일(endDate) datepicker가 닫힐때
		                     // 시작일(staDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
		                     $("#stadate").datepicker( "option", "maxDate", selectedDate );
		                 }    
		 
		            });    
	 		});
		</script>
		<script>
			function openChild(HISID)
	        {
	            // window.name = "부모창 이름"; 
	            window.name = "parentForm";
	            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	            openWin = window.open("/user/paymentDetail?hisId="+HISID,
	                    "회원조회", "width=500, height=250, resizable = no, scrollbars = no");    
	        }
			function searchFunction(){
				
				var stadate = $('#stadate').val();
			 	var enddate = $('#enddate').val();
	
			 	var postData = {'stadate' : stadate , 'enddate' : enddate};
				$.ajax({
			        url : '/user/getHistory',
			        type:'POST',
			        data: postData,
			        dataType : "json", 
			        success:function (data){//성공시에 data값을 받아와 아래를 실행 
			        	console.log(data)
			        	$('#data').children().remove();
			        	$.each(data, function(index,item){
			        		
			        		var rowItem = "<tr>";			        	
			        		rowItem += "<td style='background-color: #fafafa; text-align: center;' ondblclick='openChild("+item.HISID+")' >";
			        		rowItem += "<span id='hisdate' title='더블 클릭하세요.'>" + item.HISDATE + "</span></td>";	
							rowItem += "<td style='background-color: #fafafa; text-align: center;'><span id='histime'>" + item.HISTIME +"</span></td>";
							rowItem += "<td style='background-color: #fafafa; text-align: center;'><span id='pntType'>" + item.PNTTYPE +"</span></td>";
							rowItem += "<td style='background-color: #fafafa; text-align: center;'><span id='dPnt'>" + item.DPNT +"</span></td>";
							rowItem += "<td style='background-color: #fafafa; text-align: center;'><span id='userID'>" + item.USERID +"</span></td>";
							rowItem += "<td style='background-color: #fafafa; text-align: center;'><span id='userName'>" + item.USERNAME +"</span></td>";
			        		rowItem += "</tr>";
			        	
			      
							$('#data').append(rowItem);
			        		console.log("index:" +index);
			        		console.log("item:" +item);
			        		console.log(this.HISID);
			        		console.log(item.HISDATE);
			        		$("#hideTable1").show();
				        	$("#hideTable2").show();
			        	});
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
						<th colspan="2" style="background-color: hsla(208, 100%, 75%, 0.6); text-align:left;">조회조건  (※검색하고자 하는 날짜를 입력하세요.)</th>
					</tr>
				</thead>
			</table>
			<div class="form-group">
				<form class="form-inline" >
					<div class="form-group" style = "padding: 0px 0px 0px 15px;">
						<input style="width:542" type="text" name="stadate" id="stadate" placeholder="시작일">
			            <span>~&nbsp;</span><input style="width:542" type="text" name="enddate" id="enddate" placeholder="종료일">
					</div>
					<button class="btn btn-outline-info" style="font-weight: bold ;" onclick="searchFunction();" type="button">검색</button>
				</form>
			</div>
			<table class="table" id="hideTable1" style="display:none; text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: hsla(208, 100%, 75%, 0.6); text-align:left;">조회결과  (※ 적립 건에 한하여 거래일자를 더블 클릭 시 상세페이지로 이동합니다.)</th>
					</tr>
				</thead>
			</table>
			<table class="table" id="hideTable2"  style="display:none; text-align: center; border: 1px solid #dddddd">
				<thead>
					
					<tr>
						<th style="background-color: #fafafa; text-align: center;">거래일자</th>
						<th style="background-color: #fafafa; text-align: center;">거래일시</th>
						<th style="background-color: #fafafa; text-align: center;">거래유형</th>
						<th style="background-color: #fafafa; text-align: center;">발생포인트</th>
						<th style="background-color: #fafafa; text-align: center;">회원번호</th>
						<th style="background-color: #fafafa; text-align: center;">회원명</th>
					</tr>
				</thead>
				<tbody id="data">
					<tr>
						<td style="background-color: #fafafa; text-align: center;"><span id="hisdate"></span></td>					
						<td style="background-color: #fafafa; text-align: center;"><span id="histime"></span></td>
						<td style="background-color: #fafafa; text-align: center;"><span id="pntType"></span></td>
						<td style="background-color: #fafafa; text-align: center;"><span id="dPnt"></span></td>					
						<td style="background-color: #fafafa; text-align: center;"><span id="userID"></span></td>
						<td style="background-color: #fafafa; text-align: center;"><span id="userName"></span></td>					
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