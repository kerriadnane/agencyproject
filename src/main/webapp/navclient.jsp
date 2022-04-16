<nav class="grey darken-1">
    <div class="nav-wrapper">
    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      <ul id="nav-mobile" class="left hide-on-med-and-down">
        
        <li>
	        <a href="/client" <c:if test="${ page == '/client'}"> class="act" </c:if>>
		        <i class="material-icons right">person_add</i>
		        Ajouter un nouveau client
	        </a>
        </li>
        <li>
        	<a href="listclient" <c:if test="${ page == '/listclient'}"> class="act" </c:if>>
	        	<i class="material-icons right">people</i>
	        	Liste des clients
        	</a>
        </li>
        <c:if test="${ page == '/clientupdate'}">
	        <li>
		        <a class="act" style="cursor:pointer;">
			        <i class="material-icons right">update</i>
			        Modifier un client
		        </a>
	        </li>
        </c:if>
        <c:if test="${ page == '/clientdetail'}">
	        <li>
		        <a class="act" style="cursor:pointer;">
			        <i class="material-icons right">assignment_ind</i>
			        Détail client
		        </a>
	        </li>
        </c:if>
      </ul>
    </div>
  </nav>
  
  <ul class="sidenav" id="mobile-demo">
        
        <li>
	        <a href="client" <c:if test="${ page == '/client'}"> class="act" </c:if>>
		        <i class="material-icons right">person_add</i>
		        Ajouter un nouveau client
	        </a>
        </li>
        <li>
        	<a href="listclient" <c:if test="${ page == '/listclient'}"> class="act" </c:if>>
	        	<i class="material-icons right">people</i>
	        	Liste des clients
        	</a>
        </li>
        <c:if test="${ page == '/clientupdate'}">
	        <li>
		        <a class="act" style="cursor:pointer;">
			        <i class="material-icons right">update</i>
			        Modifier un client
		        </a>
	        </li>
        </c:if>
         <c:if test="${ page == '/clientdetail'}">
	        <li>
		        <a class="act" style="cursor:pointer;">
			        <i class="material-icons right">assignment_ind</i>
			        Détail client
		        </a>
	        </li>
        </c:if>
      </ul>
  
   <style>
  .act{
  	background-color:#616161
  }
  
  </style>
  
  <script>
  $(document).ready(function(){
	    $('.sidenav').sidenav();
	  });
  </script>