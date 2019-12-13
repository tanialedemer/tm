// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require twitter/bootstrap
//= require jquery-readyselector
//= require turbolinks
//= require 'bootstrap-sass-official'
//= require cocoon
//= require chosen
//= require bootstrap
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

(function($){
$(document).ready(function(){

$('#cssmenu li.active').addClass('open').children('ul').show();
  $('#cssmenu li.has-sub>a').on('click', function(){
    $(this).removeAttr('href');
    var element = $(this).parent('li');
    if (element.hasClass('open')) {
      element.removeClass('open');
      element.find('li').removeClass('open');
      element.find('ul').slideUp(200);
    }
    else {
      element.addClass('open');
      element.children('ul').slideDown(200);
      element.siblings('li').children('ul').slideUp(200);
      element.siblings('li').removeClass('open');
      element.siblings('li').find('li').removeClass('open');
      element.siblings('li').find('ul').slideUp(200);
    }
  });

});
})(jQuery);
