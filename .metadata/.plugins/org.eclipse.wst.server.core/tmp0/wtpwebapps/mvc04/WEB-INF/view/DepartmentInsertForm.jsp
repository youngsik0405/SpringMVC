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
<title>DepartmentInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>

<script type="text/javascript">
	
	$(document).ready(function()
	{
		// 확인
		//alert("확인");
		
		// 부서 추가 버튼이 클릭되었을 때 수행해야 할 코드 처리
		$("#submitBtn").click(function()
		{
			// 확인
			//alert("버튼 클릭 확인~!!!");
	
			// 데이터 검사
			if ($("#departmentName").val()=="")
			{
				$("#error").html("필수 입력 항목이 누락되었습니다.");
				$("#error").css("display", "inline");
				return;									//-- submit 액션 처리 중단
				
			}
			
			// 폼 submit 액션 처리
			$("#departmentForm").submit();
			
		});
		
	});
	
</script>
</head>
<body>

<!--------------------------------- 
  #36. DepartmentInsertForm.jsp
  - 부서 데이터 입력 폼 페이지
------------------------------------>

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1>[ 부서 추가 ]</h1>
		<hr>
	
		<form action="departmentinsert.action" method="post" id="departmentForm">
			<table>
				<tr>
					<th>부서명</th>
					<td>
						<input type="text" id="departmentName" name="departmentName" placeholder="부서명">
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<br><br>
						
						<button type="button" class="btn" id="submitBtn"
						style="width: 40%; height: 50px;">부서 추가</button>
						<button type="button" class="btn" id="listBtn"
						style="width: 40%; height: 50px;"
						onclick="location.href='departmentlist.action'">부서 리스트</button>
						<br><br>
						
						<span id="error" style="color: red; font-weight: bold; display: none;"></span>
					</td>
				</tr>
				
			</table>
		</form>
	
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	</div>
	
</div>




</body>
</html>