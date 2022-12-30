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

    <script src="${ path }/js/jquery-3.6.0.min.js"></script>

    <div class="container">
        <div class="member_tit">
            아이디 찾기
        </div>    
        <div class="find_id_wrap">
            <div class="find_id_choose">
                <div class="find_id_email">
                    이메일 인증
                </div>
            </div>
            <form class="find_id_form" action="${path}/member/findId" method="post">
                <div class="find_id_name1">
                    <div class="find_id_name2">
                        <label for="m_name" class="find_id_name3">이름</label>
                        <div class="find_id_name4">
                            <input type="text" data-testid="input-box" name="m_name" id="m_name" 
                            placeholder="이름을 입력해 주세요" class="find_id_name5">
                        </div>
                        <div class="check_font" id="name_check"></div>
                    </div>
                </div>
                <div class="find_id_email1">
                    <div class="find_id_email2">
                        <label for="m_email" class="find_id_email3">이메일</label>
                        <div class="find_id_email4">
                            <input type="email" data-testid="input-box" name="m_email" id="m_email" 
                            placeholder="이메일을 입력해 주세요" class="find_id_email5">
                        </div>
                        <div class="check_font" id="email_check"></div>
                    </div>
                </div>
                <div class="verification_code1">
                   <button type="submit" class="verification_code2" id="idSearch">
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
    $('.find_id_name5').on('input', checkInput);
    $('.find_id_email5').on('input', checkInput);

    // input 입력 시에 checkInput 함수실행
    function checkInput() {
        var nameCheck = $('.find_id_name5').val();   
        var emailCheck = $('.find_id_email5').val();  
        var btnCheck = $('.verification_code2');

        if (nameCheck === '' || emailCheck === '') {
        // 기본 버튼 색상
        btnCheck.removeClass('on');
        // } else {
        // // 입력 시에 버튼 배경색 변경
        // btnCheck.addClass('on');
        // }
        
            btnCheck.css('background-color', '#ddd');
            btnCheck.css('cursor', 'Default');
        } else {
            btnCheck.css('background-color', ' #495FE9');
            btnCheck.css('cursor', 'pointer');
        }
    }
</script>

<!-- 유효성 검사 -->
<script>
var nameJ = /^[가-힣]{2,6}$/;
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

// 이름
$("#m_name").blur(function() {
	if (nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#name_check").text('');
			$("#name_check").attr('style', 'visibility:hidden;');

	} else {
		$('#name_check').text('가입 시 등록한 이름을 입력해 주세요');
		$("#name_check").attr('style', 'visibility:visible;');
		$('#name_check').css('color', 'red');
	}
});

// 이메일
$('#m_email').blur(function(){
    if(mailJ.test($(this).val())){
        console.log(nameJ.test($(this).val()));
        $("#email_check").text('');
		$("#email_check").attr('style', 'visibility:hidden;');

    } else {
        $('#email_check').text('가입 시 등록한 이메일을 입력해 주세요');
		$("#email_check").attr('style', 'visibility:visible;');
        $('#email_check').css('color', 'red');
    }
});

</script>
