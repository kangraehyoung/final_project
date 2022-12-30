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
		input:focus {
            outline: none;
        }
	</style>
	
<div class="container p-0">
        <div class="row">
            <div class="col-sm-2">
                <jsp:include page="/WEB-INF/views/mypage/mypage_sideMenu.jsp"/>
            </div>

            <div class="col-sm-10">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12" style="margin-top: 40px;">
                            <form style="margin-bottom: 3px;">
                                <h5 style="font-weight: 600;" >비밀번호 변경</h5>
                                <hr style="margin-bottom: 100px;">
                            </form>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12" style="margin-top: 30px;">
                          <form style="margin-bottom: 50px;">
                            <span id="span01" style="font-size: 0.9em; font-weight: 500;"><center>현재 비밀번호와 변경할 비밀번호를 입력해주세요.</center></span> 
                          </form>
                        </div>
                    </div>

                    <div class="row" style="text-align: center; margin-left: -15px;">
                        <form action="${ path }/mypage/updatePwd" method="POST" style="width: 100%;">
                        <div style="height: 60px;">
                            <label>현재 비밀번호&nbsp:&nbsp</label>
                            <input type="password" style="border: 1px solid lightgrey; border-radius: 0%; height: 34px;" name= "password" id="password">
                        </div>
                        <div style="height: 60px;">
                            <label>신규 비밀번호&nbsp:&nbsp</label>
                            <input type="password" style="border: 1px solid lightgrey; border-radius: 0%; height: 34px;" name= "newpassword" id="newpassword">
	                        <div id="password_check" style="width: 50px;"></div>
                        </div>
                        <div style="height: 60px;">
                            <label>비밀번호 확인&nbsp:&nbsp</label>
                            <input type="password" style="border: 1px solid lightgrey; border-radius: 0%; height: 34px;" name= "newpasswordcheck" id="newpasswordcheck">
                            <div id="password_check2" style="color: red; width: 50px; padding-left:10px;"></div>
                        </div>
                        <button id="btn_updateMember" type="submit" class="btn btn-logoc">수정하기</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- 내용 전체 컨테이너 끝 -->
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
	var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,}$/; 
	
    $('#newpassword').blur(function(){
		if(pwJ.test($(this).val())){
			console.log(pwJ.test($(this).val()));
			$("#password_check").text('');
			$('#password_check').attr('style', 'visibility:hidden;');
		} else {
			$('#password_check').text('비밀번호를 확인해 주세요');
			$('#password_check').attr('style', 'visibility:visible;');
			$('#password_check').css('color', 'red');
		}
	});
    
    $("#newpasswordcheck").change(function(){
		var p1 = $("#newpassword");
		var p2 = $("#newpasswordcheck");
		
		if(p1.val() != p2.val()){
			$("#password_check2").text('비밀번호를 확인해 주세요');
			$("#password_check2").attr('style', 'visibility:visible;');
            $("#password_check2").attr('style', 'color: red');

		}else{
			$("#password_check2").text("password_check2");
			$("#password_check2").attr('style', 'visibility:hidden;');
		}
	});
</script>

<script>
	$(document).ready(function(){
		$("#btn_updateMember").click(function(){
			//비밀번호 작성 여부(유효성 검사 여부)
			if($("#password_check").css("visibility") != "hidden"){
				alert("비밀번호를 다시 입력해 주세요");
				$("#user_password").focus();
				
				return false;
			}
			
			if($("#password_check2").css("visibility") != "hidden"){
				alert("비밀번호를 다시 입력해 주세요");
				$("#user_password_retype").focus();
				
				return false;
			}
			
			var p1 = $("#newpassword");
			var p2 = $("#newpasswordcheck");
			if(p1.val() != p2.val()){
				alert("비밀번호를 다시 입력해 주세요");
				$("#user_password").focus();
				
				return false;
			}
		});
	});
</script>
