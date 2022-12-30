<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<title>VODA</title>

<!-- HEADER -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- login CSS -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/member/login.css">

    <div class="find_account1">
        <div class="find_account2">
            <div class="find_account3">
                고객님의 VODA 계정을 찾았습니다.
                <div class="find_account4">
                    아이디 확인 후 로그인해 주세요.
                </div>
            </div>
            <ul class="find_account5">
                <li class="find_account6">
                    <img class="find_account7" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxjaXJjbGUgZmlsbD0iI0Y1RjVGNSIgY3g9IjIwIiBjeT0iMjAiIHI9IjIwIi8+CiAgICAgICAgPHBhdGggZD0iTTIwIDE5YzQuNjUzIDAgOC41IDMuNDc2IDguNSA3LjcyIDAgLjQzLS4zNDYuNzgtLjc3My43OEgxMi4yNzNhLjc3Ni43NzYgMCAwIDEtLjc3My0uNzhjMC00LjI4NSAzLjgyNC03LjcyIDguNS03Ljcyem0wLTguNWEzLjQgMy40IDAgMSAxIDAgNi44IDMuNCAzLjQgMCAwIDEgMC02Ljh6IiBzdHJva2U9IiNDQ0MiIGZpbGw9IiNDQ0MiLz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="정보보기">
                    <div class="find_account8">
                        <div class="find_account9" id="m_id">
                        	 <c:forEach items="${ member }" var="member">
                        		  ${ fn:substring(member.m_id,0,3) }
                        		  <c:forEach begin="4" end="${ fn:length(member.m_id) }" step="1">
							        *
							      </c:forEach>
                        	 </c:forEach>	
                        </div>
                        <!-- 
                        -->
                        <div class="find_account10" id="m_joinDate">
                       		 <c:forEach items="${ member }" var="member">
								가입일 <fmt:formatDate value="${member.m_joinDate}" pattern="yyyy-MM-dd"/>
                        	 </c:forEach>	
                        </div>
                    </div>
                </li>
            </ul>
            <div class="find_account11">
                <button class="find_account12" type="button"
                	onclick="location.href='${path}/member/login'">
                	로그인
                </button>
            </div>
        </div>
    </div>


<br><br><br><br><br><br>
<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
</body>
</html>