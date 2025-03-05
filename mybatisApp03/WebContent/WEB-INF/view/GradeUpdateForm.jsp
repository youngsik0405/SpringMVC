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
<title>GradeUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() 
    {
        // 점수 입력 유효성 검사 (0~100)
        $("#myform").submit(function() 
        {
            var sub1 = parseInt($("#sub1").val());
            var sub2 = parseInt($("#sub2").val());
            var sub3 = parseInt($("#sub3").val());
            var errMsg = "";

            if (isNaN(sub1) || sub1 < 0 || sub1 > 100) {
            	errMsg += "과목1 점수는 0~100 사이의 값이어야 합니다.<br>";
            }
            if (isNaN(sub2) || sub2 < 0 || sub2 > 100) {
            	errMsg += "과목2 점수는 0~100 사이의 값이어야 합니다.<br>";
            }
            if (isNaN(sub3) || sub3 < 0 || sub3 > 100) {
            	errMsg += "과목3 점수는 0~100 사이의 값이어야 합니다.<br>";
            }

            if (errMsg !== "") 
            {
                $("#errMsg").html(errMsg);
                return;
            } 
 
        });
    });
</script>

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
					성적 데이터 수정
				</span>
				<span class="col-md-9">
					<a href="gradelist.action" role="button" class="btn btn-success btn-xs"
					id="btnList" style="vertical-align: bottom;">성적 리스트 출력</a>
				</span>
			</div>
		
			<div class="panel-body">
				<form action="gradeupdate.action?sid=${grade.sid }" method="post" id="myform">
					<table class="table table-striped">
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon1">
										번호 
									</span>
									<input type="text" id="sid" name="sid" class="form-control"
									value="${grade.sid }" readonly="readonly"> 
								</div>
							</td>
						</tr>
						
						<tr style="height: 10px;"></tr>
					
					 	<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon2">
										과목1 
									</span>
									<input type="text" id="sub1" name="sub1" class="form-control"
									placeholder="과목1" required="required" value="${grade.sub1 }">
									<span class="input-group-addon">0~100점 이내</span> 
								</div>
							</td>
						</tr>
						
						<tr style="height: 10px;"></tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon3">
										과목2 
									</span>
									<input type="text" id="sub2" name="sub2" class="form-control"
									placeholder="과목2" required="required" value="${grade.sub2 }">
									<span class="input-group-addon">0~100점 이내</span> 
								</div>
							</td>
						</tr>
						
						<tr style="height: 10px;"></tr>
						
						<tr>
							<td>
								<div class="input-group" role="group">
									<span class="input-group-addon" id="basic-addon4">
										과목3 
									</span>
									<input type="text" id="sub3" name="sub3" class="form-control"
									placeholder="과목3" required="required" value="${grade.sub3 }">
									<span class="input-group-addon">0~100점 이내</span> 
								</div>
							</td>
						</tr>
						
						<tr style="height: 20px;"></tr>
						
						<tr>
							<td colspan="2" style="text-align: center;">
								<button type="submit" class="btn btn-success">수정</button>
								<button type="reset" class="btn btn-default">취소</button>
		
								<span id="errMsg" style="font-size: small; color: red; display: none;">
							
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