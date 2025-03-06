<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// ObjectWrite.jsp
	
	// 웹 어플리케이션 루트(경로) 확인
	String appRoot = "/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	// 확인
	System.out.println(appRoot);
	
	// 파일 객체 생성
	File newFile = new File(appRoot, "objData/data.ser");		//-- 『.ser』 → 객체 직렬화
	
	if (!newFile.getParentFile().exists())
		newFile.getParentFile().mkdirs();
	
	// 파일에 넣기 위한 Hashtable 객체를 생성하여 데이터에 적재
	Hashtable<String, String> h = new Hashtable<String, String>();

	h.put("key1", "수박");
	h.put("key2", "딸기");
	
	// 파일을 내보내기 위한 스트림 구성
	FileOutputStream fos = new FileOutputStream(newFile);
	
	// Object 를 파일에 기록하기 위해 ObjectOutputStream 생성 후
	// FileOutputStream 감싸기
	ObjectOutputStream oos = new ObjectOutputStream(fos);
	
	// ObjectOutputStream 을 이용하여 파일에 Object 를 기록(쓰기)
	oos.writeObject(h);
	
	// 리소스 반납
	oos.close();
	fos.close();
	
%>
