
		<div class="new_passager">
			<h5>Saisissez les informations du nouveau passager</h5>
			<div class="row">
				<div class="input-field col s4">
					<i class="material-icons prefix">account_circle</i> <input
						id="nom_passager" type="text" class="validate" required> <label
						for="nom_passager" >Nom du passager</label>
				</div>
				<div class="input-field col s4">
					<i class="material-icons prefix">account_circle</i> <input
						id="prenom_passager" type="text" class="validate"> <label
						for="prenom_passager">Prenom du passager</label>
				</div>
				<div class="input-field col s4">
					<i class="material-icons prefix">mail</i> <input id="mail_passager"
						type="email" class="validate"> <label for="mail_passager">Email
						du passager</label>
				</div>
				<div class="input-field col s4 ">
					<i class="material-icons prefix">phone</i> <input size="small"
						id="tel_passager" type="tel" class="validate"> <label
						for="tel_passager">Téléphone du passager</label>
				</div>
				<div class="input-field col s4">
					<i class="material-icons prefix">location_city</i> <input
						id="adresse_passager" type="text" class="validate"> <label
						for="adresse_passager">Adresse du passager</label>
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
			$.post('ajaxpassager',
				{
					nom_passager:$('#nom_passager').val(),
					prenom_passager:$('#prenom_passager').val(),
					mail_passager:$('#mail_passager').val(),
					tel_passager:$('#tel_passager').val(),
					adresse_passager:$('#adresse_passager').val()
				},
				function(data, status){
					if(status === 'success'){
						$('#nom_passager').val('');
						$('#prenom_passager').val('');
						$('#mail_passager').val('');
						$('#tel_passager').val('');
						$('#adresse_passager').val('');
						Lobibox.notify("success", {
    		        		size: 'normal',
    		        		//rounded: true,
    		        		delay: 5000,
    		        		delayIndicator: false,
    		        		position: 'center bottom', //or 'center bottom'
    		        		msg: 'Passager Ajouté avec succès'
        				});
						$("#nom_passager").focus();
					}
				}
			);
			
		})
		</script>