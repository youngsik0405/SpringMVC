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
<title>EmpList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		// 확인
		//alert("확인");
		
		// 수정 버튼 클릭 시 액션 처리
		$(".updateBtn").click(function()
		{
			// 확인
			//alert("수정 버튼 클릭~!!!");
			
			// 수정 폼 페이지 요청
			//-- 요청하며 employeeId 넘겨주기
			$(location).attr("href", "employeeupdateform.action?employeeId=" + $(this).val());
			// → loaction.href=".....";
			
		});
		
		// 삭제 버튼 클릭 시 액션 처리
		$(".deleteBtn").click(function()
		{
			// 확인
			//alert("삭제 버튼 클릭~!!!");
			
			if (confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "employeedelete.action?employeeId=" +$(this).val());
				// → loaction.href=".....";
			}
		});
		
	});

</script>


</head>
<body>

<!---------------------------------------------- 
  #15. EmployeeList.jsp
  - 직원 리스트 출력 페이지 
  - 관리자가 접슨하는 직원 데이터 출력 페이지
    → 관리 기능 포함
    → 일반 직원이 접근하는 직원 데이터 출력 페이지는
       EmpList.jsp 로 구성할 예정
------------------------------------------------>

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1>[ 직원 목록 (일반직원 전용) ]</h1>
		<hr>
	
	
		<!-- 직원 추가 div 제거~!!! -->
		<br><br>
		
		<!-------------------------------------------------------------
		EMPLOYEEID NAME DEPARTMENTNAME POSITIONNAME REGIONNAME GRADE
		--------------------------------------------------------------->
		<table id="customers" class="table">
			<tr>
				<!-- 항목 13EA -->
				<th>번호</th>
				<th>이름</th>
				<th>지역</th>
				<th>부서</th>
				<th>직위</th>
				<th>등급</th>
				
				<!-- 관리 기능 삭제 → 열람만 가능하도록 구성 -->
			</tr>
			
			<!-- 
			<tr>
				<td>1</td>
				<td>박세진</td>
				<td>서울</td>
				<td>개발부</td>
				<td>사원</td>
				<td>관리자</td>
			</tr>
			<tr>
				<td>2</td>
				<td>김민승</td>
				<td>경기</td>
				<td>인사부</td>
				<td>사원</td>
				<td>일반사원</td>
			</tr>
			
			<tr>
				<td>3</td>
				<td>안석창</td>
				<td>대전</td>
				<td>영업부</td>
				<td>사원</td>
				<td>일반사원</td>
			</tr> 
		 	-->
		 	
			
			<c:forEach var="employee" items="${employeeList }">
			<tr>
				<td>${employee.employeeId }</td>
				<td>${employee.name }</td>
				<td>${employee.regionName }</td>
				<td>${employee.departmentName }</td>
				<td>${employee.positionName }</td>
				<td>${employee.grade==0 ? "관리자" : "일반사원" }</td>
				
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