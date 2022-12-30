<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/headerclean.jsp"/>
<!-- contents_comment CSS-->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/contents/contents_comments.css">

<table style="width: 100%;">
	<tr class="row" id="posterbg" onclick="location.href='${path}/contents/contents_detail?no=${ contents.c_no }'">
    	<td class="col d-none d-lg-block p-0" style="background-color:${ contents.c_leftcolor }"></td>
	     	<td class="p-0" style="width: 1140px;">
	         <div class="bg-black grabox">
	             <div class="LeftGradient" style="background-image: linear-gradient( to right, ${ contents.c_leftcolor } 40%, ${ contents.c_leftcolor }00 100%);"></div>
	             <div class="RightGradient" style="background-image: linear-gradient( to left, ${ contents.c_rightcolor } 40%, ${ contents.c_rightcolor }00 100%);"></div>
	             <img id="graposter" src="${ path }/resources/uploadFiles/contents/${ contents.c_bimg }" class="" alt="..." />
	         </div>
	     	</td>
     	<td class="col d-none d-lg-block p-0" style="background-color:${ contents.c_rightcolor }"></td>
    </tr>
</table>

<div class="container p-0">
	    <table class="mt-5">
            <tr>
                <td class="new-contents-info" style="width: 140px;">COMMENTS</td>
                <td style="width: 1000px;">
                    <hr class="contents-line">
                </td>
            </tr>
        </table>
        
<c:if test="${ sort == 'like'}">        
	<div class="sort" style="margin-right:5px;">인기순</div>
	<div class="sort" OnClick="location.href='${ path }/contents/contents_comments?no=${ no }&sort=new'" style="margin-right:10px; background-color:rgba(235,236,246); color:gray;">최신순</div>
	<c:if test="${not empty loginMember}">
	<div class="sort" OnClick="location.href='${ path }/contents/contents_comments?no=${ no }&sort=me'" style="margin-right:10px; background-color:rgba(235,236,246); color:gray;">내가 작성한 댓글</div>
	</c:if>
</c:if>

<c:if test="${ sort == 'new'}">
	<div class="sort" OnClick="location.href='${ path }/contents/contents_comments?no=${ no }&sort=like'" style="margin-right:5px; background-color:rgba(235,236,246); color:gray;">인기순</div>
	<div class="sort" style="margin-right:10px;">최신순</div> 
	<c:if test="${not empty loginMember}">
	<div class="sort" OnClick="location.href='${ path }/contents/contents_comments?no=${ no }&sort=me'" style="margin-right:10px; background-color:rgba(235,236,246); color:gray;">내가 작성한 댓글</div>
	</c:if>
</c:if>

<c:if test="${not empty loginMember}">
	<c:if test="${ sort == 'me'}">
	<div class="sort" OnClick="location.href='${ path }/contents/contents_comments?no=${ no }&sort=like'" style="margin-right:5px; background-color:rgba(235,236,246); color:gray;">인기순</div>
	<div class="sort" OnClick="location.href='${ path }/contents/contents_comments?no=${ no }&sort=new'" style="margin-right:10px; background-color:rgba(235,236,246); color:gray;" >최신순</div>            	
	<div class="sort" style="margin-right:10px;">내가 작성한 댓글</div>
	</c:if>
</c:if>

