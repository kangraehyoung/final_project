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
<body>
    <!-- 관리자 페이지 메인헤드 -->
    <div class="container">
      <div class="row">
      
	    <!-- 관리자 페이지 사이드바 -->
        <jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp"/>
        <!-- 관리자 페이지 메인화면 -->
        <div class="col-10 p-4">
          <h1 class="h3 mb-2 text-gray-800"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cash-coin" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z"/>
            <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z"/>
            <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z"/>
            <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z"/>
          </svg>  상품 주문 관리
        </h1>
        <hr>
        
     <!-- Begin Page Content -->
            <div class="row">
            <table class="table table-hover">
                <thead class="thead-light">
                    <tr style="text-align: center">
                        <th id="th" style="width: 10%;">주문번호</th>
                        <th id="th" style="width: 15%;">주문일자</th>
                        <th id="th" style="width: 25%;">상품명</th>
                        <th id="th" style="width: 10%;">회원정보</th>
                        <th id="th" style="width: 9%;">구매수량</th>
                        <th id="th" style="width: 10%;">주문금액</th>
                        <th id="th" style="width: 10%;">
						<select class="form-control1" style="font-size: 14.45px;"onchange="if(this.value) location.href=(this.value);">
	                        <option value="${path}/admin/admin_goods_order" selected>전체</option>
	                        <option value="${path}/admin/admin_goods_order_search?searchType=status&keyword=배송준비중">배송준비중</option>
	                        <option value="${path}/admin/admin_goods_order_search?searchType=status&keyword=배송완료">배송완료</option>
	                        <option value="${path}/admin/admin_goods_order_search?searchType=status&keyword=환불대기중">환불대기중</option>
	                        <option value="${path}/admin/admin_goods_order_search?searchType=status&keyword=환불완료">환불완료</option>
                    	</select>
						</th>
                        <th id="th" style="width: 10%;">환불</th>
                    </tr>
                </thead>
				
				
                <tbody>
 	             <c:if test="${ empty list }">
					<tr>
						<td colspan="9" style="text-align: center;">
							조회된 게시글이 없습니다.
						</td>
					</tr>	
				 </c:if> 
                  <c:if test="${ not empty list }"> 	 
	                <c:forEach var="order" items="${ list }" varStatus="Status">
                    <tr style="text-align: center;">
                        <th scope="row">
                        <a href="#" data-toggle="modal" data-target="#Modal${Status.index}">${ order.payno }</a>
                        </th>
                        <td id="td"><fmt:formatDate value="${ order.odate }" type="date"/></td>
						<td id="td" style="text-align: left;">
							<!-- Button trigger modal -->
						<a href="#" data-toggle="modal" data-target="#Modal${Status.index}">
	                        ${ order.productList[0].pname }
	                            <c:if test="${fn:length(order.productList) > 1}">
	                            외 ${fn:length(order.productList)-1}건
	                            </c:if>
						</a>


						
						</td>
						<td id="td">${ order.member[0].m_id }</td>
						<td id="td">${ order.oqtt }</td>
						<td id="td"><fmt:formatNumber value="${ order.pay.payprice }" type="number" groupingUsed="true"/>
                        <td id="td">${ order.pay.patstatus }</td>
                        <td id="td">
                        	<c:if test="${ order.pay.patstatus  eq '환불대기중'}">
                        	<a href="#" data-toggle="modal" data-target="#Modal${Status.index}"><button type="button" class="btn btn-logoC btn-sm" data-toggle="modal" data-target="#Modal${Status.index}">환불</button></a>
                        	</c:if>
                        </td>
                    </tr>
						<!-- Modal -->
						<div class="modal fade" id="Modal${Status.index}" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h3 class="modal-title" id="ModalLabel">📜 주문 상세 내역</h3>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">✖</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        • 주문번호 : ${ order.payno }<br>
						        • 상품명 : 
						        <c:forEach begin="1" end="${fn:length(order.productList)}" step="1" varStatus="i">
		                            	<c:set var="Count" value="${i.count-1}" />
		                            		                            	
		                             	<c:if test="${i.current < fn:length(order.productList)}">
		                             		<c:out value="${order.productList[Count].pname}"/>&nbsp;/&nbsp;
		                             	</c:if>
		                             	
		                             	<c:if test="${i.current eq fn:length(order.productList)}">
		                             		<c:out value="${order.productList[Count].pname}"/><br> &nbsp;&nbsp;&nbsp;‣ 총 ${i.count}개
		                             	</c:if>
		                             	
	                            	</c:forEach><br>
						        • 결제금액 : <fmt:formatNumber value="${ order.pay.payprice }" type="number" groupingUsed="true"/>원<br>
						        • 결제수단 : ${ order.pay.paymethod }<br>
						        • 구매자아이디 : ${ order.member[0].m_id }<br>
						        • 구매자이름: 
						        <c:choose>
						        	<c:when test="${fn:length(order.member[0].m_name) > 1}">
							        	<c:out value="${fn:substring(order.member[0].m_name,0,1)}"/>*
							        	<c:out value="${fn:substring(order.member[0].m_name,2,4)}"/>
						        	</c:when>
						        </c:choose><br>
						        • 구매자연락처 : ${ order.ophone }<br>
						        • 배송주소 : [${ order.opostnum }] ${ order.oadress } ${ order.oadressdetail }<br>
						        • 주문메세지 : ${ order.omessage }<br>
						        • 주문현황 : ${ order.pay.patstatus }<br>
						      </div>
						      <div class="modal-footer">
						        <form action="${ path }/admin/admin_goods_order_refund" >
						        <input type="hidden" name="no" value="${ order.payno }">
						        <c:if test="${ order.pay.patstatus  eq '환불대기중'}"><button type="submit" class="btn btn-logoC btn-sm" data-toggle="modal" data-target="#Modal">환불</button></c:if>
						        <button type="button" class="btn btn-logoC btn-sm" data-dismiss="modal">닫기</button>
						        </form>
						      </div>
						    </div>
						  </div>
						</div>
						
                    </c:forEach>
                    </c:if> 
                </tbody>
            </table>
        </div>

        <div class="search1 row my-4">
          <form action="${ path }/admin/admin_goods_order_search" style="width: 100%;">
            <div class="col-12 row">
                <div>
                    <select name="searchType" class="form-control1" style="font-size: 14.45px; ">
                        <option value="title" selected>상품명</option>
                        <option value="member">구매자</option>
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
                <li><a href="${ path }/admin/admin_goods_order?page=1">«</a></li>
			
			<!-- 이전 페이지로 -->
				<li><a href="${ path }/admin/admin_goods_order?page=${ pageInfo.prevPage }">‹</a></li>    
				           
            <!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">
						<li><a class="active">${ status.current }</a></li>
					</c:if>
					
					<c:if test="${ status.current != pageInfo.currentPage }">
                		<li><a href="${ path }/admin/admin_goods_order?page=${ status.current }">${ status.current }</a></li>
					</c:if>
				</c:forEach>
				
			<!-- 다음 페이지로 -->
				<li><a href="${ path }/admin/admin_goods_order?page=${ pageInfo.nextPage }">›</a></li>  
			<!-- 맨 끝 페이지로 -->
                <li><a href="${ path }/admin/admin_goods_order?page=${ pageInfo.maxPage }">»</a></li>
            </ul>

        </div>
           
           
         </div>
       </div>
  </div>
<hr>
</body>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>