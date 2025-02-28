<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>회원 데이터 입력폼</h1>
	<hr>
</div>

<div>
	<form action="memberinsert.action" method="post">
		아이디 <input type="text" name="id"><br>
		패스워드 <input type="password" name="pw"><br>
		이름 <input type="text" name="name"><br>
		전화 <input type="tel" name="tel"><br>
		이메일 <input type="text" name="email"><br>
		<br>
		
		<button type="submit" class="btn">입력 완료</button>
		<button type="reset" class="btn">다시 입력</button>
		
	</form>
</div>

</body>
</html>