</div>
<div class="container" style="clear:both; margin-top:37px;">
		
        <div class="row" style="margin-bottom: 10px;">
        	
        	<c:forEach var="rate" items="${ rates }">
        	<c:choose>
        		<c:when test="${ rateNo == rate.rate_no && loginMember.m_id == rate.m_id }">
		        	<form action="${ path }/contents/comment_update" method="POST" id="updateSubmit">
			        	<div class="li" style="margin:5px;">
			                <div class="commentbox">
		                	<input type="hidden" name="rate_no" value="${ rate.rate_no}">
							<input type="hidden" name="c_no" value="${ rate.c_no }">
							<input type="hidden" name="m_no" value="${ rate.m_no }">
							<input type="hidden" name="m_id" value="${ rate.m_id }">
							<input type="hidden" name="rate_like" value="${ rate.rate_like }">
			                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
			                    <div class="nickname">${ rate.m_id  }</div>
			                    <div class="commentstar" style="width:68px; left:187px; top:12px;">
									<div class="input-group mb-3">
									  <select class="custom-select" name="rate_star">
									    <option selected>${ rate.rate_star }</option>
									    <option value="0.5">0.5</option>
									    <option value="1">1</option>
									    <option value="1.5">1.5</option>
									    <option value="2">2</option>
									    <option value="2.5">2.5</option>
									    <option value="3">3</option>
									    <option value="3.5">3.5</option>
									    <option value="4">4</option>
									    <option value="4.5">4.5</option>
									    <option value="5">5</option>
									  </select>
									</div>
								</div>
			                    <hr style="margin-top: 42px; margin-bottom: 1px;">
			                    <div class="commentinner" style="top:72px;">
				                    <div class="mb-3">
										<textarea name="rate_comment" style="border:none; width:100%; height:178px; padding:10px;">${ rate.rate_comment }</textarea>
									</div>
								</div>
			                    <c:if test="${ not empty loginMember && loginMember.m_id == rate.m_id }">
			                    <a class="deletee" onclick="location.href='${ path }/contents/comment_delete?no=${ no }&sort=${ sort }&rateNo=${ rate.rate_no }'" >
			                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
								  <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
								</svg></a>
			                    
			                    <a class="updatee" onclick="return submit_form()">
			                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
								  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
								  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
								</svg></a>
								</c:if>
			                </div>
			            </div>
			    	</form>        
	            </c:when>
	            <c:otherwise>
		            <div class="li" style="margin:5px;">
		            <c:choose>
		            <c:when test="${ not empty loginMember && loginMember.m_id == rate.m_id }"><div class="commentbox" style="border: 2px solid rgba(73,95,233,0.5);"></c:when>
		            <c:otherwise><div class="commentbox"></c:otherwise>
		            </c:choose>    
		                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
		                    <div class="nickname">${ rate.m_id }</div>
		                    <div class="commentstar">★ ${ rate.rate_star }</div>
		                    <hr style="margin-top: 42px;">
		                    <div class="commentinner">${ rate.rate_comment }</div>
		                    <c:forEach var="rateLikes" items="${ rateLikes }">
		                    	<c:choose>
		                    	<c:when test="${ rateLikes.rate_no == rate.rate_no }" >
				                    <a href="#" class="like-button active" style="z-index:5;" onclick="myFunction(${ rate.rate_no },${ loginMember.m_no },event)">
				                        <?xml version="1.0" encoding="utf-8"?>
				                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
				                    </a>
			                    </c:when>
			                    </c:choose>
		                    </c:forEach> 
		                    	<a href="#" class="like-button" onclick="myFunction(${ rate.rate_no },${ loginMember.m_no },event);">
			                        <?xml version="1.0" encoding="utf-8"?>
			                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
			                    </a>
		                    <div class="likecount" id="likecount">${ rate.rate_like }</div>
		                    <span class="date"><fmt:formatDate type="date" value="${ rate.rate_date }" pattern="yyyy.MM.dd"/></span>
		                    <c:if test="${ not empty loginMember && loginMember.m_id == rate.m_id || loginMember.m_no == 999 }">
		                    <a class="delete" onclick="location.href='${ path }/contents/comment_delete?no=${ no }&sort=${ sort }&rateNo=${ rate.rate_no }'" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
							  <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
							</svg></a>
		                    </c:if>
		                    <c:if test="${ not empty loginMember && loginMember.m_id == rate.m_id }">
		                    <a class="update" onclick="location.href='${ path }/contents/comment_update?no=${ no }&sort=${ sort }&rateNo=${ rate.rate_no }'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
							  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
							  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
							</svg></a>
							</c:if>
		                </div>
		            </div>
	            </c:otherwise>
            </c:choose>
            </c:forEach>
        
 <!--            <div class="li">
                <div class="commentbox">
                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                    <div class="nickname">${ rate.m_id  }</div>
                    <div class="commentstar">★ ${ rate.rate_star }</div>
                    <hr style="margin-top: 42px;">
                    <div class="commentinner">${ rate.rate_comment }</div>
                    <a href="#" class="like-button">
                        <?xml version="1.0" encoding="utf-8"?>
                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
                    </a>
                    <div class="likecount">${ rate.rate_like }</div>
                    <a class="update">수정</a>
                    <a class="delete">삭제</a>
                </div>
            </div>
            <div class="li">
                <div class="commentbox">
                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                    <div class="nickname">강아지</div>
                    <div class="commentstar">★ 3.5</div>
                    <hr style="margin-top: 42px;">
                    <div class="commentinner">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>
                    <a href="#" class="like-button">
                        <?xml version="1.0" encoding="utf-8"?>
                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
                    </a>
                    <div class="likecount">7</div>
                    <a class="update">수정</a>
                    <a class="delete">삭제</a>
                </div>
            </div>
      <!--       <div class="col">
                <div class="commentbox">
                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                    <div class="nickname">강아지</div>
                    <div class="commentstar">★ 3.5</div>
                    <hr style="margin-top: 42px;">
                    <div class="commentinner">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>
                    <a href="#" class="like-button">
                        <?xml version="1.0" encoding="utf-8"?>
                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
                    </a>
                    <div class="likecount">7</div>
                    <a class="update">수정</a>
                    <a class="delete">삭제</a>
                </div>            
            </div>
        </div>
        <div class="row mt-2" style="margin-bottom: 10px;">
            <div class="col">
                <div class="commentbox">
                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                    <div class="nickname">강아지</div>
                    <div class="commentstar">★ 3.5</div>
                    <hr style="margin-top: 42px;">
                    <div class="commentinner">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>
                    <a href="#" class="like-button">
                        <?xml version="1.0" encoding="utf-8"?>
                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
                    </a>
                    <div class="likecount">7</div>
                    <a class="update">수정</a>
                    <a class="delete">삭제</a>
                </div>
            </div>
            <div class="col">
                <div class="commentbox">
                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                    <div class="nickname">강아지</div>
                    <div class="commentstar">★ 3.5</div>
                    <hr style="margin-top: 42px;">
                    <div class="commentinner">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>
                    <a href="#" class="like-button">
                        <?xml version="1.0" encoding="utf-8"?>
                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
                    </a>
                    <div class="likecount">7</div>
                    <a class="update">수정</a>
                    <a class="delete">삭제</a>
                </div>
            </div>
            <div class="col">
                <div class="commentbox">
                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                    <div class="nickname">강아지</div>
                    <div class="commentstar">★ 3.5</div>
                    <hr style="margin-top: 42px;">
                    <div class="commentinner">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>
                    <a href="#" class="like-button">
                        <?xml version="1.0" encoding="utf-8"?>
                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
                    </a>
                    <div class="likecount">7</div>
                    <a class="update">수정</a>
                    <a class="delete">삭제</a>
                </div>
            </div>
            <div class="col">
                <div class="commentbox">
                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                    <div class="nickname">강아지</div>
                    <div class="commentstar">★ 3.5</div>
                    <hr style="margin-top: 42px;">
                    <div class="commentinner">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>
                    <a href="#" class="like-button">
                        <?xml version="1.0" encoding="utf-8"?>
                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
                    </a>
                    <div class="likecount">7</div>
                    <a class="update">수정</a>
                    <a class="delete">삭제</a>
                </div>            
            </div>
        </div>
        <div class="row mt-2">
            <div class="col">
                <div class="commentbox">
                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                    <div class="nickname">강아지</div>
                    <div class="commentstar">★ 3.5</div>
                    <hr style="margin-top: 42px;">
                    <div class="commentinner">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>
                    <a href="#" class="like-button">
                        <?xml version="1.0" encoding="utf-8"?>
                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
                    </a>
                    <div class="likecount">7</div>
                    <a class="update">수정</a>
                    <a class="delete">삭제</a>
                </div>
            </div>
            <div class="col">
                <div class="commentbox">
                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                    <div class="nickname">강아지</div>
                    <div class="commentstar">★ 3.5</div>
                    <hr style="margin-top: 42px;">
                    <div class="commentinner">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>
                    <a href="#" class="like-button">
                        <?xml version="1.0" encoding="utf-8"?>
                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
                    </a>
                    <div class="likecount">7</div>
                    <a class="update">수정</a>
                    <a class="delete">삭제</a>
                </div>
            </div>
            <div class="col">
                <div class="commentbox">
                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                    <div class="nickname">강아지</div>
                    <div class="commentstar">★ 3.5</div>
                    <hr style="margin-top: 42px;">
                    <div class="commentinner">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>
                    <a href="#" class="like-button">
                        <?xml version="1.0" encoding="utf-8"?>
                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
                    </a>
                    <div class="likecount">7</div>
                    <a class="update">수정</a>
                    <a class="delete">삭제</a>
                </div>
            </div>
            <div class="col">
                <div class="commentbox">
                    <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                    <div class="nickname">강아지</div>
                    <div class="commentstar">★ 3.5</div>
                    <hr style="margin-top: 42px;">
                    <div class="commentinner">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div>
                    <a href="#" class="like-button">
                        <?xml version="1.0" encoding="utf-8"?>
                        <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg"><path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z"/></svg>
                    </a>
                    <div class="likecount">7</div>
                    <a class="update">수정</a>
                    <a class="delete">삭제</a>
                </div>            
            </div> -->
        </div>
        
        <!--Active and Hoverable Pagination-->
        <ul id="pagination">
            <li><a href="${ path }/contents/contents_comments?page=1&no=${no}&sort=${sort}">«</a></li>
            
            <!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<li><a class="active">${ status.current }</a></li>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<li><a href="${ path }/contents/contents_comments?page=${ status.current }&no=${no}&sort=${sort}">${ status.current }</a></li>
				</c:if>
			</c:forEach>
            
            <li><a href="${ path }/contents/contents_comments?page=${ pageInfo.maxPage }&no=${no}&sort=${sort}">»</a></li>
        </ul> 
    
    </div>

    <script>
    let button = document.querySelectorAll(".like-button");

    [].forEach.call(button, function(col){
        col.addEventListener("click" , click , false );
    });

    function click(e) {
    	if(${ empty loginMember }) {
       		alert("로그인 후 이용해주세요");
       		location.href = '${ path }/member/login'; }
    	else {
        e.preventDefault();
        this.classList.toggle("active");
        this.classList.add("animated");
        generateClones(this); }
    }

    // let button = document.querySelector(".like-button");

    // button.addEventListener("click", function(e) {
    // e.preventDefault();
    // this.classList.toggle("active");
    // this.classList.add("animated");
    // generateClones(this);
    // });

    function generateClones(button) {
    let clones = randomInt(2, 4);
    for (let it = 1; it <= clones; it++) {
        let clone = button.querySelector("svg").cloneNode(true),
        size = randomInt(5, 16);
        button.appendChild(clone);
        clone.setAttribute("width", size);
        clone.setAttribute("height", size);
        clone.style.position = "absolute";
        clone.style.transition =
        "transform 0.5s cubic-bezier(0.12, 0.74, 0.58, 0.99) 0.3s, opacity 1s ease-out .5s";
        let animTimeout = setTimeout(function() {
        clearTimeout(animTimeout);
        clone.style.transform =
            "translate3d(" +
            (plusOrMinus() * randomInt(10, 25)) +
            "px," +
            (plusOrMinus() * randomInt(10, 25)) +
            "px,0)";
        clone.style.opacity = 0;
        }, 1);
        let removeNodeTimeout = setTimeout(function() {
        clone.parentNode.removeChild(clone);
        clearTimeout(removeNodeTimeout);
        }, 900);
        let removeClassTimeout = setTimeout( function() {
        button.classList.remove("animated")
        }, 600);
    }
    }

    function plusOrMinus() {
    return Math.random() < 0.5 ? -1 : 1;
    }

    function randomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
    }
    
    function submit_form() {
    	document.getElementById('updateSubmit').submit();
    }
    </script>
    
	<script>
	//좋아요
	function myFunction(rate_no, m_no, event) { 
	    $.ajax({
	           type : "POST",  
	           url :  
	           '<c:url value ="/contents/commentLike"/>',
	           data : { 
	        	   	   'rate_no': rate_no,
	        	   	   'm_no' : m_no
	           },
	           error : function(){
	              alert("통신 에러");
	           },
	           success : function(likeCheck) {
	        	  console.log(likeCheck);
				  // alert('성공');
				  recCount(rate_no,event); 
				  
				  if(likeCheck == 0){
	              		alert("추천완료");

	                    //let element = document.getElementById("likecount")
	                    //element.innerText = parseInt(element.innerText)+1;
	                    //$(".likecount").parseInt(element.innerText)+1;
	                    
	              }
	              else if (likeCheck == 1){
	                    alert("추천취소");
	                    
	                    //let element = document.getElementById("likecount")
	                    //element.innerText = parseInt(element.innerText)-1;
	              }

			   }
	   	});
	}
	
	// 게시글 추천수
    function recCount(rate_no,event) {
		$.ajax({
            type: "POST",
            url :  
 	           '<c:url value ="/contents/likeCount"/>',
            data: {
            	'rate_no': rate_no,
            },
            success: function (count) {
            	
            	$(event.target).parent().parent().next().html(count);
            },
		})
    };
	</script>

<div style="height: 5em;">
</div>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>