<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- contents_form CSS-->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/contents/contents_form.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

<script type="text/javascript">
var path = "${pageContext.request.contextPath }";
    
$(function(){
    $("#resTb tbody").append($("#resInfoTr").html());

});
    
function resOpenPopup(){
   
    var pop = window.open("${path}/contents/contents_peoplemodal","resPopup","width=1100,height=900, scrollbars=yes, resizable=yes"); 
    pop.focus();
}
    
function setResList(resArr){
    if($("#noRes").length > 0) $("#noRes").remove();
 
    for(var i=0; i<resArr.length; i++){
            
        var trCnt = $("#resTb tbody tr").length;
        $("#resTb tbody").append($("#resTr").html());
        var lastTr = $("#resTb tbody tr:last");
        $(lastTr).attr("id","tr_"+resArr[i].rf_idx);         
        $(lastTr).find("td[name='taxonIDName']").append(resArr[i].taxonIDName);
        $(lastTr).find("input[name='people_name']").attr('value',resArr[i].taxonIDName);
        $(lastTr).find("td[name='koreanName']").append(resArr[i].koreanName);
        $(lastTr).find("input[name='people_job']").attr('value',resArr[i].koreanName);
        $(lastTr).find("input[name='people_no']").attr('value',resArr[i].people_no);
    }
}

function trRemove(ths){         
    var $tr = $(ths).parents("tr");
    $tr.remove(); 
}

</script>
 
<table style="width: 100%;">
    <tr class="row" id="posterbg">
        <td class="col d-none d-lg-block p-0" style="background: var(--main-bg-color); height: 400px;"></td>
        <td class="p-0" style="width: 1140px;">
            <div class="bg-black grabox image-show" id="image-show">
                <div class="LeftGradient" style="background-image: linear-gradient( to right, var(--main-bg-color) 40%, rgba(14, 8, 39, 0) 100%);"></div>
                <div class="RightGradient" style="background-image: linear-gradient( to left, var(--right-bg-color) 40%, rgba(14, 8, 39, 0) 100%);"></div>
                배경이미지를 등록 해주세요<img id="graposter" src="" class="image-show" alt="..." />
            </div>
        </td>
        <td class="col d-none d-lg-block p-0" style="background: var(--right-bg-color); height: 400px;"></td>
    </tr>
</table>

<!-- <div class="image-show bg-light" id="image-show"></div> -->

<div class="container" id="formbackground">
    <div class="profile" style="box-shadow: 2px 1px 10px 1px rgba(0,0,0,0.1);">
        <img id="preview" src="https://site.groupe-psa.com/content/uploads/sites/9/2016/12/white-background-2-768x450.jpg">
    </div>
    
    <form class="form" action="${ path }/contents/contents_form" method="POST" enctype="multipart/form-data">

        <p class="purple" type="프로필 파일 업로드" style="margin-left: 280px;"></p>
        <!-- <label for="profileFile">업로드</label> -->
        <div class="filebox">
            <input type="file" id="profileFile" name="upFile" style="margin-left: 280px; width:750px;" onchange="readURL(this);">
        </div>

        <p class="purple" type="배경 파일 업로드" style="margin-left: 280px;"></p>

        <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)" style="margin-left: 280px; width:750px;">

        <div class="fileInput" style="margin-left: 280px;">
            <p type="파일 첨부" class="m-0"></p>
            <p id="fileName" class="m-0"></p>
        </div>

        <table>
            <tr>
                <td style="width: 516px; padding-right: 10px;">
                    <p class="purple" type="왼쪽 배경 컬러 선택"></p>
                    <input type="color" class="form-control form-control-color" id="exampleColorInput" value="${ contents.c_leftcolor }" title="Choose your color" name="c_leftcolor" data-css-var="--main-bg-color">
                </td>
                <td style="width: 516px; padding-left: 10px;">
                    <p class="purple" type="오른쪽 배경 컬러 선택"></p>
                    <input type="color" class="form-control form-control-color" id="exampleColorInput" value="${ contents.c_rightcolor }" title="Choose your color" name="c_rightcolor" data-css-var="--right-bg-color">
                </td>
            </tr>
        </table>

        <p class="purple" type="제목"><input name="c_title" placeholder="컨텐츠의 제목을 작성하세요" value="${ contents.c_title }"></input></p>
        <p class="purple" type="컨텐츠 타입">
            <select class="select" name="c_type">
            	<option value="${ contents.c_type }" checked>${ contents.c_type }</option>
                <option value="영화">MOVIE</option>
                <option value="TV">TV</option>
                <option value="도서">BOOK</option>
                <option value="웹툰">WEBTOON</option>
            </select>
        <p class="purple" type="컨텐츠 장르"><input name="c_genre" placeholder="컨텐츠의 장르를 작성하세요" value="${ contents.c_genre }"></input></p>
        <p class="purple" type="컨텐츠 연도"><input name="c_year" placeholder="컨텐츠의 연도를 작성하세요" value="${ contents.c_year }"></input></p>
        <p class="purple" type="컨텐츠 국적"><input name="c_nation" placeholder="컨텐츠의 국적을 작성하세요" value="${ contents.c_nation }"></input></p>
        <p class="purple" type="컨텐츠 정보"><input name="c_info" placeholder="컨텐츠 기본정보 러닝타임/연재중/책페이지" value="${ contents.c_info }"></input></p>
        <p class="purple" type="컨텐츠 비디오"><input name="c_video" placeholder="관련 영상 주소를 작성하세요" value="${ contents.c_video }"></input></p>
        <p class="purple" type="컨텐츠 연령가">
            <select class="select" name="c_age">
            	<option value="${ contents.c_age }" checked> 
            	<c:if test="${ contents.c_age == 0 }"> 전체 관람가 </c:if> 
            	<c:if test="${ contents.c_age > 0 }"> ${ contents.c_age }세 관람가 </c:if> 
            	</option>
                <option value="0">전체 관람가</option>
                <option value="12">12세 관람가</option>
                <option value="15">15세 관람가</option>
                <option value="19">19세 관람가</option>
            </select>
        <p class="purple" type="컨텐츠 줄거리"></p>
        <textarea class="form-control" id="exampleFormControlTextarea1" name="c_synop" rows="4">${ contents.c_synop }</textarea>

        <p class="purple" type="컨텐츠 등장인물">

         <button id="btnFindProduct" class="btn mt-3 mr-3 terms-view" type="button" style="background-color: rgb(73,95,233); color: white;" onclick="resOpenPopup();return false;">
             컨텐츠 인물 등록 버튼
         </button>
         
         <button id="btnRegisterProduct" class="btn mt-3 terms-view" type="button" style="background-color: rgb(73,95,233); color: white;">
             인물 등록 버튼
         </button>
         

