

<div class="row reservation">
	<div class="row" style="margin-top: 50px;">
		
		<div class="input-field col s12 m6 l3">
			<i class="material-icons prefix small">search</i> <input type="text"
				id="client" name="client" class="autocomplete"> <label
				for="client">Recherche client</label> <input type="hidden"
				name="idclient" />
		</div>
		<div class="  col s12 m6 l3">
			
			<a class="waves-effect waves-light btn modal-trigger" href="#modal1">
				<i class="material-icons prefix">person_add</i>
			</a>

		</div>

		<div class="input-field col s12 m6 l3">
			<i class="material-icons prefix">search</i> <input type="text"
				id="passager" name="passager" class="autocomplete"> <label
				for="passager">Recherche passager</label> <input type="hidden"
				name=idpassager />
		</div>
		
		<div class="col s12 m6 l3">

			<a class="waves-effect waves-light btn modal-trigger" href="#modal2">
				<i class="material-icons">person_add</i>
			</a>

		</div>
	</div>
	
	<div class="divider"></div>

	<div class="col s12">
		<div class="row">
			<div class="input-field col s4">
				<i class="material-icons prefix">date_range</i> <input name="date_depart" type="text"
					class="datepicker" id="date_depart"> <label
					for="date_depart">Date de départ</label>
			</div>
			<div class="input-field col s4">
				<i class="material-icons prefix">access_time</i> <input name="heure_depart" type="text"
					class="timepicker" id="heure_depart"> <label
					for="heure_depart">Heure de départ</label>
			</div>
			<div class="input-field col s4">
				<i class="material-icons prefix">flight_takeoff</i> <input 
					type="text" id="aereport_depart" class="autocomplete"> <label
					for="aereport_depart">Aereport de départ</label> <input
					type="hidden" name="aereport_depart" />
			</div>


			<div class="input-field col s4">
				<i class="material-icons prefix">date_range</i> <input name="date_arrive" type="text"
					class="datepicker" id="date_arrive"> <label
					for="date_arrive">Date Arrivé</label>
			</div>
			<div class="input-field col s4">
				<i class="material-icons prefix">access_time</i> <input name="heure_arrive" type="text"
					class="timepicker" id="heure_arrive"> <label
					for="heure_arrive">Heure de l'arrivé</label>
			</div>
			<div class="input-field col s4">
				<i class="material-icons prefix">flight_land</i> <input type="text"
					id="aereport_arrive" class="autocomplete"> <label
					for="aereport_arrive">Aereport Arrivé</label> <input type="hidden"
					name="aereport_arrive" />
			</div>
			<div class="input-field col s4">
				<i class="material-icons prefix">flight</i> <input type="text"
					id="company" class="autocomplete"> <label
					for="company">Companie</label> <input type="hidden"
					name="idcompany" />
			</div>
			<div class="input-field col s4">
				<i class="material-icons prefix">euro_symbol</i> <input name="prix" type="text"
					id="prix" > <label
					for="prix">Prix en dinar</label> 
			</div>
		</div>
	</div>

	<div class="col s12">
		<button id="submit"  class="btn waves-effect waves-light" type="submit"
			name="action">
			Enregistrer la reservation <i class="material-icons right">save</i>
		</button>

	</div>
	<%@ include file="add_client.jsp" %>
	<%@ include file="add_passager.jsp" %>
</div>




<style>

.reservation {
	margin-top: 10px;
}


</style>


<script>
	
</script>