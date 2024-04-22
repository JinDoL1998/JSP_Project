<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
	span.material-symbols-outlined{
		vertical-align: text-bottom;
	}
</style>
</head>
<body>
<header>
    <h1 class="main"><a href="#" style="position: absolute;top:30px;">Jindol Home</a></h1>
    <ul>
    	<li><a href="#">로그인</a></li>
	    <li><a href="#">회원가입</a></li>
    </ul>
</header>
<h3>
	<span class="material-symbols-outlined">view_list</span> jsp days00
</h3>
<div>
	<xmp class="code">
		list.jsp
	</xmp>
	
	<h2>목록 보기</h2>
	<a href="<%= contextPath%>/cstvsboard/write.htm">글쓰기</a>
	<table>
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th width="45%">제목</th>
				<th width="17%">작성자</th>
				<th width="20%">등록일</th>
				<th width="10%">조회</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.seq }</td>
							<td class="title"><a href="<%= contextPath %>/cstvsboard/view.htm">${dto.title }</a></td>
							<td>${dto.writer }</td>
							<td>${dto.writeDate }</td>
							<td>${dto.readed }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">등록된 게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" align="center">[1] 2 3 4 5 6 7 8 9 10 ></td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<!-- list.htm?searchCondition=1&searchWord=검색어 -->
					<form method="get">
						<select name="searchCondition" id="searchCondition">
							<option value="1">title</option>
							<option value="2">content</option>
							<option value="3">writer</option>
							<option value="4">title+content</option>
						</select>
						<input type="text" name="searchWord" id="searchWord"/>
						<input type="submit" value="search"/>
					</form>
				</td>
			</tr>
		</tfoot>
	</table>  
</div>

<script>
	// list.htm?write=success or fail
	if('<%=request.getParameter("write") %>'=="success"){
		alert("글 쓰기 완료!!!");
	}
	else if('<%=request.getParameter("write") %>'=="fail"){
		alert("글 쓰기 실패 :( ");
	}
</script>
</body>
</html>