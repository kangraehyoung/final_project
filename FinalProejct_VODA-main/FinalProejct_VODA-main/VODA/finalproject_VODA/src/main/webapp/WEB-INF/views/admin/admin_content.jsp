<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- Admin CSS -->
    <link rel="stylesheet" href="${path}/resources/css/admin/admin.css">
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
        .poster_movie img
        { width: 80px; height: 120px;}
    </style>
    <!-- btn CSS -->
    <link rel="stylesheet" href="${path}/resources/css/common/btn.css"> 
   
    <title>컨텐츠 관리</title>
    
<body>
    <!-- 관리자 페이지 메인헤드 -->
    <div class="container">
      <div class="row">
      
	    <!-- 관리자 페이지 사이드바 -->
        <jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp"/>

        <!-- 관리자 페이지 메인화면 -->
        <div class="col-10 p-4">
          <h1 class="h3 mb-2 text-gray-800"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
            컨텐츠 관리
		  <select onchange="if(this.value) location.href=(this.value);" class="form-control1" style="width: 15%; float: right; font-size: 14.45px;" >
            <option value="${path}/admin/admin_content" selected>컨텐츠 종류</option>
            <option value="${path}/admin/admin_content">전체</option>
            <option value="${path}/admin/admin_content_search?searchType=type&keyword=영화">영화</option>
            <option value="${path}/admin/admin_content_search?searchType=type&keyword=TV">TV</option>
            <option value="${path}/admin/admin_content_search?searchType=type&keyword=웹툰">웹툰</option>
            <option value="${path}/admin/admin_content_search?searchType=type&keyword=도서">도서</option>
          </select>
          </h1>

          
          <hr>
          <!-- 카드 리스트 Row -->
            <div class="row">
              <table class="table table-hover">
                <thead class="thead-light">
                  <tr>
                    <th scope="col" style="width: 5%">No</th>
                    <th scope="col" style="width: 30%">제목</th>
                    <th scope="col" style="width: 30%">이미지</th>
                    <th scope="col" style="width: 15%">업로드날짜</th>
                    <th scope="col" style="width: 10%">리뷰관리</th>
                    <th scope="col" style="width: 20%">비활성화</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                      <th colspan="6">            
				        <div class="search1 row my-4">
				          <form action="${ path }/admin/admin_content_search" style="width: 100%;">
				            <div class="col-12 row">
				                <div>
				                    <select name="searchType" class="form-control1" style="font-size: 14.45px; ">
				                        <option value="title" selected>컨텐츠명</option>
				                        <option value="status">컨텐츠상태</option>
				                    </select>
				                </div>
				
				                <div class="col-xs-7 col-sm-7 pl-0">
				                    <div class="input-group">
				                        <input name="keyword" type="text" class="form-control1" style="font-size: 14.45px;">
				                        <span class="input-group-btn">
				                            <button id="searchBtn" class="btn btn-greyc text-nowrap" style="box-shadow: rgb(0 0 0 / 30%) 0px 0px 4px 0px;">
				                                <img src="${ path }/resources/img/community/search.png" style="height: 18px;">
				                            </button>
				                        </span>
				                    </div>
            				    </div>
            				 </div>
            			   </form>
            		     </div>
                      </th>
                  </tr>
                </tfoot>
                <tbody>
                <c:forEach var="content" items="${ list }">
                  <tr style="line-height: 120px;">                    
                    <th scope="row">${ content.c_no }</th>
                    <td style="font-weight: bold; font-size: 30px;"><a style="font-size: 18px;"  href="${path}/contents/contents_detail?no=${ content.c_no }">${ content.c_title }</a></td>
                    <td class="poster_movie">
                    <img id="graposter" class="img_thumb" src="${ path }/resources/uploadFiles/contents/${ content.c_pimg }"/></td>
                    <td><fmt:formatDate value="${content.c_date }" type="date"></fmt:formatDate></td>
                    <td><button type="button" class="btn btn-logoC btn-sm" onclick="location.href='${path}/contents/contents_comments?no=${ content.c_no }&sort=like'">관리</td>
                    <td>
                    <form action="${ path }/admin/admin_content_delete" style="width: 100%;">
                    	<input type="hidden" name="cno" value="${ content.c_no }">
                    	<c:choose> 
                    		<c:when test="${ content.c_status == 'Y'}"><button type="submit" class="btn btn-logoC btn-sm" name="contentStatus" value="Y">적용</button></c:when>
                    		<c:when test="${ content.c_status == 'N'}"><button type="submit" class="btn btn-greyC btn-sm" name="contentStatus" value="N">복구</button></c:when>
                    	</c:choose>	
                  	</form>
                  	</td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>

            <!--Active and Hoverable Pagination-->
            <ul id="pagination">
            <!-- 맨 첫 페이지로 -->
                <li><a href="${ path }/admin/admin_content?page=1">«</a></li>
			
			<!-- 이전 페이지로 -->
				<li><a href="${ path }/admin/admin_content?page=${ pageInfo.prevPage }">‹</a></li>    
				           
            <!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">
						<li><a class="active">${ status.current }</a></li>
					</c:if>
					
					<c:if test="${ status.current != pageInfo.currentPage }">
                		<li><a href="${ path }/admin/admin_content?page=${ status.current }">${ status.current }</a></li>
					</c:if>
				</c:forEach>
				
			<!-- 다음 페이지로 -->
				<li><a href="${ path }/admin/admin_content?page=${ pageInfo.nextPage }">›</a></li>  
			<!-- 맨 끝 페이지로 -->
                <li><a href="${ path }/admin/admin_content?page=${ pageInfo.maxPage }">»</a></li>
            </ul>

          </div>
        </div>
      </div>
<hr>
</body>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>