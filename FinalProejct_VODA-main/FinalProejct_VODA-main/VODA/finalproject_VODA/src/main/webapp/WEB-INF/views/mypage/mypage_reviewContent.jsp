<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <!-- my CSS -->
    <link rel="stylesheet" href="${path}/resources/css/mypage/mypage_main.css">
    <!-- my CSS -->
    <link rel="stylesheet" href="${path}/resources/css/common/btn.css">
    <!-- mylist CSS-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage/mypage_list.css">
      
	<style>
		.item {
		    padding-left: 17.5px;
		}
	
		.item_poster {
		    width: 190px;
		    padding-left: 50px;
		    padding-right: 50px;
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
        button:focus {
			box-shadow: none !important;
		}
		
		
		.btn {
		
		    transition: background 0.2s ease-in-out,
		        color 0.2s ease-in-out;
		}
		
		.btn-logoc {
		    color: #fff;
		    border-color: #495FE9;
		    background-color: #495FE9;
		}
		
		.btn-logoc:hover {
		    background-color: #0b27db !important;
		    border-color: #0b27db;
		    color: #fff !important;
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
		#searchVal:focus {
            outline: none;
        }
	</style>
	
    <div class="container p-0">
        <div class="row">
            <!-- 왼쪽 사이드메뉴 -->
            <div class="col-sm-2">
                <jsp:include page="/WEB-INF/views/mypage/mypage_sideMenu.jsp"/>
            </div>

            <!-- 오른쪽 컨텐츠 -->
            <div class="col-sm-10">
                <!-- 컨테이너 -->
                <div class="container">

                    <!-- 첫번째 행 -->
                    <div class="row">
                        <div class="col-sm-12" style="margin-top: 40px;">
                            <form style="margin-bottom: 3px;">
                                <h5 class="rightMainMenu" style="font-weight: 600;" onclick="location.href='${path}/mypage/reviewContent'">리뷰한 컨텐츠</h5>
                                <hr>
                            </form>
                        </div>
                    </div>

                    <div class="pl-3 pr-4 row" style="margin-top: 10px; height: 40px;">
						<c:if test="${ type == '영화' }">
							<div class="col-3 mycategory" style="background-color: rgb(90, 97, 224); color: white;" onclick="location.href='${path}/mypage/reviewContent?type=영화'">
						</c:if>
						<c:if test="${ type != '영화' }">
						    <div class="col-3 mycategory" onclick="location.href='${path}/mypage/reviewContent?type=영화'">
						</c:if>                    	
                            MOVIE
                        </div>
                        
						<c:if test="${ type == 'TV' }">
							<div class="col-3 mycategory" style="background-color: rgb(90, 97, 224); color: white;" onclick="location.href='${path}/mypage/reviewContent?type=TV'">
						</c:if>
						<c:if test="${ type != 'TV' }">
						    <div class="col-3 mycategory" onclick="location.href='${path}/mypage/reviewContent?type=TV'">
						</c:if>                    	
                            TV
                        </div>

						<c:if test="${ type == '도서' }">
							<div class="col-3 mycategory" style="background-color: rgb(90, 97, 224); color: white;" onclick="location.href='${path}/mypage/reviewContent?type=도서'">
						</c:if>
						<c:if test="${ type != '도서' }">
						    <div class="col-3 mycategory" onclick="location.href='${path}/mypage/reviewContent?type=도서'">
						</c:if>                    	
                            BOOK
                        </div>
                        
						<c:if test="${ type == '웹툰' }">
							<div class="col-3 mycategory" style="background-color: rgb(90, 97, 224); color: white; border-right: 1px solid grey;" onclick="location.href='${path}/mypage/reviewContent?type=웹툰'">
						</c:if>
						<c:if test="${ type != '웹툰' }">
						    <div class="col-3 mycategory" style="border-right: 1px solid grey;" onclick="location.href='${path}/mypage/reviewContent?type=웹툰'">
						</c:if>                    	
                            WEBTOON
                        </div>     
                    </div>



                    <div class="section_ranking">
                        <div class="box_ranking" data-tiara-layer="list">
                            <ol class="list_movieranking">
                            	<c:forEach var="contents" items="${ reviewList }" varStatus="status">
                            		<li class="item">
	                                    <div class="item_poster">
	                                        <div class="thumb_item" style="width: 187px; height: 273px;">
	                                            <div class="poster_movie" onclick="location.href='${path}/contents/contents_detail?no=${ contents.c_no }'" style="z-index: 2;">
	                                                <img style="z-index:3; cursor: pointer;" src="${ path }/resources/uploadFiles/contents/${ contents.c_pimg }"
	                                                    class="img_thumb" onerror=this.src="${path}/resources/img/common/noImage.png">
	                                                <span style="cursor:pointer; z-index:4;" class="txt_tag">
	                                                    <span class="ico_movie ico_see see${ contents.c_age }">${ contents.c_age }세이상관람가</span>
	                                                </span>
	                                            </div>

	                                        </div>
	                                        <div class="thumb_cont">
	                                            <strong class="tit_item">
	                                                <a style="text-decoration: none;" href="${path}/contents/contents_detail?no=${ contents.c_no }" class="link_txt"
	                                                    data-tiara-layer="moviename">${ contents.c_title }</a>
	                                            </strong>
	                                            <span class="txt_append">
	                                                <span class="info_txt">평점<span class="txt_grade">${ contents.rate_star }</span></span>
	                                            </span>
	                                        </div>
	                                    </div>
                                	</li>
                                	<c:if test="${ status.count % 4 == 0 }">
                                		<br>
                                	</c:if>
                            	</c:forEach>
                            </ol>
                        </div>


                    </div>
                    
                    <div class="row">
                        <div class="col-4"></div>
                        <div class="col-4">
                            <ul id="pagination">
				            	<!-- 맨 처음으로 -->
				                <li><a href="${ path }/mypage/reviewContent?page=1&type=${type}">«</a></li>
				                
				                <!-- 이전 페이지로 -->
				                <li><a href="${ path }/mypage/reviewContent?page=${ pageInfo.prevPage }&type=${type}">‹</a></li>
				                
								<!--  10개 페이지 목록 -->
								<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">
										<li><a class="active">${ status.current }</a></li>
									</c:if>
									
									<c:if test="${ status.current != pageInfo.currentPage }">
				                		<li><a href="${ path }/mypage/reviewContent?page=${ status.current }&type=${type}">${ status.current }</a></li>
									</c:if>
								</c:forEach>
								
								<!-- 다음 페이지로 -->
									<li><a href="${ path }/mypage/reviewContent?page=${ pageInfo.nextPage }&type=${type}">›</a></li>  
								<!-- 맨 끝 페이지로 -->
					                <li><a href="${ path }/mypage/reviewContent?page=${ pageInfo.maxPage }&type=${type}">»</a></li>
				            </ul>
                        </div>
            
                    </div>
					
					<div class="search1 row my-4">
						<div class="col-6 row">
							
						    <div class="col-3 mr-4">
						        <select id="searchType" name="searchType" class="form-control1" style="font-size: 14.45px; width: 106px;">
							        <option value="title" selected>제목</option>
						    	</select>
							</div>
					
							<div class="col-8 pl-0">
						    	<div class="input-group">
						        	<input id="searchVal" type="text" class="form-control1" style="font-size: 14.45px;">
									<span class="input-group-btn">
							    		<button id="searchBtn" class="btn btn-greyc text-nowrap" style="padding-top:0px; padding-left:6px; width:30px; height:26px; box-shadow: rgb(0 0 0 / 30%) 0px 0px 4px 0px;">
							    			<img src="${path}/resources/img/community/search.png" style="height: 18px;">
										</button>
						            </span>
						         </div>
						    </div>

					    </div>
					</div>
                    <!-- 컨테이너 끝 -->
                </div>
                <!-- 오른쪽 그리드 끝 -->
            </div>
        </div>
        <!-- 내용 전체 컨테이너 끝 -->
    </div>
    <!-- 내용 전체 컨테이너 끝 -->
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
	$(document).ready(() => {
		$("#searchBtn").on("click", () => {
			var searchType = $("#searchType").val();
			var searchVal = $("#searchVal").val();
			
			location.href="${path}/mypage/reviewContentSearch?type=${type}&searchType=" + searchType + "&searchVal=" + searchVal;
		});
	});
</script>