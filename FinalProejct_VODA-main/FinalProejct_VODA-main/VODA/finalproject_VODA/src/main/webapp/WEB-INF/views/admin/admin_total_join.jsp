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

    <!-- btn CSS -->
    <link rel="stylesheet" href="${path}/resources/css/common/btn.css">
    
    <!-- btn CSS -->
    <link rel="stylesheet" href="${path}/resources/css/mypage/join.css"> 

    <!--BootStrap CSS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!--BootStrap JS-->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!-- jQuery -->
    <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>

    <!-- 관리자 페이지 메인헤드 -->
    <div class="container">
      <div class="row">
      
	    <!-- 관리자 페이지 사이드바 -->
        <jsp:include page="/WEB-INF/views/admin/admin_sidebar.jsp"/>

        <!-- 관리자 페이지 메인화면 -->
        <div class="col-10 p-4">
          <h1 class="h3 mb-2 text-gray-800"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2-data" viewBox="0 0 16 16">
            <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5h3Z"/>
            <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-12Z"/>
            <path d="M10 7a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0V7Zm-6 4a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm4-3a1 1 0 0 0-1 1v3a1 1 0 1 0 2 0V9a1 1 0 0 0-1-1Z"/>
          </svg> 통계 확인 
          <select onchange="if(this.value) location.href=(this.value);" class="form-control" style="width: 15%; float: right;" >
            <option value="${path}/admin/admin_total_views?no=00" selected>데이터별</option>
            <option value="${path}/admin/admin_total_views?no=00">조회수</option>
            <option value="${path}/admin/admin_total_sales?no=00">매출액</option>
            <option value="${path}/admin/admin_total_join?no=00">가입자수</option>
          </select>
          </h1>
          <hr>
          <!-- 카드 리스트 Row -->
                <!-- Begin Page Content -->
                <div class="container-fluid">

                  <!-- DataTales Example -->

                  <div class="card shadow mb-4 col-12">
                      <div class="card-header py-3">
                          <h6 class="m-0 font-weight-bold text-primary" style="line-height: 3rem;">가입자수
                           <c:set var="no" value="no" />
                            <select class="form-control" style="width: 15%; float: right;" onchange="if(this.value) location.href=(this.value);">
                               <option value="${path}/admin/admin_total_join?no=00"selected="selected">월별</option>
							 <c:forEach var="monthlydata" items="${monthlydata}" varStatus="i">
                               <option value="${path}/admin/admin_total_join?no=${monthlydata.monthdata}">${monthlydata.monthdata}</option>
                             </c:forEach>
                            </select>
                          </h6>
                      </div>
                      <div class="card-body">
                          <div class="table">
                              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                  <thead>
                                      <tr>
                                          <th>날짜</th>
                                          <th>가입자수 (단위 : 명)</th>
                                      </tr>
                                  </thead>
                                  <tbody>
 	           						   <c:if test="${ empty list }">
										<tr>
											<td colspan="2" style="text-align: center;">
												조회된 게시글이 없습니다.
											</td>
										</tr>	
									 </c:if> 
									 <c:if test="${ not empty list }"> 	
                                    <c:forEach var="Totalview" items="${ list }"> 
                                      <tr>
                                          <td id="td"><fmt:formatDate value="${Totalview.joinDate}" type="date"></fmt:formatDate></td>
                                          <td id="td">${Totalview.joinCount}</td> 
                                          <c:set var="Total" value="${Total + Totalview.joinCount }" />
                                      </tr>
                                    </c:forEach>

                                       <tr>
                                          <th>총</th>
                                          <th><fmt:formatNumber type="number" value="${ Total }" groupingUsed="true"/></th>
                                      </tr>
                                      </c:if>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>

              </div>
              <!-- /.container-fluid -->

          </div>
          <!-- End of Main Content -->
  </div>
</div>
<hr>


<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>