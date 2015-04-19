$(document).on('page:change', function(){

  // Customer creates request to restaurants
  $('.create-customer-deal').on('click', function(e){
    e.preventDefault();

    $.ajax({
      url: '/customer_deals',
      type: "POST",
      dataType: "json",
      data: {party_size: $('.select-party-size option:selected').text(), neighborhoods: $('.select-neighborhood option:selected').text(),
        reservation_time: $('.select-time option:selected').text()}
    }).done(function(response){
      console.log(response);
    }).fail(function(response){
      alert(response);
    });
  });

  $('.pending-deals li').on('click', function(e) {
      var id = $(this).attr('class')

      $.ajax({
        url: '/customer_deals/'+ id,
        type: 'GET',
        dataType: 'JSON',
      })
      .done(function(response) {
        console.log(response)
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
