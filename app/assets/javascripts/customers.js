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
    $.ajax({
      url: $(this).attr('href'),
      type: 'PATCH'
    }).done(function(data){
      // debugger
      console.log(data)
      var html = "<li class=' accepted-deal span_6_of_12'><div class='accepted-deal-image span_5_of_12'><h3>"+ data.cd.reservation_time +"</h3></div><div class='accepted-deal-info span_6_of_12'><p class='deal-business'>"+ data.b.name +"</p><p class='deal-address'>"+ data.b.address +"</p><p class='deal-title' id='h3"+ data.d.id +"'>data.d.name </p></div></li>"
      $('.accepted-deals').append(html)
      $('#drop_list_item'+data.cd.id).remove()
      $('#pending_deal_count').text(data.pending_count)
      $.modal.close();
    })
  })

//to accept a mass deal, but we have no way or telling which mass_deals you have accepted, because mass_deals can belong to many users, as opposed to one customer id

  // $('body').on('click', '.accept-mass-deal-link', function(e){
  //   e.preventDefault()
  //   $.ajax({
  //     url:$(this).attr('href'),
  //     type: 'PATCH'
  //   }).done(function(data){
  //     console.log(data)
  //     //append to accepted deals link
  //     var html="lklkkj"
  //     $('.accepted-deals').append(html)
  //     // debugger
  //   })
  // })


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
