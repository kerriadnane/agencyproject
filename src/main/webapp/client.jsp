<div class="new_client">
			<h5>Saisissez les informations du nouveau client</h5>
			<div class="row">
				<div class="input-field col s12 m6 l4">
					<i class="material-icons prefix">account_circle</i> <input
						id="nom_client" type="text" class="validate"> <label
						for="nom_client">Nom du client</label>
				</div>
				<div class="input-field col s12 m6 l4">
					<i class="material-icons prefix">account_circle</i> <input
						id="prenom_client" type="text" class="validate"> <label
						for="prenom_client">Prenom du client</label>
				</div>
				<div class="input-field col s12 m6 l4">
					<i class="material-icons prefix">mail</i> <input id="mail_client"
						type="email" class="validate"> <label for="mail_client">Email
						client</label>
				</div>
				<div class="input-field col s12 m6 l4 ">
					<i class="material-icons prefix">phone</i> <input size="small"
						id="tel_client" type="tel" class="validate"> <label
						for="tel_client">Téléphone du client</label>
				</div>
				<div class="input-field col s12 m6 l4">
					<i class="material-icons prefix">location_city</i> <input
						id="adresse_client" type="text" class="validate"> <label
						for="adresse_client">Adresse du client</label>
				</div>
				<div class="col s12">
					<button id="submit"  class="btn waves-effect waves-light " type="submit"
						name="action">
						Enregistrer  
						<i class="material-icons right">save</i>
					</button>
				</div>
			</div>
			
		</div>
		
		<script>
		$('#submit').on('click',function() {
			// requete ajax vers /clientajax
			$.post('ajaxclient',
				{
					nom_client:$('#nom_client').val(),
					prenom_client:$('#prenom_client').val(),
					mail_client:$('#mail_client').val(),
					tel_client:$('#tel_client').val(),
					adresse_client:$('#adresse_client').val()
				},
				function(data, status){
					if(status === 'success'){
						$('#nom_client').val('');
						$('#prenom_client').val('');
						$('#mail_client').val('');
						$('#tel_client').val('');
						$('#adresse_client').val('');
						Lobibox.notify("success", {
    		        		size: 'normal',
    		        		//rounded: true,
    		        		delay: 5000,
    		        		delayIndicator: false,
    		        		position: 'center bottom', //or 'center bottom'
    		        		msg: 'Client Ajouté avec succès'
        				});
						$("#nom_client").focus();
					}
				}
			);
			
		})
		</script>