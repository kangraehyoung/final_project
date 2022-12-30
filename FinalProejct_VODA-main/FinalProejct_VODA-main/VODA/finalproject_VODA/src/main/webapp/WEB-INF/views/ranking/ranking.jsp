<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <meta charset="utf-8">

    <title>랭킹copy | VODA</title>


    <!--BootStrap CSS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!--BootStrap JS-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>


    <!-- Ranking CSS-->
    <link rel="stylesheet" href="${path}/resources/css/ranking/ranking.css">
    
    
    <!-- kakao JS-->
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/${VERSION}/kakao.min.js" integrity="${INTEGRITY_VALUE}" crossorigin="anonymous"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('0e845b2075f4a9238f9c4b28eea0a665');
		Kakao.isInitialized();
	</script>


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


<body class="">


    <article id="mainContent" class="kakao_article">
        <h2 class="screen_out">영화 랭킹 본문</h2>
        <div class="section_ranking">
            <div class="head_section">
                <h3 class="tit_section">${type} TOP 10<img src="${ path }/resources/img/ranking/kakao.png" onclick="js:kakaoShare()" alt=""
                        style=" position: absolute; width: 45px; height: 45px; top: 25px; right: 0px; box-sizing: border-box; border-radius: 20%; box-shadow: rgb(0 0 0 / 20%) 0px 0px 4px 0px; cursor: pointer;">
                </h3>
            </div>

            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                    <div id="carouselExampleControlsNoTouching" class="carousel slide" data-touch="false"
                        data-interval="false">
                        <!--carousel-->
                        <div class="carousel-inner">
                        
	                        <c:forEach var="contents" items="${ rankingTotalList }" varStatus="status">
	                        	<c:if test="${ status.first }">
	                       			<div class="carousel-item active">
	                       		</c:if>
	                       		<c:if test="${ status.count % 5 == 1 && !status.first }">
	                            	<div class="carousel-item">
	                            </c:if>
	                                <li>
	                                    <div class="item_poster"  style="cursor:pointer" onclick="location.href='${path}/contents/contents_detail?no=${ contents.c_no }'">
	                                        <div class="thumb_item">
	                                            <div class="poster_movie">
	                                                <img src="${ path }/resources/uploadFiles/contents/${ contents.c_pimg }"
	                                                    class="img_thumb" alt="${ contents.c_title }">
	
	                                                <span class="rank_num">${status.count }</span>
	                                                <span class="txt_tag">
	                                                    <span class="ico_movie ico_see see${ contents.c_age }">${ contents.c_age }세이상관람가</span>
	                                                </span>
	                                            </div>
	                                            <div class="poster_info">
	                                                <a href="${path}/contents/contents_detail?no=${ contents.c_no }" class="link_story"
	                                                    data-tiara-layer="poster">
	                                                    ${contents.c_synop }
	                                                </a>
	                                            </div>
	                                        </div>
	                                        <div class="thumb_cont">
	                                            <strong class="tit_item">
	                                                <a href="/moviedb/main?movieId=147615" class="link_txt"
	                                                    data-tiara-layer="moviename">${contents.c_title }</a>
	                                            </strong>
	                                            <span class="txt_append">
	                                                <span class="info_txt">평점<span class="txt_grade">${contents.rate_star }</span></span>
	                                            </span>
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
                            
                            <!--carousel page 2 end-->
                        </div>
                        <!--carousel-inner end-->
                        <c:if test="${fn:length(rankingTotalList) > 5}">
	                        <div style="width: 5%;" class="my-5">
	                            <button style="width: 5%; height:100px; margin-top:100px; margin-left: -22px;"
	                                class="carousel-control-prev" type="button"
	                                data-target="#carouselExampleControlsNoTouching" data-slide="prev">
	                                <img src="${ path }/resources/img/ranking/slide-left.png" alt=""
	                                    style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                                <span class="sr-only">Previous</span>
	                            </button>
	                            <button style="width: 5%; height:100px; margin-top:100px; margin-right: -25px;"
	                                class="carousel-control-next" type="button"
	                                data-target="#carouselExampleControlsNoTouching" data-slide="next">
	                                <img src="${ path }/resources/img/ranking/slide-right.png" alt=""
	                                    style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                                <span class="sr-only">Next</span>
	                            </button>
	                        </div>
                        </c:if>
                    </div>
                    <!--carousel-->
                </ol>
            </div>

            <!-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
            <hr style="margin-top: 45px;">
            <div class="head_section">
                <h3 class="tit_section">10대·20대 여성이 좋아하는 ${type}</h3>
            </div>

            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                    <div id="carouselExampleControlsNoTouching2" class="carousel slide" data-touch="false"
                        data-interval="false">
                        <!--carousel-->
                        <div class="carousel-inner">
	                        <c:forEach var="contents" items="${ ranking1020WList }" varStatus="status">
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
	                                                <img src="${ path }/resources/uploadFiles/contents/${ contents.c_pimg }"
	                                                    class="img_thumb" alt="${ contents.c_title }">
	
	                                                <span class="rank_num">${status.count }</span>
	                                                <span class="txt_tag">
	                                                    <span class="ico_movie ico_see see${ contents.c_age }">${ contents.c_age }세이상관람가</span>
	                                                </span>
	                                            </div>
	                                            <div class="poster_info">
	                                                <a href="${path}/contents/contents_detail?no=${ contents.c_no }" class="link_story"
	                                                    data-tiara-layer="poster">
	                                                    ${contents.c_synop }
	                                                </a>
	                                            </div>
	                                        </div>
	                                        <div class="thumb_cont">
	                                            <strong class="tit_item">
	                                                <a href="/moviedb/main?movieId=147615" class="link_txt"
	                                                    data-tiara-layer="moviename">${contents.c_title }</a>
	                                            </strong>
	                                            <span class="txt_append">
	                                                <span class="info_txt">평점<span class="txt_grade">${contents.rate_star }</span></span>
	                                            </span>
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
                        <c:if test="${fn:length(ranking1020WList) > 5}">                        
	                        <div style="width: 5%;" class="my-5">
	                            <button style="width: 5%; height:100px; margin-top:100px; margin-left: -22px;"
	                                class="carousel-control-prev" type="button"
	                                data-target="#carouselExampleControlsNoTouching2" data-slide="prev">
	                                <img src="${ path }/resources/img/ranking/slide-left.png" alt=""
	                                    style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                                <span class="sr-only">Previous</span>
	                            </button>
	                            <button style="width: 5%; height:100px; margin-top:100px; margin-right: -25px;"
	                                class="carousel-control-next" type="button"
	                                data-target="#carouselExampleControlsNoTouching2" data-slide="next">
	                                <img src="${ path }/resources/img/ranking/slide-right.png" alt=""
	                                    style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                                <span class="sr-only">Next</span>
	                            </button>
	                        </div>
	                    </c:if>
                    </div>
                    <!--carousel-->
                </ol>
            </div>




            <!-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

            <hr style="margin-top: 45px;">
            <div class="head_section">
                <h3 class="tit_section">10대·20대 남성이 좋아하는 ${type}</h3>
            </div>

            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                    <div id="carouselExampleControlsNoTouching3" class="carousel slide" data-touch="false"
                        data-interval="false">
                        <!--carousel-->
                        <div class="carousel-inner">
	                        <c:forEach var="contents" items="${ ranking1020MList }" varStatus="status">
	                        	<c:if test="${ status.first }">
	                       			<div class="carousel-item active">
	                       		</c:if>
	                       		<c:if test="${ status.count % 5 == 1 && !status.first }">
	                            	<div class="carousel-item">
	                            </c:if>
	                                <li>
	                                    <div class="item_poster"  style="cursor:pointer" onclick="location.href='${path}/contents/contents_detail?no=${ contents.c_no }'">
	                                        <div class="thumb_item">
	                                            <div class="poster_movie">
	                                                <img src="${ path }/resources/uploadFiles/contents/${ contents.c_pimg }"
	                                                    class="img_thumb" alt="${ contents.c_title }">
	
	                                                <span class="rank_num">${status.count }</span>
	                                                <span class="txt_tag">
	                                                    <span class="ico_movie ico_see see${ contents.c_age }">${ contents.c_age }세이상관람가</span>
	                                                </span>
	                                            </div>
	                                            <div class="poster_info">
	                                                <a href="${path}/contents/contents_detail?no=${ contents.c_no }" class="link_story"
	                                                    data-tiara-layer="poster">
	                                                    ${contents.c_synop }
	                                                </a>
	                                            </div>
	                                        </div>
	                                        <div class="thumb_cont">
	                                            <strong class="tit_item">
	                                                <a href="/moviedb/main?movieId=147615" class="link_txt"
	                                                    data-tiara-layer="moviename">${contents.c_title }</a>
	                                            </strong>
	                                            <span class="txt_append">
	                                                <span class="info_txt">평점<span class="txt_grade">${contents.rate_star }</span></span>
	                                            </span>
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
                        <c:if test="${fn:length(ranking1020MList) > 5}">
	                        <div style="width: 5%;" class="my-5">
	                            <button style="width: 5%; height:100px; margin-top:100px; margin-left: -22px;"
	                                class="carousel-control-prev" type="button"
	                                data-target="#carouselExampleControlsNoTouching3" data-slide="prev">
	                                <img src="${ path }/resources/img/ranking/slide-left.png" alt=""
	                                    style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                                <span class="sr-only">Previous</span>
	                            </button>
	                            <button style="width: 5%; height:100px; margin-top:100px; margin-right: -25px;"
	                                class="carousel-control-next" type="button"
	                                data-target="#carouselExampleControlsNoTouching3" data-slide="next">
	                                <img src="${ path }/resources/img/ranking/slide-right.png" alt=""
	                                    style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                                <span class="sr-only">Next</span>
	                            </button>
	                        </div>
                        </c:if>
                    </div>
                    <!--carousel-->
                </ol>
            </div>

            <hr style="margin-top: 45px;">
            <div class="head_section">
                <h3 class="tit_section">30대·40대 여성이 좋아하는 ${type}</h3>
            </div>


            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                    <div id="carouselExampleControlsNoTouching4" class="carousel slide" data-touch="false"
                        data-interval="false"><!--carousel-->
                        <div class="carousel-inner">
	                        <c:forEach var="contents" items="${ ranking3040WList }" varStatus="status">
	                        	<c:if test="${ status.first }">
	                       			<div class="carousel-item active">
	                       		</c:if>
	                       		<c:if test="${ status.count % 5 == 1 && !status.first }">
	                            	<div class="carousel-item">
	                            </c:if>
	                                <li>
	                                    <div class="item_poster"  style="cursor:pointer" onclick="location.href='${path}/contents/contents_detail?no=${ contents.c_no }'">
	                                        <div class="thumb_item">
	                                            <div class="poster_movie">
	                                                <img src="${ path }/resources/uploadFiles/contents/${ contents.c_pimg }"
	                                                    class="img_thumb" alt="${ contents.c_title }">
	
	                                                <span class="rank_num">${status.count }</span>
	                                                <span class="txt_tag">
	                                                    <span class="ico_movie ico_see see${ contents.c_age }">${ contents.c_age }세이상관람가</span>
	                                                </span>
	                                            </div>
	                                            <div class="poster_info">
	                                                <a href="${path}/contents/contents_detail?no=${ contents.c_no }" class="link_story"
	                                                    data-tiara-layer="poster">
	                                                    ${contents.c_synop }
	                                                </a>
	                                            </div>
	                                        </div>
	                                        <div class="thumb_cont">
	                                            <strong class="tit_item">
	                                                <a href="/moviedb/main?movieId=147615" class="link_txt"
	                                                    data-tiara-layer="moviename">${contents.c_title }</a>
	                                            </strong>
	                                            <span class="txt_append">
	                                                <span class="info_txt">평점<span class="txt_grade">${contents.rate_star }</span></span>
	                                            </span>
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

                        </div><!--carousel-inner end-->
                        <c:if test="${fn:length(ranking3040WList) > 5}">
	                        <div style="width: 5%;" class="my-5">
	                            <button style="width: 5%; height:100px; margin-top:100px; margin-left: -22px;"
	                                class="carousel-control-prev" type="button"
	                                data-target="#carouselExampleControlsNoTouching4" data-slide="prev">
	                                <img src="${ path }/resources/img/ranking/slide-left.png" alt=""
	                                    style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                                <span class="sr-only">Previous</span>
	                            </button>
	                            <button style="width: 5%; height:100px; margin-top:100px; margin-right: -25px;"
	                                class="carousel-control-next" type="button"
	                                data-target="#carouselExampleControlsNoTouching4" data-slide="next">
	                                <img src="${ path }/resources/img/ranking/slide-right.png" alt=""
	                                    style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                                <span class="sr-only">Next</span>
	                            </button>
	                        </div>
                        </c:if>
                    </div>
                    <!--carousel-->
                </ol>
            </div>





            <hr style="margin-top: 45px;">
            <div class="head_section">
                <h3 class="tit_section">30대·40대 남성이 좋아하는 ${type}</h3>
            </div>
            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                    <div id="carouselExampleControlsNoTouching5" class="carousel slide" data-touch="false"
                    data-interval="false"><!--carousel-->
                    <div class="carousel-inner">
	                        <c:forEach var="contents" items="${ ranking3040MList }" varStatus="status">
	                        	<c:if test="${ status.first }">
	                       			<div class="carousel-item active">
	                       		</c:if>
	                       		<c:if test="${ status.count % 5 == 1 && !status.first }">
	                            	<div class="carousel-item">
	                            </c:if>
	                                <li>
	                                    <div class="item_poster"  style="cursor:pointer" onclick="location.href='${path}/contents/contents_detail?no=${ contents.c_no }'">
	                                        <div class="thumb_item">
	                                            <div class="poster_movie">
	                                                <img src="${ path }/resources/uploadFiles/contents/${ contents.c_pimg }"
	                                                    class="img_thumb" alt="${ contents.c_title }">
	
	                                                <span class="rank_num">${status.count }</span>
	                                                <span class="txt_tag">
	                                                    <span class="ico_movie ico_see see${ contents.c_age }">${ contents.c_age }세이상관람가</span>
	                                                </span>
	                                            </div>
	                                            <div class="poster_info">
	                                                <a href="${path}/contents/contents_detail?no=${ contents.c_no }" class="link_story"
	                                                    data-tiara-layer="poster">
	                                                    ${contents.c_synop }
	                                                </a>
	                                            </div>
	                                        </div>
	                                        <div class="thumb_cont">
	                                            <strong class="tit_item">
	                                                <a href="/moviedb/main?movieId=147615" class="link_txt"
	                                                    data-tiara-layer="moviename">${contents.c_title }</a>
	                                            </strong>
	                                            <span class="txt_append">
	                                                <span class="info_txt">평점<span class="txt_grade">${contents.rate_star }</span></span>
	                                            </span>
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

                    </div><!--carousel-inner end-->
                    <c:if test="${fn:length(ranking3040MList) > 5}">
	                    <div style="width: 5%;" class="my-5">
	                        <button style="width: 5%; height:100px; margin-top:100px; margin-left: -22px;"
	                            class="carousel-control-prev" type="button"
	                            data-target="#carouselExampleControlsNoTouching5" data-slide="prev">
	                            <img src="${ path }/resources/img/ranking/slide-left.png" alt=""
	                                style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                            <span class="sr-only">Previous</span>
	                        </button>
	                        <button style="width: 5%; height:100px; margin-top:100px; margin-right: -25px;"
	                            class="carousel-control-next" type="button"
	                            data-target="#carouselExampleControlsNoTouching5" data-slide="next">
	                            <img src="${ path }/resources/img/ranking/slide-right.png" alt=""
	                                style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                            <span class="sr-only">Next</span>
	                        </button>
	                    </div>
                    </c:if>
                </div>
                <!--carousel-->
                </ol>
            </div>

            <hr style="margin-top: 45px;">
            <div class="head_section">
                <h3 class="tit_section">50대 이상 여성이 좋아하는 ${type}</h3>
            </div>
            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                    <div id="carouselExampleControlsNoTouching6" class="carousel slide" data-touch="false"
                    data-interval="false"><!--carousel-->
                    <div class="carousel-inner">
	                        <c:forEach var="contents" items="${ ranking50WList }" varStatus="status">
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
	                                                <img src="${ path }/resources/uploadFiles/contents/${ contents.c_pimg }"
	                                                    class="img_thumb" alt="${ contents.c_title }">
	
	                                                <span class="rank_num">${status.count }</span>
	                                                <span class="txt_tag">
	                                                    <span class="ico_movie ico_see see${ contents.c_age }">${ contents.c_age }세이상관람가</span>
	                                                </span>
	                                            </div>
	                                            <div class="poster_info">
	                                                <a href="${path}/contents/contents_detail?no=${ contents.c_no }" class="link_story"
	                                                    data-tiara-layer="poster">
	                                                    ${contents.c_synop }
	                                                </a>
	                                            </div>
	                                        </div>
	                                        <div class="thumb_cont">
	                                            <strong class="tit_item">
	                                                <a href="/moviedb/main?movieId=147615" class="link_txt"
	                                                    data-tiara-layer="moviename">${contents.c_title }</a>
	                                            </strong>
	                                            <span class="txt_append">
	                                                <span class="info_txt">평점<span class="txt_grade">${contents.rate_star }</span></span>
	                                            </span>
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

            		</div><!--carousel-inner end-->
            		<c:if test="${fn:length(ranking50WList) > 5}">
			            <div style="width: 5%;" class="my-5">
			                <button style="width: 5%; height:100px; margin-top:100px; margin-left: -22px;"
			                    class="carousel-control-prev" type="button"
			                    data-target="#carouselExampleControlsNoTouching6" data-slide="prev">
			                    <img src="${ path }/resources/img/ranking/slide-left.png" alt=""
			                        style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
			                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			                    <span class="sr-only">Previous</span>
			                </button>
			                <button style="width: 5%; height:100px; margin-top:100px; margin-right: -25px;"
			                    class="carousel-control-next" type="button"
			                    data-target="#carouselExampleControlsNoTouching6" data-slide="next">
			                    <img src="${ path }/resources/img/ranking/slide-right.png" alt=""
			                        style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
			                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			                    <span class="sr-only">Next</span>
			                </button>
			            </div>
		            </c:if>
        		</div>
        <!--carousel-->
                </ol>
            </div>


            <hr style="margin-top: 45px;">
            <div class="head_section">
                <h3 class="tit_section">50대 이상 남성이 좋아하는 ${type}</h3>
            </div>
            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                    <div id="carouselExampleControlsNoTouching7" class="carousel slide" data-touch="false"
                    data-interval="false"><!--carousel-->
                    <div class="carousel-inner">
	                        <c:forEach var="contents" items="${ ranking50MList }" varStatus="status">
	                        	<c:if test="${ status.first }">
	                       			<div class="carousel-item active">
	                       		</c:if>
	                       		<c:if test="${ status.count % 5 == 1 && !status.first }">
	                            	<div class="carousel-item">
	                            </c:if>
	                                <li>
	                                    <div class="item_poster"  style="cursor:pointer" onclick="location.href='${path}/contents/contents_detail?no=${ contents.c_no }'">
	                                        <div class="thumb_item">
	                                            <div class="poster_movie">
	                                                <img src="${ path }/resources/uploadFiles/contents/${ contents.c_pimg }"
	                                                    class="img_thumb" alt="${ contents.c_title }">
	
	                                                <span class="rank_num">${status.count }</span>
	                                                <span class="txt_tag">
	                                                    <span class="ico_movie ico_see see${ contents.c_age }">${ contents.c_age }세이상관람가</span>
	                                                </span>
	                                            </div>
	                                            <div class="poster_info">
	                                                <a href="${path}/contents/contents_detail?no=${ contents.c_no }" class="link_story"
	                                                    data-tiara-layer="poster">
	                                                    ${contents.c_synop }
	                                                </a>
	                                            </div>
	                                        </div>
	                                        <div class="thumb_cont">
	                                            <strong class="tit_item">
	                                                <a href="/moviedb/main?movieId=147615" class="link_txt"
	                                                    data-tiara-layer="moviename">${contents.c_title }</a>
	                                            </strong>
	                                            <span class="txt_append">
	                                                <span class="info_txt">평점<span class="txt_grade">${contents.rate_star }</span></span>
	                                            </span>
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

                    </div><!--carousel-inner end-->
                    <c:if test="${fn:length(ranking50MList) > 5}">
	                    <div style="width: 5%;" class="my-5">
	                        <button style="width: 5%; height:100px; margin-top:100px; margin-left: -22px;"
	                            class="carousel-control-prev" type="button"
	                            data-target="#carouselExampleControlsNoTouching7" data-slide="prev">
	                            <img src="${ path }/resources/img/ranking/slide-left.png" alt=""
	                                style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                            <span class="sr-only">Previous</span>
	                        </button>
	                        <button style="width: 5%; height:100px; margin-top:100px; margin-right: -25px;"
	                            class="carousel-control-next" type="button"
	                            data-target="#carouselExampleControlsNoTouching7" data-slide="next">
	                            <img src="${ path }/resources/img/ranking/slide-right.png" alt=""
	                                style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
	                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                            <span class="sr-only">Next</span>
	                        </button>
	                    </div>
                    </c:if>
                </div>
                <!--carousel-->
                </ol>
            </div>



        </div>
    </article>
    </main>
    <hr class="hide">
    
    
