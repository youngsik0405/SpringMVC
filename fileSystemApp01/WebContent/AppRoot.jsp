<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 웹 어플리케이션 경로
	String appRoot = "/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	// 파일 객체 생성
	File newFile = new File(appRoot, "data/test.txt");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AppRoot.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>관찰하기</h1>
	<hr>
</div>

<div>
	<h2>웹 어플리케이션 루트</h2>
	<h3><%=appRoot %></h3>
	<!-- 
		C:\SpringMVC\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\fileSystemApp01\
		------------																----------------	
		workspace																		project
	-->
	
	<h2>생성할 파일 위치</h2>
	<h3><%=newFile %></h3>
	<!-- 
		C:\SpringMVC\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\fileSystemApp01\data\test.txt
	-->
</div>

</body>
</html>