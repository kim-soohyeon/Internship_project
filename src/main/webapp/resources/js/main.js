$(function(){


    $(window).resize(function(){
        var height = $(this).height() + 60 + 'px';
        console.log(height);
        $('section').css('minHeight',height);

    });
    //$(window).trigger('resize');
    //슬라이드
    $('.match').bxSlider();


        
        

    
    $('.pop').find('.exit').click(function(){
        $('#players').find('.pop').fadeOut();
    })
    $('.readMore').click(function(){
        $('.pop .content p').toggleClass('open');
        if($('.pop .content p').hasClass('open')){
            $(this).text('Read Less');
            }else{
            $(this).text('Read More');
            }
    })
});
            function redover() {
                let ms = document.getElementById('ms');
                ms.style = "cursor:pointer";
                ms.style.color = "red";
            };
            function redout() {
                let ms = document.getElementById('ms');
                ms.style.color = "blue";
            };
            function redover2() {
                let ms2 = document.getElementById('ms2');
                ms2.style = "cursor:pointer";
                ms2.style.color = "red";
            };
            function redout2() {
                let ms2 = document.getElementById('ms2');
                ms2.style.color = "blue";
            };
            function redover3() {
                let ms3 = document.getElementById('ms3');
                ms3.style = "cursor:pointer";
                ms3.style.color = "red";
            };
            function redout3() {
                let ms3 = document.getElementById('ms3');
                ms3.style.color = "blue";
            };
            // 전체 스케쥴로 이동하는 기능 // 경기마다 반복코딩해야 함으로 간단히 줄일수 있는법 찾아보기.!
            function locate() {
                location = '/awsp/board/register';
            };
            function locatelogo() {//홈 부분 로고 클릭시 바르셀로나 홈페이지로 이동.
                location = '/awsp/board/list';
            };
        //메뉴 페이지 이동
            function fnMove(num) { // 스크롤 이동할 함수 
                var menu = ["home", "service", "download"]; // 이동할 스크롤 배열 처리
                var mn = String(menu[num]); // string으로 형 변환
                var offset = $("#"+mn).offset(); // offset() 함수를 이용해서 절대 좌표를 가진 객체를 가져온다
                $('html, body').animate({ scrollTop: offset.top }, 400);
            };
            
            function logoutBtn(){
            	location = '/awsp/board/login';
            };
            
            function regBtn(){
            	location = '/awsp/board/register';
            };
            
            function TestBtn(){
            	location = '/awsp/board/TestBlock';
            };

            
            function onmouse(num) {
                let ms = document.getElementById(num);
                ms.style = "cursor:pointer";
            }

            function changeImg2()
            {
                var a2 = document.getElementById("i2");
                a2.src="../resources/img/maker2-1.png";
            }
            
            function normalImg2()
            {
                var b2 = document.getElementById("i2");
                b2.src="../resources/img/maker2.png";
            }