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
<title>GradeList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(document).ready(function()
	{
		$(".btnInsert").click(function()
		{
			$(location).attr("href", "gradeinsertform.action?sid=" + $(this).val());
		});
		
		
		$(".btnUpdate").click(function()
		{
			$(location).attr("href", "gradeupdateform.action?sid=" + $(this).val());
		});
		
		
		$(".btnDelete").click(function()
		{
			if (confirm("정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "gradedelete.action?sid=" + $(this).val());				
			}
		});
		
	});
	
	


</script>


</head>
<body>

<!-- 타이틀 영역 -->
<div class="panel title">
	<h1>성적 관리</h1>
	<p>(SpringMVC + Annotation + mybatis 버전)</p>
	<hr>
</div>

<!-- 메뉴 영역 -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand">Home</a>
		</div>
	
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="studentlist.action">학생 관리 <span class="sr-only">(current)</span></a>
				</li>
				<li>
					<a href="gradelist.action">성적 관리</a>
				</li>
			</ul>
		</div>
		
	</div>
</nav>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading row">
				<span style="font-size: 17pt; font-weight: bold;" class="col-md-3">
					성적 리스트 출력
				</span>
				<span class="col-md-9">
					<a href="studentlist.action" role="button" class="btn btn-success btn-xs"
					id="btnList" style="vertical-align: bottom;">학생 리스트 돌아가기</a>
				</span>
			</div>
			
			<div class="panel-body">
				<table class="table table-hover table-striped">
					<thead>
						<tr class="trTitle">
							<th>번호</th>
							<th>이름</th>
							<th>과목1</th>
							<th>과목2</th>
							<th>과목3</th>
							<th>총점</th>
							<th>평균</th>
							<th>등급</th>
							<th>입력</th>
							<th>수정 및 삭제</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="grade" items="${list}">
						<tr>
							<td>${grade.sid }</td>
							<td>${grade.name }</td>
							<td>${grade.sub1 }</td>
							<td>${grade.sub2 }</td>
							<td>${grade.sub3 }</td>
							<td>${grade.tot }</td>
							<td>${grade.avg }</td>
							<td>${grade.ch }</td>
							
							
							 <td>
					            <c:choose>
					                <c:when test="${grade.tot == -1}">
					                    <button type="button" class="btn btn-success btnInsert"
					                            value="${grade.sid}">입력</button>
					                </c:when>
					                
					                <c:otherwise>
					                    <button type="button" class="btn btn-success btnInsert" disabled="disabled">입력</button>
					                </c:otherwise>
					            </c:choose>
					        </td>
					
					        
					        <td>
					            <c:choose>
					                <c:when test="${grade.tot == -1}">
					                    <button type="button" class="btn btn-success btnUpdate" disabled="disabled">수정</button>
					                    <button type="button" class="btn btn-danger btnDelete" disabled="disabled">삭제</button>
					                </c:when>
					                
					                <c:otherwise>
					                    <button type="button" class="btn btn-success btnUpdate"
					                            value="${grade.sid}">수정</button>
					                    <button type="button" class="btn btn-danger btnDelete"
					                            value="${grade.sid}">삭제</button>
					                </c:otherwise>
					            </c:choose>
					        </td>
						</tr>
						</c:forEach>
						
					</tbody>
				
				</table>
			</div>
		</div>
	</div>
</div>


</body>
</html>