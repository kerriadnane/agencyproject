<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">	
<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Compiled and minified JavaScript -->
    <link href="css/lobibox.css" rel="stylesheet">
    <link href="css/jquery-confirm.css" rel="stylesheet">
    <script
			  src="https://code.jquery.com/jquery-3.6.0.js"
			  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
			  crossorigin="anonymous">
    </script>
    
    <script
			  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
			  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
			  crossorigin="anonymous"></script>
			  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script type="text/javascript" src="js/jquery-confirm.js"></script>
	<script type="text/javascript" src="js/lobibox.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
  
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<style>
body {
  margin: 0;
  font-family: "Lato", sans-serif;
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #757575;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #d5cfd0;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 1px 16px;
  /*height: 1000px;*/
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}
</style>
</head>

<body>
<div class="navbar-fixed">
  <nav class="teal">
    <div class="nav-wrapper container">
    <a href="#!" class="brand-logo">Réservation des vols</a>
  </div>
  </nav>
</div>        
<div class="sidebar">
  <a <c:if test="${ page == '/home' || page == null}">class="active"</c:if>
	  href="<c:url value="/home"></c:url>">
	  <i class="material-icons"> home &nbsp;</i>
   		Home
  </a>
  <a  <c:if test="${ page == '/reservation' || page == '/listreservation' || page == '/reservationdetail'}">class="active"</c:if>
  	  href="<c:url value="/reservation"></c:url>">
  	  <i class="material-icons"> local_airport &nbsp;</i> 
  	    Réservation
  </a>
  <a  <c:if test="${ page == '/client' || page == '/listclient' || page == '/clientupdate' || page == '/clientdetail'}">class="active"</c:if>
  	  href="<c:url value="/client"></c:url>">
  	  <i class="material-icons"> people &nbsp;</i> 
  	    Client
  </a>
  <a  <c:if test="${ page == '/passager' || page == '/listpassager' || page == '/passagerupdate' || page == '/passagerdetail'}">class="active"</c:if>
  	  href="<c:url value="/passager"></c:url>">
  	  <i class="material-icons"> airline_seat_legroom_normal &nbsp;</i> 
  	    Passager
  </a>
  <c:if test="${ sessionScope.username!=null }">
  <a  id="logout" 
  	  href="<c:url value="/logout"></c:url>">
  	  <i class="material-icons"> close &nbsp;</i> 
  	    Se déconnecter
  </a>
  </c:if>
</div>
<c:if test ="${ sessionScope.username != null }">
<div class="content">
  
  <c:if test="${ page == '/reservation' }">
  		<%@ include file="navreservation.jsp" %>
		<%@ include file="reservation.jsp" %>
  </c:if>
  
  <c:if test="${ page == '/listreservation' }">
  		<%@ include file="navreservation.jsp" %>
		<%@ include file="listreservation.jsp" %>
  </c:if> 
  
  <c:if test="${ page == '/home' }">
		<%@ include file="home1.jsp" %>
  </c:if>
  
  <c:if test="${ page == null }">
		<%@ include file="home1.jsp" %>
  </c:if>
  
  <c:if test="${ page == '/client'}">
  		<%@ include file="navclient.jsp" %>
		<%@ include file="client.jsp" %>
  </c:if>
  
  <c:if test="${ page == '/clientupdate'}">
  		<%@ include file="navclient.jsp" %>
		<%@ include file="clientupdate.jsp" %>
  </c:if>
  
  <c:if test="${ page == '/listclient'}">
  		<%@ include file="navclient.jsp" %>
		<%@ include file="listclient.jsp" %>
  </c:if>
  <c:if test="${ page == '/clientdetail'}">
  		<%@ include file="navclient.jsp" %>
		<%@ include file="clientdetail.jsp" %>
  </c:if>
  <c:if test="${ page == '/reservationdetail'}">
  		<%@ include file="navreservation.jsp" %>
		<%@ include file="reservationdetail.jsp" %>
  </c:if>
  
  <c:if test="${ page == '/passager'}">
  		<%@ include file="navpassager.jsp" %>
		<%@ include file="passager.jsp" %>
  </c:if>
  
   <c:if test="${ page == '/listpassager'}">
  		<%@ include file="navpassager.jsp" %>
		<%@ include file="listpassager.jsp" %>
  </c:if>
  
   <c:if test="${ page == '/passagerupdate'}">
  		<%@ include file="navpassager.jsp" %>
		<%@ include file="passagerupdate.jsp" %>
  </c:if>
  
  <c:if test="${ page == '/passagerdetail'}">
  		<%@ include file="navpassager.jsp" %>
		<%@ include file="passagerdetail.jsp" %>
  </c:if>

</div>
</c:if>

<c:if test="${ sessionScope.username == null }">
<%@ include file="home.jsp" %>
</c:if>
</body>
</html>

<script>

$(".dropdown-trigger").dropdown();



</script>
