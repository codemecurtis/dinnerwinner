$(document).on('page:change', function(){
  $('.create-customer-deal').on('click', function(e){
    e.preventDefault();

    $.ajax({
      url: '/customer_deals',
      type: "POST",
      dataType: "json",
      data: {party_size: $('.select-party-size option:selected').text(), neighborhoods: $('.select-neighborhood option:selected').text(),
        reservation_time: $('.select-time option:selected').text()}
    }).done(function(response){
      $('.success').fadeIn('200', function(){});
      setTimeout(function(){
        $('.success').fadeOut(2500);
      })
    }).fail(function(response){
      alert(response);
    });
  });

  $('.pending-deals li').on('click', function(e) {
      var id = $(this).attr('class')
      var source = $('#pending-deals').html();
      var template = Handlebars.compile(source)
      var context = {}
      $.ajax({
        url: '/customer_deals/'+ id,
        type: 'GET',
        dataType: 'JSON',
      })
      .done(function(response) {
        console.log(response);
        context.business = response.requested_business
        context.deal = response.pending_deal
        context.customer_deal = response.customer_deal
        $('.customer-deal-modal').append(template(context))
        $('.customer-deal-modal').modal({
          overlayClose: true
        });
        console.log("success");
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });
  })
});
