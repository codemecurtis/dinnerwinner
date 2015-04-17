$ = jQuery.noConflict();
$(document).on('page:change', function() {
  $('.customer-signup-link').on('click', function(){
    $('.customer-signup-form').modal();
  })
});

