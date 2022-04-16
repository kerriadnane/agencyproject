
$(document).ready(function() {
	$('.datepicker').datepicker({
		format: 'yyyy-mm-dd',
		minDate: new Date()
	});

	$('.timepicker').timepicker({
		
	});
});

$(document).ready(function() {
	$(function() {
		$.ajax({
			type: 'GET',
			url: 'ajaxaereport',
			success: function(response) {
				var aereportArray = response;
				var aereportList = {};
				for (var i = 0; i < aereportArray.length; i++) {
					aereportList[aereportArray[i].nom] = aereportArray[i];
				}
				$('#aereport_depart').autocomplete(
					{
						data: aereportList,
						onAutocomplete: function(txt) {
							$("input[name=aereport_depart]").val(aereportList[txt].id)
						}
						//aereportList
					});

				$('#aereport_arrive').autocomplete({
					data: aereportList,
					onAutocomplete: function(txt) {
						$("input[name=aereport_arrive]").val(aereportList[txt].id);
					}
					//aereportList
				});
			}
		});
	});

	////////////////////////////
	$(function() {
		$.ajax({
			type: 'GET',
			url: 'ajaxclient',
			success: function(response) {
				var clientArray = response;
				var clientList = {};
				for (var i = 0; i < clientArray.length; i++) {
					clientList[clientArray[i].nom+ " " + clientArray[i].prenom] = clientArray[i];
				}

				$('#client').autocomplete({
					data: clientList,
					onAutocomplete: function(txt) {
						$("input[name=idclient]").val(clientList[txt].id);
					}
					//aereportList
				});
			}
		});
	});

	$(function() {
		$.ajax({
			type: 'GET',
			url: 'ajaxpassager',
			success: function(response) {
				var passagerArray = response;
				var passagerList = {};
				for (var i = 0; i < passagerArray.length; i++) {
					passagerList[passagerArray[i].nom+ " " + passagerArray[i].prenom] = passagerArray[i];
				}
				console.log(passagerArray)
				$('#passager').autocomplete({
					data: passagerList,
					onAutocomplete: function(txt) {
						$("input[name=idpassager]").val(passagerList[txt].id)
					}
				});
			}
		});
	});
	// company
	$(function() {
		$.ajax({
			type: 'GET',
			url: 'ajaxcompany',
			success: function(response) {
				var companyArray = response;
				var companyList = {};
				for (var i = 0; i < companyArray.length; i++) {
					companyList[companyArray[i].nom+ " "+ companyArray[i].prenom] = companyArray[i];
				}

				$('#company').autocomplete({
					data: companyList,
					onAutocomplete: function(txt) {
						$("input[name=idcompany]").val(companyList[txt].id)
					}
					//aereportList
				});
			}
		});
	});



	$("#submit").on("click", function() {
		$idclient = $("input[name=idclient]").val();
		$idpassager = $("input[name=idpassager]").val();
		$date_depart = $("input[name=date_depart]").val();
		$heure_depart = $("input[name=heure_depart]").val();
		$aereport_depart = $("input[name=aereport_depart]").val();
		$date_arrive = $("input[name=date_arrive]").val();
		$heure_arrive = $("input[name=heure_arrive]").val();
		$aereport_arrive = $("input[name=aereport_arrive]").val();
		$idcompany = $("input[name=idcompany]").val();
		$prix = $("input[name=prix]").val();
		
		$.post("reservation",
			{
				idclient: $idclient,
				idpassager: $idpassager,
				date_depart: $date_depart,
				heure_depart: $heure_depart,
				aereport_depart: $aereport_depart,
				date_arrive: $date_arrive,
				date_arrive: $date_arrive,
				heure_arrive: $heure_arrive,
				aereport_arrive: $aereport_arrive,
				idcompany: $idcompany,
				prix: $prix
			},
			function(data, status) {
				if (status === "success") {
					$("input[name=idclient]").val('');
					$("input[name=idpassager]").val('');
					$("input[name=date_depart]").val('');
					$("input[name=heure_depart]").val('');
					$("input[name=aereport_depart]").val('');
					$("input[name=date_arrive]").val('');
					$("input[name=heure_arrive]").val('');
					$("input[name=aereport_arrive]").val('');
					$("input[name=idcompany]").val('');
					$("input[name=prix]").val('');
					$("#idclient").val('');
					$("#client").val('');
					$("#passager").val('');
					$("#aereport_depart").val('');
					$("#aereport_arrive").val('');
					$("#company").val('');
					
					Lobibox.notify("success", {
    		        		size: 'normal',
    		        		//rounded: true,
    		        		delay: 10000,
    		        		delayIndicator: false,
    		        		position: 'center bottom', //or 'center bottom'
    		        		msg: 'Reservation Ajouté avec succès cliquer pour aller au détails',
							delayIndicator: true, 
							onClickUrl: "reservationdetail?id="+data,
        				});
					
				}
			});
	});

});

