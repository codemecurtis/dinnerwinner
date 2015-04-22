$(document).on('page:change', function(){

  $('.customer-signup-link').on('click', function(e){
      e.preventDefault();
      $('.signup-modal').modal({
      overlayClose: true,
      onOpen: function (dialog) {
        dialog.overlay.fadeIn('slow', function () {
          dialog.container.slideDown('slow', function () {
            dialog.data.fadeIn('slow');
          });
        });
      },
      onClose: function (dialog) {
        dialog.container.slideUp('slow', function () {
          dialog.overlay.fadeOut('slow', function () {
            dialog.data.fadeIn('slow');
          });
        });
      }
    });
    })

  $('.customer-login-link').on('click', function(e){
    e.preventDefault();
    $('.login-modal').modal({
      overlayClose: true,
      onOpen: function (dialog) {
        dialog.overlay.fadeIn('slow', function () {
          dialog.container.slideDown('slow', function () {
            dialog.data.fadeIn('slow');
          });
        });
      },
      onClose: function (dialog) {
        dialog.container.slideUp('slow', function () {
          dialog.overlay.fadeOut('slow', function () {
            dialog.data.fadeIn('slow');
          });
        });
      }
    });
  })

});
