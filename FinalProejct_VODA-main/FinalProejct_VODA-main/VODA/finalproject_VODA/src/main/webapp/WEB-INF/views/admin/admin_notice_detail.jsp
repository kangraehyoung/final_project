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

    <!-- Board CSS -->
    <link rel="stylesheet" href="${path}/resources/css/admin/board.css">
    
    <!--BootStrap CSS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!-- common CSS-->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/common/headerfooter.css">

    <!--BootStrap JS-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>

    <!-- summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <!-- btn CSS -->
    <link rel="stylesheet" href="${path}/resources/css/common/btn.css">

    <title>공지사항</title>

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
          </svg> 공지사항 관리
        </h1>

    <!-- 내용 전체 컨테이너 -->
    <div class="container mt-5">

        <div>
            <h3 style="text-align: center;  color: #000000; font-size: 17px;">공지사항</h3>
        </div>
        <!-- 후기글 전체 -->
        <div class="mt-4" style="border: 1px solid rgb(238, 233, 233);">

            <div>
                <table class="table m-0">
                    <thead>
                        <tr>
                            <th class="table-active" style="width: 20%;">제목</th>
                            <td style="width: 40%; margin-left: 10px; text-align: left;">${ notice.noticeTitle} </td>
                            <td style="width: 10%;"></td>
                            <td style="width: 20%;"></td>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <th class="table-active">작성자</th>
                            <td style="width: 50%; margin-left: 10px; text-align: left;">${ notice.noticeWriterId }</td>
                            <th class="table-active">작성일</th>
                            <td style="margin-left: 10px; text-align: left;"><fmt:formatDate value="${ notice.noticeCreateDate }" dateStyle="long"/></td>
                        </tr>

                        <tr>
                            <th class="table-active">파일</th>                 
                            <td style="margin-left: 10px; text-align: left;"> 
                            	<a href="javascript:" id="fileDown">
                            		${ notice.noticeOriginalFileName }
                            	</a>
                            </td>
                            <th class="table-active">조회수</th>
                            <td style="margin-left: 10px; text-align: left;">${ notice.noticeReadCount }</td>
                        </tr>

                        <tr>
                            <td class="p-0"></td>
                            <td class="p-0"></td>
                            <td class="p-0"></td>
                            <td class="p-0"></td>
                        </tr>
                    </tbody>



                </table>
            </div>


            <!-- 이미지 -->
            <div>
                <!--    <img style="background: black; width: 100%; height: 500px;"> -->
            </div>
            <!-- 내용 -->
            <div class="my-3 px-3">
                <p style="font-size: 14.45px;">
                    ${ notice.noticeContent }<br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>


                </p>
                <div class="text-right mt-3">
                    <button class="btn btn-logoC py-0"
                        style="width: 80px; height: 29.05px; font-size: 14.45px;"
                        onclick="location.href='${path}/admin/admin_notice_update?no=${ notice.noticeno }'">수정</button>
                    <button class="btn btn-greyC py-0" id="btnDelete"
                        style="width: 80px; height: 29.05px; font-size: 14.45px;">삭제</button>
                </div>
            </div>


            <hr style="border-style: dotted;">

        <!-- 목록버튼 -->
        <div class="text-center mt-3 mb-5">
            <button class="btn btn-greyC py-0" style="width: 80px; height: 29.05px; font-size: 0.85em;" onclick="location.href='${path}/admin/admin_notice_list'">목록</button>
        </div>
    </div>
    </div></div></div>
    </div>
	    <script>
		$(document).ready(() => {
			$("#btnDelete").on("click", () => {
				if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
					location.replace("${ path }/admin/admin_notice_delete?no=${ notice.noticeno }");
				}
			});
			$("#fileDown").on("click", () => {
				location.assign("${ path }/admin/admin_notice_detail/fileDown?oname=${ notice.noticeOriginalFileName }&rname=${ notice.noticeRenamedFileName }");
			});	
		
		});
		
		</script>

</body>
</html>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>