$(document).on('page:change', function(){

  $('.customer-signup-link').on('click', function(evt){
    evt.preventDefault();
    console.log('success')

    $('.customer-signup-popup').css({display: "block"});
  })
})
