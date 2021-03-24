<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" />
<title>따릉이는 처음이라</title>
</head>
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
                <h1 class="masthead-heading text-uppercase mb-0">MAP</h1>
                <p>
                <!-- Masthead Avatar Image-->
                <div id="map" style="width: 100%; height: 70vh;"></div>
            </div>
        </header>
</body>
<script type="text/javascript"   src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script async defer   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAR6YEhjTwI3KkMiZCo9lsV7tlcQRkbDE4&callback=&region=kr"></script>
<script>
   function ddaData(){
      $.ajax({
          url : "http://openapi.seoul.go.kr:8088/4e48475a7970726531303078534f6e4f/json/bikeList/1/1000/",
          type : "get",
          dataType: "json",
          success : function(data){
             var latitude = '';
            var longitude = '';
            if (navigator.geolocation) { // GPS를 지원하면
               navigator.geolocation.getCurrentPosition(function(position) {
                  latitude = position.coords.latitude;
                  longitude = position.coords.longitude;
               }, 
               function(error) {
                  console.error(error);
               }, {
                  enableHighAccuracy: false,
                  maximumAge: 0,
                  timeout: Infinity
               });
            } else {
                alert('GPS를 지원하지 않습니다');
            }
            
              var list = data.rentBikeStatus.row;
              
            var map = new google.maps.Map(document.getElementById("map"), {
               zoom: 15,
               scrollwheel: false,
               center: new google.maps.LatLng(latitude, longitude),
            });
            
            // 지도 좌표 설정
            for (var i = 0; i < list.length; i++) {
               var latitude = parseFloat(list[i].stationLatitude) ? parseFloat(list[i].stationLatitude) : 0;
               var longitude = parseFloat(list[i].stationLongitude) ? parseFloat(list[i].stationLongitude) : 0;
               
               if (latitude != 0 && longitude != 0) {
                  map.panTo(new google.maps.LatLng(latitude, longitude));
                  break;
               }
               
               var marker = new google.maps.MarKer({
                  position: new google.maps.LatLng(latitude, longitude),
                  map: map,
                  title: list[i].stationName
               });
            }
            
            // 지도 좌표 설정
            for (var i = 0; i < list.length; i++) {
               var title = list[i].stationName;
               var lat = list[i].stationLatitude;
               var lng = list[i].stationLongitude;
               var cnt = list[i].parkingBikeTotCnt;
               
               var pos = new google.maps.LatLng(lat, lng);
               var m = new google.maps.Marker({
                  position: pos,
                  title: title + '(대여가능 : '+ cnt +')',
                  map:map,
                  animation: google.maps.Animation.DROP
               });
               
               m.addListener('click', function(){
                  alert(this.getTitle());
               });
            }
                          
          },
          error : function(info, xhr){
             
          }
      });
      
   }
   
   ddaData();
   
</script>


<body>

</body>
</html>
</body>
</html>