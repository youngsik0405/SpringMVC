<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// FileRead.jsp
	
	// 1. 웹 어플리케이션 루트(경로) 확인
	String appRoot = "";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	// 2. 파일을 읽기 위해 File 객체 생성
	File newFile = new File(appRoot, "data/test.txt"); 
	
	// 3. 파일이 존재하는지의 여부 확인
	//	  → 파일이 존재하는 경우에만 처리해서 FileNotFoundException 방지
	if (newFile.exists())
	{
		// 4-1. 파일을 읽기 위한 FileReader 객체 생성
		FileReader fr = new FileReader(newFile);
		
		// 4-2. 파일을 좀 더 안정적으로 읽어내기 위해 BufferedReader 로 감싸기
		BufferedReader br = new BufferedReader(fr);
		//-- 읽어들이는 버퍼 장착
		
		// 5. 실질적으로 파일의 내용을 읽어냄
		String readData;
		while ((readData=br.readLine())!=null)
		{
			out.println(readData + "<br>");
		}
		
		// 6-1. 리소스 반납(→ BufferedReader 리소스 닫아줌)
		br.close();
		
		// 6-2. 리소스 반납(→ FileReader 리소스 닫아줌)
		fr.close();
	}
	
%>