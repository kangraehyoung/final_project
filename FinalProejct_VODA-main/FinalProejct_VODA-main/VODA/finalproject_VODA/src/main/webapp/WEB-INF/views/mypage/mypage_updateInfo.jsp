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
                                <h5 style="font-weight: 600; margin-bottom: 17px;">회원 정보 변경</h5>
                                <hr>
                            </form>
                        </div>
                    </div>
                    <form action="${ path }/mypage/updateMember" method="POST">

                        <div class="mt-3">
                            <p class="myMenuTitle">기본 정보</p>
                        </div>
                        
                        <!-- 두번째 행 -->
                        <div class="row">
                        <div class="col-sm-12">
                            <table class="table infotable" style="width: 100%;">
                                <tbody>
                                    <tr>
                                        <th class="infotable_th" style="width: 27%; padding-top: 16px;">아이디</th>
                                        <td class="infotable_td" style="padding-top: 16px;">${ loginMember.m_id }</td>
                                    </tr>
                                    <tr>
                                        <th class="infotable_th" style="padding-top: 16px;">이름</th>
                                        <td class="infotable_td">
                                            <input type="text" id="m_name" name="m_name" maxlength="30" required value="${ loginMember.m_name }"> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="infotable_th" style="padding-top: 16px;">이메일</th>
                                        <td class="infotable_td">
                                            <input type="text" name="m_email" id="m_email" tabindex="-1" required value="${ loginMember.m_email }">
                                            <!-- 
                                            <select id="emailDomain" name="emailDomain" class="chosen_select">
                                                <option value="self" selected="selected">직접입력</option>
                                                <option value="naver.com">naver.com</option>
                                                <option value="hanmail.net">hanmail.net</option>
                                                <option value="daum.net">daum.net</option>
                                                <option value="nate.com">nate.com</option>
                                                <option value="hotmail.com">hotmail.com</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="icloud.com">icloud.com</option>
                                            </select>
                                             -->
                                            <label for="" id="email_chk"></label>
                                            <input type="hidden" name="emailTest" value="0" />
                                            <button id="emailCheckBtn" type="button" class="btn btn-logoc" style="font-size: 0.85em; width: 90px; height: 27.67px; padding-top: 5px; padding-left: 5px; padding-right: 5px; margin-top: -3px; margin-left: -4px;">중복확인</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="infotable_th" style="padding-top: 16px;">휴대폰번호</th>
                                        <td class="infotable_td">
                                            <input type="text" id="m_phone" name="m_phone" maxlength="12" placeholder="- 없이 입력하세요." value="${ loginMember.m_phone }" required>
                                        </td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgrey;">
                                        <th class="infotable_th" style="padding-top: 52px;">주소</th>
                                        <td class="infotable_td">
                                            <div class="address_postcode">
                                                <input type="text" id="sample6_postcode" name="m_postNum" readonly="readonly" type="number" value="${ loginMember.m_postNum }" required style="font-size: 0.85em; height: 27.66px; margin-bottom: 10px; background-color: #e9ecef;" >
                                                <button type="button" id="btnPostcode" onclick="sample6_execDaumPostcode()" class="btn_post_search btn btn-logoc" style="font-size: 0.7em; width: 90px; height: 27.67px; margin-top: 0px; padding-top: 5px; padding-left: 5px; padding-right: 5px;">주소 검색</button>
                                            </div>
                                            <div class="address_input">
                                                <div>
                                                    <input type="text" id="sample6_address" name="m_address" readonly="readonly" value="${ loginMember.m_address }" required style="font-size: 0.85em; width: 294px; height: 27.66px; margin-bottom: 10px; background-color: #e9ecef;">             
                                                </div>
                                                <div>
                                                    <input type="text" id="sample6_detailAddress" name="m_detailAddress" value="${ loginMember.m_detailAddress }" style="width: 294px; height: 27.66px; font-size: 0.85em;">
                                                    <label for="" id="address_chk"></label>
                                                </div>
                                            </div>
                                        </td>
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
                            <table class="table infotable" style="width: 100%;">
                                <tbody>
                                    <tr>
                                        <th class="infotable_th" style="width: 27%; padding-top: 16px;">성별</th>
                                        <td class="infotable_td" style="padding-top: 17px; padding-bottom: 7px;">
                                        	<c:if test="${ loginMember.m_gender == 'M' }">
                                            	<input type="radio" name="m_gender" id="man" value="M" checked>
                                        	</c:if>
                             	            <c:if test="${ loginMember.m_gender != 'M' }">
                                            	<input type="radio" name="m_gender" id="man" value="M">
                                        	</c:if>
                                            <label for="men" style="margin-top: -10px;">남자</label>
                                            <c:if test="${ loginMember.m_gender == 'W' }">
	                                            <input type="radio" name="m_gender" id="woman" value="W" checked>
                                            </c:if>
                                            <c:if test="${ loginMember.m_gender != 'W' }">
	                                            <input type="radio" name="m_gender" id="woman" value="W">
                                            </c:if>
                                            <label for="men" style="margin-top: -10px;">여자</label>
                                            <c:if test="${ loginMember.m_gender == 'N' }">
                                            	<input type="radio" name="m_gender" id="none" value="N" checked>
                                            </c:if>
                                            <c:if test="${ loginMember.m_gender != 'N' }">
                                            	<input type="radio" name="m_gender" id="none" value="N" >
                                            </c:if>
                                            <label for="men" style="margin-top: -10px;">선택 안함</label>
                                        </td>
                                    </tr>
                                    <tr style="border-bottom: 1px solid lightgrey;">
                                        <th class="infotable_th" style="padding-top: 16px;">생년월일</th>
                                        <td class="infotable_td" style="padding-top: 14px;">
                                             <input data-testid="input-box" name="m_birth" maxlength='8'
                                             placeholder="예: 20001225" type="text" id="m_birth" style="height:25px;" value="<fmt:formatDate value="${ loginMember.m_birth }" type="date" pattern="yyyyMMdd"></fmt:formatDate>">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 행 시작 -->
                    <div class="text-center">
                        <button type="button" class="btn btn-greyc" onclick="location.href='${path}/mypage/memberInfo'">돌아가기</button>
                        <button id="btn_updateMember" type="submit" class="btn btn-logoc">수정하기</button>
                    </div>
                </form>
                    
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

