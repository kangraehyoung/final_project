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

       <div class="css_email1">
            <div class="css_email2">
                <div class="css_email3">
                    <p class="css_email4">
                        <img src="${path}/resources/img/member/email.png" id="email_img">
                        <span class="css_email5">'가입 시 이메일 주소'</span>로
                        <br>
                        인증번호 메일이 발송되었어요.
                    </p>
                    <p class="css_email6">
                        5분 후에도 메일이 오지 않는다면
                        <br>
                        스팸함을 확인해 주세요.
                    </p>
                </div>
            </div>
        </div>

<br><br><br><br><br><br>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