<div id="contAreaBox">
    <div class="table">
        <table id="resTb">
            <thead>
                <tr>
                    <th>PEOPLE-NAME</th>
                    <th>PEOPLE-JOB</th>
                    <th>CONTENTSPEOPLE-ROLE</th>
                    <th style="padding-right: 22px;">삭제</th>
                </tr>
            </thead> 
            <tbody>
                
            </tbody>
        </table>
    </div>
</div>

<table class="table table-hover">
  <tbody>
  	<c:forEach var="contentsPeople" items="${ contentsPeople }">
    <tr>
      <th scope="row"><input class="form-control" name="people_name" value="${ contentsPeople.people_name }"></th>
      <td><input class="form-control"  name="people_job" value="${ contentsPeople.people_job }"></td>
      <td><input class="form-control" name="cp_role"  value="${ contentsPeople.cp_role }"></td> 
      	  <input class="form-control" name="people_no" value="${ contentsPeople.people_no }" type="hidden">
      <td name="cancel" class="text-right"> <a href="javascript:void(0);" onclick="trRemove(this);return false;" class="btn del text-right">삭제</a> </td>
    </tr>
	</c:forEach>
  </tbody>
</table>
         
<div class="table-responsive">
    <table class="table" style="display:none;" id="testTable">        
        <tbody id="resTr">
            <tr>
                <td name="taxonIDName"><input class="form-control" name="people_name" type="hidden"></td> 
                <td name="koreanName"><input class="form-control"  name="people_job" type="hidden"></td>
                <td><input class="form-control" type="text" name="cp_role" placeholder="역할 | 이름"><input class="form-control" name="people_no" type="hidden"></td>
                <td name="cancel"> <a href="javascript:void(0);" onclick="trRemove(this);return false;" class="btn del">삭제</a> </td>
            </tr>
        </tbody>
    </table>
</div>

         <div style="height:125px;">
             <button type="submit" class="contentssubmit" style="float:right;">컨텐츠 등록</button>
         </div>
    </form>
</div>

<script>
    $('input[type="color"]').on("change", function() {
        document.body.style.setProperty($(this).attr("data-css-var"), this.value);
    });
</script>

<script>
    $('input[type="color"]').on("change", function() {
        document.body.style.setProperty($(this).attr("right-css-var"), this.value);
    });
</script>

<script>
    var submit = document.getElementById('submitButton');
    //submit.onclick = showImage; //Submit 버튼 클릭시 이미지 보여주기

    function showImage() {
        var newImage = document.getElementById('image-show').lastElementChild;
        newImage.style.visibility = "visible";

        document.getElementById('image-upload').style.visibility = 'hidden';

        document.getElementById('fileName').textContent = null; //기존 파일 이름 지우기
    }

    function loadFile(input) {
        var file = input.files[0];

        var name = document.getElementById('fileName');
        name.textContent = file.name;

        var newImage = document.createElement("img");
        newImage.setAttribute("class", 'img');
        newImage.setAttribute("id", 'graposter');

        newImage.src = URL.createObjectURL(file);

        var container = document.getElementById('image-show');
        container.appendChild(newImage);
    };
</script>

<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    }
</script>

<!-- 인물 등록 -->
<script>
	$(document).ready(() => {
        $("#btnRegisterProduct").on("click", () => {
            let url ="peopleEnroll.html";
            let status = "left=300px,top=0px,width=1200px,height=800px";

            open(url,"",status);
        });
	}); 
</script>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>