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
//= require bootstrap/alert
//= require bootstrap/affix
//= require bootstrap/scrollspy
//= require flat-ui
//= require skdslider
//= require_tree .

$(document).ready(function() {
  if ($('#home .signup').length > 0) {
    var $inputs = $('#signup form#new_user .personal .inputs');
    $inputs.find('#add_homepage').click(function() {
      $('<input></input>', {
        'type': 'text',
        'name': 'user[homepage][' + $inputs.find('input').length + ']',
        'class': 'form-control'
      }).insertBefore($inputs.find('#add_homepage'));
    });

    $(".select-role input[name='user[user_type]']").change(function(){
      if($("input:radio[name='user[user_type]']:checked").val() === "others"){
        $("#other_type").trigger('focus');
      } else {
        $("#other_type").trigger('blur');
      }
    });
    $('#other_type').focus(function() {
      $(".select-role input[name='user[user_type]']").attr('checked', false);
      $("#user_user_type_others").attr('checked', 'checked');

      $('.select-role .radio').removeClass('checked');
      $("input#user_user_type_others").parent('.radio').addClass('checked');

    });
  }

  if ($('#projects').length > 0) {
    var $inputs = $('#projects form#new_project .team .inputs')
    $inputs.find('#add_member').click(function() {
      $('<input></input>', {
        'type': 'text',
        'name': 'project[team][' + $inputs.find('input').length + ']',
        'class': 'form-control'
      }).insertBefore($inputs.find('#add_member'));
    });
  }

});
