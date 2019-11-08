
$(document).ready(function() {

    var repuesto_servicio_suggested = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace("descipcion"),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: window.location.origin + '/repuesto_serviciosuggestion',
      remote: {
        url: window.location.origin + '/repuesto_serviciosuggestion?query=%QUERY',
        wildcard: '%QUERY'
      }
    });

    $('#item_descripcion').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
    },
    {
      displayKey: 'descipcion',
      source: repuesto_servicio_suggested,
      templates: {
        suggestion: function (repuesto_servicio) {
            return '<p>' + repuesto_servicio.descripcion + '</p>';
        }
      }
    });


    $('#item_descripcion').typeahead('val', $('#item_brand_name').val() );

    $('#item_descripcion').on('typeahead:select', function(object, datum){
        $('#repuesto_servicio_id').val(datum.id);
    });

    $('#item_descripcion').on('typeahead:change', function(event, data){
        $('#repuesto_servicio_id').val(data);
        $(this).trigger('typeahead:_propia', data)
    });

    $('#repuesto_servicio').on('blur', function() {
        data = $('#repuesto_servicio').val();
        $(this).trigger('typeahead:_propia', data)
        url = '/validate_suggested_repuesto';
        $.ajax({
            url: url,
            data: { repuesto_servicio_descripcion: data },
            success: function(res){
                if (res["0"].valid == false){
                    // Marca no válida
                    $('#repuesto_servicio').css('border-color', 'red');
                }else{
                    // Marca correcta
                    $('#repuesto_servicio_id').val(res["0"].id.toString());
                    $('#repuesto_servicio').css('border-color', '#ccc');
                }
            }
        });
    });

    $('#repuesto_servicio').on('typeahead:_propia', function(evt, datum){
    });
});
