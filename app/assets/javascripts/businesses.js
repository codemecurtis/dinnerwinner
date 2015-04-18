$(document).ready(function() {
  $(window).load(function(e){
    $.ajax({
      url: window.location+'/deals',
      method: 'GET',
      dataType: 'JSON'
    }).done(function(data){
      console.log("done done dlfkjlksjjklfs")
      var context = { deals: data };
      var source = $('#deals-template').html();
      var template = Handlebars.compile(source);
      var html = template(context);
      $('#wrapper').append(html);
    })
  });

  $('#wrapper').on("click", ".delete-button", function(e){
    e.preventDefault();
    $.ajax({
      url: window.location+/deals/+ $(this).attr('href'),
      type: 'DELETE',
    }).done(function(data){
      document.getElementById('tile-'+data).remove();
    })
  })

  // $('#wrapper').on("click", ".edit-button", function(e) {
  //   e.preventDefault;
  //   $.ajax({
  //     url: window.location+/deals/+ $(this).attr('href'),
  //     type: 'PATCH',
  //   }).done(function(data){
  //     // document.getElementById('tile-'+data).remove();
  //     console.log("in the patch route");
  //   })
  // })


})
