<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<title>VODA</title>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <!-- join CSS -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/member/enroll.css">
    
  <div class="container">
      <div class="join_base_wrap">
          <div class="member_tit">
              <img src="${path}/resources/img/member/check.png" id="check_img">

              <h2>회원가입 완료! <br> VODA 회원이 되신 것을 환영해요. </h2>

              <br>

              <h6>지금 바로 VODA와 다양한 컨텐츠 리뷰를 공유해보세요!</h6>
          </div>    
      </div> 
  </div>
      <div class="join_completion">
          <button id="btn_join_completion" type="button" class="btn-logoc" 
          			onclick="location.href='/voda/member/login'">VODA 즐기러 가기</button>
      </div>
  
  <br><br><br><br><br><br>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
