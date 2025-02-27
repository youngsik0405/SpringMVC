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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style type="text/css">
	* {line-height: 150%;}
	#customers {border: 1px solid gray;}
	#customers th {background-color: #ffeeff;}
	#customers td
	{
		background-color: #eeddee;
		text-align: center;
	}
	#submitBtn
	{
		height: 150%;
		width: 250px;
		font-size: 18px;
		font-weight: bold;
		font-family: 맑은 고딕;
		color: #343;
	}
	#error
	{
		color: red;
		font-size: small;
		display: none;
	}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			// 테스트
			//alert("버튼 클릭 확인~!!!");
			
			// 두 항목 모두 필수 입력 항목이기 때문에... 생략 가능~!!!
			$("#error").css("display", "none");
			
			if ($("#name").val()=="" || $("#telephone").val()=="")
			{
				$("#error").css("display", "inline");
				return;
			}
			
			$("#memberForm").submit();
		});
	});

</script>
</head>
<body>

<div>
	<h1>회원 관리</h1>
	<p>(Spring MVC 버전)</p>
	<hr>
</div>

<div>
	<!-- <form action="" method="post" id="memberForm"> -->
	<form action="memberinsert.do" method="post" id="memberForm">
		이름
		<input type="text" name="name" id="name" class="control" required="required">
		<br>
		
		전화
		<input type="text" name="telephone" id="telephone" calss="control" required="required">
		<br>
		
		<button type="button" id="submitBtn">회원 추가</button>
		<span id="error">모든 항목을 입력해야 합니다.</span>
	</form>
	<br><br>
	
	<!-- EL 표현에 의한 인원 수 출력 부분 -->
	<!-- <p>전체 인원 수 : 3</p> -->
	<p>전체 인원 수 : ${count }</p>
	
	<!-- 전체 회원 리스트 출력 부분 -->
	<table id="customers" style="width: 500px;">
		<tr>
			<th>번호</th><th>이름</th><th>전화번호</th>
		</tr>
		
		<!-- 
		<tr>
			<td>1</td>
			<td>정영훈</td>
			<td>010-1111-1111</td>
		</tr>
		<tr>
			<td>2</td>
			<td>박세진</td>
			<td>010-2222-2222</td>
		</tr>
		<tr>
			<td>3</td>
			<td>곽유진</td>
			<td>010-3333-3333</td>
		</tr>
		-->
		<%-- EL, JSTL 표현에 의한 회원 명단 출력 부분 --%>
		<%--
		<c:forEach>
		</c:forEach>
		--%>
		<c:forEach var="member" items="${memberList }">
		<tr>
			<td>${member.mid }</td>
			<td>${member.name }</td>
			<td>${member.telephone }</td>
		</tr>
		</c:forEach>
		
	</table>
	
</div>

</body>
</html>