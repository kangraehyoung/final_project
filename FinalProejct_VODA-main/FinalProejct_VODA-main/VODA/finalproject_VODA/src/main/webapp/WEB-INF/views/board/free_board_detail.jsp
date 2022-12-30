<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--BootStrap CSS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

        * {
            font-family: Pretendard,
                -apple-system, BlinkMacSystemFont,
                system-ui, Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
        }

        input:focus {
            outline: none;
        }



        button:focus {
            box-shadow: none !important;
        }

        .btn-logoc {
            color: #fff;
            border-color: #495FE9;
            background-color: #495FE9;
        }
        
        .btn-logoc:focus {
        	outline: none;
        	box-shadow: none;
        }

        .btn-logoc:hover {
            background-color: #0b27db !important;
            border-color: #0b27db;
            color: #fff !important;
        }

        .btn {

            transition: background 0.2s ease-in-out,
                color 0.2s ease-in-out;
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

        .table-active,
        .table-active>td,
        .table-active>th {
            background-color: rgb(235, 236, 240);
        }

        textarea {
            outline-color: rgb(235, 236, 240);
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
            border-top: 0.2px solid #dee2e6 !important;
        }

        .id {
            display: inline-block;
            content: "";
            margin: 0 9px;
            width: 1px;
            height: 11px;
            vertical-align: -2px;
            background: #cfcfda;
        }

        hr {
            margin: 0px;
        }
    </style>

    <!--BootStrap JS-->
	<!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>

    <!-- summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <title>free_brd_detail</title>

<body>


    <!-- 내용 전체 컨테이너 -->
    <div class="container mt-5">

        <div>
            <h3 style="text-align: center;  color: #000000; font-size: 17px;"><a style="text-decoration-line: none;" href="${path }/board/free_board_list?type=FREE">자유 게시판</a></h3>
        </div>
        <!-- 후기글 전체 -->
        <div class="mt-4" style="border: 1px solid rgb(238, 233, 233);">

            <div>
                <table class="table m-0">
                    <thead>
                        <tr>
                            <th class="table-active" style="width: 20%;">제목</th>
                            <td style="width: 50%;">${ board.btitle }</td>
                            <td style="width: 15%;"></td>
                            <td style="width: 15%;"></td>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <th class="table-active">작성자</th>
                            <td style="width: 50%;">${ board.mid }</td>
                            <th class="table-active">작성일</th>
                            <td><fmt:formatDate value="${ board.bcreatedate }" dateStyle="long"/></td>
                        </tr>

                        <tr>
                            <th class="table-active">파일</th>
                            <td style="margin-left: 10px; text-align: left;"> 
                            	<a href="javascript:" id="fileDown">
                            		${ board.boriginalfilename }
                            	</a>
                            </td>
                            <th class="table-active">조회수</th>
                            <td>${ board.bview }</td>
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
                    ${ board.bcontent }<br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>

                </p>
                <c:if test="${ loginMember.m_id == board.mid || loginMember.m_authorization == 'M' }">
	                <div class="text-right mt-3">
	                    <button class="btn btn-logoc py-0"
	                        style="width: 80px; height: 29.05px; font-size: 14.45px;"
	                        onclick="location.href='${path}/board/free_board_update?no=${ board.bno }'">수정</button>
	                    <button class="btn btn-greyc py-0" id="btnDelete"
	                        style="width: 80px; height: 29.05px; font-size: 14.45px;">삭제</button>
	                </div>
	            </c:if>
            </div>


            <hr style="border-style: dotted;">
            
            
            <!-- 댓글 -->
            <div id="comment-container" class="px-3">
                <strong class="p-1" style="color: #000000; font-size: 14.45px;">댓글</strong>
					<hr>
					<div id="comment-list">
                	<c:forEach var="comments" items="${ board.comments }">
                <div class="comment">
                	    <input id="cmno" type="hidden" value="${ comments.cmno}">
	                	<input id="cmwriterno" type="hidden" value="${comments.cmwriterno }" >
                    <div style="padding: 0px; margin:10px">
                        <strong style="color: #000000; font-size: 14.45px;">${comments.cmwriterid }</strong>
                        <span class="id"></span>
                        <span id="cmdate" name="cmdate" class="mt-1 col p-0" style="font-size: 11px; color: #000000;">${comments.cmdate }</span>
                        <p  class="cmcontent" style="color: #000000; font-size: 14.45px; margin-bottom: 10px;">${comments.cmcontent }</p>
                        <c:if test="${ loginMember.m_no == comments.cmwriterno || loginMember.m_authorization == 'M' }">
	                        <div style="margin-top: 10px;">
		                            <div style="float:right; margin-top: -33px;">
		                                <button id="updatebutton" onclick="updateComments(event)" class="btn btn-greyc py-0" style="font-size: 13px; height: 23px; margin-right: 5px;">수정</button>
		                                <button id="deletebutton" onclick="deleteComments(event)" class="btn btn-greyc py-0" style="font-size: 13px; height: 23px;">삭제</button>
		                            </div>
	                        </div>
                        </c:if>
                    </div>
                    
                    <hr>
                </div>

                <div class="mb-3 comment-editor" style="display:none;">
                        <div class="form-control" style="height: 105px; margin-top: 10px; margin-bottom: 5px;">
                            <strong class="p-1 cmwriterid" style="color: #000000; font-size: 14.45px;"></strong>
                            <hr style="margin: 0px;">
                            <textarea id="updateCommentsContent" class="p-1"
                                style="border: none; resize: none; width: 100%; color: #000000; font-size: 14.45px;"
                                placeholder="댓글을 작성해주세요"></textarea>
                        </div>

                        <div class="text-right mt-1">
                            <button  onclick="updateCommentsCancel(event)" class="btn btn-greyc py-0" style="font-size: 13px; height: 23px; margin-right:5px">취소</button>
                            <button  onclick="updateCommentsCommit(event)" class="btn btn-greyc py-0" style="font-size: 13px; height: 23px;">작성</button>
                        </div>
                  </div>
                        
					
					</c:forEach>
                      </div>

                   <div  id="comment-editor" class="mb-3">
                        <div class="form-control" style="height: 105px; margin-top: 10px; margin-bottom: 5px;">
                            <input id="loginno" type="hidden" value="${ loginMember.m_no }" >
                            <strong id="loginId" value="${loginMember.m_id }" class="p-1 cmwriterid" style="color: #000000; font-size: 14.45px;">${loginMember.m_id }</strong>
                            <hr style="margin: 0px;">
                            <textarea id="cmcontent"  onfocus="loginCheck();"  class="p-1"
                                style="border: none; resize: none; width: 100%; color: #000000; font-size: 14.45px;"
                                placeholder="댓글을 작성해주세요"></textarea>
                        </div>
                        <div class="text-right mt-1">
                            <button  onclick="writeComments();" class="btn btn-greyc py-0" style="font-size: 13px; height: 23px;">작성</button>
                        </div>
            		</div>
        		</div>
      		</div>
        <!-- 목록버튼 -->
        <div class="text-center mt-3 mb-5">
            <button class="btn btn-greyc py-0" style="width: 80px; height: 29.05px; font-size: 0.85em;" onclick="location.href='${path}/board/free_board_list?type=FREE'">목록</button>
        </div>
    </div>
    
    
	<script>
		$(document).ready(() => {
				$("#btnDelete").on("click", () => {
					if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
						location.replace("${ path }/board/free_board_delete?no=${ board.bno }");
					}
				})
				
				$("#fileDown").on("click", () => {
					location.assign("${ path }/board/free_board_detail/fileDown?oname=${ board.boriginalfilename }&rname=${ board.brenamedfilename }");
				});
				
				
			});
		
		function loginCheck(){
			if(${ empty loginMember }) {
				alert("로그인 후 이용해주세요");
				
				$("#cmcontent").blur();
			}
		}	
		
		function formatDate(date) {

		    var d = new Date(date),

		    hours = ('0' + d.getHours()).slice(-2); 
		    minutes = ('0' + d.getMinutes()).slice(-2);
		    seconds = ('0' + d.getSeconds()).slice(-2); 

		    timeString = hours + ':' + minutes  + ':' + seconds;

		    console.log(timeString);

		    month = '' + (d.getMonth() + 1) , 
		    day = '' + d.getDate(), 
		    year = d.getFullYear();

		    if (month.length < 2) month = '0' + month; 
		    if (day.length < 2) day = '0' + day; 

		    return [year, month, day].join('-') + ' ' + timeString;

		    }
		
		
		function writeComments() {
			
			if($("#cmcontent").val().trim()==""){
				alert("내용을 입력해주세요");
			} else{
				console.log(${loginMember.m_no});
				console.log($("#loginno").attr("value"));
				var now = new Date();
				var comments = {
					"bno" : ${board.bno},
					"cmcontent" : $("#cmcontent").val(),
					"cmwriterid" : $("#loginId").attr("value"),
					"cmwriterno" : parseInt($("#loginno").attr("value")),
					"cmdate" : formatDate(now)
				}
				
				$.ajax({
					url: "${path}/board/commentswrite",
					type: "POST",
					dataType: "json",
					contentType : "application/json",
					data: JSON.stringify(comments),
					success: function(data) {
						let html = "<div class='comment'>";
						html += "<input id='cmno' type='hidden' value="+ data.cmno + ">";
						html += "<input id='cmwriterno' type='hidden' value=" + data.cmwriterno +">";
						html += "<div style='padding: 0px; margin:10px'>";
						html += "<strong style='color: #000000; font-size: 14.45px;'>"+data.cmwriterid+"</strong>";
						html += "<span class='id'></span>";
						html += "<span class='mt-1 col p-0' style='font-size: 11px; color: #000000'>"+ data.cmdate + "</span>";
						html += "<p  class='cmcontent' style='color: #000000; font-size: 14.45px; margin-bottom: 10px;''>"+data.cmcontent+"</p>";
						html += "<div style='margin-top: 10px;'>";
						html += "<div style='float:right; margin-top: -33px;'>";
						html += "<button onclick='updateComments(event)' class='btn btn-greyc py-0' style='font-size: 13px; height: 23px; margin-right: 5px;'>수정</button>";
						html += "<button onclick='deleteComments(event)' class='btn btn-greyc py-0' style='font-size: 13px; height: 23px;''>삭제</button></div></div></div><hr></div>";
						html += "<div class='mb-3 comment-editor' style='display:none;'>";
						html += "<div class='form-control'  style='height: 105px; margin-top: 10px; margin-bottom: 5px;'>";
						html += "<strong class='p-1 cmwriterid' style='color: #000000; font-size: 14.45px;'></strong>";
						html += "<hr style='margin: 0px;'>";
						html += "<textarea id='updateCommentsContent' class='p-1' style='border: none; resize: none; width: 100%; color: #000000; font-size: 14.45px;' placeholder='댓글을 작성해주세요'></textarea>";
						html += "</div>";
						html += "<div class='text-right mt-1'>";
						html += "<button  onclick='updateCommentsCancel(event)' class='btn btn-greyc py-0' style='font-size: 13px; height: 23px; margin-right:5px'>취소</button>";
						html += "<button  onclick='updateCommentsCommit(event)' class='btn btn-greyc py-0' style='font-size: 13px; height: 23px;'>작성</button>";
						html += "</div></div>";
						
						$("#comment-list").append(html);
						$("#cmcontent").val('');
					},
					error: (error) => {
						alert("댓글 작성 실패");
					}
				});
			}
			
		}
		
		function deleteComments(event) {
			$("#deletebutton").attr("value", "N")
			var comments = {
					"bno" : ${board.bno},
					"cmno" : $(event.target).parent().parent().parent().siblings("#cmno").val(),
					"cmwriterno" : $(event.target).parent().parent().parent().siblings("#cmwriterno").val(),
					"cmstatus" : $("#deletebutton").attr("value")
				}
			$.ajax({
				url: "${path}/board/commentsdelete",
				type: "POST",
				dataType: "json",
				contentType : "application/json",
				data: JSON.stringify(comments),
				success: function() {
					$(event.target).parents(".comment").remove();
				},
				error: (error) => {
					alert("댓글 삭제 실패");
				}
			});
		}
		
		function updateComments(event) {
			$(event.target).parents(".comment").hide();
			$(event.target).parents(".comment").next().show();
			$(event.target).parents(".comment").next().find("#updateCommentsContent").val($(event.target).parent().parent().prev().text());
			$(event.target).parents(".comment").next().find(".cmwriterid").text($(event.target).parent().parent().prev().prev().prev().prev().text());
		}
		
		function updateCommentsCancel(event) {
			$(event.target).parent().parent().hide();
			$(event.target).parent().parent().prev().show();
		}
		
		function updateCommentsCommit(event){
			var now = new Date();
			var comments = {
					"cmno" : $(event.target).parent().parent().prev().find("#cmno").val(),
					"cmcontent" : $(event.target).parent().prev().find("#updateCommentsContent").val(),
					"cmwriterno" : $(event.target).parent().parent().prev().find("#cmwriterno").val(),
					"cmdate" : formatDate(now)
				}
			
			$.ajax({
				url: "${path}/board/commentsupdate",
				type: "POST",
				dataType: "json",
				contentType : "application/json",
				data: JSON.stringify(comments),
				success: function() {
					$(event.target).parent().parent().hide();
					$(event.target).parent().parent().prev().show();
					$(event.target).parent().parent().prev().find(".cmcontent").text($(event.target).parent().prev().find("#updateCommentsContent").val());
					$(event.target).parent().parent().prev().find("#cmdate").text(formatDate(now));
				},
				error: (error) => {
					alert("댓글 수정 실패");
				}
				
			});
		}
</script>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>