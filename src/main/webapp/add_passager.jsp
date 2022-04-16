

<!-- Modal Structure -->
<div id="modal2" class="modal modal-fixed-footer blue lighten-5 scale-transition">
	<div class="modal-content">
	<h4>Ajouter un nouveau passager</h4>
		<div class="row" style="margin-top:5%">
				<div class="input-field col s4">
					<i class="material-icons prefix">account_circle</i> <input
						id="nom_passager" type="text" class="validate"> <label
						for="nom_passager">Nom du passager</label>
				</div>
				<div class="input-field col s4">
					<i class="material-icons prefix">account_circle</i> <input
						id="prenom_passager" type="text" class="validate"> <label
						for="prenom_passager">Prenom du passager</label>
				</div>
				<div class="input-field col s4">
					<i class="material-icons prefix">mail</i> <input id="mail_passager"
						type="email" class="validate"> <label for="mail_passager">Email
						passager</label>
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
			</div>
	</div>
	<div class="modal-footer">
		<button id="cancel_passager" class="btn waves-effect waves-light grey darken-1" type="submit"
			name="action">
			Annuler <i class="material-icons right ">cancel</i>
		</button>
		<button id="add_passager" class="btn waves-effect waves-light" type="submit"
			name="action">
			Ajouter <i class="material-icons right">save</i>
		</button>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.modal').modal(
				{
					dismissible:false
				});

		$('#add_passager').click(function() {
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
							$('input[name=idpassager]').val(data.id);
							$('#passager').val(data.nom+" "+data.prenom);
							$('#passager').focus();
							$('#nom_passager').val('');
							$('#prenom_passager').val('');
							$('#mail_passager').val('');
							$('#tel_passager').val('');
							$('#adresse_passager').val('');
							
							$('.modal').modal().close();
							
						}
					}
				);
			$('.modal').modal().close()
		})
		
		$('#cancel_passager').click(function() {
			$('.modal').modal().close()
		})
	});
</script>