<!-- 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<!-- 회원 가입 클릭 시 값 체크 (유효성 검사) -->
<script>
$(document).ready(function(){
	$("#emailCheckBtn").on("click", () => {
		let user_email = $("#m_email").val().trim();
		
		var $user_email = $("#m_email");
		if (/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test($user_email.val()) == false) {
			alert("이메일 형식으로 입력해 주세요");
			return;
		} 
		var email1 = '${loginMember.m_email}';
		var email2 = $("#m_email").val().trim();
		
		$.ajax({
			type: "POST",
			url: "${ path }/member/emailCheck",
			dataType: "json",
			data: {
				user_email 
			},
			success: (obj) => {
				console.log(obj);
				
				if(obj.duplicate === true) {
					if(email1 == email2){
						$("[name=emailTest]").val("1");
						alert("사용 가능한 이메일 입니다.")
					} else{
						alert("이미 사용중인 이메일 입니다.")
					}
				} else {
					$("[name=emailTest]").val("1");
					alert("사용 가능한 이메일 입니다.")
				}
			}, 
			error: (error) => {
				console.log(error);
			}
		});
	});
	
	$("#btn_updateMember").click(function(){
		// 이름 정규식
		var nameJ = /^[가-힣]{2,6}$/;
		// 이메일 검사 정규식
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		
	    // 이름

		if (nameJ.test($("#m_name").val())) {
		} else {
			alert("이름을 다시 입력해주세요");
			return false;
		}
	
	    //이메일 중복검사
	    
		
		if($("[name=emailTest]").val() != "1"){
			alert("이메일 중복 체크를 해주세요");
			
			return false;
		}
		
		if(phoneJ.test($("#m_phone").val())){
		} else {
			alert("휴대폰 번호를 다시 입력해주세요");
			return false;
		}
		
		if($("#sample6_detailAddress").val() == ""){
			alert("주소를 다시 입력해주세요");
			return false;
		}
		
	});
});

</script>