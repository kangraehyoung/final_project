<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- goods_popular_list CSS-->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/product/product_popular_list.css">
<article id="mainContent" class="kakao_article">
        <h2 class="screen_out">영화 랭킹 본문</h2>
        <div class="section_ranking">
            <div class="head_section">
                <h3 class="tit_section">인기 상품 TOP 10</h3>
            </div>
            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                            <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/06/24/1000000847/1000000847_detail_055.jpg" class="img_thumb" alt="공조2: 인터내셔날">
                                        <span class="rank_num">1</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=147615" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="" class="link_txt" data-tiara-layer="moviename">[지브리] 지브리 더 아트 시리즈</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">72,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/10/43/1000001044/1000001044_main_042.jpg" class="img_thumb" alt="늑대사냥">
                                        <span class="rank_num">2</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=155115" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=155115" class="link_txt" data-tiara-layer="moviename">[지브리] 랜덤 박스(신들의세계)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">13,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/08/32/1000000965/1000000965_main_01.jpg" class="img_thumb" alt="육사오(6/45)">
                                        <span class="rank_num">3</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=142869" class="link_story" data-tiara-layer="poster">
                                            마녀배달부 키키
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=142869" class="link_txt" data-tiara-layer="moviename">[지브리] 다이컷매트(마녀 지지)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">12,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/05/19/1000001892/1000001892_detail_054.jpg" class="img_thumb" alt="탑건: 매버릭">
                                        <span class="rank_num">4</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=114329" class="link_story" data-tiara-layer="poster">
                                            하울의 움직이는 성
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=114329" class="link_txt" data-tiara-layer="moviename">[지브리] 프레임클리어파일(하울의움직이는성)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">7,200</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/08/32/1000001999/1000001999_detail_050.jpg" class="img_thumb" alt="인생은 아름다워">
                                        <span class="rank_num">5</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=133709" class="link_story" data-tiara-layer="poster">
                                            벼랑위의 포뇨
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=133709" class="link_txt" data-tiara-layer="moviename">[지브리] 뱃지(쿠로스케)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">12,600</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/06/25/1000001954/1000001954_detail_028.jpg" class="img_thumb" alt="알라딘">
                                        <span class="rank_num">6</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=115601" class="link_story" data-tiara-layer="poster">
                                            이웃집 토토로
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=115601" class="link_txt" data-tiara-layer="moviename">[지브리] 꽃단장시리즈(토토로_다이컷편지지)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">9,600</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/06/24/1000000653/1000000653_detail_064.jpg" class="img_thumb" alt="극장판 엄마 까투리: 도시로 간 까투리 가족">
                                        <span class="rank_num">7</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=162471" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=162471" class="link_txt" data-tiara-layer="moviename">[지브리] 오르골(뜨개질하는 가오나시)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">50,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/06/25/1000001961/1000001961_detail_013.jpg" class="img_thumb" alt="인생은 뷰티풀: 비타돌체">
                                        <span class="rank_num">8</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=163053" class="link_story" data-tiara-layer="poster">
                                            이웃집 토토로
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=163053" class="link_txt" data-tiara-layer="moviename">[지브리] 투명소토토로시리즈(귀걸이)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">26,600</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/06/24/1000000851/1000000851_detail_07.jpg" class="img_thumb" alt="오! 마이 고스트">
                                        <span class="rank_num">9</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=148313" class="link_story" data-tiara-layer="poster">
                                            벼랑위의 포뇨
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=148313" class="link_txt" data-tiara-layer="moviename">[지브리] 포뇨 애니메이션북(개정판)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">15,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>                
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/21/07/29/1000001476/1000001476_detail_098.jpg" class="img_thumb" alt="시맨틱 에러: 더 무비">
                                        <span class="rank_num">10</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=161454" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=161454" class="link_txt" data-tiara-layer="moviename">[지브리] 빈티지트레이 (센치 하쿠의오니기리)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">11,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                    </ol>
            </div>
    </article>
    <article id="mainContent" class="kakao_article">
        <h2 class="screen_out">영화 랭킹 본문</h2>
        <div class="section_ranking">
            <div class="head_section">
                <h3 class="tit_section">여성 인기 상품 TOP 10</h3>
            </div>
            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                            <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/06/24/1000000847/1000000847_detail_055.jpg" class="img_thumb" alt="공조2: 인터내셔날">
                                        <span class="rank_num">1</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=147615" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="" class="link_txt" data-tiara-layer="moviename">[지브리] 지브리 더 아트 시리즈</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">72,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/10/43/1000001044/1000001044_main_042.jpg" class="img_thumb" alt="늑대사냥">
                                        <span class="rank_num">2</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=155115" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=155115" class="link_txt" data-tiara-layer="moviename">[지브리] 랜덤 박스(신들의세계)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">13,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/08/32/1000000965/1000000965_main_01.jpg" class="img_thumb" alt="육사오(6/45)">
                                        <span class="rank_num">3</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=142869" class="link_story" data-tiara-layer="poster">
                                            마녀배달부 키키
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=142869" class="link_txt" data-tiara-layer="moviename">[지브리] 다이컷매트(마녀 지지)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">12,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/05/19/1000001892/1000001892_detail_054.jpg" class="img_thumb" alt="탑건: 매버릭">
                                        <span class="rank_num">4</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=114329" class="link_story" data-tiara-layer="poster">
                                            하울의 움직이는 성
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=114329" class="link_txt" data-tiara-layer="moviename">[지브리] 프레임클리어파일(하울의움직이는성)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">7,200</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/08/32/1000001999/1000001999_detail_050.jpg" class="img_thumb" alt="인생은 아름다워">
                                        <span class="rank_num">5</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=133709" class="link_story" data-tiara-layer="poster">
                                            벼랑위의 포뇨
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=133709" class="link_txt" data-tiara-layer="moviename">[지브리] 뱃지(쿠로스케)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">12,600</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/06/25/1000001954/1000001954_detail_028.jpg" class="img_thumb" alt="알라딘">
                                        <span class="rank_num">6</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=115601" class="link_story" data-tiara-layer="poster">
                                            이웃집 토토로
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=115601" class="link_txt" data-tiara-layer="moviename">[지브리] 꽃단장시리즈(토토로_다이컷편지지)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">9,600</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/06/24/1000000653/1000000653_detail_064.jpg" class="img_thumb" alt="극장판 엄마 까투리: 도시로 간 까투리 가족">
                                        <span class="rank_num">7</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=162471" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=162471" class="link_txt" data-tiara-layer="moviename">[지브리] 오르골(뜨개질하는 가오나시)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">50,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/06/25/1000001961/1000001961_detail_013.jpg" class="img_thumb" alt="인생은 뷰티풀: 비타돌체">
                                        <span class="rank_num">8</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=163053" class="link_story" data-tiara-layer="poster">
                                            이웃집 토토로
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=163053" class="link_txt" data-tiara-layer="moviename">[지브리] 투명소토토로시리즈(귀걸이)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">26,600</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/06/24/1000000851/1000000851_detail_07.jpg" class="img_thumb" alt="오! 마이 고스트">
                                        <span class="rank_num">9</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=148313" class="link_story" data-tiara-layer="poster">
                                            벼랑위의 포뇨
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=148313" class="link_txt" data-tiara-layer="moviename">[지브리] 포뇨 애니메이션북(개정판)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">15,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>                
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/21/07/29/1000001476/1000001476_detail_098.jpg" class="img_thumb" alt="시맨틱 에러: 더 무비">
                                        <span class="rank_num">10</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=161454" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=161454" class="link_txt" data-tiara-layer="moviename">[지브리] 빈티지트레이 (센치 하쿠의오니기리)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">11,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                    </ol>
            </div>
    </article>
    <article id="mainContent" class="kakao_article">
        <h2 class="screen_out">영화 랭킹 본문</h2>
        <div class="section_ranking">
            <div class="head_section">
                <h3 class="tit_section">남성 인기 상품 TOP 10</h3>
            </div>
            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                            <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/06/24/1000000847/1000000847_detail_055.jpg" class="img_thumb" alt="공조2: 인터내셔날">
                                        <span class="rank_num">1</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=147615" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="" class="link_txt" data-tiara-layer="moviename">[지브리] 지브리 더 아트 시리즈</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">72,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/10/43/1000001044/1000001044_main_042.jpg" class="img_thumb" alt="늑대사냥">
                                        <span class="rank_num">2</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=155115" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=155115" class="link_txt" data-tiara-layer="moviename">[지브리] 랜덤 박스(신들의세계)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">13,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/08/32/1000000965/1000000965_main_01.jpg" class="img_thumb" alt="육사오(6/45)">
                                        <span class="rank_num">3</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=142869" class="link_story" data-tiara-layer="poster">
                                            마녀배달부 키키
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=142869" class="link_txt" data-tiara-layer="moviename">[지브리] 다이컷매트(마녀 지지)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">12,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/05/19/1000001892/1000001892_detail_054.jpg" class="img_thumb" alt="탑건: 매버릭">
                                        <span class="rank_num">4</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=114329" class="link_story" data-tiara-layer="poster">
                                            하울의 움직이는 성
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=114329" class="link_txt" data-tiara-layer="moviename">[지브리] 프레임클리어파일(하울의움직이는성)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">7,200</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/08/32/1000001999/1000001999_detail_050.jpg" class="img_thumb" alt="인생은 아름다워">
                                        <span class="rank_num">5</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=133709" class="link_story" data-tiara-layer="poster">
                                            벼랑위의 포뇨
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=133709" class="link_txt" data-tiara-layer="moviename">[지브리] 뱃지(쿠로스케)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">12,600</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/06/25/1000001954/1000001954_detail_028.jpg" class="img_thumb" alt="알라딘">
                                        <span class="rank_num">6</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=115601" class="link_story" data-tiara-layer="poster">
                                            이웃집 토토로
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=115601" class="link_txt" data-tiara-layer="moviename">[지브리] 꽃단장시리즈(토토로_다이컷편지지)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">9,600</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/06/24/1000000653/1000000653_detail_064.jpg" class="img_thumb" alt="극장판 엄마 까투리: 도시로 간 까투리 가족">
                                        <span class="rank_num">7</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=162471" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=162471" class="link_txt" data-tiara-layer="moviename">[지브리] 오르골(뜨개질하는 가오나시)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">50,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/22/06/25/1000001961/1000001961_detail_013.jpg" class="img_thumb" alt="인생은 뷰티풀: 비타돌체">
                                        <span class="rank_num">8</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=163053" class="link_story" data-tiara-layer="poster">
                                            이웃집 토토로
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=163053" class="link_txt" data-tiara-layer="moviename">[지브리] 투명소토토로시리즈(귀걸이)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">26,600</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/20/06/24/1000000851/1000000851_detail_07.jpg" class="img_thumb" alt="오! 마이 고스트">
                                        <span class="rank_num">9</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=148313" class="link_story" data-tiara-layer="poster">
                                            벼랑위의 포뇨
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=148313" class="link_txt" data-tiara-layer="moviename">[지브리] 포뇨 애니메이션북(개정판)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">15,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>                
                        <li>
                            <div class="item_poster">
                                <div class="thumb_item">
                                    <div class="poster_movie">
                                            <img src="http://dwmdotori.godohosting.com/data/goods/21/07/29/1000001476/1000001476_detail_098.jpg" class="img_thumb" alt="시맨틱 에러: 더 무비">
                                        <span class="rank_num">10</span>
                                            
                                    </div>
                                    <div class="poster_info">
                                        <a href="/moviedb/main?movieId=161454" class="link_story" data-tiara-layer="poster">
                                            센과 치히로의 행방불명
                                        </a>
                                    </div>
                                </div>
                                <div class="thumb_cont">
                                    <strong class="tit_item">
                                        <a href="/moviedb/main?movieId=161454" class="link_txt" data-tiara-layer="moviename">[지브리] 빈티지트레이 (센치 하쿠의오니기리)</a>
                                    </strong>
                                    <span class="txt_append">
                                        <span class="info_txt">가격<span class="txt_grade">11,000</span></span>
                                    </span>
                                </div>
                            </div>
                        </li>
                    </ol>
            </div>
    </article>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>