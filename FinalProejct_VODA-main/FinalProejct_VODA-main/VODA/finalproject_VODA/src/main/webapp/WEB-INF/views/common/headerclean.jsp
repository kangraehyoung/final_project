<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--BootStrap CSS-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

	<!--BootStrap JS
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	
 	<!-- common CSS-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/common/headerfooter.css">
    
    
	
	<title>Insert title here</title>
</head>
<body>
	<!-- 헤더 시작 -->
	<div class="container p-0">
	  <nav class="navbar navbar-expand-lg navbar-light pl-0 pr-0">
	    <div class="container-fluid pl-0 pr-0">
	        <a class="navbar-brand mr-1" href="${path}"><img class="logoimg" src="${path}/resources/img/common/VODA.png"></a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
	          <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarColor03">
	          <ul class="navbar-nav me-auto mt-1">
	            <li class="nav-item dropdown">
	              <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
	                  aria-expanded="false">
	                  CONTENTS
	              </a>
	              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                  <li><a class="dropdown-item" href="${path}/contents/contents?type=movie&sort=new">MOVIE</a></li>
	                  <li><a class="dropdown-item" href="${path}/contents/contents?type=tv&sort=new">TV</a></li>
	                  <li><a class="dropdown-item" href="${path}/contents/contents?type=book&sort=new">BOOK</a></li>
	                  <li><a class="dropdown-item" href="${path}/contents/contents?type=webtoon&sort=new">WEBTOON</a></li>
	              </ul>
	            </li>
	            <li class="nav-item dropdown">
	                <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
	                    aria-expanded="false" onclick="location.href='${path}/product/product_all_list'">
	                    GOODS
	                </a>
	                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                    <li><a class="dropdown-item" href="#" onclick="location.href='${path}/product/product_all_list'">ALL GOODS</a></li>
	                    <li><a class="dropdown-item" href="#" onclick="location.href='${path}/product/product_cart'">CART</a></li>
	                </ul>
            	</li>
	            <li class="nav-item dropdown">
	              <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
	                  aria-expanded="false">
	                  RANKING
	              </a>
	              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	                <li><a class="dropdown-item" href="#" onclick="location.href='${path}/ranking/ranking?type=영화'">MOVIE</a></li>
	                <li><a class="dropdown-item" href="#" onclick="location.href='${path}/ranking/ranking?type=TV'">TV</a></li>
	                <li><a class="dropdown-item" href="#" onclick="location.href='${path}/ranking/ranking?type=도서'">BOOK</a></li>
	                <li><a class="dropdown-item" href="#" onclick="location.href='${path}/ranking/ranking?type=웹툰'">WEBTOON</a></li>
	              </ul>
	            </li>
	            <li class="nav-item dropdown">
	              <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
	                  aria-expanded="false">
	                  COMMUNITY
	              </a>
	              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

	                  <li><a class="dropdown-item" href="#" onclick="location.href='${path}/board/notice_list'">NOTICE</a></li>
	                  <li><a class="dropdown-item" href="#" onclick="location.href='${path}/board/free_board_list'">FREE BOARD</a></li>
	                  <li><a class="dropdown-item" href="#" onclick="location.href='${path}/board/question_board_list'">Q&A</a></li>
	              </ul>
	            </li>
	          </ul>
	        </div>

	      <div class="search">
	        <form class="d-flex" id="frm-foo" action= "${path}/contents/contents_search">
	          <input class="form-control me-sm-2" type="text" name="keyword" id="searchInput">
	        </form>
	      </div>
	      
		<c:if test="${ empty loginMember }">
	      <div class="right">
	        <a class="text-nowrap" id="login" href="#"
	        onclick="location.href='${path}/member/login'">로그인</a>
	        <a class="text-nowrap" id="join" href="#"
	        onclick="location.href='${path}/member/enroll'">회원가입</a>
	      </div>
		</c:if>
		<c:if test="${ !empty loginMember }">
		  <div class="right">
		  	<c:if test="${ loginMember.m_authorization == 'U' }">
		        <a href="${ path }/mypage/main" class="text-nowrap">
					마이페이지
				</a>
			</c:if>
		  	<c:if test="${ loginMember.m_authorization == 'M' }">
		        <a href="${ path }/admin/admin_dashboard" class="text-nowrap">
					관리자페이지
				</a>
			</c:if>
			<a class="text-nowrap" href="${ path }/member/logout"
	        	style="margin-left: 16px;">
				로그아웃
			</a>
	      </div>	
		</c:if>
		
	    </div>
	  </nav>
	</div>
	<!-- 헤더 끝 -->