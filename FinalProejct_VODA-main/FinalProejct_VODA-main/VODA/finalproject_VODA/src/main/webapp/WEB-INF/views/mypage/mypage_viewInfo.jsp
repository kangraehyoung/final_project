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
	
	<style>
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
                                <h5 style="font-weight: 600; margin-bottom: 17px;">회원 정보 조회</h5>
                                <hr>
                            </form>
                        </div>
                    </div>

                    <div class="mt-3">
                        <p class="myMenuTitle">기본 정보</p>
                    </div>

                    <!-- 두번째 행 -->
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table" style="width: 100%;">
                                <tbody>
                                    <tr>
                                        <th class="infotable_th" style="width: 27%; padding-top: 16px;">아이디</th>
                                        <td class="infotable_td" style="padding-top: 16px;">${ loginMember.m_id }</td>
                                    </tr>
                                    <tr>
                                        <th class="infotable_th" style="width: 27%; padding-top: 16px;">이름</th>
                                        <td class="infotable_td" style="padding-top: 16px;">${ loginMember.m_name }</td>
                                    </tr>
                                    <tr>
                                        <th class="infotable_th" style="width: 27%; padding-top: 16px;">이메일</th>
                                        <td class="infotable_td" style="padding-top: 16px;">${ loginMember.m_email }</td>
                                    </tr>
                                    <tr>
                                        <th class="infotable_th" style="width: 27%; padding-top: 16px;">휴대폰번호</th>
                                        <td class="infotable_td" style="padding-top: 16px;">${ loginMember.m_phone }</td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgrey;">
                                        <th class="infotable_th" style="width: 27%; padding-top: 16px;">주소</th>
                                        <td class="infotable_td" style="padding-top: 16px;">${ loginMember.m_address } ${loginMember.m_detailAddress}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="mt-3">
                        <p class="myMenuTitle">부가 정보</p>
                    </div>

                    <!-- 두번째 행 -->
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table" style="width: 100%;">
                                <tbody>
                                    <tr>
                                        <th class="infotable_th" style="width: 27%; padding-top: 16px;">성별</th>
                                        <td class="infotable_td" style="padding-top: 16px;">
                                        	<c:if test="${loginMember.m_gender == 'W' }">
                                        		여자
                                        	</c:if>
                                        	<c:if test="${loginMember.m_gender == 'M' }">
                                        		남자
                                        	</c:if>
                                        	<c:if test="${loginMember.m_gender == 'N' }">
                                        		비공개
                                        	</c:if>
                                        </td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgrey;">
                                        <th class="infotable_th" style="padding-top: 16px;">생년월일</th>
                                        <td class="infotable_td" style="padding-top: 16px;"><fmt:formatDate value="${ loginMember.m_birth }" type="date"></fmt:formatDate></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 행 시작 -->
                    <div class="text-center">
                        <button onclick="location.href='${path}/mypage/updateMember'" class="btn btn-logoc">수정하기</button>
                    </div>

                    <!-- 행 끝 -->

                </div>
                <!-- 컨테이너 끝 -->
            </div>
            <!-- 오른쪽 그리드 끝 -->
        </div>
    </div>
    <!-- 내용 전체 컨테이너 끝 -->
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>