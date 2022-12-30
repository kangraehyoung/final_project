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
<title>people</title>

    <!--BootStrap CSS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!-- people CSS -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/people/people.css">
    
</head>
<body>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

 <hr class="hide">

    <main class="kakao_content">
        <article id="mainContent" class="kakao_article">
            <h2 class="screen_out">본문</h2>
            <div class="section_star">
                <div class="box_basic" data-tiara-layer="main">
                    <div class="info_poster">
                        <div class="thumb_img">
                            <c:if test="${ not empty people.people_original_filename }">
                            	<img src="${ path }/resources/upload/people/${ people.people_renamed_filename }"
                            	style="width:105%;height:105%;-fit:cover;">
							</c:if>
                        </div>
                    </div>
                    <div class="info_detail">
                        <div class="detail_tit_fixed" aria-hidden="true">
                            <div class="inner_tit">
                                <span class="txt_tit">${ people.people_no }</span>
                            </div>
                        </div>
                        <div class="detail_tit">
                        <h3 class="tit_movie">
                            <span class="txt_tit">${ people.people_name }</span>
                        </h3>
                            <div class="head_origin">
                                <span class="txt_name"></span>
                            </div>
                        </div>
                        <div class="detail_cont">
                            <div class="inner_cont">
                                <dl class="list_cont">
                                    <dt>직업</dt>
                                    <dd>${ people.people_job }</dd>
                                </dl>
                                <dl class="list_cont">
                                    <dt>출생일</dt>
                                    <dd>${ people.people_birth }
                                    </dd>
                                </dl>
                                <dl class="list_cont">
                                    <dt>성별</dt>
                                    <dd>${ people.people_gender }</dd>
                                </dl>
                            </div>
                            <div class="inner_cont">
                                <dl class="list_cont">
                                    <dt>데뷔</dt>
                                    <dd>${ people.people_debut }</dd>
                                </dl>
                                <dl class="list_cont">
                                    <dt>수상</dt>
                                    <dd>
                                    ${ people.poeple_award }
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button type="button" class="btn-logoc" style="width: 100px; height: 36px; float: right;"
             onclick="location.replace('${ path }/admin/admin_people')">목록으로</button>
        </article>        
    </main>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	

</body>
</html>