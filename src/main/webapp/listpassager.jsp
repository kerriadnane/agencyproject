
<div style="padding:0px">
	<table id="example" class="display responsive-table compact">
	        <thead>
	            <tr>
	                <th>Nom</th>
	                <th>Prénom</th>
	                <th>Adresse</th>
	                <th>Telephone</th>
	                <th>Email</th>
	                <th>Action</th>
	            </tr>
	        </thead>
	        
  </div>
	</table>
    <div class="progress">
    <div class="indeterminate"></div>
    
</div>
    <style>
    
    </style>
    <script>
    
    
    $(document).ready(function(){ 
    	$.get("ajaxpassager", function(data, status){
    		if(status === "success"){
    			$(".progress").hide();
    			$('#example').DataTable( {
    	        	data:data,
    	        	select: false,
    	        	paging:true,
    	        	"lengthMenu": [ 5 ],
    	        	"columns": [
    	        	    { "data": "nom" },
    	        	    { "data": "prenom" },
    	        	    { "data": "adresse" },
    	        	    { "data": "tel"},
    	        	    { "data": "email" },
    	        	    { "data": null, "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
    	                    $(nTd).html(
    	                    		"<a  href='passagerdetail?id="+oData.id+"' id='"+oData.id+"'><i class='material-icons prefix '>assignment_ind</i></a>&nbsp;&nbsp;"+
    	                    		"<a  href='passagerupdate?id="+oData.id+"'><i class='material-icons prefix'>update</i></a>&nbsp;&nbsp;"+
    	                    		"<a  href='#' id='deleteclient' onclick=deletepassager("+oData.id+")><i class='material-icons prefix'>delete</i></a>&nbsp;&nbsp;");
    	                } }
    	        	 ]
    	        } );
    		};
    	});
    	
    	deletepassager =  function(id){
    		// requete ajax ver la servlet AjaxClient pour supprimer le client 
    		// USE jquery-confirm..... !!
    		$.confirm({
    			boxWidth: '500px',
    		    title:'Confirmation',
    		    content:'Supprimer le passager ?',
    		    type: 'red',
    		    buttons: {
    		        confirm:{
    		        	text:'Supprimer',
    		        	btnClass:'red darken-4',
    		        	action: function () {
    		        		
	    		        		$.ajax({
	    		        		    url: 'ajaxpassager?id='+id,
	    		        		    type: 'DELETE',
	    		        		    success: function(result, status) {
	    		        		        if(status === 'success'){
	    		        		        	document.getElementById(id).parentElement.parentElement.remove();
	    		        		        	Lobibox.notify("info", {
			        		        		size: 'normal',
			        		        		//rounded: true,
			        		        		delay: 5000,
			        		        		delayIndicator: false,
			        		        		position: 'center bottom', //or 'center bottom'
			        		        		msg: 'Passager supprimé avec succès'
        		        		});
	    		        		        }
	    		        		    }
	    		        		});
    		        			
    		        			
    		        			
    		        }
    		        },
    		        cancel: function () {
    		            
    		        }
    		    }
    		});
    	}
    });
    
   
    </script>