<script type="text/javascript">

  // SDK 초기화 여부를 판단합니다.
  console.log(Kakao.isInitialized());

  function kakaoShare() {
	    Kakao.Link.sendDefault({
	      objectType: 'feed',
	      content: {
	        title: '오늘의 VODA 랭킹 보러가기',
	        description: '영화, 드라마, 책, 웹툰 인기 순위를 보고싶으면?',
	        imageUrl: 'https://occ-0-325-988.1.nflxso.net/dnm/api/v6/oQyw8Fv9eE41UPapt7zHvdUdzrE/AAAABbRLGW6za6NH1VixoN4Xillbebl6-TtXNqstWv3IFpxu45Sj6ggOtTUHHchY9E6HUh2-BrJia32IDFYFYO3hBxKTAdOsh9VR3Bx2TwqRpthLhOYfeAGOJi9NOhOHU0h_z6ndbA.jpg?r=170',
	        link: {
	          mobileWebUrl: 'http://localhost:8088/voda/ranking/ranking',
	          webUrl: 'http://localhost:8088/voda/ranking/ranking',
	        },
	      },
	      buttons: [
	    	    {
	    	        title: '웹으로 이동',
	    	        link: {
	    	          mobileWebUrl: 'http://localhost:8088/voda/ranking/ranking',
	    	          webUrl: 'http://localhost:8088/voda/ranking/ranking',
	    	        },
	    	      },
	    	      {
	    	        title: '앱으로 이동',
	    	        link: {
	    	          mobileWebUrl: 'http://localhost:8088/voda/ranking/ranking',
	    	          webUrl: 'http://localhost:8088/voda/ranking/ranking',
	    	        },
	    	      },
	      ],
	      // 카카오톡 미설치 시 카카오톡 설치 경로이동
	      installTalk: true,
	    })
  }
</script>

    </div>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
