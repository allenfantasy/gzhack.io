// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  if ($('#home section#about').length > 0) {
    $('#signup #add_homepage').click(function() {
      var $div = $('<div></div>', {
        'class': 'row'
      }).appendTo($('#signup .field.personal .input'));

      $('<input></input>', {
        'type': 'text',
        'name': 'user[homepage][' + $('#signup .personal input').length + ']'
      }).appendTo($div);

      $('#signup #add_homepage').appendTo($div);
    });
  }
});
