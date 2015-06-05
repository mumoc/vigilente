//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require hammer
//= require slider
//= require vigilente
//= require_self


$('form').on('submit', function() {
  ga('send', 'event', 'user', 'subscription');
});
