<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// WriteOk.jsp
	
	// ① 기능 구현에 필요한 주요 속성값들 준비
	String root = pageContext.getServletContext().getRealPath("/");
	
	// - 파일이 업로드 되는 실제 물리적인 경로 속성 준비
	String savePath = root + "pds" + File.separator + "saveFile";			//-- check~!!!
	//									"\\"
	
	// 확인
	System.out.println(savePath);
	
	
	
	// - 인코딩 방식 속성 준비
	String encType = "UTF-8";
	
	// - 파일 최대 크기 속성 준비
	int maxFileSize = 5*1024*1024;
	
	// ② 경로상 물리적인 디렉터리 구조가 존재하지 않을 경우 생성할 수 있도록 처리
	File dir = new File(savePath);
	if (!dir.exists())
		dir.mkdirs();
	
	// ③ MultipartRequest 구성
	MultipartRequest req = null;
	String urlFile = "";													//-- check~!!!
	
	try
	{
		// request, 파일저장경로, 파일최대크기, 인코딩방식, 중복파일명처리정책
		req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
		
		// ④ 구성된 MultipartRequest 로 부터 필요한 값 얻어내기
		out.println("작성자 : " + req.getParameter("userName") + "<br>");
		out.println("제목 : " + req.getParameter("subject") + "<br>");
		out.println("서버에 저장된 파일명 : " + req.getFilesystemName("uploadFile") + "<br>");
		out.println("사용자 업로드 파일명 : " + req.getOriginalFileName("uploadFile") + "<br>");
		out.println("업로드 파일 타입 : " + req.getContentType("uploadFile") + "<br>");
	
		File f = req.getFile("uploadFile");
		if (f != null)
			out.println("업로드 파일 크기 : " + f.length() + "Bytes <br>");
		
		// check~!!!
		// ⑤ 다운로드 기능을 수행하기 위한 속성을 get 방식으로 처리
		urlFile = "Download.jsp?saveFileName=" + req.getFilesystemName("uploadFile");
		urlFile += "&orliginalFileName=" + req.getOriginalFileName("uploadFile");
		
		
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h2><a href="<%=urlFile%>">파일 다운로드</a></h2>
</div>


</body>
</html>