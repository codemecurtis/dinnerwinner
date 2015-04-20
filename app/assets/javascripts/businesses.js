$(document).on('page:change', function(){
  $.ajax({
    url: window.location+'/request_list',
    // data:
  }).done(function(data){
    var context =  { requests: data};
    var source = $('#requests-template').html();
    var template = Handlebars.compile(source);
    var html = template(context)
    $('#requests-list').append(html)
    // debugger
    // console.log(context)
  }).fail(function(response){
    alert(response)
  });

  $("#requests-list").on('click','.make_an_offer_link', function(event){
    event.preventDefault();
    var customerDealID=$(this).attr('href')
    console.log(customerDealID)
    $('#wrapper-for').modal({overlayClose: true});
      $("body").on('submit', '#make-offer', function(e){
        e.preventDefault();
        $.ajax({
          url: '/customer_deals/'+customerDealID,
          data: $('#make-offer').serialize(),
          type: 'PATCH'
      }).done(function(data){
        console.log(data)
        // $('#wrapper-for').modal('hide');
      }).fail(function(response){
        alert(response)
      });

  });
})





}); //close document





// });

