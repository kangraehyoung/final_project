<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<title>VODA</title>

    <!--BootStrap CSS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

	<!--BootStrap JS-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!-- people CSS -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/people/people.css">
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    

	<div class="wrapper" style="width: 800px" >
		<form action="${ path }/admin/peopleEnroll" method="POST" enctype="multipart/form-data">
		    <main class="kakao_content" style="width: 800px" >
		        <article id="mainContent" class="kakao_article" style="padding-bottom: 0px;">
		        <h2 class="screen_out">영화인 본문</h2>
		            <div class="section_star">
		                <div class="box_basic" data-tiara-layer="main" style="padding-left: 50px;">
		                    <div class="info_poster">
		                        <div class="thumb_img">
		                            <img  class="bg_img" id="blah" src="#" alt="" />
		                        </div>
		                        <input type='file' id="imgInp" name="upfile" 
		                        style="margin-top: 30px; width: 220px;"/>
		                    </div>
		                <div class="base_info_sec">
		                    <table border="0" cellpadding="0" cellspacing="0" style="margin-left: 300px;">
		                        <colgroup>
		                            <col width="25%">
		                            <col width="75%">
		                        </colgroup>
		                        <tbody>
		                        <tr>
		                            <th>
		                                <span class="important">이름</span>
		                            </th>
		                            <td>
		                                <div class="form-inline">
		                                    <div class="form-group mx-sm-3 mb-2">
		                                        <label for="inputName" class="sr-only">PeopleName</label>
		                                        <input type="text" class="form-control" id="inputName" name="people_name" placeholder="" required>
		                                    </div>
		                                </div>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>
		                                <span class="important">직업</span>
		                            </th>
		                            <td>
		                                <div class="form-inline">
		                                    <div class="form-group mx-sm-3 mb-2">
		                                        <label for="inputJob" class="sr-only">PeopleJob</label>
		                                        <input type="text" class="form-control" id="inputJob" name="people_job" placeholder="" required>
		                                    </div>
		                                </div>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>
		                                <span class="important">데뷔</span>
		                            </th>
		                            <td>
		                                <div class="form-inline">
		                                    <div class="form-group mx-sm-3 mb-2">
		                                        <label for="inputDebut" class="sr-only">PeopleDebut</label>
		                                        <input type="text" class="form-control" id="inputDebut" name="people_debut" placeholder="" required>
		                                    </div>
		                                </div>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>
		                                <span class="important">출생일</span>
		                            </th>
		                            <td>
		                                <div class="form-inline">
		                                    <div class="form-group mx-sm-3 mb-2">
		                                        <label for="inputBirth" class="sr-only">PeopleBirth</label>
		                                        <input type="text" class="form-control" id="inputBirth" name="people_birth" placeholder="" required>
		                                    </div>
		                                </div>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>
		                                <span class="important">수상</span>
		                            </th>
		                            <td>
		                                <div class="form-inline">
		                                    <div class="form-group mx-sm-3 mb-2">
		                                        <label for="inputAward" class="sr-only">PeopleAward</label>
		                                        <input type="text" class="form-control" id="inputAward" name="poeple_award" placeholder="" required>
		                                    </div>
		                                </div>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>
		                                <span class="important">성별</span>
		                            </th>
		                            <td>
		                                <div class="form-inline">
		                                    <div class="form-group mx-sm-3 mb-2">
		                                        <label for="inputGender" class="sr-only">PeopleGender</label>
		                                        <input type="text" class="form-control" id="inputGender" name="people_gender" placeholder="" required>
		                                    </div>
		                                </div>
		                            </td>
		                        </tr>
		                        </tbody>
		                    </table>
		                </div> 
		                    <div class="footer" style="width: 400px; margin-top: 50px;">
		                        <div class="text-right mt-2" >
		                            <input type="submit" class="btn-logoc" style="width: 100px; height: 36px;" value="등록">
		                            <button type="button" class="btn-greyc"  onClick='window.close()'
		                            style="width: 100px; height: 36px;">취소</button>
		                        </div> 
		                    </div> 
		                </div>
		            </div>    
		        </article>      
		    </main>
		</form> 
	</div>   



<!-- 파일 첨부 -->
<script>
    $(function() {
        $("#imgInp").on('change', function(){
            readURL(this);
        });
    });

    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }

        reader.readAsDataURL(input.files[0]);
        }
    }
</script>
