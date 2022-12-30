<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
	
  <!-- HEADER -->
  <jsp:include page="/WEB-INF/views/common/headerclean.jsp"/>

  <!-- Star Sating CDN-->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <!-- bookmark CDN-->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.0/gsap.min.js'></script>
  <script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/MorphSVGPlugin3.min.js'></script>

  <!-- contents_detail CSS --> 	
  <link rel="stylesheet" type="text/css" href="${path}/resources/css/contents/contents_detail.css">
  
  <!--BootStrap CSS-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

  <!--BootStrap JS-->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

  <!--  Jquery  -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

      <table style="width: 100%;">
        <tr class="row" id="posterbg">
            <td class="col d-none d-lg-block p-0" style="background-color:${ contents.c_leftcolor }"></td>
            <td class="p-0" style="width: 1140px;">
                <div class="bg-black grabox">
                    <div class="LeftGradient" style="background-image: linear-gradient( to right, ${ contents.c_leftcolor } 40%, ${ contents.c_leftcolor }00 100%);"></div>
                    <div class="RightGradient" style="background-image: linear-gradient( to left, ${ contents.c_rightcolor } 40%, ${ contents.c_rightcolor }00 100%);"></div>
                    <img id="graposter" src="${ path }/resources/uploadFiles/contents/${ contents.c_bimg }" class="" alt="..." />
                </div>
            </td>
            <td class="col d-none d-lg-block p-0" style="background-color:${ contents.c_rightcolor }"></td>
        </tr>
    </table>

    <div class="container" id="profilecontainer">
        <div class="profile">
            <img src="${ path }/resources/uploadFiles/contents/${ contents.c_pimg }" alt="">
        </div>
        <div class="contentsdetail">
            <div class="profiletitle"> ${ contents.c_title } </div>
            <span class="profiledetailnum"> ${ contents.c_year} &nbsp;</span>
            <span class="profiledetail">•&nbsp; ${ contents.c_genre} &nbsp;•</span>
            <span class="profiledetail">&nbsp; ${ contents.c_nation} &nbsp;</span>
            <hr>
            <div class="profileavr">평균 ★ ${ rateResult.rate_avg } (${ rateResult.rate_count }명)</div>
            <hr>
            <div class="row">
                <!-- partial:index.partials.html -->
                <div class="col-5">
                    <div id="half-stars-example">
                        <div class="rating-group">
                            <input class="rating__input rating__input--none" checked name="rating2" id="rating2-0" value="0" type="radio" onclick="return(false);">
                            <label aria-label="0 stars" class="rating__label" for="rating2-0">&nbsp;</label>
                            <label aria-label="0.5 stars" class="rating__label rating__label--half" for="rating2-05"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>
                            <input class="rating__input" name="rating2" id="rating2-05" value="0.5" type="radio" onclick="return(false);" <c:if test="${ rateResult.rate_avg >= 0.5 }"> checked </c:if>>
                            <label aria-label="1 star" class="rating__label" for="rating2-10"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                            <input class="rating__input" name="rating2" id="rating2-10" value="1" type="radio" onclick="return(false);" <c:if test="${ rateResult.rate_avg >= 1 }"> checked </c:if>>
                            <label aria-label="1.5 stars" class="rating__label rating__label--half" for="rating2-15"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>
                            <input class="rating__input" name="rating2" id="rating2-15" value="1.5" type="radio" onclick="return(false);" <c:if test="${ rateResult.rate_avg >= 1.4 }"> checked </c:if>>
                            <label aria-label="2 stars" class="rating__label" for="rating2-20"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                            <input class="rating__input" name="rating2" id="rating2-20" value="2" type="radio" onclick="return(false);" <c:if test="${ rateResult.rate_avg >= 2 }"> checked </c:if>>
                            <label aria-label="2.5 stars" class="rating__label rating__label--half" for="rating2-25"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>
                            <input class="rating__input" name="rating2" id="rating2-25" value="2.5" type="radio" onclick="return(false);" <c:if test="${ rateResult.rate_avg >= 2.4 }"> checked </c:if>>
                            <label aria-label="3 stars" class="rating__label" for="rating2-30"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                            <input class="rating__input" name="rating2" id="rating2-30" value="3" type="radio" onclick="return(false);" <c:if test="${ rateResult.rate_avg >= 3 }"> checked </c:if>>
                            <label aria-label="3.5 stars" class="rating__label rating__label--half" for="rating2-35"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>
                            <input class="rating__input" name="rating2" id="rating2-35" value="3.5" type="radio" onclick="return(false);" <c:if test="${ rateResult.rate_avg >= 3.4 }"> checked </c:if>>
                            <label aria-label="4 stars" class="rating__label" for="rating2-40"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                            <input class="rating__input" name="rating2" id="rating2-40" value="4" type="radio" onclick="return(false);" <c:if test="${ rateResult.rate_avg >= 4 }"> checked </c:if>>
                            <label aria-label="4.5 stars" class="rating__label rating__label--half" for="rating2-45"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>
                            <input class="rating__input" name="rating2" id="rating2-45" value="4.5" type="radio" onclick="return(false);" <c:if test="${ rateResult.rate_avg >= 4.4 }"> checked </c:if>>
                            <label aria-label="5 stars" class="rating__label" for="rating2-50"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
                            <input class="rating__input" name="rating2" id="rating2-50" value="5" type="radio">
                        </div>
                        <!-- partial -->
                    </div>
                </div>
                <div class="col" style="margin-top: 20px;">
                <c:choose>
                	<c:when test= "${ confirmLike == 1 }">
	                	<button class="bookmark marked hey" style="--default-y: 0px; --background-height: 19px;	--default-position: 0px;">
	                	<svg viewBox="0 0 36 36">
	                            <path class="filled" d="M26 6H10V18V30C10 30 17.9746 23.5 18 23.5C18.0254 23.5 26 30 26 30V18V6Z" />
	                            <path class="default" d="M26 6H10V18V30C10 30 17.9746 23.5 18 23.5C18.0254 23.5 26 30 26 30V18V6Z" />
	                            <path class="corner" d="M10 6C10 6 14.8758 6 18 6C21.1242 6 26 6 26 6C26 6 26 6 26 6H10C10 6 10 6 10 6Z" />
	                    </svg>
	                    </button>
                	</c:when>
                	<c:otherwise>
	                    <button class="bookmark hey" onclick="loginCheck()">
	                        <svg viewBox="0 0 36 36">
	                            <path class="filled" d="M26 6H10V18V30C10 30 17.9746 23.5 18 23.5C18.0254 23.5 26 30 26 30V18V6Z" />
	                            <path class="default" d="M26 6H10V18V30C10 30 17.9746 23.5 18 23.5C18.0254 23.5 26 30 26 30V18V6Z" />
	                            <path class="corner" d="M10 6C10 6 14.8758 6 18 6C21.1242 6 26 6 26 6C26 6 26 6 26 6H10C10 6 10 6 10 6Z" />
	                        </svg>
	                    </button>
                    </c:otherwise>
				</c:choose>
					<c:if test="${ not empty loginMember }">
                    <span id="bookmarktext" class="hey">북마크</span>
                    </c:if>
                    <c:if test="${ empty loginMember }">
                    <span id="bookmarktext" class="hey" onclick="loginCheck()" >로그인하고 북마크</span>
                    </c:if>
                </div>
			
                <div class="col">
                    <a id="comment" href="#${ path }/contents/comment_form?no=${ contents.c_no }" onclick="rateCheck();">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                            <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z" />
                        </svg>
                        <c:if test="${ not empty loginMember }">
                        <span id="commentpopup">코멘트</span>
                        </c:if>
                        <c:if test="${ empty loginMember }">
	                    <span id="commentpopup" onclick="loginCheck()">로그인 하고 코멘트</span>
	                    </c:if>
                    </a>
                </div>

                <!--popup1-->
                <div id="${ path }/contents/comment_form?no=${ contents.c_no }" class="popup-container">
                    <div class="popup-content">
                        <a href="#" class="close">&times;</a>
                        <div class="gamsang">COMMENT</div>
                        <form action="${ path }/contents/comment_write?no=${ contents.c_no }" method="post">
                            <div class="staraverage" style="text-align: center; height: 110px; background-color: rgb(235,236,246);">
                                <fieldset class="rate">
                                    <input type="radio" id="rating10" name="rate_star" value="5" /><label for="rating10" title="5 stars"></label>
                                    <input type="radio" id="rating9" name="rate_star" value="4.5" /><label class="half" for="rating9" title="4 1/2 stars"></label>
                                    <input type="radio" id="rating8" name="rate_star" value="4" /><label for="rating8" title="4 stars"></label>
                                    <input type="radio" id="rating7" name="rate_star" value="3.5" /><label class="half" for="rating7" title="3 1/2 stars"></label>
                                    <input type="radio" id="rating6" name="rate_star" value="3" /><label for="rating6" title="3 stars"></label>
                                    <input type="radio" id="rating5" name="rate_star" value="2.5" /><label class="half" for="rating5" title="2 1/2 stars"></label>
                                    <input type="radio" id="rating4" name="rate_star" value="2" /><label for="rating4" title="2 stars"></label>
                                    <input type="radio" id="rating3" name="rate_star" value="1.5" /><label class="half" for="rating3" title="1 1/2 stars"></label>
                                    <input type="radio" id="rating2" name="rate_star" value="1" /><label for="rating2" title="1 star"></label>
                                    <input type="radio" id="rating1" name="rate_star" value="0.5" /><label class="half" for="rating1" title="1/2 star"></label>
                                </fieldset>
                            </div>
                            <div id="commentinputbox">
                                <textarea name="rate_comment" id="commentinput" type="text" placeholder="당신의 감상을 적어보세요"></textarea> <br>
                                <button class="commentsubmit">
                                    평가하기
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <hr style="margin-top: 20px;">

    <div class="container bg-light" id="basicinformation-container">
        <!--회색 박스 시작 -->
        <div id="gibonjungbo" class="mt-0"> 기본 정보 </div>
        <div id="gibonjungbotext">
            <table>
                <tr>
                    <td class="" id="contentinfo">
                        ${ contents.c_title } <br>
                        ${ contents.c_year } · ${ contents.c_nation } · ${ contents.c_genre } <br>
                        ${ contents.c_info } · <c:if test ="${ contents.c_age > 0 }">${ contents.c_age }세 이용가</c:if><c:if test ="${ contents.c_age == 0 }">전체 이용가</c:if><br><br> 
                    </td>
                    <td class="" id="julgury">
                        <div id="julguryline">
                            ${ contents.c_synop }
                        </div>
                    </td>
            </table>
        </div>

        <hr>

        <div id="gibonjungbo"> 관련 영상 </div>
        <!-- 16:9 aspect ratio -->
        <div class="embed-responsive embed-responsive-16by9">
            <iframe class="embed-responsive-item" src="${ contents.c_video }"></iframe>
        </div>

        <hr style="margin-top: 30px;">

        <div id="gibonjungbo" style="margin-bottom: 10px;"> 출연 제작 </div>

        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="false">
            <!--carousel-->
            <div class="carousel-inner" style="height:290px;">
                <div class="carousel-item active">
                    <!--carousel page 1 start-->
                    <div class="row" id="inmul">
                    <c:forEach var="contentsPeople" items="${ contentsPeople }" begin="0" end="0">
                        <div class="col-actor" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
                             	<img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">	
                            </div>
                        </div>
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
					</c:forEach>
					<c:forEach var="contentsPeople" items="${ contentsPeople }" begin="1" end="1"> 	
                        <div class="col-actor" style="padding-left: 0px" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
                                <img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">
                            </div>
                        </div> 
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
                    </c:forEach>
                    </div>
                    <hr style="margin: 0px;">
                    <div class="row" id="inmul">
                    <c:forEach var="contentsPeople" items="${ contentsPeople }" begin="2" end="2">
                        <div class="col-actor" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
                            	<img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">
                            </div>
                        </div>
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
					</c:forEach>
					<c:forEach var="contentsPeople" items="${ contentsPeople }" begin="3" end="3">
                        <div class="col-actor" style="padding-left: 0px" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
								<img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">
                            </div>
                        </div>
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
                    </c:forEach>
                    </div>
                    <hr style="margin: 0px;">
                    <div class="row" id="inmul">
                    <c:forEach var="contentsPeople" items="${ contentsPeople }" begin="4" end="4">
                        <div class="col-actor" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
                                <img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">
                            </div>
                        </div>
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
                    </c:forEach>
                    <c:forEach var="contentsPeople" items="${ contentsPeople }" begin="5" end="5">
                        <div class="col-actor" style="padding-left: 0px" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
                                <img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">
                            </div>
                        </div>
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
                    </c:forEach>
                    </div>
                </div>
                
                <!--carousel page 1 end-->

                 <div class="carousel-item">
                    <!--carousel page 1 start-->
                    <div class="row" id="inmul">
                    <c:forEach var="contentsPeople" items="${ contentsPeople }" begin="6" end="6">
                        <div class="col-actor" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
                            	<img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">
                            </div>
                        </div>
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
					</c:forEach>
					<c:forEach var="contentsPeople" items="${ contentsPeople }" begin="7" end="7"> 	
                        <div class="col-actor" style="padding-left: 0px" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
                            	<img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">
                            </div>
                        </div> 
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
                    </c:forEach>
                    </div>
                    <hr style="margin: 0px;">
                    <div class="row" id="inmul">
                    <c:forEach var="contentsPeople" items="${ contentsPeople }" begin="8" end="8">
                        <div class="col-actor" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
                            	<img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">
                            </div>
                        </div>
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
					</c:forEach>
					<c:forEach var="contentsPeople" items="${ contentsPeople }" begin="9" end="9">
                        <div class="col-actor" style="padding-left: 0px" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
                                <img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">
                            </div>
                        </div>
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
                    </c:forEach>
                    </div>
                    <hr style="margin: 0px;">
                    <div class="row" id="inmul">
                    <c:forEach var="contentsPeople" items="${ contentsPeople }" begin="10" end="10">
                        <div class="col-actor" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
                                <img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">
                            </div>
                        </div>
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
                    </c:forEach>
                    <c:forEach var="contentsPeople" items="${ contentsPeople }" begin="11" end="11">
                        <div class="col-actor" style="padding-left: 0px" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div class="sajin">
                            	<img src="${ path }/resources/upload/people/${ contentsPeople.people_renamed_filename }" alt="">
                            </div>
                        </div>
                        <div class="col-name" OnClick="location.href='${ path }/people/people?people_no=${ contentsPeople.people_no }'">
                            <div style="font-size:1em; margin-top: 5px;">${ contentsPeople.people_name }</div>
                            <div style="color:gray; font-size:0.9em;">${ contentsPeople.cp_role }</div>
                        </div>
                    </c:forEach>
                    </div>
                </div>
                <!--carousel page 2 end-->
            </div>
            <c:if test="${fn:length(contentsPeople) > 5}"> 
            <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </button>
            </c:if>
        </div>
        <!--carousel-->

        <hr>

        <div id="gibonjungbo"> 평균 별점 </div>

        <div class="container" style="margin-bottom: 50px;">
            <div class="chart" style="margin:auto; height: 500px;">
            	<div class="bar" <c:if test="${ rateResult._05 == 0 }">data-bar-value="1"</c:if> data-bar-value="${ rateResult._05 }0"><span class="bar__name"></span></div>
            	<div class="bar" <c:if test="${ rateResult._1 == 0 }">data-bar-value="1"</c:if> data-bar-value="${ rateResult._1 }0"><span class="bar__name">1</span></div>
            	<div class="bar" <c:if test="${ rateResult._15 == 0 }">data-bar-value="1"</c:if> data-bar-value="${ rateResult._15 }0"><span class="bar__name"></span></div>
            	<div class="bar" <c:if test="${ rateResult._2 == 0 }">data-bar-value="1"</c:if> data-bar-value="${ rateResult._2 }0"><span class="bar__name">2</span></div>
            	<div class="bar" <c:if test="${ rateResult._25 == 0 }">data-bar-value="1"</c:if> data-bar-value="${ rateResult._25 }0"><span class="bar__name"></span></div>
            	<div class="bar" <c:if test="${ rateResult._3 == 0 }">data-bar-value="1"</c:if> data-bar-value="${ rateResult._3 }0"><span class="bar__name">3</span></div>
            	<div class="bar" <c:if test="${ rateResult._35 == 0 }">data-bar-value="1"</c:if> data-bar-value="${ rateResult._35 }0"><span class="bar__name"></span></div>
            	<div class="bar" <c:if test="${ rateResult._4 == 0 }">data-bar-value="1"</c:if> data-bar-value="${ rateResult._4 }0"><span class="bar__name">4</span></div>
            	<div class="bar" <c:if test="${ rateResult._45 == 0 }">data-bar-value="1"</c:if> data-bar-value="${ rateResult._45 }0"><span class="bar__name"></span></div>
            	<div class="bar" <c:if test="${ rateResult._5 == 0 }">data-bar-value="1"</c:if> data-bar-value="${ rateResult._5 }0"><span class="bar__name">5</span></div>
            </div>
        </div>
        <hr style="margin-top: 30px; margin-bottom: 30px;">

        <span id="gibonjungbo"> 코멘트 </span>

        <span style="font-size: 1em; color: gray;">${ rateResult.rate_count }+</span>

        <span OnClick="location.href='${ path }/contents/contents_comments?no=${ contents.c_no }&sort=like'" 
        style="color:rgb(73,95,233); float:right; font-weight:600; font-size:1.2em; cursor:pointer;">더보기</span>
		
        <c:if test="${ rateResult.rate_count > 0 }">
        <div id="carouselExampleControlsNoTouching" class="carousel slide" data-touch="false" data-interval="false">
            <!--carousel-->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <!--carousel page 1 start-->
                    <div class="row" style="margin: 0;">
                        <c:forEach var="rate" items="${ contents.rates }" begin="0" end="2">
                        <div class="innercommentbox">
                            <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                            <div class="nickname"><c:out value="${ rate.m_id  }"/> </div>
                            <div class="commentstar">★ <c:out value="${ rate.rate_star }"/></div>
                            <hr style="margin-top: 42px;">
                            <div class="commentinner"><c:out value="${ rate.rate_comment }"/></div>
                            <a href="#" class="like-button">
                                <?xml version="1.0" encoding="utf-8"?>
                                <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z" /></svg>
                            </a>
                            <div class="likecount"><c:out value="${ rate.rate_like }"/></div>
                        </div>
                        </c:forEach>
                        <c:forEach var="rate" items="${ contents.rates }" begin="3" end="3">
                        <div class="innercommentbox-right">
                            <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                            <div class="nickname"><c:out value="${ rate.m_id  }"/> </div>
                            <div class="commentstar" style="left:126px;">★ <c:out value="${ rate.rate_star }"/></div>
                            <hr style="margin-top: 42px;">
                            <div class="commentinner"><c:out value="${ rate.rate_comment }"/></div>
                            <a href="#" class="like-button">
                                <?xml version="1.0" encoding="utf-8"?>
                                <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z" /></svg>
                            </a>
                            <div class="likecount"><c:out value="${ rate.rate_like }"/></div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <!--carousel page 1 end-->

                <div class="carousel-item">
                    <!--carousel page 2 start-->
                    <div class="row" style="margin: 0;">
	                	<c:forEach var="rate" items="${ contents.rates }" begin="3" end="5">
                        <div class="innercommentbox">
                            <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                            <div class="nickname"><c:out value="${ rate.m_id  }"/> </div>
                            <div class="commentstar">★ <c:out value="${ rate.rate_star }"/></div>
                            <hr style="margin-top: 42px;">
                            <div class="commentinner"><c:out value="${ rate.rate_comment }"/></div>
                            <a href="#" class="like-button">
                                <?xml version="1.0" encoding="utf-8"?>
                                <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z" /></svg>
                            </a>
                            <div class="likecount"><c:out value="${ rate.rate_like }"/></div>
                        </div>
                        </c:forEach>
                        <c:forEach var="rate" items="${ contents.rates }" begin="6" end="6">
                        <div class="innercommentbox-right">
                            <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                            <div class="nickname"><c:out value="${ rate.m_id  }"/> </div>
                            <div class="commentstar" style="left:126px;">★ <c:out value="${ rate.rate_star }"/></div>
                            <hr style="margin-top: 42px;">
                            <div class="commentinner"><c:out value="${ rate.rate_comment }"/></div>
                            <a href="#" class="like-button">
                                <?xml version="1.0" encoding="utf-8"?>
                                <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z" /></svg>
                            </a>
                            <div class="likecount"><c:out value="${ rate.rate_like }"/></div>
                        </div>
                        </c:forEach>
                        <div class="row bg-danger" style="height:300px;"></div>
                    </div>
                </div>
                <!--carousel page 2 end-->
                
                <div class="carousel-item">
                    <!--carousel page 2 start-->
                    <div class="row" style="margin: 0;">
	                	<c:forEach var="rate" items="${ contents.rates }" begin="6" end="8">
                        <div class="innercommentbox">
                            <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                            <div class="nickname"><c:out value="${ rate.m_id  }"/> </div>
                            <div class="commentstar">★ <c:out value="${ rate.rate_star }"/></div>
                            <hr style="margin-top: 42px;">
                            <div class="commentinner"><c:out value="${ rate.rate_comment }"/></div>
                            <a href="#" class="like-button">
                                <?xml version="1.0" encoding="utf-8"?>
                                <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z" /></svg>
                            </a>
                            <div class="likecount"><c:out value="${ rate.rate_like }"/></div>
                        </div>
                        </c:forEach>
                        <c:forEach var="rate" items="${ contents.rates }" begin="9" end="9">
                        <div class="innercommentbox-right">
                            <div class="userimg"><img src="https://emojigraph.org/media/apple/dog-face_1f436.png" alt=""></div>
                            <div class="nickname"><c:out value="${ rate.m_id }"/> </div>
                            <div class="commentstar" style="left:126px;">★ <c:out value="${ rate.rate_star }"/></div>
                            <hr style="margin-top: 42px;">
                            <div class="commentinner"><c:out value="${ rate.rate_comment }"/></div>
                            <a href="#" class="like-button">
                                <?xml version="1.0" encoding="utf-8"?>
                                <svg width="20" height="20" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M320 1344q0-26-19-45t-45-19q-27 0-45.5 19t-18.5 45q0 27 18.5 45.5t45.5 18.5q26 0 45-18.5t19-45.5zm160-512v640q0 26-19 45t-45 19h-288q-26 0-45-19t-19-45v-640q0-26 19-45t45-19h288q26 0 45 19t19 45zm1184 0q0 86-55 149 15 44 15 76 3 76-43 137 17 56 0 117-15 57-54 94 9 112-49 181-64 76-197 78h-129q-66 0-144-15.5t-121.5-29-120.5-39.5q-123-43-158-44-26-1-45-19.5t-19-44.5v-641q0-25 18-43.5t43-20.5q24-2 76-59t101-121q68-87 101-120 18-18 31-48t17.5-48.5 13.5-60.5q7-39 12.5-61t19.5-52 34-50q19-19 45-19 46 0 82.5 10.5t60 26 40 40.5 24 45 12 50 5 45 .5 39q0 38-9.5 76t-19 60-27.5 56q-3 6-10 18t-11 22-8 24h277q78 0 135 57t57 135z" /></svg>
                            </a>
                            <div class="likecount"><c:out value="${ rate.rate_like }"/></div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <!--carousel page 3 end-->
            </div>
            <!--carousel-inner end-->
            <div style="width: 5%;" class="my-5">
                <button style="width: 5%; height:100px; margin-top:130px; margin-left: -29px;" class="carousel-control-prev" type="button" data-target="#carouselExampleControlsNoTouching" data-slide="prev">
                    <img class="next" src="${path}/resources/img/ranking/slide-left.png" alt="" style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </button>
                <button style="width: 5%; height:100px; margin-top:130px; margin-right: -29px;" class="carousel-control-next" type="button" data-target="#carouselExampleControlsNoTouching" data-slide="next">
                    <img class="next" src="${path}/resources/img/ranking/slide-right.png" alt="" style="box-sizing: border-box; border-radius: 50%; box-shadow: rgb(0 0 0 / 40%) 0px 0px 4px 0px;">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </button>
            </div>
        </div>
 		</c:if>
 		<div style="height:280px; text-align:center; color:gray; padding-top:150px; font-size:1.1em;">등록된 코멘트가 없습니다</div>
        
        <!--carousel-->
    </div>
    <!--회색 박스 끝 -->
    
    <div class="container">
    <button type="button" class="btn mt-3 mb-3"  onclick="location.href='${path}/contents/contents_update?no=${ contents.c_no }'"
    style="float:right; background-color:rgb(73,95,233); color:white;">컨텐츠 수정</button>
	</div>
	
    <div style="height: 35px;"></div>
	
	<script>
	var likeval = ${ confirmLike };
	
	let mNo = '${ loginMember.m_no }';
	let cNo = '${ contents.c_no }';
	
	
		
	$('.hey').click(function() {
		$.ajax({
			type :'post',
			url : '<c:url value ="/contents/contents_detail/likeUp"/>',
			//contentType: 'application/json',
			data: { 
				mNo : "${ loginMember.m_no }",
				cNo : "${ contents.c_no }" 
			},
			success : function(confirmLike) {
				if(confirmLike == 0){
	             		alert("북마크 완료");
	                   
	            }
	            else if (confirmLike == 1){
	             	alert("북마크 취소");
	                  
	            }
			}
		})// 아작스 끝
	})

	
	</script>

	<script>
	function loginCheck() {
		 if(${ empty loginMember }) {
       		alert("로그인 후 이용해주세요");
       		location.href = '${ path }/member/login';
       	}
	}
	</script>
	
	<script>
	function rateCheck() {
		if(${ empty loginMember }) {
       		alert("로그인 후 이용해주세요");
       		location.href = '${ path }/member/login';
       	} 
		else if (${ confirmRate } > 0) {
       		alert("이미 코멘트 하셨습니다");
       		location.href = '${ path }/contents/contents_comments?no=${ contents.c_no }&sort=me'
       	}
	}
	</script>

<!-- contents_detail JS --> 	
<script type="text/javascript" src="${path}/resources/js/contents/contents_detail.js"></script>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>