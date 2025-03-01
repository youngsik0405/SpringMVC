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
<title>EmployeeInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>

<script type="text/javascript">
	
	//$();
	//jquery();
	$(document).ready(function()
	{
		// 확인
		//alert("확인");
		
		// AJAX 요청 및 응답 처리
		ajaxRequest();
		
		// jQuery-UI 달력을 불러오는 함수 처리(→ datepicker())
		$("#birthday").datepicker(
		{
			dateFormat: "yy-mm-dd"
			, changeMonth: true
			, changeYear:true
		});
		
		// 직위(select)의 선택된 내용이 변경되었을 경우 수행해야 할 코드 처리
		$("#positionId").change(function()
		{
			// 확인
			//alert("선택 변경~!!!");
			
			// AJAX 요청 및 응답 처리
			ajaxRequest();
			
			
		});
		
		// 직원 추가 버튼이 클릭되었을 때 수행해야 할 코드 처리
		$("#submitBtn").click(function()
		{
			// 확인
			//alert("버튼 클릭 확인~!!!");
			
			// 확인
			//alert($("#minBasicPay").val());		//--(Ⅹ)
			//alert($("#minBasicPay").text());		//--(○)
			
			
			
			// 데이터 검사
			//-- 누락된 입력값이 있는지 없는지에 대한 여부 확인
			// 	 이름, 주민번호앞, 주민번호뒷, 생년월일, 전화번호, 기본급 항목 누락 시
			//	 → 필수 입력 항목이 누락되었음을 안내
			if ($("#name").val()=="" || $("#ssn1").val()=="" || $("#ssn2").val()==""
				|| $("#birthday").val()=="" || $("#telephone").val()==""
				|| $("#basicPay").val()== "")
			{
				$("#error").html("필수 입력 항목이 누락되었습니다.");
				$("#error").css("display", "inline");
				return;									//-- submit 액션 처리 중단
				
			}
			
			
			
			// 최소 기본급에 대한 유효성 검사
			//-- 직급별최소기본급 > 사용자입력기본급
			//	 → 입력한 기본급이 최소 기본급보다 적음을 안내
			if ( parseInt($("#minBasicPay").text()) > parseInt($("#basicPay").val()))
			{
				$("#error").html("입력한 기본급이 최소 기본급보다 적습니다.");
				$("#error").css("display", "inline");
				return;									//-- submit 액션 처리 중단
			}
			
			// 폼 submit 액션 처리
			$("#employeeForm").submit();

			
			
			
		});
		
	});
	
	
	function ajaxRequest()
	{
		// 확인
		//alert("AJAX 요청 및 응답처리~!!!");
		
		// 『$.post()』 / 『$.get()』
		//-- jQuery 에서 AJAX 를 사용해야 할 경우 지원해주는 함수
		//   (서버 측에서 요청한 데이터를 받아오는 기능의 함수)
		
		// ※ 위 함수의 사용 방법(방식)
		//-- 『$.post(요청주소, 전송데이터, 응답액션처리)』
		//	 ·요청주소(url)
		//	 → 데이터를 요청할 파일에 대한 정보
		//	 ·전송데이터(data)
		//	 → 서버 측에 요청하는 과정에서 내가 전달할 파라미터
		//	 ·응답액션처리(function)
		//	 → 응답을 받을 수 있는 함수(기능 처리)
		
		// ※ 참고로... 전송데이터(data) 는 파라미터의 데이터타입을 그대로 취하게 되므로
		//    html 이든 문자열이든 상관이 없다.
		
		$.post("ajax.action", {positionId: $("#positionId").val()}, function(data)
		{
			$("#minBasicPay").html(data);
		});
		
	}
	
</script>
</head>
<body>

<!--------------------------------- 
  #20. EmployeeInsertForm.jsp
  - 직원 데이터 입력 폼 페이지
------------------------------------>

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1>[ 직원 추가 ]</h1>
		<hr>
	
		<form action="employeeinsert.action" method="post" id="employeeForm">
			<table>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" id="name" name="name" placeholder="이름">
					</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>
						<input type="text" id="ssn1" name="ssn1" placeholder="앞 6자리"
						style="width: 100px;">
						- <input type="password" id="ssn2" name="ssn2" placeholder="뒤 7자리"
						style="width: 110px;"> 
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" id="birthday" name="birthday" placeholder="생년월일">
					</td>
				</tr>
				<tr>
					<th>양/음력</th>
					<td>
						<input type="radio" value="0" name="lunar" id="lunar0" checked="checked">
						<label for="lunar0">양력</label>
						<input type="radio" value="1" name="lunar" id="lunar1">
						<label for="lunar1">음력</label>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="tel" id="telephone" name="telephone" placeholder="전화번호">
					</td>
				</tr>
				<tr>
	               <th>지역</th>
	               <td>
	                  <select id="ragionId" name="regionId">
	                  <!-- 
	                     <option value="1">우리집</option>
	                     <option value="2">너네집</option>
	                     <option value="3">쟤네집</option>
	                     <option value="4">걔네집</option>
	                  -->
	                  <c:forEach var="region" items="${regionList }">
	                  		<option value="${region.regionId }">${region.regionName }</option>
	                  </c:forEach>
	                  
	                  </select>
	               </td>
	            </tr>
				<tr>
					<th>부서</th>
					<td>
						<select id="departmentId" name="departmentId" >
						<!-- 
							<option value="1">창작부</option>
							<option value="2">독서부</option>
							<option value="3">음악부</option>
							<option value="4">축구부</option>
						-->
						<c:forEach var="department" items="${departmentList }">
	                  		<option value="${department.departmentId }">${department.departmentName }</option>
	                  	</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>직위</th>
					<td>
						<select name="positionId" id="positionId">
						<!-- 
							<option value="1">팀장</option>
							<option value="2">기술고문</option>
							<option value="3">팀원</option>
							<option value="4">엑스맨</option> 
						-->
						<c:forEach var="position" items="${positionList }">
	                  		<option value="${position.positionId }">${position.positionName }</option>
	                  	</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
	               <th>기본급</th>
	               <td>
	                  <input type="text" id="basicPay" name="basicPay">
	                  (최소 기본급 <span id="minBasicPay"
	                  style="color:red; font-weight: bold;">0</span>원)
	               </td>
	            </tr>
				<tr>
					<th>수당</th>
					<td>
						<input type="text" id="extraPay" name="extraPay">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<br><br>
						
						<button type="button" class="btn" id="submitBtn"
						style="width: 40%; height: 50px;">직원 추가</button>
						<button type="button" class="btn" id="listBtn"
						style="width: 40%; height: 50px;"
						onclick="location.href='employeelist.action'">직원 리스트</button>
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