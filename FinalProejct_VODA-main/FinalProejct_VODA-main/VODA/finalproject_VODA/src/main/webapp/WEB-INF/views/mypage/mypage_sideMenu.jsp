<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<div class="mySideMenu">
                    <h5 style="font-weight: 600;" onclick="location.href='${path}/mypage/main'">마이 페이지</h5>
                    <hr>
                    <nav id="sidebarMenu" class="d-md-block sidebar collapse">
                        <div>
                            <ul class="nav flex-column">

                                <li class="nav-item mt-2">
                                    <a class="nav-link mySideMenuTitle" role="button" data-toggle="collapse"
                                        href="#pay_collapse" role="button" aria-expanded="false"
                                        aria-controls="admin_goods_collapse">
                                        <p class="mb-1">구매 정보</p>
                                    </a>
                                </li>

                                <div class="collapse show multi-collapse" id="pay_collapse">
                                    <a class="nav-link mySideMenuSubTitle px-2" role="button" href="${path}/mypage/payList">
                                        <li>
                                            - 주문 / 배송 조회</li>
                                    </a>
                                    <a class="nav-link mySideMenuSubTitle px-2" role="button" href="${path}/mypage/payCancelList">
                                        <li>
                                            - 취소 / 환불 내역</li>
                                    </a>
                                </div>

                                <li class="nav-item mt-2">
                                    <a class="nav-link mySideMenuTitle" role="button" data-toggle="collapse"
                                        href="#member_collapse" role="button" aria-expanded="false"
                                        aria-controls="admin_goods_collapse">
                                        <p class="mb-1">회원 정보</p>
                                    </a>
                                </li>

                                <div class="collapse show multi-collapse" id="member_collapse">
                                    <a class="nav-link mySideMenuSubTitle px-2" role="button" href="${path}/mypage/memberInfo">
                                        <li>
                                            - 회원 정보 조회 / 변경</li>
                                    </a>
                                    <a class="nav-link mySideMenuSubTitle px-2" role="button" href="${path}/mypage/updatePwd">
                                        <li>
                                            - 비밀번호 변경</li>
                                    </a>
                                    <a class="nav-link mySideMenuSubTitle px-2" role="button" href="${path}/mypage/deleteMember">
                                        <li>
                                            - 회원 탈퇴</li>
                                    </a>
                                </div>

                                <li class="nav-item mt-2">
                                    <a class="nav-link mySideMenuTitle" role="button" data-toggle="collapse"
                                        href="#contents_collapse" role="button" aria-expanded="false"
                                        aria-controls="admin_goods_collapse">
                                        <p class="mb-1">나의 컨텐츠</p>
                                    </a>
                                </li>

                                <div class="collapse show multi-collapse" id="contents_collapse">
                                    <a class="nav-link mySideMenuSubTitle px-2" role="button" href="${path}/mypage/dibsContent">
                                        <li>
                                            - 찜한 컨텐츠</li>
                                    </a>
                                    <a class="nav-link mySideMenuSubTitle px-2" role="button" href="${path}/mypage/reviewContent">
                                        <li>
                                            - 리뷰한 컨텐츠</li>
                                    </a>
                                </div>

                                <li class="nav-item mt-2">
                                    <a class="nav-link mySideMenuTitle" role="button" data-toggle="collapse"
                                        href="#board_collapse" role="button" aria-expanded="false"
                                        aria-controls="admin_goods_collapse">
                                        <p class="mb-1">내가 쓴 글</p>
                                    </a>
                                </li>

                                <div class="collapse show multi-collapse" id="board_collapse">
                                    <a class="nav-link mySideMenuSubTitle px-2" role="button" href="${path}/mypage/writeFreeBoard">
                                        <li>
                                            - 자유게시글 조회</li>
                                    </a>
                                    <a class="nav-link mySideMenuSubTitle px-2" role="button" href="${path}/mypage/writeQuestionBoard">
                                        <li>
                                            - 문의사항 조회</li>
                                    </a>
                                </div>
                            </ul>
                        </div>
                    </nav>
                </div>