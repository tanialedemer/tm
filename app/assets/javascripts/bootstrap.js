//= require bootstrap
//= require bootstrap/collapse
//= require bootstrap/modal
//= require bootstrap/button
//= require bootstrap/affix
//= require bootstrap/tab
//= require bootstrap/alert
//= require bootstrap/transition
//= require bootstrap/tooltip
//= require bootstrap/popover
//= require bootstrap/scrollspy
//= require bootstrap/dropdown
//= require bootstrap/carousel
jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});
