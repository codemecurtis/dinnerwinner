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
    // console.log(context)
  }).fail(function(response){
    alert(response)
  });

  $("#requests-list").on('click','.make_an_offer_link', function(event){
    event.preventDefault();
      // debugger
    // document.getElementById('wrapper'+$(this).attr('href')).style.display="block"
    $('#wrapper'+$(this).attr('href')).modal();
    $.ajax({
      url: window.location+'/deals',
      method: 'GET',
      dataType: 'JSON'
    }).done(function(data){
      console.log("dsaf")
      var context = { deals: data };
      var source = $('#deals-template-offer').html();
      var template = Handlebars.compile(source);
      var html = template(context);
      // console.log(html)
      $('#wrapper').append(html);
    }).fail(function(response){
      alert(response)
    }); //close ajax
  }); //close request-lict on click


}); //close document





// });

