<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- contents_movie CSS-->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/contents/contents_movie.css">

    <article id="mainContent" class="kakao_article">
		
		<c:if test="${ type == 'movie'}">  
	        <table class="mt-5">
	            <tr>
	                <td class="new-contents-info" style="width: 250px;">MOVIE CONTENTS</td>
	                <td style="width: 1150px;">
	                    <hr class="contents-line">
	                </td>
	            </tr>
	        </table>
    	</c:if>
    	
    	<c:if test="${ type == 'tv'}">  
	        <table class="mt-5">
	            <tr>
	                <td class="new-contents-info" style="width: 250px;">TV CONTENTS</td>
	                <td style="width: 1150px;">
	                    <hr class="contents-line">
	                </td>
	            </tr>
	        </table>
    	</c:if>
    	
    	<c:if test="${ type == 'book'}">  
	        <table class="mt-5">
	            <tr>
	                <td class="new-contents-info" style="width: 250px;">BOOK CONTENTS</td>
	                <td style="width: 1150px;">
	                    <hr class="contents-line">
	                </td>
	            </tr>
	        </table>
    	</c:if>
    	
    	<c:if test="${ type == 'webtoon'}">  
	        <table class="mt-5">
	            <tr>
	                <td class="new-contents-info" style="width: 300px;">WEBTOON CONTENTS</td>
	                <td style="width: 1150px;">
	                    <hr class="contents-line">
	                </td>
	            </tr>
	        </table>
    	</c:if>
    	
    	<c:if test="${ sort == 'new'}">
    	<div class="mainsort">최신순</div>
		<div class="mainsort" style="margin-right:10px; background-color:rgba(235,236,246); color:gray;" OnClick="location.href='${ path }/contents/contents?type=${ type }&sort=like'">인기순</div>
    	</c:if>
    	
    	<c:if test="${ sort == 'like'}">
    	<div class="mainsort" style="background-color:rgba(235,236,246); color:gray;" OnClick="location.href='${ path }/contents/contents?type=${ type }&sort=new'">최신순</div>
		<div class="mainsort" style="margin-right:10px;">인기순</div>
    	</c:if>
    
    	
        <div class="section_ranking" style="clear:both;">
            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                	<c:if test="${ not empty list }">
	                	<c:forEach var="contents" items="${ list }">
		                    <li>
		                        <div class="item_poster" onclick="location.href='${path}/contents/contents_detail?no=${ contents.c_no }'">
		                            <div class="thumb_item">
		                                <div class="poster_movie">
		                                    <img src="${ path }/resources/uploadFiles/contents/${ contents.c_pimg }" class="img_thumb">
		                                    <span class="txt_tag">
		                                        <span class="ico_movie ico_see see${ contents.c_age }">${ contents.c_age }세이상관람가</span>
		                                    </span>
		                                </div>
		                                <div class="poster_info">
		                                    <a href="${path}/contents/contents_detail?no=${ contents.c_no }" class="link_story" data-tiara-layer="poster">
		                                        ${ contents.c_synop }
		                                    </a>
		                                </div>
		                            </div>
		                            <div class="thumb_cont">
		                                <strong class="tit_item">
		                                    <a href="#" class="link_txt" data-tiara-layer="moviename">${ contents.c_title }</a>
		                                </strong>
		                                <span class="txt_append">
		                                	 <c:if test="${ contents.rate_star == 0 }">
		                                	 	<span class="info_txt">등록 된 평점이 없어요</span>
		                                	 </c:if>
		                                	 <c:if test="${ contents.rate_star > 0 }">
		                                    <span class="info_txt">평점<span class="txt_grade">${ contents.rate_star }</span></span>
		                                   	 </c:if>
		                                </span>
		                            </div>
		                        </div>
		                    </li>
	                    </c:forEach>
                    </c:if>
                    <!--<li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe3c34791317eefee49caec94c87a3b1bb24b0e8d" class="img_thumb" alt="늑대사냥">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see19">청소년관람불가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=155115" class="link_story" data-tiara-layer="poster">
                                        인간 스스로 먹잇감이 되다동남아시아로 도피한 인터폴 수배자들을 이송할 움직이는 교도소 ‘프론티어 타이탄’.극악무도한 이들과
                                        베테랑 형사들이 필리핀 마닐라 항구에 모이고탈출을 꿈꾸는 종두(서인국), 한국으로 돌아가야만 하는 도일(장동윤)을
                                        비롯해이들은 각자의 목적과 경계심을 품고 탑승한다.한국으로 향하던 중, 태평양 한 가운데에서 이들에게는지금까지 보지 못한
                                        극한의 상황과 마주하게 되는데…태평양 한 가운데의 지옥, 누가 살아남을 것인가?
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=155115" class="link_txt" data-tiara-layer="moviename">늑대사냥</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">9.0</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Ff5c62530ef4f57a469bdb51cc065f2c47503f9d8" class="img_thumb" alt="육사오(6/45)">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see12">12세이상관람가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=142869" class="link_story" data-tiara-layer="poster">
                                        “45개 번호 중에 6개 맞히면 1등인 육사오라는 종이쪼가리,내가 주웠지 말입니다”우연히 1등 당첨 로또를 주운 말년 병장
                                        ‘천우’.심장이 터질듯한 설렘도 잠시, 순간의 실수로 바람을 타고 군사분계선을 넘어간 로또.바사삭 부서진 멘탈을
                                        부여잡고…기필코 다시 찾아야 한다!우연히 남쪽에서 넘어온 1등 당첨 로또를 주운 북한 병사 ‘용호’.이거이 남조선 인민의
                                        고혈을 쥐어 짜내는 육사오라는 종이쪼가리란 말인가?근데 무려 당첨금이 57억이라고?!당첨금을 눈앞에서 놓칠 위기에 처한
                                        ‘천우’와북에선 한낱 종이쪼가리일 뿐일 로또를 당첨금으로 바꿔야 하는 ‘용호’.여기에 예상치 못한 멤버들(?)까지 합류하고
                                        57억을 사수하기 위한 3:3팀이 결성되는데…주운 자 VS 또 주운 자아슬아슬 선 넘는 지분 협상이 시작된다!
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=142869" class="link_txt" data-tiara-layer="moviename">육사오(6/45)</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">8.4</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F4eb261668eb43a125d0adc250a89adb48216c005" class="img_thumb" alt="탑건: 매버릭">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see12">12세이상관람가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=114329" class="link_story" data-tiara-layer="poster">
                                        한순간의 실수도 용납되지 않는 하늘 위, 가장 압도적인 비행이 시작된다!최고의 파일럿이자 전설적인 인물 매버릭(톰
                                        크루즈)은 자신이 졸업한 훈련학교 교관으로 발탁된다.그의 명성을 모르던 팀원들은 매버릭의 지시를 무시하지만 실전을 방불케
                                        하는 상공 훈련에서 눈으로 봐도 믿기 힘든 전설적인 조종 실력에 모두가 압도된다.매버릭의 지휘아래 견고한 팀워크를 쌓아가던
                                        팀원들에게 국경을 뛰어넘는 위험한 임무가 주어지자매버릭은 자신이 가르친 동료들과 함께 마지막이 될 지 모를 하늘 위 비행에
                                        나서는데…
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=114329" class="link_txt" data-tiara-layer="moviename">탑건: 매버릭</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">9.4</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F292bb497493d7d227ecbf994742c1ff9f90f10bb" class="img_thumb" alt="인생은 아름다워">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see12">12세이상관람가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=133709" class="link_story" data-tiara-layer="poster">
                                        내 생애 가장 빛나는 선물모든 순간이 노래가 된다!무뚝뚝한 남편 ‘진봉’과 무심한 아들 딸을 위해 헌신하며 살아온
                                        ‘세연’은어느 날 자신에게 시간이 얼마 남지 않았다는 것을 알게 된다.한 치 앞도 알 수 없는 인생에 서글퍼진 ‘세연’은
                                        마지막 생일선물로문득 떠오른 자신의 첫사랑을 찾아 달라는 황당한 요구를 한다.막무가내로 우기는 아내의 고집에 어쩔 수 없이
                                        여행길에 따라나선 ‘진봉’은아무런 단서도 없이 이름 석 자만 가지고 무작정 전국 방방곡곡을 누빈다.시도 때도 없이 티격태격
                                        다투던 두 사람은 가는 곳곳마다자신들의 찬란했던 지난날 소중한 기억을 하나 둘 떠올리는데...과연 ‘세연’의 첫사랑은
                                        어디에 있으며 그들의 여행은 무사히 마칠 수 있을까?
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=133709" class="link_txt" data-tiara-layer="moviename">인생은 아름다워</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">8.6</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                </ol>
            </div>
    
            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F36f22dea0e0a9e0e626c549ce689558160c46ed4" class="img_thumb" alt="공조2: 인터내셔날">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see15">15세이상관람가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=147615" class="link_story" data-tiara-layer="poster">
                                        공조 이즈 백! 이번엔 삼각 공조다!남한으로 숨어든 글로벌 범죄 조직을 잡기 위해 새로운 공조 수사에 투입된 북한 형사
                                        ‘림철령’(현빈).수사 중의 실수로 사이버수사대로 전출됐던 남한 형사 ‘강진태’(유해진)는 광수대 복귀를 위해 모두가
                                        기피하는 ‘철령’의 파트너를 자청한다. 이렇게 다시 공조하게 된 ‘철령’과 ‘진태’!‘철령’과 재회한 ‘민영’(임윤아)의
                                        마음도 불타오르는 가운데,‘철령’과 ‘진태’는 여전히 서로의 속내를 의심하면서도 나름 그럴싸한 공조 수사를 펼친다.드디어
                                        범죄 조직 리더인 ‘장명준’(진선규)의 은신처를 찾아내려는 찰나,미국에서 날아온 FBI 소속 ‘잭’(다니엘 헤니)이 그들
                                        앞에 나타나는데…!아직도 짠내 나는 남한 형사,여전한 엘리트 북한 형사,그리고 FBI 소속 해외파 형사까지!각자의 목적으로
                                        뭉친 그들의 짜릿한 공조 수사가 시작된다!
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=147615" class="link_txt" data-tiara-layer="moviename">공조2: 인터내셔날</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">8.1</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe3c34791317eefee49caec94c87a3b1bb24b0e8d" class="img_thumb" alt="늑대사냥">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see19">청소년관람불가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=155115" class="link_story" data-tiara-layer="poster">
                                        인간 스스로 먹잇감이 되다동남아시아로 도피한 인터폴 수배자들을 이송할 움직이는 교도소 ‘프론티어 타이탄’.극악무도한 이들과
                                        베테랑 형사들이 필리핀 마닐라 항구에 모이고탈출을 꿈꾸는 종두(서인국), 한국으로 돌아가야만 하는 도일(장동윤)을
                                        비롯해이들은 각자의 목적과 경계심을 품고 탑승한다.한국으로 향하던 중, 태평양 한 가운데에서 이들에게는지금까지 보지 못한
                                        극한의 상황과 마주하게 되는데…태평양 한 가운데의 지옥, 누가 살아남을 것인가?
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=155115" class="link_txt" data-tiara-layer="moviename">늑대사냥</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">9.0</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Ff5c62530ef4f57a469bdb51cc065f2c47503f9d8" class="img_thumb" alt="육사오(6/45)">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see12">12세이상관람가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=142869" class="link_story" data-tiara-layer="poster">
                                        “45개 번호 중에 6개 맞히면 1등인 육사오라는 종이쪼가리,내가 주웠지 말입니다”우연히 1등 당첨 로또를 주운 말년 병장
                                        ‘천우’.심장이 터질듯한 설렘도 잠시, 순간의 실수로 바람을 타고 군사분계선을 넘어간 로또.바사삭 부서진 멘탈을
                                        부여잡고…기필코 다시 찾아야 한다!우연히 남쪽에서 넘어온 1등 당첨 로또를 주운 북한 병사 ‘용호’.이거이 남조선 인민의
                                        고혈을 쥐어 짜내는 육사오라는 종이쪼가리란 말인가?근데 무려 당첨금이 57억이라고?!당첨금을 눈앞에서 놓칠 위기에 처한
                                        ‘천우’와북에선 한낱 종이쪼가리일 뿐일 로또를 당첨금으로 바꿔야 하는 ‘용호’.여기에 예상치 못한 멤버들(?)까지 합류하고
                                        57억을 사수하기 위한 3:3팀이 결성되는데…주운 자 VS 또 주운 자아슬아슬 선 넘는 지분 협상이 시작된다!
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=142869" class="link_txt" data-tiara-layer="moviename">육사오(6/45)</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">8.4</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F4eb261668eb43a125d0adc250a89adb48216c005" class="img_thumb" alt="탑건: 매버릭">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see12">12세이상관람가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=114329" class="link_story" data-tiara-layer="poster">
                                        한순간의 실수도 용납되지 않는 하늘 위, 가장 압도적인 비행이 시작된다!최고의 파일럿이자 전설적인 인물 매버릭(톰
                                        크루즈)은 자신이 졸업한 훈련학교 교관으로 발탁된다.그의 명성을 모르던 팀원들은 매버릭의 지시를 무시하지만 실전을 방불케
                                        하는 상공 훈련에서 눈으로 봐도 믿기 힘든 전설적인 조종 실력에 모두가 압도된다.매버릭의 지휘아래 견고한 팀워크를 쌓아가던
                                        팀원들에게 국경을 뛰어넘는 위험한 임무가 주어지자매버릭은 자신이 가르친 동료들과 함께 마지막이 될 지 모를 하늘 위 비행에
                                        나서는데…
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=114329" class="link_txt" data-tiara-layer="moviename">탑건: 매버릭</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">9.4</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F292bb497493d7d227ecbf994742c1ff9f90f10bb" class="img_thumb" alt="인생은 아름다워">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see12">12세이상관람가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=133709" class="link_story" data-tiara-layer="poster">
                                        내 생애 가장 빛나는 선물모든 순간이 노래가 된다!무뚝뚝한 남편 ‘진봉’과 무심한 아들 딸을 위해 헌신하며 살아온
                                        ‘세연’은어느 날 자신에게 시간이 얼마 남지 않았다는 것을 알게 된다.한 치 앞도 알 수 없는 인생에 서글퍼진 ‘세연’은
                                        마지막 생일선물로문득 떠오른 자신의 첫사랑을 찾아 달라는 황당한 요구를 한다.막무가내로 우기는 아내의 고집에 어쩔 수 없이
                                        여행길에 따라나선 ‘진봉’은아무런 단서도 없이 이름 석 자만 가지고 무작정 전국 방방곡곡을 누빈다.시도 때도 없이 티격태격
                                        다투던 두 사람은 가는 곳곳마다자신들의 찬란했던 지난날 소중한 기억을 하나 둘 떠올리는데...과연 ‘세연’의 첫사랑은
                                        어디에 있으며 그들의 여행은 무사히 마칠 수 있을까?
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=133709" class="link_txt" data-tiara-layer="moviename">인생은 아름다워</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">8.6</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                </ol>
            </div>
    
            <div class="box_ranking" data-tiara-layer="list">
                <ol class="list_movieranking">
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F36f22dea0e0a9e0e626c549ce689558160c46ed4" class="img_thumb" alt="공조2: 인터내셔날">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see15">15세이상관람가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=147615" class="link_story" data-tiara-layer="poster">
                                        공조 이즈 백! 이번엔 삼각 공조다!남한으로 숨어든 글로벌 범죄 조직을 잡기 위해 새로운 공조 수사에 투입된 북한 형사
                                        ‘림철령’(현빈).수사 중의 실수로 사이버수사대로 전출됐던 남한 형사 ‘강진태’(유해진)는 광수대 복귀를 위해 모두가
                                        기피하는 ‘철령’의 파트너를 자청한다. 이렇게 다시 공조하게 된 ‘철령’과 ‘진태’!‘철령’과 재회한 ‘민영’(임윤아)의
                                        마음도 불타오르는 가운데,‘철령’과 ‘진태’는 여전히 서로의 속내를 의심하면서도 나름 그럴싸한 공조 수사를 펼친다.드디어
                                        범죄 조직 리더인 ‘장명준’(진선규)의 은신처를 찾아내려는 찰나,미국에서 날아온 FBI 소속 ‘잭’(다니엘 헤니)이 그들
                                        앞에 나타나는데…!아직도 짠내 나는 남한 형사,여전한 엘리트 북한 형사,그리고 FBI 소속 해외파 형사까지!각자의 목적으로
                                        뭉친 그들의 짜릿한 공조 수사가 시작된다!
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=147615" class="link_txt" data-tiara-layer="moviename">공조2: 인터내셔날</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">8.1</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe3c34791317eefee49caec94c87a3b1bb24b0e8d" class="img_thumb" alt="늑대사냥">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see19">청소년관람불가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=155115" class="link_story" data-tiara-layer="poster">
                                        인간 스스로 먹잇감이 되다동남아시아로 도피한 인터폴 수배자들을 이송할 움직이는 교도소 ‘프론티어 타이탄’.극악무도한 이들과
                                        베테랑 형사들이 필리핀 마닐라 항구에 모이고탈출을 꿈꾸는 종두(서인국), 한국으로 돌아가야만 하는 도일(장동윤)을
                                        비롯해이들은 각자의 목적과 경계심을 품고 탑승한다.한국으로 향하던 중, 태평양 한 가운데에서 이들에게는지금까지 보지 못한
                                        극한의 상황과 마주하게 되는데…태평양 한 가운데의 지옥, 누가 살아남을 것인가?
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=155115" class="link_txt" data-tiara-layer="moviename">늑대사냥</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">9.0</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Ff5c62530ef4f57a469bdb51cc065f2c47503f9d8" class="img_thumb" alt="육사오(6/45)">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see12">12세이상관람가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=142869" class="link_story" data-tiara-layer="poster">
                                        “45개 번호 중에 6개 맞히면 1등인 육사오라는 종이쪼가리,내가 주웠지 말입니다”우연히 1등 당첨 로또를 주운 말년 병장
                                        ‘천우’.심장이 터질듯한 설렘도 잠시, 순간의 실수로 바람을 타고 군사분계선을 넘어간 로또.바사삭 부서진 멘탈을
                                        부여잡고…기필코 다시 찾아야 한다!우연히 남쪽에서 넘어온 1등 당첨 로또를 주운 북한 병사 ‘용호’.이거이 남조선 인민의
                                        고혈을 쥐어 짜내는 육사오라는 종이쪼가리란 말인가?근데 무려 당첨금이 57억이라고?!당첨금을 눈앞에서 놓칠 위기에 처한
                                        ‘천우’와북에선 한낱 종이쪼가리일 뿐일 로또를 당첨금으로 바꿔야 하는 ‘용호’.여기에 예상치 못한 멤버들(?)까지 합류하고
                                        57억을 사수하기 위한 3:3팀이 결성되는데…주운 자 VS 또 주운 자아슬아슬 선 넘는 지분 협상이 시작된다!
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=142869" class="link_txt" data-tiara-layer="moviename">육사오(6/45)</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">8.4</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F4eb261668eb43a125d0adc250a89adb48216c005" class="img_thumb" alt="탑건: 매버릭">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see12">12세이상관람가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=114329" class="link_story" data-tiara-layer="poster">
                                        한순간의 실수도 용납되지 않는 하늘 위, 가장 압도적인 비행이 시작된다!최고의 파일럿이자 전설적인 인물 매버릭(톰
                                        크루즈)은 자신이 졸업한 훈련학교 교관으로 발탁된다.그의 명성을 모르던 팀원들은 매버릭의 지시를 무시하지만 실전을 방불케
                                        하는 상공 훈련에서 눈으로 봐도 믿기 힘든 전설적인 조종 실력에 모두가 압도된다.매버릭의 지휘아래 견고한 팀워크를 쌓아가던
                                        팀원들에게 국경을 뛰어넘는 위험한 임무가 주어지자매버릭은 자신이 가르친 동료들과 함께 마지막이 될 지 모를 하늘 위 비행에
                                        나서는데…
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=114329" class="link_txt" data-tiara-layer="moviename">탑건: 매버릭</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">9.4</span></span>
                                </span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item_poster">
                            <div class="thumb_item">
                                <div class="poster_movie">
                                    <img src="https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F292bb497493d7d227ecbf994742c1ff9f90f10bb" class="img_thumb" alt="인생은 아름다워">
                                    <span class="txt_tag">
                                        <span class="ico_movie ico_see see12">12세이상관람가</span>
                                    </span>
                                </div>
                                <div class="poster_info">
                                    <a href="/moviedb/main?movieId=133709" class="link_story" data-tiara-layer="poster">
                                        내 생애 가장 빛나는 선물모든 순간이 노래가 된다!무뚝뚝한 남편 ‘진봉’과 무심한 아들 딸을 위해 헌신하며 살아온
                                        ‘세연’은어느 날 자신에게 시간이 얼마 남지 않았다는 것을 알게 된다.한 치 앞도 알 수 없는 인생에 서글퍼진 ‘세연’은
                                        마지막 생일선물로문득 떠오른 자신의 첫사랑을 찾아 달라는 황당한 요구를 한다.막무가내로 우기는 아내의 고집에 어쩔 수 없이
                                        여행길에 따라나선 ‘진봉’은아무런 단서도 없이 이름 석 자만 가지고 무작정 전국 방방곡곡을 누빈다.시도 때도 없이 티격태격
                                        다투던 두 사람은 가는 곳곳마다자신들의 찬란했던 지난날 소중한 기억을 하나 둘 떠올리는데...과연 ‘세연’의 첫사랑은
                                        어디에 있으며 그들의 여행은 무사히 마칠 수 있을까?
                                    </a>
                                </div>
                            </div>
                            <div class="thumb_cont">
                                <strong class="tit_item">
                                    <a href="/moviedb/main?movieId=133709" class="link_txt" data-tiara-layer="moviename">인생은 아름다워</a>
                                </strong>
                                <span class="txt_append">
                                    <span class="info_txt">평점<span class="txt_grade">8.6</span></span>
                                </span>
                            </div>
                        </div>
                    </li> -->
                </ol>
            </div>
           <c:if test="${ loginMember.m_authorization == 'M' }">
           		<div class="sort" OnClick="location.href='${ path }/contents/contents_form'">컨텐츠 등록</div>
           </c:if>
        </div>
    
        <!--Active and Hoverable Pagination-->
        <ul id="pagination">
            <li><a href="${ path }/contents/contents?type=${ type }&page=1">«</a></li>
            
            <!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<li><a class="active">${ status.current }</a></li>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<li><a href="${ path }/contents/contents?type=${ type }&page=${ status.current }">${ status.current }</a></li>
				</c:if>
			</c:forEach>
            
            <li><a href="${ path }/contents/contents?type=${ type }&page=${ pageInfo.maxPage }">»</a></li>
        </ul>
        
    </article>

<div style="height: 5em;">
</div>
   
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>