// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import '../stylesheets/application'
import './bootstrap_custom.js'

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
