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
<title>RegionList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style>

	.btn:disabled 
	{ 
		background-color: #d3d3d3;  
		color: #a9a9a9; 
	}

	.btn:disabled:hover 
	{
		background-color: #d3d3d3; 
	}
	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		$(".updateBtn").click(function()
		{
			//alert("수정 확인!!");
			
			$(location).attr("href", "regionupdateform.action?regionId=" + $(this).val());
		});
		
		$(".deleteBtn").click(function()
		{
			//alert("삭제 확인!!!");
			
			if (confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "regiondelete.action?regionId=" + $(this).val());
			}
		});
	});


</script>
</head>
<body>

<!---------------------------------------------- 
  #34. RegionList.jsp
  - 지역 리스트 출력 페이지 
  - 관리자가 접근하는 지역 데이터 출력 페이지
    → 관리 기능 포함
------------------------------------------------>

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1>[ 지역 관리 (관리자 전용) ]</h1>
		<hr>
		
		<div>
			<form action="">
				<input type="button" class="btn" value="지역 추가"
				onclick="location.href='regioninsertform.action'">
			</form>
		</div>
		<br><br>
		
		<table id="region" class="table">
			<tr>
				<th>지역번호</th>
				<th>지역명</th>
				<th>삭제가능여부</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			
			<c:forEach var="region" items="${regionList }">
			<tr>
				<td>${region.regionId }</td>
				<td>${region.regionName }</td>
				<td>${region.delCheck > 0 ? "삭제 불가능" : "삭제 가능" }</td>
				
				<td>
					<button type="button" class="btn updateBtn"
					value="${region.regionId }">수정</button>
				</td>
				<td>
					<button type="button" class="btn deleteBtn"
					value="${region.regionId }"
					${region.delCheck > 0 ? 'disabled="disabled"' : ''}>삭제</button>
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