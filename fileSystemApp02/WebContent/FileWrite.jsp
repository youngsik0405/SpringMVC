<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// FileWrite.jsp
	
	// 웹 어플리케이션 루트(경로) 확인
	String appRoot = "/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);

	// 경로 확인
	System.out.println(appRoot);	
	
	// 1. 파일을 쓰기 위해 File 객체 생성
	File newFile = new File(appRoot, "data/test.txt");
	//-- 확인한 웹 어플리케이션 루트를 기준으로 data 및 test.txt 구성
	
	// 2. 파일을 생성할 경로까지의 디렉터리가 존재하지 않는 경우
	if (!newFile.getParentFile().exists())
	{
		// 파일 생성이 가능한 경로까지의 디렉터리들을 생성
		newFile.getParentFile().mkdirs();
	}
	
	
	// 3-1. 파일을 쓰기 위한 FileWriter 객체 생성
	FileWriter fw = new FileWriter(newFile);
	
	// 3-2. FileWriter 를 보다 편하게 사용하기 위해 PrintWriter 로 감싸줌 
	PrintWriter pw = new PrintWriter(fw);
	
	// 4. 실질적으로 파일에 내용을 씀
	pw.println("테스트이다...");
	pw.println("확인해보자...");
	
	// 5-1. 리소스 반납(→ PrintWriter 리소스 닫아줌)
	pw.close();
	
	// 5-2. 리소스 반납(→ FileWriter 리소스 닫아줌)
	fw.close();
	
%>

