
    <div class="row">
    <div class="col s12">
    	<h5>Etat civil</h5>
    	<div class="divider"></div>
    	<div class="card-panel  grey lighten-2 lighten-3 z-depth-3  row">
        	<div class="col s12 m6 l4">Nom: ${ passager.getNom() }</div>
        	<div class="col s12 m6 l4">Prénom: ${ passager.getPrenom() }</div>
        	<div class="col s12 m6 l4">Téléphone: ${ passager.getTel() }</div>
        	<div class="col s12 m6 l4">Adresse: ${ passager.getAdresse() }</div>
        	<div class="col s12 m6 l4">Email: ${ passager.getEmail() }</div>
      	</div>
    </div>
    <h5>Réservations effectuées <span class=" new badge blue"  data-badge-caption="${ passager.getReservations().size()}"> Nombre de reservation </span></h5>
    <div class="divider"></div>
    <c:forEach items="${passager.getReservations()}" var="liste">
      <div class="col s12 m6 l4">
      	<div class="card z-depth-3">
		    <div class="card-content">
		    <blockquote>
		      <p>Numéro de reservation: <span class="blue-text">${ liste.getId() }</span></p>
		      <p>
		      	Date de reservation: 
		      	<span class="blue-text">
		      		
		      		<fmt:formatDate value="${ liste.getDate_res() }" pattern="dd/MM/YYYY"/>
		      	</span>
		      </p>
		      <p>
		      	Prix: 
		      	<span class="green-text">
		      		
		      		<fmt:formatNumber value="${liste.getPrix()}" type="number"/> DA
		      	</span>
		      </p>
		       
		       
		    </blockquote>
		    </div>
		    <div class="card-tabs">
		      <ul class="tabs tabs-fixed-width">
		        <li class="tab">
		        	<a href="#test1${ liste.getId() }">
	  					<i class="material-icons">local_airport</i>
            		</a>
            	</li>
		        <li class="tab">
		        	<a href="#test2${ liste.getId() }">
			        	<i class="material-icons">person</i>
		        	</a>
		        </li>
		      </ul>
		    </div>
		    <div class="card-content grey lighten-4">
		      <div id="test1${ liste.getId() }">
		      
		      	<p>
		      		Date de départ: 
		      		<span class="blue-text">
		      			<fmt:formatDate value="${ liste.getVol().getDate_depart() }" pattern="dd/mm/yyyy"/>
		      		</span>
		      	</p>
		      	<p>Heure de départ: <span class="blue-text">${ liste.getVol().getHeure_debart() }</span></p>
		      	<p>
		      		Aereport de départ: 
		      		<span class="blue-text">
		      			<a href="#">${ liste.getVol().getAereport_dep().getNom() } </a>
		      		</span>
		      	</p>
		      	<p>
		      		Date arrivé: 
		      		<span class="blue-text">
		      			<fmt:formatDate value="${ liste.getVol().getDate_arrive() }" pattern="dd/mm/yyyy"/>
		      		</span>
		      	</p>
		      	<p>Heure arrivé: <span class="blue-text">${ liste.getVol().getHeure_arrive() }</span></p>
		      	<p>
		      		Aereport arrivé: 
		      		<span class="blue-text">
		      			<a href="#">${ liste.getVol().getAereport_arr().getNom() } </a>
		      		</span>
		      	</p>
		      </div>
		      <div id="test2${ liste.getId() }">
		      	<p>Nom: <span class="blue-text">${ liste.getClient().getNom() }</span></p>
		      	<p>Prénom: <span class="blue-text">${ liste.getClient().getPrenom() }</span></p>
		      	<p>Adresse: <span class="blue-text">${ liste.getClient().getAdresse() }</span></p>
		      	<p>Téléphone: <span class="blue-text">${ liste.getClient().getTel() }</span></p>
		      	<p>Email: <span class="blue-text">${ liste.getClient().getEmail() }</span></p>
		      </div>
		    </div>
		  </div>
      </div>
    </c:forEach> 	
    </div>
    
    <script>
    $(document).ready(function(){
        $('.tabs').tabs({
        	//swipeable:true
        });
      });
    </script>
          