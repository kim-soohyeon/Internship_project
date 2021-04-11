<!DOCTYPE html>
<html>
    <head>
        <%@ page pageEncoding="utf-8" %>
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
        <style type="text/css">

        	.btn-outline-info:hover {
			    color: 	#000000;
			    background-color: #f3eaa0;
			    border-color: #f3eaa0;
			}
			.btn-outline-info {
			    color: #F0E68C;
			    background-color: transparent;
			    background-image: none;
			    border-color: #F0E68C;
			}
		</style>
    </head>
    <body>  
    	<br>
        <div class="container"><!-- 좌우측의 공간 확보 -->
            <!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
                <!-- 본문 들어가는 부분 -->
	 		<form action="/user/register" class="form-horizontal" role="form" method="post">
	        <!-- <form class="form-horizontal" role="form" method="post" action="javascript:alert( '회원가입이 완료되었습니다.' );"> -->
	        <table class="table" style="text-align: center; border: 1px solid #dddddd">
	        <thead>
					<tr>
						<!-- non-breaking space (줄바꿈을 하지 않는 공백)의 줄임말 -->
						<th colspan="2" style="background-color: #F0E68C; text-align:center;" >회원가입&nbsp;&nbsp;(*은 필수입력항목입니다.)</th>
					</tr>
			</thead>
			</table>
            <div class="form-group" id="divName">
                <label for="inputName" class="col-lg-2 control-label">*이름</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control onlyHangul" name="userName" id="userName" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                </div>
            </div>
            <div class="form-group" id="divPhoneNumber">
                <label for="inputPhoneNumber" class="col-lg-2 control-label">*휴대폰 번호</label>
                <div class="col-lg-10">
                    <input type="tel" class="form-control onlyNumber" name="contact" id="contact" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                </div>
            </div>
            <div class="form-group" id="divEmail">
                <label for="inputEmail" class="col-lg-2 control-label">*이메일</label>
                <div class="col-lg-10">
                    <input type="email" class="form-control" name="email" id="email" data-rule-required="true" placeholder="이메일" maxlength="40">
                </div>
            </div>
            <div class="form-group" id="divAddr">
                <label for="inputAddr" class="col-lg-2 control-label">주소</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" name="address" data-rule-required="true" placeholder="주소를 입력하세요." maxlength="15">
                </div>
            </div>       
            <div class="form-group">
                <label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
                <div class="col-lg-10">
                    <select class="form-control" name="gender">
                        <option value="M">남</option>
                        <option value="F">여</option>
                    </select>
                </div>
            </div>
            <div class="form-group" id="divAge">
                <label for="inputAge" class="col-lg-2 control-label">나이</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control onlyNumber" name="age" data-rule-required="true" placeholder="숫자로 입력하세요." >
                </div>
            </div>
            <div class="form-group" id="divJob">
                <label for="inputJob" class="col-lg-2 control-label">직업</label>
                <div class="col-lg-10">
                    <select class="form-control" name="job">
                    	<option value="">직업을 선택하세요</option>
			            <option value="공무원">공무원</option>
	                    <option value="교사">교사</option>
	                    <option value="의사">의사</option>
	                    <option value="자영업">자영업</option>
	                    <option value="전문직">전문직</option>
	                    <option value="주부">주부</option>
	                    <option value="회사원">회사원</option>
	                    <option value="학생">학생</option>
	                    <option value="기타">기타</option>
			        </select>
                </div>
            </div>           
			 <div class="form-group">
                <label for="memberInfo" class="col-lg-2 control-label">마케팅 동의여부</label>
                <div class="col-lg-10" id="memberInfoYn">
                    <textarea class="form-control" rows="4" style="resize:none">
동의하시면 1000포인트를 지급해드립니다.
                    </textarea>
                    <div class="radio">
                        <label>
                            <input type="radio" name="agree" id="agree" value="동의" checked>
                            동의합니다.
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="agree" value="비동의">
                            동의하지 않습니다.
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <button type="submit" class="btn btn-outline-info" style="font-weight: bold ;" id="reg_submit">가입하기</button>
                </div>
            </div>
        </form>
         <!-- </form> -->
         
        <script>
            $(function(){
                //모달을 전역변수로 선언
                var modalContents = $(".modal-contents");
                var modal = $("#defaultModal");
                var check_all = new Array(3).fill(false);
                //가입하기 버튼 유효성 검사를 위한 배열
                
               //가입 하기 버튼 눌렀을때 유효성 검사
                $('#reg_submit').click(function(){
                	var validAll = true;
            		for(var i = 0; i < check_all.length; i++){
            			
            			if(check_all[i] == false){
            				validAll = false;
            			}
            		} 	
            		if(validAll){ // 유효성 모두 통과
            			window.alert('회원가입이 완료되었습니다!');
            			
            		} else{
            			return;
            			
            		}
                });
                 
                $('.onlyAlphabetAndNumber').keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
                    }
                });
                 
                $(".onlyHangul").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                    }
                });
             
                $(".onlyNumber").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^0-9]/gi,''));
                    }
                });
                 
                //------- 검사하여 상태를 class에 적용
                $('#userName').keyup(function(event){
                     
                    var divName = $('#divName');
                     
                    if($.trim($('#userName').val())==""){
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                        check_all[0]=true;
                    }
                });
                $('#contact').keyup(function(event){
                    
                    var divPhoneNumber = $('#divPhoneNumber');
                     
                    if($.trim($('#contact').val())==""){
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                        check_all[1]=true;
                        
                    }
                });
                
                $('#email').keyup(function(event){
                     
                    var divEmail = $('#divEmail');
                     
                    if($.trim($('#email').val())==""){
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                        check_all[2]=true;
                    }
                });
                 
                
                $('#age').keyup(function(event){
                    
                    var divPhoneNumber = $('#divAge');
                     
                    if($.trim($('#age').val())==""){
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                });
                 
                  
                //------- validation 검사
                $( "form" ).submit(function( event ) {
                    var divName = $('#divName');
                    var divEmail = $('#divEmail');
                    var divPhoneNumber = $('#divPhoneNumber');                   
                     
                    //이름
                    if($('#userName').val()==""){
                        modalContents.text("이름을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                        $('#userName').focus();
                        return false;
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                     
                    //이메일
                    if($('#email').val()==""){
                        modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                        $('#email').focus();
                        return false;
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                     
                    //휴대폰 번호
                    if($('#contact').val()==""){
                        modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                        $('#contact').focus();
                        return false;
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                      
                 
                });
                 
            });
             
        </script>
                <!--// 본문 들어가는 부분 -->
            <hr/>
            <!-- 푸터 들어가는 부분 -->            
            <%@include file="../includes/footer.jsp"%>
            <!--// 푸터 들어가는 부분 -->
            
        </div>
    </body>
</html>
