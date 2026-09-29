<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 요청으로 온 한글이 깨지지 않게 UTF-8로 읽는다
    request.setCharacterEncoding("UTF-8");

    // contextPath의 결과를 담는다
    String contextPath = request.getContextPath();
    
	// ⭐ 임시 테스트: 현재 세션을 admin으로 설정
    session.setAttribute("id", "admin");

	// 서버가 기억하고 있는 로그인 아이디를 가져오기
	String loginId = (String)session.getAttribute("id");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | Magic Box</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        font-family: Arial, sans-serif;
        color: #222;
    }

    .container {
        width: 1200px;
        margin: 0 auto;
    }

    /* Header */
    .header {
        border-bottom: 1px solid #ddd;
    }

    .header-inner {
        height: 80px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .logo {
        font-size: 28px;
        font-weight: bold;
    }

    .nav {
        display: flex;
        gap: 35px;
    }

    .nav a {
        text-decoration: none;
        color: #222;
    }

    /* Notice */
    .notice-section {
        padding: 70px 0;
    }

    .page-title {
        font-size: 32px;
        margin-bottom: 10px;
    }

    .page-description {
        color: #777;
        margin-bottom: 40px;
    }

    .notice-table {
        width: 100%;
        border-collapse: collapse;
        border-top: 2px solid #222;
    }

    .notice-table th,
    .notice-table td {
        padding: 18px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    .notice-table th {
        background-color: #f8f8f8;
    }

    .notice-title {
        text-align: left !important;
    }

    .notice-title a {
        color: #222;
        text-decoration: none;
    }

    .pagination {
        margin-top: 35px;
        text-align: center;
    }

    .pagination a {
        margin: 0 8px;
        text-decoration: none;
        color: #555;
    }

    /* Search & Write Area (검색창 및 글쓰기 버튼 가로 배치용) */
    .search-write-wrapper {
        margin-top: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 10px; /* 검색창과 글쓰기 버튼 사이의 간격 */
    }

    .search-form {
        display: flex;
        gap: 0; /* 인풋과 검색 버튼 딱 붙이기 */
    }

	.search-box {
        display: flex;
        align-items: center;
    }

    .search-box input {
        width: 300px;
        height: 38px;
        padding: 0 10px;
        border: 1px solid #ccc;
        box-sizing: border-box;
        font-size: 14px;
    }

    /* 검색 버튼과 글쓰기 버튼 크기/디자인 통일 */
    .search-box button,
    .btn-write {
        height: 38px;
        padding: 0 20px;
        border: 1px solid #222;
        background: #222;
        color: white;
        cursor: pointer;
        font-size: 14px;
        box-sizing: border-box;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;
    }

    .btn-write:hover, .search-box button:hover {
        background: #444;
    }
    
    .login-info {
        text-align: center;
        margin-top: 15px;
        color: #555;
        font-size: 13px;
    }
</style>

</head>

<body>

<!-- Header -->
<header class="header">
    <div class="container header-inner">
        <div class="logo">
            MOVIE BOX
        </div>

        <nav class="nav">
            <a href="#">영화</a>
            <a href="#">예매</a>
            <a href="#">영화관</a>
            <a href="#">이벤트</a>
            <a href="#">MY</a>
        </nav>
    </div>
</header>

<!-- Notice -->
<main>
    <section class="notice-section">
        <div class="container"></div>

            <h1 class="page-title">공지사항</h1>
            <p class="page-description">
                MOVIE BOX의 새로운 소식과 안내사항을 확인하세요.
            </p>

            <!-- Notice Table -->
            <table class="notice-table">

                <thead>
                    <tr>
                        <th width="10%">번호</th>
                        <th>제목</th>
                        <th width="15%">작성일</th>
                        <th width="10%">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 테스트 데이터 -->
                    <tr>
                        <td>3</td>
                        <td class="notice-title">
                            <a href="detail?id=3">주차장 이용 안내</a>
                        </td>
                        <td>2026-09-23</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="notice-title">
                            <a href="detail?id=2">시스템 점검 안내</a>
                        </td>
                        <td>2026-09-23</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td class="notice-title">
                            <a href="detail?id=1">추석 연휴 영화관 운영 안내</a>
                        </td>
                        <td>2026-09-23</td>
                        <td>0</td>
                    </tr>
                </tbody>
            </table>

			 <!-- Pagination -->
            <div class="pagination">
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
            </div>
            
            <!-- 검색창과 글쓰기 버튼을 나란히 묶어주는 래퍼 -->
            <div class="search-write-wrapper">
                <!-- 검색 폼 -->
                <form action="<%=contextPath%>/FileBoard/searchlist.bo"
                      method="post"
                      name="frmSearch" 
                      class="search-form">
                      
            <!-- Search Box -->
                    <div class="search-box">
                        <input type="text" name="keyword" placeholder="공지사항 검색">
                        <button type="submit">검색</button>
                    </div>
                </form>

                <!-- 관리자만 새 글쓰기 버튼 표시 -->
                <% 
                    // 로그인 아이디가 admin일 때만 글쓰기 버튼을 보여준다 (변수명 loginId로 통일)
                    if ("admin".equals(loginId)){ 
                %>
			
				<%-- 새 글쓰기 버튼 --%>
			    <button type="button"
			    		id="newContent"
			    		class="btn-write"
			            onclick="location.href='<%=contextPath%>/FileBoard/write.bo'">  
			        글쓰기
			    </button>
			<% 
				} 
			%>
        </div>
        
        <div class="login-info">
                현재 로그인 ID: <%= loginId %>
        </div>

    </section>

</main>

</body>
</html>