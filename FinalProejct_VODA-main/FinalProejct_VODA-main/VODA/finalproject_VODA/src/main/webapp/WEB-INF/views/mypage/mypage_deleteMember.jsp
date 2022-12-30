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

    <!-- btn CSS -->
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
	textarea {
    	resize: none;
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
                                <h5 style="font-weight: 600;">회원 탈퇴</h5>
                                <hr>
                            </form>
                        </div>
                    </div>


                    <!-- 두번째 행 -->
                    <div class="row">

                        <div class="col-sm-12" style="margin-top: 16px;">
                            <form style="margin-bottom: 50px;">
                                <span class="tabletitle">1. 회원 탈퇴 안내</span>
                                <div style="border: 1px solid lightgray; padding: 20px; margin-top: 10px;">
                                    <p style=" color: grey; font-size: 0.85em; ">
                                        VODA 탈퇴 안내 <br>
                                        <br>
                                        회원님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다. <br>
                                        불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다. <br>
                                        <br>
                                        ■ 아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다. <br>
                                        1. 회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 <br>
                                        고객정보 보호정책에따라 관리 됩니다. <br>
                                        2. 계정 복구를 원하시는 경우 VODA 홈페이지 하단의 이메일 및 전화번호로 문의해주세요<br>
                                    </p>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <!-- 세번째 행 -->
                    <div class="row">
                        <div class="col-sm-12">
                            <form action="${path}/mypage/deleteMember" method="post">
                                <span class="tabletitle">2. 회원 탈퇴 하기</span>
                                <!-- 테이블 -->
                                <table class="mytable">
                                    <thead class="table_thead">
                                        <tr>
                                            <th class="table_th">탈퇴사유</th>
                                            <td class="table_td" rowspan="2"
                                                style="border-bottom: 1px solid lightgrey;">
                                                <div>
                                                    <table class="ml-2" style="width: 50%; text-align: left;">
                                                        <tr>
                                                            <td>
                                                                <label><input type="checkbox" value="sati-service"> 교환 /
                                                                    환불 / 반품 불만 &nbsp; &nbsp;</label>
                                                            </td>
                                                            <td>
                                                                <label><input type="checkbox" value="sati-price"> 상품가격
                                                                    불만 &nbsp; &nbsp;</label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label><input type="checkbox" value="sati-deliv"> 배송
                                                                    불만</label> <br>
                                                            </td>
                                                            <td>
                                                                <label><input type="checkbox" value="sati-service">
                                                                    고객서비스 불만 &nbsp; &nbsp;</label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label><input type="checkbox" value="sati-visit"> 방문 빈도가
                                                                    낮음 &nbsp; &nbsp;</label>
                                                            </td>
                                                            <td>
                                                                <label><input type="checkbox" value="sati-privacy"> 개인
                                                                    정보유출 우려</label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label><input type="checkbox" value="sati-etc">
                                                                    기타</label>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </div>
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th class="table_th">남기실 말씀</th>
                                            <td rowspan="2">
                                                <textarea class="mytextarea"></textarea>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!-- 테이블 끝 -->
                                <p style="text-align: center; margin-top: 10px; margin-left: 70px;">
                                    <button id="deleteMember" type="submit" class="btn btn-logoc">탈퇴</button>
                                </p>
                            </form>
                        </div>
                    </div>

                </div>
                <!-- 컨테이너 끝 -->
            </div>
            <!-- 오른쪽 그리드 끝 -->
        </div>
    </div>
    <!-- 내용 전체 컨테이너 끝 -->
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
