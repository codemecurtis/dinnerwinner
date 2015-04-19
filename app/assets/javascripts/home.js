$(document).on('page:change', function(){
  $('.customer-signup-link').on('click', function(e){
      e.preventDefault();
      $('.customer-signup-modal').modal({
        overlayClose: true
      })
    })

  $('.customer-login-link').on('click', function(e){
    e.preventDefault();
    $('.customer-login-modal').modal({
      overlayClose: true
    })
  })
});
