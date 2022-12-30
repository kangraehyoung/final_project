<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- contents_movie CSS-->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/contents/contents_movie.css">
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <article id="mainContent" class="kakao_article">

        <table class="mt-5">
            <tr>
                <td class="new-contents-info" style="width: 200px;">SEARCH MOVIE</td>
                <td style="width: 1200px;">
                    <hr class="contents-line">
                </td>
            </tr>
        </table>
    
        <div class="section_ranking">
        <div class="box_ranking"  data-tiara-layer="list">
                
        <ol class="list_movieranking cont" id="one" style="padding-top:30px;" >
		    <c:if test="${ not empty searchResult }">
		        <c:forEach var="searchResult" items="${ searchResult }">
		            <c:if test="${ searchResult.c_type eq '영화' }">
		            <li class="box" onclick="location.href='${path}/contents/contents_detail?no=${ searchResult.c_no }'">
		                <div class="item_poster">
		                    <div class="thumb_item">
		                        <div class="poster_movie">
		                            <img src="${ path }/resources/uploadFiles/contents/${ searchResult.c_pimg }" class="img_thumb">
		                        </div>
		                        <div class="poster_info">
		                            <a href="${path}/contents/contents_detail?no=${ searchResult.c_no }" class="link_story" data-tiara-layer="poster">
		                            	 ${ searchResult.c_synop }
		                            </a>
		                        </div>
		                    </div>
		                    <div class="thumb_cont">
		                        <strong class="tit_item">
		                            <a href="#" class="link_txt" data-tiara-layer="moviename">${ searchResult.c_title }</a>
		                        </strong>
		                        <span>${ searchResult.c_year } ・ ${ searchResult.c_nation }</span>
		                    </div>
		                </div>
		            </li>
		            </c:if>
		        </c:forEach>
		    </c:if>
		</ol>     
		
		<c:set var="loop_flag" value="false" />
		<c:forEach var="searchResult" items="${ searchResult }">
		<c:if test="${not loop_flag }">
		<c:if test="${ not empty searchResult.c_type && searchResult.c_type eq '영화'  }">
			<div class="btn_wrap" style="text-align:center;">
	                    <button type="button" class="btn btn01">	
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
						    <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
							</svg>
						</button>
	        </div>  
	        <c:set var="loop_flag" value="true" /> 
		</c:if>
		</c:if>
		</c:forEach>  
                
        <table class="mt-4">
            <tr>
                <td class="new-contents-info" style="width: 150px;">SEARCH TV</td>
                <td style="width: 1250px;">
                    <hr class="contents-line">
                </td>
            </tr>
        </table>
        
		<ol class="list_movieranking cont" id="two" style="padding-top:30px;">
		    <c:if test="${ not empty searchResult }">
		        <c:forEach var="searchResult" items="${ searchResult }">
		            <c:if test="${ searchResult.c_type eq 'TV' }">
		            <li class="box" onclick="location.href='${path}/contents/contents_detail?no=${ searchResult.c_no }'">
		                <div class="item_poster">
		                    <div class="thumb_item">
		                        <div class="poster_movie" onclick="location.href='${path}/contents/contents_detail?no=${ searchResult.c_no }'">
		                            <img src="${ path }/resources/uploadFiles/contents/${ searchResult.c_pimg }" class="img_thumb">
		                        </div>
		                        <div class="poster_info">
		                            <a href="${path}/contents/contents_detail?no=${ searchResult.c_no }" class="link_story" data-tiara-layer="poster">
		                            	 ${ searchResult.c_synop }
		                            </a>
		                        </div>
		                    </div>
		                    <div class="thumb_cont">
		                        <strong class="tit_item">
		                            <a href="#" class="link_txt" data-tiara-layer="moviename">${ searchResult.c_title }</a>
		                        </strong>
		                        <span>${ searchResult.c_year } ・ ${ searchResult.c_nation }</span>
		                    </div>
		                </div>
		            </li>
		            </c:if>
		        </c:forEach>
		    </c:if>
		</ol>
		
		<c:set var="loop_flag" value="false" />
		<c:forEach var="searchResult" items="${ searchResult }">
		<c:if test="${not loop_flag }">
		<c:if test="${ searchResult.c_type eq 'TV'  }">
			<div class="btn_wrap" style="text-align:center;">
	                    <button type="button" class="btn btn02">	
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
						    <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
							</svg>
						</button>
	        </div>  
	        <c:set var="loop_flag" value="true" /> 
		</c:if>
		</c:if>
		</c:forEach> 
		
		<table class="mt-4">
            <tr>
                <td class="new-contents-info" style="width: 200px;">SEARCH BOOK</td>
                <td style="width: 1200px;">
                    <hr class="contents-line">
                </td>
            </tr>
        </table>
        
        <ol class="list_movieranking cont" id="three" style="padding-top:30px;">
		    <c:if test="${ not empty searchResult }">
		        <c:forEach var="searchResult" items="${ searchResult }">
		        	<c:if test="${ searchResult.c_type eq '책' }">
		            <li class="box" onclick="location.href='${path}/contents/contents_detail?no=${ searchResult.c_no }'">
		                <div class="item_poster">
		                    <div class="thumb_item">
		                        <div class="poster_movie" onclick="location.href='${path}/contents/contents_detail?no=${ searchResult.c_no }'">
		                            <img src="${ path }/resources/uploadFiles/contents/${ searchResult.c_pimg }" class="img_thumb">
		                        </div>
		                        <div class="poster_info">
		                            <a href="${path}/contents/contents_detail?no=${ searchResult.c_no }" class="link_story" data-tiara-layer="poster">
		                            	 ${ searchResult.c_synop }
		                            </a>
		                        </div>
		                    </div>
		                    <div class="thumb_cont">
		                        <strong class="tit_item">
		                            <a href="#" class="link_txt" data-tiara-layer="moviename">${ searchResult.c_title }</a>
		                        </strong>
		                        <span>${ searchResult.c_year } ・ ${ searchResult.c_nation }</span>
		                    </div>
		                </div>
		            </li>
		            </c:if>
		        </c:forEach>
		    </c:if>
		</ol>
		
		<c:set var="loop_flag" value="false" />
		<c:forEach var="searchResult" items="${ searchResult }">
		<c:if test="${not loop_flag }">
		<c:if test="${ searchResult.c_type eq '책'  }">
			<div class="btn_wrap" style="text-align:center;">
	                    <button type="button" class="btn btn03">	
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
						    <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
							</svg>
						</button>
	        </div>  
	        <c:set var="loop_flag" value="true" /> 
		</c:if>
		</c:if>
		</c:forEach> 
		
		<table class="mt-4">
            <tr>
                <td class="new-contents-info" style="width: 250px;">SEARCH WEBTOON</td>
                <td style="width: 1150px;">
                    <hr class="contents-line">
                </td>
            </tr>
        </table>
        
        <ol class="list_movieranking cont" id="four" style="padding-top:30px;">
		    <c:if test="${ not empty searchResult }">
		        <c:forEach var="searchResult" items="${ searchResult }">
		        	<c:if test="${ searchResult.c_type eq '웹툰' }">
		            <li class="box" onclick="location.href='${path}/contents/contents_detail?no=${ searchResult.c_no }'">
		                <div class="item_poster" style="height:212px;">
		                    <div class="thumb_item" style="height:212px;">
		                        <div class="poster_movie" onclick="location.href='${path}/contents/contents_detail?no=${ searchResult.c_no }'">
		                            <img src="${ path }/resources/uploadFiles/contents/${ searchResult.c_pimg }" class="img_thumb">
		                        </div>
		                    	<div class="poster_info">
		                            <a href="${path}/contents/contents_detail?no=${ searchResult.c_no }" class="link_story" data-tiara-layer="poster">
		                            	 ${ searchResult.c_synop }
		                            </a>
		                        </div>
		                    </div>
		                    <div class="thumb_cont">
		                        <strong class="tit_item">
		                            <a href="#" class="link_txt" data-tiara-layer="moviename">${ searchResult.c_title }</a>
		                        </strong>
		                        <span>${ searchResult.c_year } ・ ${ searchResult.c_nation }</span>
		                    </div>
		                </div>
		            </li>
		            </c:if>
		        </c:forEach>
		    </c:if>
		</ol>
		
		<c:set var="loop_flag" value="false" />
		<c:forEach var="searchResult" items="${ searchResult }">
		<c:if test="${not loop_flag }">
		<c:if test="${ searchResult.c_type eq '웹툰'  }">
			<div class="btn_wrap" style="text-align:center;">
	                    <button type="button" class="btn btn04">	
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
						    <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
							</svg>
						</button>
	        </div>  
	        <c:set var="loop_flag" value="true" /> 
		</c:if>
		</c:if>
		</c:forEach> 
                
        <table class="mt-4">
            <tr>
                <td class="new-contents-info" style="width: 230px;">SEARCH PEOPLE</td>
                <td style="width: 1170px;">
                    <hr class="contents-line">
                </td>
            </tr>
        </table>
        
        <ol class="list_movieranking cont" id="five" style="padding-top:30px;">
		    <c:if test="${ not empty searchPeople }">
		        <c:forEach var="searchPeople" items="${ searchPeople }">
		            <li class="box" OnClick="location.href='${ path }/people/people?people_no=${ searchPeople.people_no }'">
		                <div class="item_poster">
		                    <div class="thumb_item">
		                        <div class="poster_movie" onclick="location.href='${path}/contents/contents_detail?no=${ searchPeople.people_no }'">
		                           <img src="${ path }/resources/upload/people/${ searchPeople.people_renamed_filename }" alt="">	
		                        </div>
		                        <div class="poster_info">
		                            <a href="${ path }/people/people?people_no=${ searchPeople.people_no }" class="link_story" data-tiara-layer="poster">
		                            </a>
		                        </div>
		                    </div>
		                    <div class="thumb_cont">
		                        <strong class="tit_item">
		                            <a href="#" class="link_txt" data-tiara-layer="moviename">${ searchPeople.people_name}</a>
		                        </strong>
		                    </div>
		                </div>
		            </li>
		        </c:forEach>
		    </c:if>
		</ol>   
		
		<c:forEach var="searchPeople" items="${ searchPeople }">
		
			<div class="btn_wrap" style="text-align:center;">
	                    <button type="button" class="btn btn05">	
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
						    <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
							</svg>
						</button>
	        </div>   
		
		</c:forEach>          
                
            </div>
        </div>
    
    </article>

