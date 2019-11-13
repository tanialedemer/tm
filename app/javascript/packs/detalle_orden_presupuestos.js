$(document).ready(function(){

    $(document).on("shown.bs.modal", "#new-detail-modal", function() {


    	var items_suggested = new Bloodhound({
    	  datumTokenizer: Bloodhound.tokenizers.obj.whitespace("descripcion"),
    	  queryTokenizer: Bloodhound.tokenizers.whitespace,
          prefetch: window.location.origin + '/items_suggestion',
    	  remote: {
            url: window.location.origin + '/items_suggestion?query=%QUERY',
        	wildcard: '%QUERY'
    	  }
    	});

    	$('#detalle_orden_presupuestos_repuesto_servicio').typeahead({
    		  hint: true,
    		  highlight: true,
    		  minLength: 1
    	},
    	{
    	  displayKey: 'descripcion',
    	  source: items_suggested,
          templates: {
            suggestion: function (repuesto_servicio) {
                return '<p>' + repuesto_servicio.descripcion + '</p>';
            }
          }
    	});

        $('#detalle_orden_presupuestos_repuesto_servicio').focus();

    	$('#detalle_orden_presupuestos_repuesto_servicio').typeahead('val', $('#detalle_orden_presupuestos_descripcion').val() );

    	$('#detalle_orden_presupuestos_repuesto_servicio').on('typeahead:select', function(object, datum){
            $('#detalle_orden_presupuestos_repuesto_servicio').val(datum.id);
            $('#detalle_orden_presupuestos_cantidad').focus();
            subtotal();
        });

        $('#detalle_orden_presupuestos_repuesto_servicio').on('typeahead:change', function(event, data){
            $('#detalle_orden_presupuestos_repuesto_servicio').val(data);
        });

        $('#detalle_orden_presupuestos_repuesto_servicio').on('blur', function() {
        	data = $('#detalle_orden_presupuestos_repuesto_servicio').val();
        	url = '/validate_suggested_item';
        	$.ajax({
        		url: url,
        		data: { descripcion: data },
        		success: function(res){
        			if (res["0"].valid == false){
        				// Item no válido
        				$('#detalle_orden_presupuestos_repuesto_servicio').css('border-color', 'red');
        			}else{
        				// Item correcto
                        $('#detalle_orden_presupuestos_repuesto_servicio_id').val(res["0"].id.toString());
                        $('#detalle_orden_presupuestos_precio_venta').val(res["0"].precio_venta.toString());
        				$('#detalle_orden_presupuestos_repuesto_servicio').css('border-color', '#ccc');
                        subtotal();
        			}
        		}
        	});
        });

        function subtotal() {
            $('#detalle_orden_presupuestos_subtotal').val($('#detalle_orden_presupuestos_cantidad').val() * $('#detalle_orden_presupuestos_precio_venta').val());
        };

        $('#detalle_orden_presupuestos_cantidad').blur(function(){
             subtotal();
        });

        $('#detalle_orden_presupuestos_precio_venta').blur(function(){
             subtotal();
        });

    });
});
