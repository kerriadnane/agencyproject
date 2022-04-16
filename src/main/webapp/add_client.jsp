
<!-- Modal Structure -->
<div id="modal1" class="modal modal-fixed-footer blue lighten-5">
	<div class="modal-content">

		<h4>Ajouter un client</h4>
		<div class="divider"></div>
		<div class="row"  style="margin-top:5%">
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
		</div>
	</div>
	<div class="modal-footer">
		<button id="cancel_client"
			class="btn waves-effect waves-light grey darken-1" type="submit"
			name="action">
			Annuler <i class="material-icons right ">cancel</i>
		</button>
		<button id="add_client" class="btn waves-effect waves-light"
			type="submit" name="action">
			Ajouter <i class="material-icons right">save</i>
		</button>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.modal').modal({
			dismissible : false
		});

		$('#add_client').on('click',function() {
			
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
						$('input[name=idclient]').val(data.id);
						$('#client').val(data.nom+" "+data.prenom);
						$('#client').focus();
						$('#nom_client').val('');
						$('#prenom_client').val('');
						$('#mail_client').val('');
						$('#tel_client').val('');
						$('#adresse_client').val('');
						
						$('.modal').modal().close();
						
					}
				}
			);
			
		})

		$('#cancel_client').click(function() {
			$('.modal').modal().close()
		})
	});
</script>