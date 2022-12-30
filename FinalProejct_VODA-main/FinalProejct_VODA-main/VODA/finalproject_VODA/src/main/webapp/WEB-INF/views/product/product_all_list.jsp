<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- goods_all_list CSS-->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/product/product_all_list.css?ver=1">
 <style>
        @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

        * {
            font-family: Pretendard,
                -apple-system, BlinkMacSystemFont,
                system-ui, Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
        }

        .page-link,
        .form-control {

            box-shadow: none !important;
        }

        input:focus {
            outline: none !important;
        }


        .btn {

            transition: background 0.2s ease-in-out,
                color 0.2s ease-in-out;
            /* 패딩은 주석하쇼 */
            padding: 1px 0.38rem;


        }

        .btn-greyc {
            background-color: rgb(235, 236, 240);
            border: rgb(235, 236, 240);
            color: #000000;

        }

        .btn-greyc:hover {
            background-color: #c3c3c4b7 !important;
            border-color: #c3c3c4b7 !important;
            color: #000000 !important;



        }

        table * {
            font-size: 14.45px;
            color: #000000;
        }

        .table thead th {
            border-bottom: 1px;
        }

        .table {
            margin-bottom: 0rem;
        }


        .table td,
        .table th {
            padding: 0.60rem;
        }

        .page-link {
            color: #000000;
            font-size: 14.45px;
        }

        /* pagination */
        #pagination {
            margin: 0;
            margin-top: 20px;
            padding: 0;
            text-align: center;

        }

        #pagination li {
            display: inline
        }

        #pagination li a {
            display: inline-block;
            text-decoration: none;
            padding: 3px 7px;
            color: #000000;
            font-size: 14.45px;
        }

        /* Active and Hoverable Pagination */
        #pagination li a {
            border-radius: 5px;
            -webkit-transition: background-color 0.3s;
            transition: background-color 0.3s
        }

        #pagination li a.active {
            background-color: rgb(73, 95, 233);
            color: #fff
        }

        #pagination li a:hover:not(.active) {
            background-color: #ddd;
        }

        .display1 {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .display2 {
            float: right;
            margin-top: -90px;
        }


        /* 인풋, 폼태그 */
        option {
            font-size: 14.5px;
        }

        .form-control1 {
            display: block;
            height: 27.8px;
            padding: 0.2rem 0.7rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;

        }


        .td-hr {
            pointer-events: none;
        }
    </style>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
        <a href="${path}/product/product_search?searchtype=pcategory&searchname=지브리">
            <img src="${path}/resources/img/product/가로자른배너1.png" class="d-block w-100" alt="..." id="crs">
        </a>
        </div>
        <div class="carousel-item">
        <a href="${path}/product/product_search?searchtype=pcategory&searchname=지브리">
            <img src="${path}/resources/img/product/가로자른배너2.png" class="d-block w-100" alt="..." id="crs">
        </a>
        </div>
        <div class="carousel-item">
        <a href="${path}/product/product_search?searchtype=pname&searchname=토토로">
            <img src="${path}/resources/img/product/가로자른배너3.png" class="d-block w-100" alt="..." id="crs">
        </a>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-target="#carouselExampleIndicators" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-target="#carouselExampleIndicators" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </button>
</div>
<br>
    <article id="mainContent" class="kakao_article">
        <h2 class="screen_out">영화 랭킹 본문</h2>
        <div class="section_ranking">
            <div class="head_section">
                <h3 class="tit_section">전체 상품</h3>
            </div>
            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                        <c:forEach var="product" items="${product}">
                        <c:set var="rename" value="${ product.prenamefile }" />
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="${ path }/resources/uploadFiles/${ fn:substring(rename,0,22) }" class="img_thumb" alt="">
                                    </div>
                                    <div class="poster_info">
                                        <a href="${ path }/product/product_detail?pno=${product.pno}" class="link_story" data-tiara-layer="poster">
                                            ${product.pcategory}
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="${ path }/product/product_detail?pno=${product.pno}" class="link_txt" data-tiara-layer="moviename">[${ product.pcategory }] ${ product.pname }</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">${ product.pprice } </span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </ol>
            </div>
    </article>
    
    
    <div class="display1 row my-3">
            <!--Active and Hoverable Pagination-->
            <ul id="pagination">
            	<!-- 맨 처음으로 -->
                <li><a href="${ path }/product/product_all_list?page=1">«</a></li>
                
                <!-- 이전 페이지로 -->
                <li><a href="${ path }/product/product_all_list?page=${ pageInfo.prevPage }">‹</a></li>
                
				<!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">
						<li><a class="active">${ status.current }</a></li>
					</c:if>
					
					<c:if test="${ status.current != pageInfo.currentPage }">
                		<li><a href="${ path }/product/product_all_list?page=${ status.current }">${ status.current }</a></li>
					</c:if>
				</c:forEach>
				
				<!-- 다음 페이지로 -->
					<li><a href="${ path }/product/product_all_list?page=${ pageInfo.nextPage }">›</a></li>  
				<!-- 맨 끝 페이지로 -->
	                <li><a href="${ path }/product/product_all_list?page=${ pageInfo.maxPage }">»</a></li>
            </ul>
            
        </div>
    
    <c:if test="${ loginMember.m_authorization == 'M' }">
    	<div class="display2" style="margin-right: 212px;">
            <button class="btn btn-greyc text-nowrap" style="box-shadow: rgb(0 0 0 / 30%) 0px 0px 4px 0px;"  onclick="location.href='${path}/product/product_create'"><img
                    src="${path}/resources/img/community/edit.png" style="height: 20px;"></button>
        </div>
	</c:if>

        <div class="col-4 text-right">
    </div>
    
    <div class="search1 row my-4" style="margin: 0 auto; width: 1100px">
    <form action="${ path }/product/product_search" style="width: 100%;">
            <div class="col-6 row" style="width: 100%;">
                <div class="col-xs-3 col-sm-3" style="padding-left: -15px;">
                    <select name="searchtype" class="form-control1" style="font-size: 14.45px; ">
                        <option value="pname" selected>상품명</option>
                        <option value="pcategory">영화명</option>
                    </select>
                </div>

                <div class="col-xs-7 col-sm-7 pl-0">
                    <div class="input-group" style="margin-left: -10px;">
                        <input type="text" class="form-control1" style="font-size: 14.45px;" name="searchname">
                        <span class="input-group-btn">
                            <button id="searchBtn" class="btn btn-greyc text-nowrap"
                                style="box-shadow: rgb(0 0 0 / 30%) 0px 0px 4px 0px;"><img
                                     src="${path}/resources/img/community/search.png" style="height: 18px;"></button>
                        </span>
                    </div>

                </div>
            </div>
        </form>
        </div>
    
    
    <br><br><br>
    
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>