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
    </style>
    <!-- btn CSS -->
    <link rel="stylesheet" href="${path}/resources/css/common/btn.css"> 
   
    <title>자유게시판 관리</title>

</head>
<body>
    <!-- 관리자 페이지 메인헤드 -->
    <div class="container">
      <div class="row">
      
	    <!-- 관리자 페이지 사이드바 -->
        <jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp"/>

        <!-- 관리자 페이지 메인화면 -->
        <div class="col-10 p-4">
          <h1 class="h3 mb-2 text-gray-800"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
            <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
            <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
            <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
          </svg> 자유게시판 관리
        </h1>
    <!-- 내용 전체 컨테이너 -->
    <div class="container my-5">

                <!-- Begin Page Content -->
     <div class="container-fluid">
        <div class="table">
            <table id="table_idd" class="table table-bordered" style="width:100%">
                <thead>
                    <tr style="text-align: center">
                        <th id="th" style="width: 10%;">번호</th>
                        <th id="th" style="width: 35%;">제목</th>
                        <th id="th" style="width: 10%;">작성자</th>
                        <th id="th" style="width: 15%;">날짜</th>
                        <th id="th" style="width: 10%;">비활성화</th>
                    </tr>
                </thead>
				
				
                <tbody>
 	             <c:if test="${ empty search }">
					<tr>
						<td colspan="6" style="text-align: center;">
							조회된 게시글이 없습니다.
						</td>
					</tr>	
				 </c:if> 
                  <c:if test="${ not empty search }"> 	 
	                <c:forEach var="board" items="${ search }">
                    <tr style="text-align: center;">
                        <td id="td">${ board.bno }</td>
						<td id="td" style="text-align: left;">
							<a href="${ path }/board/free_board_detail?no=${ board.bno }">
								${ board.btitle }
							</a>
						</td>
						<td id="td">${ board.mid }</td>
						<td id="td"><fmt:formatDate value="${ board.bcreatedate }" type="date"></fmt:formatDate>
                        <td id="td">
                   		<form action="${ path }/admin/admin_freeboard_delete" style="width: 100%;">
                    	<input type="hidden" name="bno" value="${ board.bno }">
                    	<input type="hidden" name="btype" value="FREE">
                    	<c:choose> 
                    		<c:when test="${ board.bstatus == 'Y'}"><button type="submit" class="btn btn-logoC btn-sm" name="bstatus" value="Y">적용</button></c:when>
                    		<c:when test="${ board.bstatus == 'N'}"><button type="submit" class="btn btn-greyC btn-sm" name="bstatus" value="N">복구</button></c:when>
                    	</c:choose>	
                  		</form>
                        </td>
                    </tr>
                    </c:forEach>
                    </c:if> 
                </tbody>
            </table>
        </div>


        <div class="col-4 text-right">
        </div>


        <div class="search1 row my-4">
          <form action="${ path }/admin/admin_board_search" style="width: 100%;">
            <div class="col-12 row">
                <div>
                    <select name="searchType" class="form-control1" style="font-size: 14.45px; ">
                        <option value="title" selected>제목</option>
                        <option value="writer">작성자</option>
                        <option value="status">게시글상태</option>
                    </select>
                </div>

                <div class="col-xs-7 col-sm-7 pl-0">
                    <div class="input-group">
                        <input name="keyword" type="text" class="form-control1" style="font-size: 14.45px;">
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
           
        <div class="display1 row my-3">
            <!--Active and Hoverable Pagination-->
            <ul id="pagination">
            <!-- 맨 첫 페이지로 -->
                <li><a href="${ path }/admin/admin_freeboard_search?page=1&searchType=${searchType}&keyword=${keyword}">«</a></li>
			
			<!-- 이전 페이지로 -->
				<li><a href="${ path }/admin/admin_freeboard_search?page=${ pageInfo.prevPage }&searchType=${searchType}&keyword=${keyword}">‹</a></li>    
				           
            <!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">
						<li><a class="active">${ status.current }</a></li>
					</c:if>
					
					<c:if test="${ status.current != pageInfo.currentPage }">
                		<li><a href="${ path }/admin/admin_freeboard_search?page=${ status.current }&searchType=${searchType}&keyword=${keyword}">${ status.current }</a></li>
					</c:if>
				</c:forEach>
				
			<!-- 다음 페이지로 -->
				<li><a href="${ path }/admin/admin_freeboard_search?page=${ pageInfo.nextPage }&searchType=${searchType}&keyword=${keyword}">›</a></li>  
			<!-- 맨 끝 페이지로 -->
                <li><a href="${ path }/admin/admin_freeboard_search?page=${ pageInfo.maxPage }&searchType=${searchType}&keyword=${keyword}">»</a></li>
            </ul>

        </div>
           
           
         </div>
       </div>
     </div>
   </div>
</div>
</body>
</html>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>