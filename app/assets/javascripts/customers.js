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
      console.log(response);
    }).fail(function(response){
      alert(response);
    });
  });


});
