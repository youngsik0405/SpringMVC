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
<title>StudentUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<!-- 타이틀 영역 -->
<div class="panel title">
	<h1>학생 성적 관리</h1>
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
					학생 데이터 입력
				</span>
				<span class="col-md-9">
					<a href="studentlist.action" role="button" class="btn btn-success btn-xs"
					id="btnList" style="vertical-align: bottom;">학생 리스트 출력</a>
				</span>
			</div>
		
			<div class="panel-body">
				<form action="studentupdate.action" method="post" id="myform">
					<table class="table table-striped">
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon1">
										번호 <sup style="color: red;">※</sup>
									</span>
									<input type="text" id="sid" name="sid" class="form-control"
									maxlength="30" readonly="readonly" value="${student.sid }">
									<span class="input-group-addon">30자 이내</span> 
								</div>
							</td>
						</tr>
						
						<tr style="height: 10px;"></tr>
					
					 	<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2">
										이름 <sup style="color: red;">※</sup>
									</span>
									<input type="text" id="name" name="name" class="form-control"
									 placeholder="name" maxlength="30" required="required" value="${student.name }">
									<span class="input-group-addon">30자 이내</span> 
								</div>
							</td>
						</tr>
						
						<tr style="height: 10px;"></tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon3">
										전화번호
									</span>
									<input type="tel" id="tel" name="tel" class="form-control"
									placeholder="tel" maxlength="40" required="required" value="${student.tel }">
									<span class="input-group-addon">40자 이내</span>
								</div>
							</td>
						</tr>
						
						<tr style="height: 20px;"></tr>
						
						<tr>
							<td colspan="2" style="text-align: center;">
								<button type="submit" class="btn btn-success">수정</button>
								<button type="reset" class="btn btn-default">취소</button>
								<br>
								
								<span style="font-size: small;">(※)는 필수입력 항목입니다.</span>
								<span id="errMsg" style="font-size: small; color: red; display: none;">
									필수입력 항목을 모두 입력해야 합니다.
								</span>
							
							</td>
						</tr>
						
						
					</table>
				
				</form>
			</div>
		
		</div>
	</div>

</div><!-- .container -->



</body>
</html>