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

  $('body').on('click', '.accept_pending_deal_dropdown_link', function(e){
    e.preventDefault();
// debugger
    $.ajax({
      url: $(this).attr('href'),
      type: 'PATCH'
      // dataType: "JSON"
      // data: {current_pending_count: parseInt($('#pending_deal_count').text())}
    }).done(function(data){
      console.log(data);
      // debugger
      $('#drop_list_item'+data.cd.id).remove()
      $('#pending_deal_count').text(data.pending_count)
      $.modal.close();
    })
  })


  $('.pending-deals li').on('click', function(e) {
    e.preventDefault()
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
        $('.customer-deal-modal').html("")
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
//same ajax call for the pic tiles
    $('body').on('click','.pic-link', function(e) {
      e.preventDefault()
      var id = $(this).attr('href') //this is the cutomer_deal
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
        $('.customer-deal-modal').html("")
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

    //ajax call to accept an offer


});
