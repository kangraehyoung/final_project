<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--BootStrap CSS-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
	<!--BootStrap JS-->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	
 	<!-- common CSS-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/common/headerfooter.css">
    
    <!-- goods_all_list CSS-->
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main/mainpage.css">
	
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<title>보다 - 컨텐츠 리뷰 & 쇼핑몰</title>
	
	 <style>
        img {
            display: inline-block;
            overflow: hidden;
            font-size: 0;
            line-height: 0;
            text-indent: -9999px;
            vertical-align: top;
            background-size: 500px auto;
        }
    </style>
    
</head>
<body>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/headerclean.jsp"/>
    
 <div class="videowrapper">
    <!-- autoplay 요소를 지우면 자동 재생이 되지 않음 -->
    <video loop muted controls poster="${path}/resources/img/main/thumbnail.png">
        <source src="${path}/resources/img/main/trailer.mp4" type="">
    </video>

    <div class="container p-0">
        <div class="info">
            <p class="title">블레이드 러너 2049</p>
            <div class="outline d-none d-lg-block">
                핵전쟁 이후 혼돈으로 무질서로 휩싸인 2019년, 복제인간 ‘로이’를 포함한 <br>
                ‘넥서스 6’이 오프월드에서 반란을 일으킨 후 지구로 잠입한다... <br>
            </div>
            <br>
            <button type="button" class="btn btn-outline-light">리뷰 보러가기</button>
        </div>
    </div>

	<div class="container p-0">
    <article id="mainContent" class="kakao_article">

        <div class="section_ranking">

            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                    <div id="carouselExampleControlsNoTouching2" class="carousel slide" data-touch="false" data-interval="false">
                        <!--carousel-->
                        <div class="carousel-inner">
                            <c:forEach var="contents" items="${ list }" varStatus="status">
                                <c:if test="${ status.first }">
                                    <div class="carousel-item active">
                                </c:if>
                                <c:if test="${ status.count % 5 == 1 && !status.first }">
                                    <div class="carousel-item">
                                </c:if>
                                <li>
                                    <div class="item_poster" style="cursor:pointer" onclick="location.href='${path}/contents/contents_detail?no=${ contents.c_no }'">
                                        <div class="thumb_item">
                                            <div class="poster_movie">
                                                <img src="${ path }/resources/uploadFiles/contents/${ contents.c_pimg }" class="img_thumb" alt="${ contents.c_title }">

                                                <span class="rank_num">${status.count }</span>
                                                <span class="txt_tag">
                                                    <span class="ico_movie ico_see see${ contents.c_age }">${ contents.c_age }세이상관람가</span>
                                                </span>
                                            </div>
                                            <div class="poster_info">
                                                <a href="${path}/contents/contents_detail?no=${ contents.c_no }" class="link_story" data-tiara-layer="poster">
                                                    ${contents.c_synop }
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <c:if test="${ !status.last && status.count % 5 == 0 }">
                        </div>
                        </c:if>

                        <c:if test="${ status.last }">
                    </div>
                    </c:if>
                    </c:forEach>
            </div>
            <!--carousel-inner end-->

            <div style="width: 5%;" class="my-5">
                <button style="width: 5%; height:100px; margin-top:100px; margin-left: -22px;" class="carousel-control-prev" type="button" data-target="#carouselExampleControlsNoTouching2" data-slide="prev">
                    <img src="${ path }/resources/img/ranking/slide-left.png" alt="" style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </button>
                <button style="width: 5%; height:100px; margin-top:100px; margin-right: -25px;" class="carousel-control-next" type="button" data-target="#carouselExampleControlsNoTouching2" data-slide="next">
                    <img src="${ path }/resources/img/ranking/slide-right.png" alt="" style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </button>
            </div>

        </div>
        <!--carousel-->
        </ol>
    </article>
    </div>
</div> <!-- 비디오래퍼 끝 -->

        
<div style="height: 300px;"></div>
 
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>