<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/product/product_cart.css">
  <div class="container">
        <section class="cart">
            <div class="cart__information">
                <ul>
                    <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                    <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                    <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
                </ul>
            </div>
            <table class="cart__list">
                
                    <thead>
                        <tr>
                            <td>
	                            <input type="checkbox" id="allCheck1" class="allCheck">
	                            <label for="allCheck1" class="check_s on"></label>
                            </td>
                            <td colspan="2">상품정보</td>
                            <td>옵션</td>
                            <td>상품금액</td>
                            <td>상품금액 * 수량</td>
                        </tr>
                    </thead>
                   
                    <tbody>
                    <c:forEach var="cart" items="${ cart }">
                    <c:set var="rename" value="${ cart.prenamefile }" />
                        <tr class="cart__list__detail">
                            <td style="width: 2%;">
                            	<input type="checkbox" id="cartSno1_212360" class="checkProduct" name="cartSno[]" value="${ cart.pno }">
                            	<label for="cartSno1_212360" class="check_s on"></label>
                            </td>
                            <td style="width: 13%;">
                            	<img src="${ path }/resources/uploadFiles/${ fn:substring(rename,0,22) }" style="height: 80%;">
                            </td>
                            <td style="width: 27%;"><a href="#">${ cart.pmadecompany }</a>
                                <p>[${cart.pcategory}]${ cart.pname }</p>
                            </td>
                            <td class="cart__list__option" style="width: 27%;">
                                <p>잔여 상품 수량: ${ cart.pqtt }개</p>
                                <p>상품 주문 수량: <input class="quantitySelect" class="number_input" type="number" min="1" max="${ cart.pqtt }" value="1" name="proderqtt" style="height: 20px; width: 43px;">개</p>
                            </td>
                            <td style="width: 15%;">
                            	<strong class="proPrice">${ cart.pprice }</strong><br>
                            </td>
                            <td style="width: 15%;">
                            	<strong class="sumPrice">${ cart.pprice }</strong><br>
							</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3">&nbsp;&nbsp;<button id="deleteCart" class="btn btn-primary2 py-1">선택상품 삭제</button>
                            </td>
                            <td></td>
                            <td><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총 합계 금액 : </strong></td>
                            <td><strong class="totalPrice">0</strong></td>
                        </tr>
                    </tfoot>
                
            </table>
            <div class="cart__mainbtns">
                <button type="button" class="btn btn-back py-1" onclick="location.href='${path}/product/product_all_list'">쇼핑 계속하기</button>
                <button class="btn btn-primary py-1" id="selectedProductPayment">주문하기</button>
            </div>
        </section>
    </div>
<script>
    var allCheck = document.querySelector(".allCheck");
    var list = document.querySelectorAll(".check");
    allCheck.onclick = () => {
        if(allCheck.checked){
            for(var i = 0; i < list.length; i++){
                list[i].checked = true;
            }
        } else {
            for(var i = 0; i < list.length; i++){
                list[i].checked = false;
            }
        }
    }
</script>
<script type="text/javascript">

$(document).ready(() => {
	$(".quantitySelect").on("change", (event) => {
		var quantity = $(event.target).val();
		var proPrice = $(event.target).parent().parent().next().find(".proPrice").text();
		$(event.target).parent().parent().next().next().find(".sumPrice").text(quantity * proPrice);
		getTotalPrice();
	});
	
	$("#selectedProductPayment").on("click", () => {
		var result = 1;
		$("input:checkbox[name='cartSno[]']:checked").each(function(){
			var value = Number($(this).parent().next().next().find(".quantitySelect").val());
			var min = Number($(this).parent().next().next().find(".quantitySelect").attr("min"));
			var max = Number($(this).parent().next().next().find(".quantitySelect").attr("max"));
			
			if(value < min || value > max){
				result = 0;
			}
		});
		if(result==0){
			alert("구매수량을 적절하게 입력해주세요");
		} else{
			var arr = [];
			var pqttarr = [];
			$("input:checkbox[name='cartSno[]']:checked").each(function(){
				var pno = $(this).val();
				var porderqtt = $(this).parent().next().next().next().find(".quantitySelect").val();
				arr.push(pno);
				pqttarr.push(porderqtt);
			});
			if(arr.length !=0){
				location.href="${path}/product_list_order?pnolist="+arr+"&porderqtt="+pqttarr;
				
			}else{
				alert("상품을 선택해주세요");
			}
		}		
	});
	
	$(".checkProduct").change(function(){
		getTotalPrice();
    });
	
	$("#allCheck1").change(function() {
		if($("#allCheck1").is(":checked")){
			$('.checkProduct').prop('checked',true);
			getTotalPrice();
        }else{
        	$('.checkProduct').prop('checked',false);
			getTotalPrice();
        }
	});
	
	function getTotalPrice(){
		var arr = [];
		var totalPrice = 0;
		$("input:checkbox[name='cartSno[]']:checked").each(function(){
			totalPrice += Number($(this).parent().next().next().next().next().next().find(".sumPrice").text());
		});
		$(".totalPrice").text(totalPrice);
	}
	
	$("#deleteCart").on("click", ()=> {
		var arr = [];
		$("input:checkbox[name='cartSno[]']:checked").each(function(){
			var pno = $(this).val();
			arr.push(pno);
		});
		if(arr.length !=0){
			location.href="${path}/product/cart_delete?list="+arr;
		}else{
			alert("상품을 선택해주세요");
		}
	});
	
});
</script>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>