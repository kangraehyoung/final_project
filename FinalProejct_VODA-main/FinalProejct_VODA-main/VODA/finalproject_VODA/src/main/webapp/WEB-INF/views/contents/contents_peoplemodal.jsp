<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!-- Jquery-->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>

<!--BootStrap CSS-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<!--BootStrap JS-->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> 

<!-- common CSS-->
<link rel="stylesheet" type="text/css" href="../../CSS/Common/headerfooter.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">


<style>

/* 폰트 */
@import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');
* { font-family: Pretendard, 
    -apple-system, BlinkMacSystemFont, 
    system-ui, Roboto, 'Helvetica Neue', 'Segoe UI', 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif; }

/* 서치바 CSS */
.search-box {
  position : absolute;
  /*top : 50px;
  left : 550px;  */
  transform : translate(0%, 0%);
  background : rgb(235,236,246);
  height : 40px;
  border-radius : 40px;
  padding : 10px; }

.search-btn {
  color : white;
  float : right;
  width : 40px;
  height : 40px;
  border-radius: 50%;
  background : rgb(73,95,233);
  display:flex;
  justify-content: center;
  align-items: center;
  text-decoration: none;
  transition: 0.4s; }

.search-txt {
  border:none;
  background:none;
  outline:none;
  float:left;
  padding:0;
  color: black;
  font-size:16px;
  transition : 1s;
  line-height: 40px;
  width : 0px; }

.search-box:hover > .search-txt {
  width: 240px;
  padding: 0px 20px; }
  
.search-box:hover > .search-btn {
  background:rgb(235,236,246); }
  
/* 페이지 네이션 시작 */
#wrapper {
margin: 0 auto;
display: block;
width: 960px;
}

.page-header {
text-align: center;
font-size: 1.5em;
font-weight: normal;
border-bottom: 1px solid #ddd;
margin: 30px 0
}

#pagination {
margin: 0;
margin-top: 40px;
padding: 0;
text-align: center
}

#pagination li {
display: inline
}

#pagination li a {
display: inline-block;
text-decoration: none;
padding: 5px 10px;
color: #000
}

/* Active and Hoverable Pagination */
#pagination li a {
border-radius: 5px;
-webkit-transition: background-color 0.3s;
transition: background-color 0.3s
}
#pagination li a.active {
background-color: rgb(73,95,233);
color: #fff
}
#pagination li a:hover:not(.active) {
background-color: #ddd;
} 

/* border-pagination */
.b-pagination-outer {
width: 100%;
margin: 0 auto;
text-align: center;
overflow: hidden;
display: flex
}

#border-pagination {
margin: 0 auto;
padding: 0;
text-align: center
}

#border-pagination li {
display: inline;
}

#border-pagination li a {
display: block;
text-decoration: none;
color: #000;
padding: 5px 10px;
border: 1px solid #ddd;
float: left;
}

#border-pagination li a {
-webkit-transition: background-color 0.4s;
transition: background-color 0.4s
}

#border-pagination li a.active {
background-color: #4caf50;
color: #fff;
}

#border-pagination li a:hover:not(.active) {
background: #ddd;
}  

.none {
border : none;
}

.big {
font-weight: 600;
font-size: 1.05em;
border: none;
} 

/* 최신 컨텐츠 */
#new-contents {
    /* width: 1140px; */
    margin:0px;
}

#new-contents-container {
    margin-top: 200px;
}

.contents-line {
    background-color: rgba(73, 95, 233, 0.5);
    height: 2px;
}

.new-contents-info {
    font-size: 1.4em;
    margin-bottom: 20px;
    font-weight: 500;
}

.next {
  display: inline-block;
  overflow: hidden;
  font-size: 0;
  line-height: 0;
  text-indent: -9999px;
  vertical-align: top;
  background-size: 500px auto; }

</style>

<script>
var path = "${pageContext.request.contextPath }";
$(function(){
$("#check_all").click(function(){
var chk = $(this).is(":checked");
if(chk) $("#resTb input[name='chk_res']").prop('checked', true);
else  $("#resTb input[name='chk_res']").prop('checked', false); 
});
});
 
function selectItem(){
if($("#resTb input[name='chk_res']:checked").length == 0){
alert("체크할 리스트를 선택해주세요.");
return false;
}
 
var resArr = new Array();
$("#resTb input[name='chk_res']:checked").each(function(index) {
var organismID = $(this).val();
var resObj = new Object();
$tr = $("#tr_"+organismID);

resObj.taxonIDName = $tr.find("input[name='taxonIDName']").val();
resObj.koreanName = $tr.find("input[name='koreanName']").val();
resObj.people_no = $tr.find("input[name='people_no']").val();

resArr.push(resObj);
});
window.opener.setResList(resArr);
window.close();
}
</script> 
 
<div class="container">

<table class="mt-5">
    <tr>
        <td class="new-contents-info" style="width: 250px;">컨텐츠 인물 선택</td>
        <td style="width: 1150px;">
            <hr class="contents-line">
        </td>
    </tr>
</table>

<div class="table-responsive mt-4">
	<table id="resTb" class="table table-striped table-bordered text-center">
	
	<thead>
	    <tr>
	        <th><input type="checkbox" id="check_all" /></th>
	        <th>PEOPLE_NO</th>
	        <th>PEOPLE_NAME</th>
	        <th>PEOPLE_JOB</th>
	        <th>PEOPLE_BIRTH</th>
	    </tr>
	</thead>
	<tbody>
	    <c:forEach var="people" items="${list}" varStatus="status">
	        <tr id="tr_${people.people_no}">
	        	
	            <input type="hidden" name="taxonIDName" value="${people.people_name}" />
	            <input type="hidden" name="koreanName" value="${people.people_job}" />
	            <input type="hidden" name="people_no" value="${people.people_no}" />
	            
	            <td><input type="checkbox" name="chk_res" value="${people.people_no}" /></td>
	            <td class="people_no"><c:out value="${people.people_no}"/></td>
	            <td class="taxonIDName"><c:out value="${people.people_name}"/></td>
	            <td class="koreanName"><c:out value="${people.people_job}"/></td>
	            <td class="scientificName"><c:out value="${people.people_birth}"/></td>
	        </tr>
	    </c:forEach>
	</tbody>
	</table>
	
	  <!--Active and Hoverable Pagination-->
       <ul id="pagination">
           <li><a href="${ path }/contents/contents_peoplemodal?page=1">«</a></li>
           
           <!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<li><a class="active">${ status.current }</a></li>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<li><a href="${ path }/contents/contents_peoplemodal?page=${ status.current }">${ status.current }</a></li>
				</c:if>
			</c:forEach>
           
           <li><a href="${ path }/contents/contents_peoplemodal?page=${ pageInfo.maxPage }">»</a></li>
       </ul>
       
       
<form action="${ path }/contents/contents_peoplesearch">
  	<div class="search-box p-0">
          <input class="search-txt" type="text" id="keyword" name="keyword"/>
      <a class="search-btn" href="${ path }/contents/contents_peoplesearch">
        <i class="fas fa-search" style="color: white;"></i>
      </a>
    </div>
</form>	    
       
       
</div>
<a href="#" onclick="selectItem();return false;" class="btn  btn-light" style="float:right;">선택</a>
</div>

