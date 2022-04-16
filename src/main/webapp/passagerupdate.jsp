<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="new_passager" style="margin-top:5%">
			
			<div class="row">
				<div class="input-field col s4">
					<i class="material-icons prefix">account_circle</i> <input value="${ passager.getNom() }"
						id="nom_passager" type="text" class="validate" required> <label
						for="nom_passager" >Nom du passager</label>
				</div>
				<div class="input-field col s4">
					<i class="material-icons prefix">account_circle</i> <input value="${ passager.getPrenom() }"
						id="prenom_passager" type="text" class="validate"> <label
						for="prenom_passager">Prenom du passager</label>
				</div>
				<div class="input-field col s4">
					<i class="material-icons prefix">mail</i> <input id="mail_passager" value="${ passager.getEmail() }"
						type="email" class="validate"> <label for="mail_passager">Email
						du passager</label>
				</div>
				<div class="input-field col s4 ">
					<i class="material-icons prefix">phone</i> <input size="small" value="${ passager.getTel() }"
						id="tel_passager" type="tel" class="validate"> <label
						for="tel_passager">Téléphone du passager</label>
				</div>
				<div class="input-field col s4">
					<i class="material-icons prefix">location_city</i> <input value="${ passager.getAdresse() }"
						id="adresse_passager" type="text" class="validate"> <label
						for="adresse_passager">Adresse du passager</label>
				</div>
				<div class="col s12">
					<button id="add_passager"  class="btn waves-effect waves-light " type="submit"
						name="action">
						Mettre a jour les modifications
						<i class="material-icons right">save</i>
					</button>
				</div>
				
				<input type="hidden" name="idpassager" value="${ passager.getId() }"/>	
			</div>
		</div>
		
		<script>
			$(document).ready(function(){
				$("#add_passager").click(function(){
					
					$.ajax({
							url:'ajaxpassager?id='+$("input[name=idpassager]").val(),
							type:'put',
							data:{
									nom_passager:$('#nom_passager').val(),
									prenom_passager:$('#prenom_passager').val(),
									mail_passager:$('#mail_passager').val(),
									tel_passager:$('#tel_passager').val(),
									adresse_passager:$('#adresse_passager').val()
							},
							success:function(data, status){
								console.log(status)
							}
					});
				});
			});
		</script>
		
		
		
		