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
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		
	<style type="text/css">
    .datePicker {
        text-align:center;
        width:80px;    
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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<body>
		<br>
		<div class="container">
			<!-- submit버튼을 누르면 onsubmit이 실행되어 check함수가 실행됨 -->
		    <form action="/promotion/register" role="form" method="post" name="promotion" onsubmit="return check()">
		    <table class="table table-hover" style=" border: 1px solid #dddddd">
			    <thead>
			    	<tr>
			    		<th colspan="2" style="background-color: #CECEF6; text-align:center;" >프로모션 등록&nbsp;&nbsp;(*은 필수입력항목입니다.)</th>
					</tr>
					<tr>
						<td style="width:300px" align="center"><strong>금액대별 사용</strong></td>
						<td style="width:1000px">
							<input type="radio" id="aaa" name="useYN" value="00" onchange="setDisplay()" > 사용안함
							<input type="radio" id="bbb" name="useYN" value="10" onchange="setDisplay()" checked="checked"> 사용

							<!-- <input type="radio" name="test" value="3" onclick="div_OnOff(this.value,'hide');">(금액대별 기준을 사용하려면 체크하세요.) -->
						</td>
					</tr>
				</thead>    
		        <tbody>
		        	<tr name="trStaff" class="table-info" >
		                <td style="width:300px" align="center"><strong>*프로모션명</strong></td>
		                <td style="width:1000px">
		                    <input style="width:542" type="text" name="pName" placeholder="">
		                </td>
		            </tr>
		            <tr name="trStaff" class="table-info">
		                <td style="width:50px" align="center"><strong>기간</strong></td>
		                <td style="width:1000px">
		                    	<input style="width:542" type="text" name="stadate" id="staDate" placeholder="시작일">
		                    	<span>~&nbsp;</span><input style="width:542" type="text" name="enddate" id="endDate" placeholder="종료일">
		                </td> 
		            </tr>
		            <tr name="trStaff" class="table-info">
		                <td style="width:50px" align="center"><strong>*구간/적립률</strong></td>
		                <td style="width:1000px">
		                	<input type="text" name="more" placeholder="이상값" id="hide" style="text-align:right;">
		                    <input type="text" name="under" placeholder="미만값" id="hide2" style="text-align:right;">
		                    <!-- <input type="text" name="pName" placeholder="이상값">원 이상  
		                    <input type="text" name="staff_contact" placeholder="미만값">원 미만 -->
		                    <input type="text" name="pntValue" style="text-align:right;" placeholder="적립률">
		                    <button type="button" name="addStaff" class="btn btn-outline-info" id="hide3">구간 추가</button>
		                </td>
		            </tr>
		        </tbody>      
		    </table>
		    <center><button type="submit" class="btn btn-outline-info" id="reg_submit">등록하기</button></center>
		    </form>
			<script>
				$(document).ready(function () {
		            $.datepicker.setDefaults($.datepicker.regional['ko']); 
		            $( "#staDate" ).datepicker({
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
		                     $("#endDate").datepicker( "option", "minDate", selectedDate );
		                 }    
		 
		            });
		            $( "#endDate" ).datepicker({
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
		                     $("#staDate").datepicker( "option", "maxDate", selectedDate );
		                 }    
		 
		            });    
		    	});
			    //추가 버튼
			    $(document).on("click","button[name=addStaff]",function(){
			         
			        var addStaffText =  '<tr name="trStaff" class="table-info">'+
			            '   <td class="active table-info" align="center"><strong>*구간/적립률</strong></td>'+
			            '   <td class="table-info">'+
			            '       <input type="text" name="more" placeholder="이상값" id="hide" style="text-align:right;">'+
			            '       <input type="text" name="under" placeholder="미만값" id="hide2" style="text-align:right;">'+
			            '       <input type="text" name="pntValue" style="text-align:right;" placeholder="적립률">'+
			            '       <button class="btn btn-outline-info" name="delStaff">삭제</button>'+
			            '   </td>'+
			            '</tr>';
			             
			        var trHtml = $( "tr[name=trStaff]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
			         
			        trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.
			         
			    });
			     
			    //삭제 버튼
			    $(document).on("click","button[name=delStaff]",function(){
			         
			        var trHtml = $(this).parent().parent();
			         
			        trHtml.remove(); //tr 태그 삭제
			         
			    });
			    
			    function check() {

					$.each($('input[name=under]'), function(index,value){
						console.log("under 값:"+this.value);
						if(this.value == ""){
							$(this).val("max");
						}
					});
					$.each($('input[name=more]'), function(index,value){
						console.log("more 값:"+this.value);
						if(this.value == ""){
							$(this).val("min");
						}
					});
			    }
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
			    
				 function setDisplay(){
					    if($('input:radio[id=aaa]').is(':checked')){
					        $('#hide').hide();
					        $('#hide2').hide();
					        $('#hide3').hide();
					    }else{
					        $('#hide').show();
					        $('#hide2').show();
					        $('#hide3').show();
					    }
					}

			</script>
			<%@include file="../includes/footer.jsp"%>
		</div>
	</body>
</html>
