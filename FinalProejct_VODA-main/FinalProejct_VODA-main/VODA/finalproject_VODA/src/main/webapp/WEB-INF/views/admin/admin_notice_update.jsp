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

    <!--BootStrap JS-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>


    <!-- summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
    
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
            <h3 style="text-align: center;  color: #000000; font-size: 17px;">공지사항 수정</h3>
        </div>
        <!-- 공지사항 내용 전체 -->
        <div class="mt-4" style="border: 1px solid rgb(238, 233, 233);">


			<form action="${ path }/admin/admin_notice_update" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="noticeno" value="${ notice.noticeno }">
				<input type="hidden" name="originalFileName" value="${ notice.noticeOriginalFileName }">
				<input type="hidden" name="renamedFileName" value="${ notice.noticeRenamedFileName }">
				
            <div>
                <table class="table m-0">
                    <thead>
                        <tr>
                            <th class="table-active" style="width: 20%;">제목</th>
                            <td class="p-0" style="width: 80%;"><input type="text" value="${ notice.noticeTitle }" name="noticeTitle"
                                    style="width: 98%; height: 25px; font-size: 14.45px; margin-top: 8.4px; margin: 8px;">
                            </td>

                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <th class="table-active">작성자</th>
                            <td style="margin-left: 10px; text-align: left;">${ notice.noticeWriterId }</td>
                        </tr>

                        <tr>
                            <th class="table-active">파일</th>
                            <td class="p-0" style="margin-left: 10px; text-align: left;">
                            <label
                                    style="font-size: 14.45px; padding-left: 0px; padding-top: 10.2px; padding-bottom: 10.2px; margin: 0px;">
                                     &nbsp;&nbsp;<input type="file" name="upfile" style="font-size: 14.45px; padding-left: 0px; padding-top: 10.2px; padding-bottom: 10.2px; margin: 0px;" >
                                     현재 파일 : ${ notice.noticeOriginalFileName }</label>
                            </td>
                        </tr>
                         <tr>
                            <th class="table-active">메인게시글 설정</th>
                            <td style="margin-left: 10px; text-align: left;"><input type="checkbox" id="HeadCheck" name="noticeTopTitle" value=1></td>
                        </tr>
                    </tbody>

                </table>
            </div>


            <!-- 내용 -->
            <div class="my-2 px-2">

                <textarea id="summernote" name="noticeContent">${ notice.noticeContent }</textarea>

                <script>
                    $('#summernote').summernote({
                        placeholder: '내용을 입력해주세요',
                        focus: true,
                        height: 400,
                        toolbar: [
                            // [groupName, [list of button]]
                            ['fontname', ['fontname']],
                            ['fontsize', ['fontsize']],
                            ['color', ['color']],
                            ['style', ['bold', 'italic', 'underline', 'clear']],
                            ['para', ['ul', 'ol', 'paragraph']],
                            ['insert', ['picture', 'video']],
                            ['height', ['height']]
                        ],
                        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체', '바탕체'],
                        // 추가한 폰트사이즈
                        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
                        // 줄간격
                        lineHeights: ['0.2', '0.3', '0.4', '0.5', '0.6', '0.8', '1.0', '1.2', '1.4', '1.5', '2.0', '3.0']
                    });

                    $('#summernote').summernote('fontSize', 14.45);
                </script>

                <div class="text-right mt-2">
                    <input class="btn btn-logoC py-0" type="submit"
                        style="width: 80px; height: 29.05px; font-size: 14.45px;" value="수정">
                    <input class="btn btn-greyC py-0" id="btnCancel" type="button"
                        style="width: 80px; height: 29.05px; font-size: 14.45px;" value="취소">
                </div>
            </div>
            </form>
        </div>

        <div class="mb-5 row my-5">
        </div>
    </div>
    </div></div></div>
    
	<script>
		$(document).ready(() => {
		$("#btnCancel").on("click", () => {
				if(confirm("게시글 수정을 취소하시겠습니까?")) {
					location.replace("${ path }/admin/admin_notice_list");
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