<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>

        <div class="col-2" id="sidebar_col">
          <nav id="sidebarMenu" class="d-md-block sidebar collapse">
            <div class="sidebar-sticky pt-5">
              <ul class="nav flex-column">
                <li class="nav-item">
                  <a class="nav-link" role="button" href="${path}/admin/admin_dashboard">
                    <h5>
                      관리자 페이지
                    </h5>
                  </a>
                  <hr>
                </li>


                <li class="nav-item">
                  <a class="nav-link" role="button" href="${path}/admin/admin_member">
                      <p id="admin_nav_title"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                        회원 관리</p>
                    </a>
                </li>
                
                
                <li class="nav-item">
				  <a class="nav-link" data-toggle="collapse" href="#admin_content_collapse" role="button" aria-expanded="false" aria-controls="admin_content_collapse">
                    <p id="admin_nav_title"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                      컨텐츠 관리</p>
                    </a>
                </li>
                
                <div class="collapse multi-collapse" id="admin_content_collapse">
                  <a class="nav-link" role="button" href="${path}/admin/admin_content" id="admin_nav_sublist"><li id="admin_nav_subtitle">
                    - 컨텐츠 정보 관리</li></a>
                  <a class="nav-link" role="button" href="${path}/admin/admin_people" id="admin_nav_sublist"><li id="admin_nav_subtitle">
                    - 인물페이지 관리</li></a>
                  <br>
                </div>

                
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#admin_goods_collapse" role="button" aria-expanded="false" aria-controls="admin_goods_collapse">
                      <p id="admin_nav_title"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
                        상품 관리</p>
                      </a>
                    </li>
                <div class="collapse multi-collapse" id="admin_goods_collapse">
                  <a class="nav-link" role="button"  href="${path}/admin/admin_goods" id="admin_nav_sublist"><li id="admin_nav_subtitle">
                    - 상품 정보 관리</li></a>
                  <a class="nav-link" role="button" href="${path}/admin/admin_goods_order" id="admin_nav_sublist"><li id="admin_nav_subtitle">
                    - 상품 주문 관리</li></a>
                  <br>
                </div>

                  <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#admin_board_collapse" role="button" aria-expanded="false" aria-controls="admin_board_collapse">
                      <p id="admin_nav_title"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal-text" viewBox="0 0 16 16">
                        <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
                        <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
                        <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
                      </svg>
                        게시판 관리</p>
                      </a>
                    </li>
                <div class="collapse multi-collapse" id="admin_board_collapse">
                  <a class="nav-link" role="button"  href="${path}/admin/admin_freeboard" id="admin_nav_sublist"><li id="admin_nav_subtitle">
                    - 자유게시판 관리</li></a>
                  <a class="nav-link" role="button" href="${path}/admin/admin_qna" id="admin_nav_sublist"><li id="admin_nav_subtitle">
                    - 문의게시판 관리</li></a>
                  <a class="nav-link" role="button" href="${path}/admin/admin_notice_list" id="admin_nav_sublist"><li id="admin_nav_subtitle">
                    - 공지사항 관리</li></a>

                  <br>
                </div>
                  
                <li class="nav-item">
                  <a class="nav-link" role="button" href="${path}/admin/admin_total_views?no=00">
                    <p id="admin_nav_title"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2-data" viewBox="0 0 16 16">
                      <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5h3Z"/>
                      <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5v-12Z"/>
                      <path d="M10 7a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0V7Zm-6 4a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm4-3a1 1 0 0 0-1 1v3a1 1 0 1 0 2 0V9a1 1 0 0 0-1-1Z"/>
                    </svg> 통계 확인</p>
                  </a>
                </li>
              </ul>
            </div>
          </nav>
		</div>
