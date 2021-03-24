<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name ="viewport" content="width=device-width", initial-scale="1">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" />
<link href="css/bootstrap" rel="stylesheet" />
<title>따릉이는 처음이라</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="main.jsp">S-BIKE</a>
                <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="search.jsp">MAP</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="list.jsp">SEARCH</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="dda.jsp">REIVEW</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="join.jsp">JOIN</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="login.jsp">LOGIN</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <center>
			<div class="container">
				<div class="col-lg-4" style="padding-top: 20px"></div>
				<div class="col-lg-4">
					<div class="jumbotron" style="padding-top: 20px;">
						<form method="post" action="joinAction.jsp">
							<h3 style="text-align:center">JOIN</h3>
							<div class = "form-group">
								<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
							</div>
							<div class="form-group" style="text-align:center;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
									</label>
										<label class="btn btn-primary">
										<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
									</label> 
								</div>
							</div>
							<div class="form-group">
								<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
							</div>
							<input type="submit" class="btn btn-default form-control" style="background-color: #1BBC9B; color: white" value="회원가입">
						</form>
				</div>
			</div>			
		</div>
		</center>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>