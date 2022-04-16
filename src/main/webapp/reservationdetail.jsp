<ul class="collapsible popout expandable">
    <li class="active">
      <div class="collapsible-header teal lighten-5">
	      <i class="material-icons">person</i>
	      Client: &nbsp; 
	      <span class="blue-text">
	      	(${ reservation.getClient().getNom() }  ${ reservation.getClient().getPrenom() })
	      </span>
	      <span class="new badge red" data-badge-caption="Reservation">
	      	${ reservation.getClient().getReservations().size() }
	      </span>
      </div>
      <div class="collapsible-body">
      	<div class="row">
	      <div class="col s12 m6 l4">
	      	<p>Nom: <span class="blue-text">${ reservation.getClient().getNom() }</span></p>
	      </div>
	      <div class="col s12 m6 l4">
	      	<p>Prénom: <span class="blue-text">${ reservation.getClient().getPrenom() }</span></p>
	      </div>
	      <div class="col s12 m6 l4">
	      	<p>Adresse: <span class="blue-text">${ reservation.getClient().getAdresse() }</span></p>
	      </div>
	      <div class="col s12 m6 l4">
	      <p>Téléphone: <span class="blue-text">${ reservation.getClient().getTel() }</span></p>
	      </div>
	      <div class="col s12 m6 l4">
	      <p>Email: <span class="blue-text">${ reservation.getClient().getEmail() }</span></p>
	      </div>
	      
    	</div>
    	
      </div>
    </li>
    <li>
      <div class="collapsible-header teal lighten-5">
	      <i class="material-icons">person_outline</i>
	      Passager:
	      <span class="blue-text">
	      	(${ reservation.getPassager().getNom() }  ${ reservation.getPassager().getPrenom() })
	      </span>
	      <span class="new badge blue" data-badge-caption="Reservation">
	      	${ reservation.getPassager().getReservations().size() }
	      </span>
      </div>
      <div class="collapsible-body">
      	  <div class="row">
	      <div class="col s12 m6 l4">
	      	<p>Nom: <span class="blue-text">${ reservation.getPassager().getNom() }</span></p>
	      </div>
	      <div class="col s12 m6 l4">
	      	<p>Prénom: <span class="blue-text">${ reservation.getPassager().getPrenom() }</span></p>
	      </div>
	      <div class="col s12 m6 l4">
	      	<p>Adresse: <span class="blue-text">${ reservation.getPassager().getAdresse() }</span></p>
	      </div>
	      <div class="col s12 m6 l4">
	      <p>Téléphone: <span class="blue-text">${ reservation.getPassager().getTel() }</span></p>
	      </div>
	      <div class="col s12 m6 l4">
	      <p>Email: <span class="blue-text">${ reservation.getPassager().getEmail() }</span></p>
	      </div>
    	</div>
      </div>
    </li>
    <li>
      <div class="collapsible-header teal lighten-5">
	      <i class="material-icons">local_airport</i>
	      Vol
      </div>
      <div class="collapsible-body">
      <div class="row">
	      <div class="col s12 m6 l4">
	    
		    <div class="card horizontal">
		      
		      <div class="card-stacked">
		        <div class="card-content">
		          <p><i class="material-icons preffix">flight_takeoff</i>&nbsp; Départ:</p>
		          <blockquote >
			          <p>${ reservation.getVol().getAereport_dep().getNom() }</p>
			          <fmt:formatDate value="${ reservation.getVol().getDate_depart() }" pattern="dd/mm/yyyy"/>
			          <p>${ reservation.getVol().getHeure_debart() }</p>
		          </blockquote>
		        </div>
		        
		      </div>
		    </div>
	  	  </div>
	  	  <div class="col s12 m6 l4">
		    <div class="card horizontal">
		      
		      <div class="card-stacked">
		        <div class="card-content">
		          <p><i class="material-icons">flight_land</i>&nbsp;Arrivé:</p>
		          <blockquote>
			          <p>${ reservation.getVol().getAereport_arr().getNom() }</p>
			          <fmt:formatDate value="${ reservation.getVol().getDate_arrive() }" pattern="dd/mm/yyyy"/>
			          <p>${ reservation.getVol().getHeure_arrive() }</p>
		          </blockquote>
		        </div>
		        
		      </div>
		    </div>
	  	  </div>
	  	  <div class="col s12 m6 l4">
		    <div class="card horizontal">
		      
		      <div class="card-stacked">
		        <div class="card-content">
		          <p><i class="material-icons">local_airport</i>&nbsp;Companie:</p>
		          <blockquote>
		          	<p>${ reservation.getVol().getCompany().getNom() }</p>
		          	<p></p>
		          	<p></p>
		          </blockquote>
		        </div>
		      </div>
		    </div>
	  	  </div>
  	  </div>
      </div>
    </li>
  </ul>
  
  
  <script>
  $(document).ready(function(){
	    $('.collapsible').collapsible();
	  });
  </script>