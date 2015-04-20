$(document).on('page:change', function(){

    $('.business-signup-link').on('click', function(e){
        e.preventDefault();
        $('.signup-modal').modal({
          overlayClose: true
        })
      })

    $('.business-login-link').on('click', function(e){
      e.preventDefault();
      $('.login-modal').modal({
        overlayClose: true
      })
    })

  $("#requests-list").on('click','.make_an_offer_link', function(event){
    event.preventDefault();
    var customerDealID=$(this).attr('href')
    $('#wrapper-for').modal({overlayClose: true});
    console.log(customerDealID)
    $("body").on('submit', '#make-offer', function(e){
      e.preventDefault();
      $.ajax({
        url: '/customer_deals/'+customerDealID,
        data: $('#make-offer').serialize(),
        type: 'PATCH'
      }).done(function(data){
        $.modal.close();
        $('#requests-list').find($('#list'+data.id)).remove();
        console.log(data)
      })
    });

  });

  $("body").on('submit','.create_mass_deal_form', function(e){
    e.preventDefault();
    $.ajax({
      url:$(this).attr("action"),
      data:$('#create-form').serialize(),
      type:'POST'
    }).done(function(data){
      console.log(data)
      var html = "<li id=mass"+data.id+" class='deal deal-"+data.id+"'><img src='"+data.deal_image+"'><h3> "+data.name+" </h3><p>"+ data.short_description +"</p></li>"
      $(".mass-deals-list").append(html)
      $.modal.close();
    })

  })


  $('body').on('click','.cancel_mass_deal_link', function(e){
    e.preventDefault()
    $.ajax({
      url:$(this).attr("href"),
      type:'DELETE'
    }).done(function(data){
      console.log(data)
    })
  })

});

