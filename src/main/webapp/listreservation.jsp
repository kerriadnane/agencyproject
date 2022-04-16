
<div style="padding:0px">
	<table id="example" class="display responsive-table compact">
	        <thead>
	            <tr>
	                <th>Date</th>
	                <th>Départ</th>
	                <th>Arrivé</th>
	                <th>Nom client</th>
	                <th>Prenom client</th>
	                <th>Prix</th>
	                <th>Action</th>
	            </tr>
	        </thead>
	</table>
    
    
</div>
    <style>
    
    </style>
    <script>
    
    
    $(document).ready(function(){
    	$.get("ajaxreservation", function(data, status){
    		if(status === "success"){
    			$('#example').DataTable( {
    	        	data:data,
    	        	select: false,
    	        	paging:true,
    	        	"lengthMenu": [ 5 ],
    	        	"columns": [
    	        	    { "data": "date_res" },
    	        	    { "data": "aereport_dep"},
    	        	    { "data": "aereport_arr" },
    	        	    { "data": "nom_client"},
    	        	    { "data": "prenom_client"},
    	        	    { "data": "prix" },
    	        	    { "data": null, "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
    	                    $(nTd).html(
    	                    		"<a  href='reservationdetail?id="+oData.idreservation+"' id='"+oData.idreservation+"'><i class='material-icons prefix '>art_track</i></a>&nbsp;&nbsp;"+
    	                    		"<a  href='reservationupdate?id="+oData.idreservation+"'><i class='material-icons prefix'>update</i></a>&nbsp;&nbsp;"+
    	                    		"<a  href='#' id='deletereservation' onclick=deletereservation("+oData.idreservation+")><i class='material-icons prefix'>delete</i></a>&nbsp;&nbsp;");
    	                } }
    	        	 ]
    	        } );
    		};
    	});
    	
    	deletereservation =  function(id){
    		// requete ajax ver la servlet AjaxClient pour supprimer le client 
    		// USE jquery-confirm..... !!
    		$.confirm({
    			boxWidth: '500px',
    		    title:'Confirmation',
    		    content:'Supprimer la reservation ?',
    		    type: 'red',
    		    buttons: {
    		        confirm:{
    		        	text:'Supprimer',
    		        	btnClass:'red darken-4',
    		        	action: function () {
    		        		
	    		        		$.ajax({
	    		        		    url: 'ajaxreservation?id='+id,
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
			        		        		msg: 'Reservation supprimé avec succès'
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