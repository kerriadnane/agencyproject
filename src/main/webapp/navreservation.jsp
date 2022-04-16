<nav class="grey darken-1">
    <div class="nav-wrapper">
      <ul class="left hide-on-med-and-down">
        
        <li>
        	<a href="reservation" <c:if test="${ page == '/reservation'}"> class="act" </c:if>>
	        	<i class="material-icons right">insert_invitation</i>
	        	Ajouter une nouvelle réservation
        	</a>
        </li>
        <li>
        	<a href="listreservation" <c:if test="${ page == '/listreservation'}"> class="act" </c:if>> 
	        	<i class="material-icons right">list</i>
	        	Liste des réservations
        	</a>
        </li>
        <c:if test="${ page == '/reservationdetail'}">
	        <li>
	        	<a href=""  class="act" > 
		        	<i class="material-icons right">art_track</i>
		        	Détail de la réservation
	        	</a>
	        </li>
        </c:if>
      </ul>
    </div>
  </nav>
  
  <style>
  .act{
  	background-color:#616161
  }
  
  </style>