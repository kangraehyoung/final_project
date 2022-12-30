<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<title>VODA</title>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- login CSS -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/member/login.css">


    <div class="container">
        <div class="css_email1">
            <div class="css_email2">
                <div class="css_email3">
                    <p class="css_email4">
                        <img src="${path}/resources/img/member/email.png" id="email_img">
                        <span class="css_email5">'가입 시 이메일 주소'</span>로
                        <br>
                        메일이 발송되었어요.
                        <br>
                        확인 후 인증번호를 입력해 주세요.
                    </p>
                    <p class="css_email6">
                        5분 후에도 메일이 오지 않는다면
                        <br>
                        스팸함을 확인해 주세요.
                    </p>
                </div>
            </div>
        </div>  
        <div class="find_id_wrap">
            <div class="find_id_choose">
                <div class="find_id_email">
                    인증번호 입력
                </div>
            </div>
            <form class="find_id_form" action="${path}/member/verifyCode" method="post">
            <input type="hidden" name ="m_email" value="${m_email}">
            <input type="hidden" name ="num" value="${num}">
                <div class="find_id_name1">
                    <div class="find_id_name2">
                        <label for="memId" class="find_id_name3">인증번호</label>
                        <div class="find_id_name4">
                            <input type="text" data-testid="input-box" name="code" id="code" 
                            placeholder="인증번호를 입력해 주세요" class="find_id_name5">
                        </div>
                    </div>
                </div>
                <div class="verification_code1">
                    <button type="submit" class="verification_code2" id="code_onclick">
                   	확인
                  	</button>
                </div>
            </form>
        </div> 
    </div>

<br><br><br><br><br><br>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	

<script>
$(document).ready(function(){
	$("#findId_onclick").click(function(){
	var msg="${msg}"
	   if(msg != null) {
	      alert(msg);
	   }
	});
});
	
</script>
 
<script>
    $('.find_id_name5').on('input', checkInput);
    $('.find_id_email5').on('input', checkInput);

    // input 입력 시에 checkInput 함수실행
    function checkInput() {
        var nameCheck = $('.find_id_name5').val();   
        var emailCheck = $('.find_id_email5').val();  
        var btnCheck = $('.verification_code2');

        if (nameCheck === '' || emailCheck === '') {
        // // 기본 버튼 색상
        // btnCheck.removeClass('on');
        // } else {
        // // 입력 시에 버튼 배경색 변경
        // btnCheck.addClass('on');
        // }
        
            btnCheck.css('background-color', '#ddd');
        } else {
            btnCheck.css('background-color', '#007bff');
            btnCheck.css('cursor', 'pointer');
        }
    }
</script>

<!-- 유효성 검사 -->
<script>
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

// 이메일
$('#m_email').blur(function(){
    if(mailJ.test($(this).val())){
        console.log(mailJ.test($(this).val()));
        $("#email_check").text('');
    } else {
        $('#email_check').text('이메일 형식으로 입력해 주세요');
        $('#email_check').css('color', 'red');
    
});
</script>
