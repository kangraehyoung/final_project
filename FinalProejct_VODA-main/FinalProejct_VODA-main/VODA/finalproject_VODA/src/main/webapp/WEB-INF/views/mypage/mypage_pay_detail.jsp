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
                                <h5 style="font-weight: 600;" >주문 상세 조회</h5>
                                <hr>
                            </form>
                        </div>
                    </div>

                    <div class="mb-4" style="margin-top: 16px;">
                        <span class="tabletitle">주문 상품 내역</span>
                        <table class="mytable" style="margin-top: 15px;">
                            <thead class="table_thead">
                                <tr>
                                    <th class="table_th" style="width: 10%;">주문번호</th>
                                    <th class="table_th" colspan="2">상품정보</th>
                                    <th class="table_th" style="width: 10%;">주문수량</th>
                                    <th class="table_th" style="width: 10%;">총 금액</th>
                                    <th class="table_th" style="width: 10%;">주문일자</th>
                                    <th class="table_th" style="width: 10%;">주문상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="product" items="${order.productList}">
                            	    <tr style="border-bottom: 1px solid lightgrey">
	                                    <td class="table_td">${ order.payno }</td>
	                                    <td class="table_td" style="width: 15%;"><img class="my-1" style="height: 80px; width: 80px;" src="${ path }/resources/uploadFiles/${ fn:substring(product.prenamefile,0,22) }"></td>
	                                    <td class="table_td" style="text-align: left;">${ product.pname }</td>
	                                    <td class="table_td">${product.porderqtt }</td>
	                                    <td class="table_td"><fmt:formatNumber value="${product.porderqtt * product.pprice}" ></fmt:formatNumber>원</td>
	                                    <td class="table_td"><fmt:formatDate value="${ order.odate }" type="date" pattern="yyyy-MM-dd"></fmt:formatDate></td>
	                                    <td class="table_td">${ order.pay.patstatus }</td>
                                	</tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="row mb-2">
                        <div class="col-sm-12" style="margin-top: 40px;">
                            <form style="margin-bottom: 3px;">
                                <span class="tabletitle">주문자 정보</span>
                            </form>
                        </div>
                    </div>
                    
                    <div>
                        <table class="table" style="width: 100%;">
                            <tbody>
                            <tr>
                                <th class="table_th" style="width: 30%; padding-top: 18px;">주문자 이름</th>
                                <td class="table_td" style="padding-top: 18px;">${ loginMember.m_name }</td>
                            </tr>
                            <tr>
                                <th class="table_th" style="padding-top: 18px;">주소</th>
                                <td class="table_td" style="padding-top: 18px;">${ loginMember.m_address } ${ loginMember.m_detailAddress }</td>
                            </tr>
                            <tr>
                                <th class="table_th" style="padding-top: 18px;">휴대폰번호</th>
                                <td class="table_td" style="padding-top: 18px;">${ loginMember.m_phone }</td>
                            </tr>
                            <tr>
                                <th class="table_th" style="padding-top: 18px;">이메일</th>
                                <td class="table_td" style="padding-top: 18px;">${ loginMember.m_email }</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="row mb-2">
                        <div class="col-sm-12" style="margin-top: 40px;">
                            <form style="margin-bottom: 3px;">
                                <span class="tabletitle">배송 정보</span>
                            </form>
                        </div>
                    </div>
                    
                    <div>
                        <table class="table" style="width: 100%;">
                            <tbody>
                            <tr>
                                <th class="table_th" style="width: 30%; padding-top: 18px">받으실 분</th>
                                <td class="table_td" style="padding-top: 18px;">${ order.oname }</td>
                            </tr>
                            <tr>
                                <th class="table_th" style="padding-top: 18px;">배송 주소</th>
                                <td class="table_td" style="padding-top: 18px;">${ order.oadress } ${ order.oadressdetail }</td>
                            </tr>
                            <tr>
                                <th class="table_th" style="padding-top: 18px;">휴대폰번호</th>
                                <td class="table_td" style="padding-top: 18px;">${ order.ophone }</td>
                            </tr>
                            <tr>
                                <th class="table_th" style="padding-top: 18px;">남기실 말씀</th>
                                <td class="table_td" style="padding-top: 18px;">${ order.omessage }</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="row mb-2">
                        <div class="col-sm-12" style="margin-top: 40px;">
                            <form style="margin-bottom: 3px;">
                                <span class="tabletitle">결제 정보</span>
                            </form>
                        </div>
                    </div>
                    
                    <div>
                        <table class="table" style="width: 100%;">
                            <tbody>
                            <tr>
                                <th class="table_th" style="width: 30%; padding-top: 18px">상품 합계 금액</th>
                                <td class="table_td" style="padding-top: 18px;"><fmt:formatNumber value="${order.pay.payprice }" ></fmt:formatNumber>원</td>
                            </tr>
                            <tr>
                                <th class="table_th" style="padding-top: 18px;">배송비</th>
                                <td class="table_td" style="padding-top: 18px;">0원</td>
                            </tr>
                            <tr>
                                <th class="table_th" style="padding-top: 18px;">최종 결제 금액</th>
                                <td class="table_td" style="padding-top: 18px;"><fmt:formatNumber value="${order.pay.payprice }" ></fmt:formatNumber>원</td>
                            </tr>
                            <tr>
                                <th class="table_th" style="padding-top: 18px;">결제 수단</th>
                                <td class="table_td" style="padding-top: 18px;">${order.pay.paymethod}</td>
                            </tr>
                            <tr>
                                <th class="table_th" style="padding-top: 18px;">주문 상태</th>
                                <td class="table_td" style="padding-top: 18px;">${order.pay.patstatus}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    
 
                    <div class="text-center mb-5">
                    	<c:if test="${order.pay.patstatus == '배송준비중' || order.pay.patstatus == '배송완료'}">
	                        <button type="button" class="btn btn-greyc" onclick="location.href='${path}/mypage/payList'">목록으로</button>
                    	</c:if>
                    	<c:if test="${order.pay.patstatus == '환불대기중' || order.pay.patstatus == '환불완료'}">
	                        <button type="button" class="btn btn-greyc" onclick="location.href='${path}/mypage/payCancelList'">목록으로</button>
                    	</c:if>
                        <c:if test="${order.pay.patstatus == '배송준비중' }">
                        	<button onclick="location.href='${path}/mypage/payCancel?payNo=${order.payno}'" id="btn_payCancel" type="button" class="btn btn-logoc">환불하기</button>
                        </c:if>
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
<script>
	window.
</script>