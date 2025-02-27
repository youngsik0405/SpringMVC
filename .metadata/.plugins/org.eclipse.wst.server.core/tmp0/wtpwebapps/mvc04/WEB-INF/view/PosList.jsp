<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PosList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<!---------------------------------------------- 
  #65. PosList.jsp
  - 일반 직원이 접근하는 직위 데이터 출력 페이지
------------------------------------------------>

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1>[ 직위 목록 (일반직원 전용) ]</h1>
		<hr>
		
		<br><br>
		
		<table id="position" class="table">
			<tr>
				<th>직위번호</th>
				<th>직위명</th>
				<th>최소 기본급</th>
			</tr>
			
			<c:forEach var="position" items="${posList }">
			<tr>
				<td>${position.positionId }</td>
				<td>${position.positionName }</td>
				<td>
					<fmt:formatNumber value="${position.minBasicPay }" groupingUsed="true"></fmt:formatNumber>
				</td>
			</tr>
			</c:forEach>
			
			
		</table>
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	</div>
	
</div>

</body>
</html>