<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<title>VODA</title>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- Font CSS -->
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'>

    <!-- login CSS -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/member/login.css"> 
    
    <!-- eye slash -->
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">  

	    <div class="container">
	        <div class="row">
	            <div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3">
	                <div class="panel border bg-white">
	                    <div class="panel-heading">
	                        <br>
	                        <h3 class="pt-3 font-weight-bold">로그인</h3>
	                        <br>
	                        <h2 tabindex="0" class="login-box-hd">VODA 계정으로 로그인</h2>
	                    </div>
	                    <div class="panel-body p-3">
	                    	 <form action="${path}/member/login" method="POST"
	                    	 id="loginForm" name="loginForm" onsubmit="return frm_check();">
	                            <div class="form-group py-2"  style="margin-bottom: 0px;">
	                                <div class="input-field">
	                                    <span class="far fa-user p-2"></span> 
	                                    <input id="userId" name="m_id" type="text" placeholder="이메일 주소 또는 아이디"  autocomplete="off" required> 
	                                </div>
	                            </div>
	                            <div class="form-group py-1 pb-2"  style="margin-bottom: 0px;">
	                                <div class="input-field" style="height: 44px;">
	                                    <span class="fas fa-lock px-2"></span>
		                                    <input id="userPwd" name="m_password" type="password" placeholder="비밀번호"  autocomplete="off" required>
	                                    		<span id="eye" class="far fa-eye-slash"></span>
	                                </div>
	                            </div>
	                            <span class="form-inline" style="margin-left: 10px;">
	                                <input type="checkbox" name="saveId" id="saveId">
	                                <label for="saveId" class="text-muted" id="idSaveCheck">아이디 저장</label> 
	                            </span>
	                            <!-- 
	                            <span class="form-inline"> 
	                                <input type="checkbox" name="autoLogin" id="autoLogin"> 
	                                <label for="autoLogin" class="text-muted">자동 로그인</label>
	                            </span>
	                             -->
	                            <br>
	                            <button type="submit" class="btn-logoc" id="login_submit">로그인</button>
	                            <ul class="join-find">
	                                <li>
	                                    <a  href="${path}/member/findId" id="forgotId" class="">아이디 찾기</a>
	                                </li>
	                                <li>
	                                    <a href="${path}/member/findPwd" id="forgotPwd" class="">비밀번호 찾기</a>
	                                </li>
	                                <li>
	                                    <a href="${path}/member/enroll" id="enroll" class="">회원가입</a>
	                                </li>
	                            </ul>
	                        </form>
	                    </div>
	                    
	                    <!-- 카카오 로그인 -->
	                    <div class="mx-3 my-2 py-2 bordert">
	                        <a onclick="location.href='${urlKakao}'">
	                            <img src='${path}/resources/img/member/kakao_login_medium_narrow.png'>
	                            </a>
	                    <button type ="button" class = "btn" onclick="location.href='${urlNaver}'">
	                    	<img src='${path}/resources/img/member/naver_login.png' 
	                    		style="width: 170px;">
	                    </button>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	   
	   

 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!--  아이디 저장 -->
<script type="text/javascript">
     $(function() {
         
           fnInit();
         
     });
     
     function frm_check(){
         saveid();
     }
 
    function fnInit(){
        var cookieid = getCookie("saveid");
        console.log(cookieid);
        if(cookieid !=""){
            $("input:checkbox[id='saveId']").prop("checked", true);
            $('#userId').val(cookieid);
        }
        
    }    
 
    function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setTime(todayDate.getTime() + 0);
        if(todayDate > expiredays){
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
        }else if(todayDate < expiredays){
            todayDate.setDate(todayDate.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
        }
        
        
        console.log(document.cookie);
    }
 
    function getCookie(Name) {
        var search = Name + "=";
        console.log("search : " + search);
        
        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
            offset = document.cookie.indexOf(search);
            console.log("offset : " + offset);
            if (offset != -1) { // 쿠키가 존재하면 
                offset += search.length;
                // set index of beginning of value
                end = document.cookie.indexOf(";", offset);
                console.log("end : " + end);
                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                if (end == -1)
                    end = document.cookie.length;
                console.log("end위치  : " + end);
                
                return unescape(document.cookie.substring(offset, end));
            }
        }
        return "";
    }
 
    function saveid() {
        var expdate = new Date();
        if ($("#saveId").is(":checked")){
            expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
            setCookie("saveid", $("#userId").val(), expdate);
            }else{
           expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
            setCookie("saveid", $("#userId").val(), expdate);
             
        }
    }
 
//eye slash
	$(document).ready(function(){
	    $('#eye').on('click',function(){
	        $('input').toggleClass('active');
	        if($('input').hasClass('active')){
	            $(this).attr('class',"fa fa-eye-slash fa-lg")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa fa-eye fa-lg")
	            .prev('input').attr('type','password');
	        }
	    });
	});
</script>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
