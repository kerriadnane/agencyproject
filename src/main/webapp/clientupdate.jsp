<div class="row"  style="margin-top:5%">
			<div class="input-field col s12 m6 l4">
				<i class="material-icons prefix">account_circle</i> <input
					id="nom_client" type="text" class="validate" value="${ client.getNom() }"> <label
					for="nom_client">Nom du client</label>
			</div>
			<div class="input-field col s12 m6 l4">
				<i class="material-icons prefix">account_circle</i> <input
					id="prenom_client" type="text" class="validate" value="${ client.getPrenom() }"> <label
					for="prenom_client">Prenom du client</label>
			</div>
			<div class="input-field col s12 m6 l4">
				<i class="material-icons prefix">mail</i> <input id="mail_client"
					type="email" class="validate" value="${ client.getEmail() }"> <label for="mail_client">Email
					client</label>
			</div>
			<div class="input-field col s12 m6 l4 ">
				<i class="material-icons prefix">phone</i> <input size="small"
					id="tel_client" type="tel" class="validate" value="${ client.getTel() }"> <label
					for="tel_client">Téléphone du client</label>
			</div>
			<div class="input-field col s12 m6 l4">
				<i class="material-icons prefix">location_city</i> <input
					id="adresse_client" type="text" class="validate" value="${ client.getAdresse() }"> <label
					for="adresse_client">Adresse du client</label>
			</div>
			
		<input type="hidden" name="idclient" value="${ client.getId() }"/>	
		</div>
		
		<button id="add_client" class="btn waves-effect waves-light"
			type="submit" name="action">
				Mettre a jour les modifications <i class="material-icons right">save</i>
		</button>
		
		
		
		<script>
			$(document).ready(function(){
				$("#add_client").click(function(){
					$.ajax({
							url:'ajaxclient?id='+$("input[name=idclient]").val(),
							type:'put',
							data:{
									nom_client:$('#nom_client').val(),
									prenom_client:$('#prenom_client').val(),
									mail_client:$('#mail_client').val(),
									tel_client:$('#tel_client').val(),
									adresse_client:$('#adresse_client').val()
							},
							success:function(data, status){
								console.log(status)
							}
					});
				});
			});
		</script>
		
		
		