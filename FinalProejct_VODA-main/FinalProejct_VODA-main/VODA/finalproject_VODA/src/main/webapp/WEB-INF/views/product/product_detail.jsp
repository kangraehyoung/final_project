<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<%@page import="java.util.Calendar" %>
<%
        java.util.Calendar cal = java.util.Calendar.getInstance();
		cal.add(Calendar.DATE, +2);
%>
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/product/product_detail.css?ver=1">
    <!-- Demo styles -->
    <style>
        .swiper {
            width: 100%;
            height: 100%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;

            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }


        .swiper {
            width: 100%;
            height: 300px;
            margin-left: auto;
            margin-right: auto;
        }

        .swiper-slide {
            background-size: cover;
            background-position: center;
        }

        .mySwiper2 {
            height: 370px;
            width: 400px;
        }

        .mySwiper {
            height: 100px;
            box-sizing: border-box;
            padding: 10px 0;
            width: 400px;
        }

        .mySwiper .swiper-slide {
            width: 25%;
            height: 100%;
            opacity: 0.4;
        }

        .mySwiper .swiper-slide-thumb-active {
            opacity: 1;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>

    <div class="container my-5">
        <div>
            <div class="card" style="border: none;">
                <div class="row g-0 p-5">
                    <!-- 이미지 -->
                    <div class="col-6" style="width: 100%;">
                        <!-- Swiper -->

                        <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff"
                            class="swiper mySwiper2">
                            <div class="swiper-wrapper">
                            <c:forEach items="${ imgList }" var="imgList">
                                <div class="swiper-slide">
                                    <img
                                        src="${ path }/resources/uploadFiles/${imgList}" />
                                </div>
                            </c:forEach>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                        <div thumbsSlider="" class="swiper mySwiper">
                            <div class="swiper-wrapper">
                            <c:forEach items="${ imgList }" var="imgList">
                                <div class="swiper-slide">
                                    <img
                                        src="${ path }/resources/uploadFiles/${imgList}" />
                                </div>
                                
                            </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-1"></div>
                    <!-- 이미지 상세내용 -->
                    <div id="div1" class="col-5">
                        <div class="card-body py-0">
                            <h4 class="card-title">[${ product.pcategory }]${ product.pname }</h4>

                            <p class="my-0">${ product.pcategory }</p>
                            <hr class="my-2">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 30%;">상품번호</td>
                                    <td>${ product.pno }</td>
                                </tr>
                                <tr>
                                    <td>제조사</td>
                                    <td>${ product.pmadecompany }</td>
                                </tr>
                                <tr>
                                    <td>원산지</td>
                                    <td>${ product.pmadelocal }</td>
                                </tr>
                                <tr>
                                    <td>배송예정일</td>
                                    <td> 
	                                    <%= cal.get(java.util.Calendar.YEAR) %>년
									    <%= cal.get(java.util.Calendar.MONTH) + 1 %>월
									    <%= cal.get(java.util.Calendar.DATE) %>일
								    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="mb-2">수량</div>
                                    </td>
                                    <td>
                                        <div class="mb-2">${ product.pqtt }</div>
                                    </td>
                                </tr>
                                <tr
                                    style="border-top: 1px solid rgba(0,0,0,.1); border-bottom: 1px solid rgba(0,0,0,.1);">
                                    <td>
                                        <div class="my-2">판매가</div>
                                    </td>
                                    <td>${ product.pprice }원</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="mt-2">수량선택</div>
                                    </td>
                                    <td>
                                    
                                        <input id="quantitySelect" class="mt-2" type="number" min=1 max=${ product.pqtt } value=1 name="porderqtt">
                                    </td>
                                </tr>
                                <tr style="border-bottom: 1px solid rgba(0,0,0,.1);">
                                    <td>
                                        <div class="mb-2">총 합계금액</div>
                                    </td>
                                    <td>
                                        <div class="mb-2" id="totalPrice">${product.pprice}원</div>
                                    </td>
                                </tr>
                            </table>

                            <table class="my-2" style="width: 100%;">
                                <tr>
                                    
                                    <td style="width: 50%;" class="">
                                    	<form action="${ path }/product/cart_insert">
                                    	<input type="hidden" name="pno" value="${ product.pno }">
                                        <div class="py-2 text-center"><button class="btn-greyc">장바구니</button></div>
                                        </form>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">                                
                                        <div><button id="payment" class="btn-logoc" style="margin-top: -20px;">구매하기</button></div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
            <c:if test="${ loginMember.m_authorization == 'M' }">
            <div style="margin-left: 883px; margin-top: -40px;">
				<button id="btnDelete" class="btn-logocsm">상품 삭제</button>
				<button class="btn-logocsm" onclick="location.href='${ path }/product/product_update?pno=${ product.pno }'">상품 수정</button>
			</div>
			</c:if>
			<br><br>
            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#artistIntroduce" style="height: 55px; line-height: 40px;">상품
                        소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#orderIntroduce" style="height: 55px; line-height: 40px;">배송 안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#cancelIntroduce" style="height: 55px; line-height: 40px;">취급주의/교환/환불</a>
                </li>
            </ul>

            <div id="artistIntroduce">
                <div class="card" style="border: none;">
                    <div class="row g-0 p-5">

                    </div>
                </div>
				
                <div class="p-5">
                	<c:forEach items="${ imgList }" var="imgList">
                    <img style="width: 100%; height: 700px;" src="${ path }/resources/uploadFiles/${imgList}">
                    </c:forEach>
                    <p>
                        ${ product.pcontents }
                    </p>
                </div>
            </div>
            <br><br><br><br><br>
            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="#artistIntroduce" style="height: 55px; line-height: 40px;">상품
                        소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#orderIntroduce" style="height: 55px; line-height: 40px;">배송 안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#cancelIntroduce" style="height: 55px; line-height: 40px;">취급주의/교환/환불</a>
                </li>
            </ul>
            <div id="orderIntroduce" class="p-5">
					<h3>배송 안내</h3>
					<p>- 배송비는 별도로 추가되지 않습니다.
					<h3>배송 기간</h3>
					<p>
						 평일 오전 11시 이전 주문건은 당일 출고됩니다. (정상재고 확인시)

						 입금일 기준 평균 3~5일 소요됩니다. (토/일/공휴일 제외)
						
						 물류센터 재고 부족 시 재고가 있는 매장에서 이동받아 배송되므로 5~7일 소요 될 수 있습니다. (토/일/공휴일 제외) 
					</p>
			</div>
			<br><br><br><br><br>
			<ul class="nav nav-tabs nav-justified">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="#artistIntroduce" style="height: 55px; line-height: 40px;">상품
                        소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#orderIntroduce" style="height: 55px; line-height: 40px;">배송 안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#cancelIntroduce" style="height: 55px; line-height: 40px;">취급주의/교환/환불</a>
                </li>
            </ul>
			
			
			<div id="cancelIntroduce" class="p-5">
				<h2>환불 안내</h2><br>
				<h3>교환/환불 및 AS 안내  </h3>
					<p>
						반품 및 교환은 상품 수령 후 7일이내에 요청해 주세요.

						 (다만, 상품 오배송 및 상품설명 표시사항과 다를 경우 수령한 다음날로부터 3개월 이내, 
						
						  혹은 그사실을 안 날로부터 30일 이내 반품/교환이 가능합니다.)
						
						 완제품으로 수입된 상품의 경우 A/S가 불가합니다.
					</p>

					<h3>교환/환불 가능한 경우</h3>
					<p>
						고객변심(충동구매/필요성 상실 등)에 의한 요청일 경우 (반품/교환 비용은 고객부담)

 						주문한 상품과 다른 상품이 오배송된 경우 / 명백한 상품의 하자가 발견된 경우 
					</p>
					<h3>교환/환불 불가능한 경우</h3>
					<p>
						상품 수령후 7일을 초과한 경우

						 고객님의 부주의 또는 사용으로 인해 상품 혹은 제품박스가 멸실 또는 훼손된 경우
						
						 시간이 지나 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우 
						
						 고객님의 요청에 따라 주문 제작된 상품일 경우 /  무작위 배송(랜덤) 상품일 경우
					</p>
					<h3>교환/환불 특이사항</h3>
					<p>
						 ﻿​결제하신 수단에 따라 환불 방법이 차이가 날 수 있습니다.

						 고객 환불 신청 이후 별도의 관리자 승인이 필요하기 때문에 최종 승인까지 시간이 소요될 수 있습니다.
						
						 카드사 사정에 따라 취소 완료가 되기까지 3~5일 정도 소요일이 발생할 수 있습니다.
					</p>
					<h3>반품/교환 절차</h3>
					<p>
						 ﻿​온라인신청: 마이페이지▶나의활동▶내가쓴문의&답변▶교환/반품 바로가기에서 내용 작성 

						 또는 고객센터(010-2955-3179) 신청가능 
						
						 택배기사님 방문 후 반품/교환 상품회수
						
						 물류센터에서 상품 상태 확인 후 반품/교환 진행
					</p>
			</div>
        </div>
        <input type="hidden" name="pno" value="${ product.pno }">
        
	
    </div>
    
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script type="text/javascript">
$(document).ready(() => {
	$("#quantitySelect").on("change", () => {
		$("#totalPrice").text(${product.pprice} * $("#quantitySelect").val());
	});
	
	$("#payment").on("click", () => {
		if(${empty loginMember}){
			alert("로그인이 필요합니다.");
		} else{
			var value = parseInt($("#quantitySelect").val());
			var min = parseInt($("#quantitySelect").attr("min"));
			var max = parseInt($("#quantitySelect").attr("max"));
			if(value <= max && value >= min){
				location.href="${path}/product_order?pno=${product.pno}&porderqtt=" + $("#quantitySelect").val();
			} else {
				alert("구매수량을 다시 입력해주세요");
			}
		}
	});
	
	
	
	
});
</script>
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
            spaceBetween: 10,
            slidesPerView: 4,
            freeMode: true,
            watchSlidesProgress: true,
        });
        var swiper2 = new Swiper(".mySwiper2", {
            spaceBetween: 10,
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            thumbs: {
                swiper: swiper,
            },
        });
        $(document).ready(() => {
			$("#btnDelete").on("click", () => {
				if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
					location.replace("${ path }/product/product_delete?pno=${ product.pno }");
				}
			});
		});
        
    </script>

