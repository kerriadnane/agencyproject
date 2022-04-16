<nav class="grey darken-1">
    <div class="nav-wrapper">
    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      <ul id="nav-mobile" class="left hide-on-med-and-down">
        
        <li>
	        <a href="passager" <c:if test="${ page == '/passager'}"> class="act" </c:if>>
		        <i class="material-icons right">person_add</i>
		        Ajouter un nouveau passager
	        </a>
        </li>
        <li>
        	<a href="listpassager" <c:if test="${ page == '/listpassager'}"> class="act" </c:if>>
	        	<i class="material-icons right">people_outline</i>
	        	Liste des passagers
        	</a>
        </li>
        <c:if test="${ page == '/passagerupdate'}">
	        <li>
		        <a class="act" style="cursor:pointer;">
			        <i class="material-icons right">update</i>
			        Modifier un passager
		        </a>
	        </li>
        </c:if>
        <c:if test="${ page == '/passagerdetail'}">
	        <li>
		        <a class="act" style="cursor:pointer;">
			        <i class="material-icons right">assignment_ind</i>
			        Détail passager
		        </a>
	        </li>
        </c:if>
      </ul>
    </div>
  </nav>
  
  <ul class="sidenav" id="mobile-demo">
        
        <li>
	        <a href="passager" <c:if test="${ page == '/passager'}"> class="act" </c:if>>
		        <i class="material-icons right">person_add</i>
		        Ajouter un nouveau passager
	        </a>
        </li>
        <li>
        	<a href="listpassager" <c:if test="${ page == '/listpassager'}"> class="act" </c:if>>
	        	<i class="material-icons right">people_outline</i>
	        	Liste des passagers
        	</a>
        </li>
        <c:if test="${ page == '/passagerupdate'}">
	        <li>
		        <a class="act" style="cursor:pointer;">
			        <i class="material-icons right">update</i>
			        Modifier un passager
		        </a>
	        </li>
        </c:if>
        <c:if test="${ page == '/passagerdetail'}">
	        <li>
		        <a class="act" style="cursor:pointer;">
			        <i class="material-icons right">assignment_ind</i>
			        Détail passager
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