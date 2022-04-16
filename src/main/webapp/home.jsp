<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- Compiled and minified JavaScript -->
<link href="css/lobibox.css" rel="stylesheet">
<link href="css/jquery-confirm.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous">
	
</script>



<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script type="text/javascript" src="js/jquery-confirm.js"></script>
<script type="text/javascript" src="js/lobibox.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

<style>
.centrer {
	height: 300px;
	display: flex;
	align-item: center;
	margin-top: 10%;
	justify-content: center;
}
</style>
</head>
<body class="">

	<div class="centrer">
		<div class="row card-panel blue lighten-5 z-depth-3">
			<div id="erreur" class="card-panel red darken-1" style="display:none;">
				<span class="white-text">
				Erreur d'authentification
				</span>
			</div>
			<div class="input-field col s12">
				<i class="material-icons prefix">person</i> <input id="user"
					type="text" class="validate"> <label for="user">Non
					d'utilisateur</label>
			</div>
			<div class="input-field col s12 ">
				<i class="material-icons prefix">lock</i> <input id="password"
					type="password" class="validate"> <label for="password">Mot
					de passe</label>
			</div>

			<div class="col s12">
				<button id="connect" class="btn waves-effect waves-light"
					type="submit" name="action">
					Se connecter <i class="material-icons right">send</i>
				</button>
			</div>
		</div>
	</div>


</body>
</html>

<script>
	$(document).ready(function() {
		$("#connect").on("click", function() {
			$.post("home?action=login", {
				username : $("#user").val(),
				password : $("#password").val(),
			}, function(data, status) {
				if (status == "success") {
					if (data == "erreur") {
						$("#erreur").show();
					} else {
						location.reload();  
					}
				} else {
					alert("erreur utilisateur erroné")
				}
			})
		});
	})
</script>

