// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery_nested_form
//= require jquery-readyselector
//= require turbolinks
//= require 'bootstrap-sass-official'
//= require cocoon
//= require chosen
//= require select2
//= require bootstrap-modal
//= require bootstrap-modalmanager
//= require 'typeahead.js.js'
//= require jquery
//= require jquery-ui/widgets/autocomplete
//= require_tree .

$(document).on('turbolinks:load', function(){

  $(".chosen-select").chosen();

  $('form').on('click', '.remove_record', function(event){
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('tr').hide();
  return event.preventDefault();
});


  $('form').on('click', '.add_fields', function(event){
    var regexp, time;
    time= new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.fields').append($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
});
