<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>따릉이는 처음이라</title>
</head>

 <!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

<link href="css/styles.css" rel="stylesheet" />
<body id="page-top">
        <!-- Navigation-->
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
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">SEARCH</h1>
                <p>
                <!-- Masthead Avatar Image-->
                <br>
                <br>
                <input type="text" name="search" id="search" value="" /> 
      			<input type="button" name="btn" id="btn" onclick="search();" value="검색" placeholder="ex)합정역" style="color: black">	
                
                <p>
                <p>
            </div>
        </header>
        <br>
        <br>
    <div id="list"></div>
</body>

<script type="text/javascript"   src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script async defer   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAR6YEhjTwI3KkMiZCo9lsV7tlcQRkbDE4&callback=&region=kr"></script>
<script>
   function ddaData(searchTitle){
      searchTitle = searchTitle ||'';
      $.ajax({
          url : "http://openapi.seoul.go.kr:8088/4e48475a7970726531303078534f6e4f/json/bikeList/1/1000/",
          type : "get",
          dataType: "json",
          success : function(data){
              var list = data.rentBikeStatus.row;
              $("#list").html('');         //초기화
            for (var i = 0; i < list.length; i++) {
                 var html = '';
               var title = list[i].stationName;
               var cnt = list[i].parkingBikeTotCnt;
               var rackTotCnt = list[i].rackTotCnt;
               var shared = list[i].shared;
               
               if( title.indexOf(searchTitle) > 0 || searchTitle == ''){
                  html += '<div class="container">';
                  html += '   <div class="row">';
                  html += '      <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">';
                  html += '         <tbody>';
                  html += '            <tr>';
                  html += '               <td>'+ title +'</td>';
                  html += '            </tr>';
                  html += '            <tr>';
                  html += '               <td>자전거주차총건수 : '+ cnt +'</td>';
                  html += '            </tr>';
                  html += '            <tr>';
                  html += '               <td>거치대개수 : '+ rackTotCnt +'</td>';
                  html += '            </tr>';
                  html += '            <tr>';
                  html += '               <td>거치율 : '+ shared +'</td>';
                  html += '            </tr>';
                  html += '         </tbody>';
                  html += '      </table>';
                  html += '   </div>';
                  html += '</div>';
                  
                  $("#list").append(html);
               }
            }
                          
          },
          error : function(info, xhr){
             
          }
      });
   }

   function search(){
      ddaData($('#search').val());
   }
   
   ddaData();
   
</script>
</html>