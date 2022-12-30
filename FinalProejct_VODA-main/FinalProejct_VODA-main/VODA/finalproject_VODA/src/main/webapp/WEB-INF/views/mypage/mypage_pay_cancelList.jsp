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
    
    <!-- datePicker CSS -->
    <link rel="stylesheet" href="${path}/resources/css/mypage/mypage_datePicker.css">
    
    <!-- datePicker JS -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="${path}/resources/js/mypage/mypage_datePicker.js" ></script>
	
	<style>
	.table_td > label{
		font-size: 1.05em;
	}
	input:focus {
            outline: none;
    }
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
                                <h5 class="rightMainMenu" style="font-weight: 600;" onclick="location.href='${path}/mypage/payCancelList'">취소 / 환불 내역</h5>
                                <hr>
                            </form>
                        </div>
                    </div>

                    <div class="mb-2 text-right">
                        <label for="">기간 선택&nbsp; : &nbsp;</label>
                        <input type="text" class="datepicker" id="datepicker1" >
                        ~
                        <input type="text" class="datepicker" id="datepicker2" >
                        <span class="input-group-btn" >
                            <button id="searchBtn" class="btn btn-light text-nowrap" ><img src="${path}/resources/img/mypage/search.png" style="height: 23px;"></button>
                        </span>
                    </div>


                    <!-- 두번째 행 -->
                    
                    <div class="mb-5">
                        <table class="mytable">
                            <thead class="table_thead">
                                <tr>
                                    <th class="table_th" style="width: 10%;">주문번호</th>
                                    <th class="table_th" colspan="2">상품정보</th>
                                    <th class="table_th" style="width: 10%;">금액</th>
                                    <th class="table_th" style="width: 10%;">주문일자</th>
                                    <th class="table_th" style="width: 10%;">주문상태</th>
                                    <th class="table_th" style="width: 10%;">환불</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="order" items="${ orderList }">
	                            	<tr style="border-bottom: 1px solid lightgrey">
	                                    <td class="table_td"><label style="cursor:pointer; margin-top: 10px;" onclick="location.href='${path}/mypage/payDetail?payNo=${ order.payno }'">${ order.payno }</label></td>
	                                    <td class="table_td" style="width: 15%;"><img class="my-1" style="height: 80px; width: 80px;" src="${ path }/resources/uploadFiles/${ fn:substring(order.productList[0].prenamefile,0,22) }"></td>
	                                    <td class="table_td" style="text-align: left;">
	                                    	<label style="cursor: pointer;" onclick="location.href='${path}/mypage/payDetail?payNo=${ order.payno }'">${ order.productList[0].pname }
	                                    		<c:if test="${fn:length(order.productList) > 1}">
	                                    		등
	                                    		</c:if>
	                                    	</label> <br>
	                                    	<label style="font-size: 0.9em; margin-bottom: 0px;">총&nbsp;${fn:length(order.productList)}개 상품</label>
	                                    </td>
	                                    <td class="table_td"><fmt:formatNumber value="${ order.pay.payprice }" ></fmt:formatNumber>원</td>
	                                    <td class="table_td"><fmt:formatDate value="${ order.odate }" type="date" pattern="yyyy-MM-dd"></fmt:formatDate></td>
	                                    <td class="table_td">${ order.pay.patstatus }</td>
	                                    <td class="table_td">
	                                    	<c:if test="${order.pay.patstatus == '환불대기중' }">
			                                    <button class="btn btn-logoc" style="font-size: 0.95em; padding-top: 5px; height: 28px;" onclick="location.href='${path}/mypage/refundCancel?payNo=${order.payno}'">환불취소</button>
	                                    	</c:if>
	                                    </td>
	                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>
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
	$(document).ready(()=> {
		$("#searchBtn").on("click", ()=> {
			var dateFrom = $("#datepicker1").val();
			var dateTo = $("#datepicker2").val();
			
			if(dateFrom == '' || dateTo == ''){
				alert("날짜를 입력해주세요");
				return;
			}
			
			var date1 = new Date(dateFrom);
			var date2 = new Date(dateTo);
			if(date1 <= date2){
				location.href="${path}/mypage/payCancelList?dateFrom=" + dateFrom + "&dateTo=" + dateTo;
			} else{
				alert("날짜를 올바르게 입력해주세요");
				return;
			}
			
		});
	});
</script>