<div style="height: 5em;">
</div>

<script>

$(window).on('load', function () {
 	//탭
// 	$('.cont').hide();
// 	$('.cont:first').show();
// 	$('.tab_wrap a').eq(0).click();

// 	$('.tab_wrap a').click(function () {
// 			$('.tab_wrap a').removeClass('active');
// 			$(this).addClass('active');
// 			$('.cont').hide();
// 			var activeTab = $(this).attr('rel');
// 			$('#' + activeTab).show();
// 	});
  
 //더보기 
    load('#one', '5');
    $(".btn_wrap .btn01").on("click", function () {
        load('#one', '5', '.btn_wrap');
    });
    load('#two', '5');
    $(".btn_wrap .btn02").on("click", function () {
        load('#two', '5', '.btn_wrap');
    });
    load('#three', '5');
    $(".btn_wrap .btn03").on("click", function () {
        load('#three', '5', '.btn_wrap');
    });
    load('#four', '5');
    $(".btn_wrap .btn04").on("click", function () {
        load('#four', '5', '.btn_wrap');
    });
    load('#five', '5');
    $(".btn_wrap .btn05").on("click", function () {
        load('#five', '5', '.btn_wrap');
    });
});

	function load(id, cnt, btn) {
		var more_list = id + " .box:not(.active)";
		var more_length = $(more_list).length;
		var more_total_cnt;
    
		if (cnt < more_length) {
				more_total_cnt = cnt;
		} else {
				more_total_cnt = more_length;
      // 내용 다 보여지면 더보기 버튼 숨기기
      //  $('.btn').hide();

      //탭과 함께 쓰일때 visible 사용
				// if ($('#ing').is(":visible")){
				// 	$('.btn01').hide();
				// }else{
				// 	$('.btn02').hide();
				// }
		}
		$(more_list + ":lt(" + more_total_cnt + ")").addClass("active");
	}

</script>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>