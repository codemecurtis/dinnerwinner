$(document).ready(function() {
  console.log("hello");
  $(window).load(function(e){
    console.log('load dfsfsdf')
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
      url: $(this).attr("href"),
      type: 'DELETE',
    }).done(function(data){
      console.log("delete works");
    })
  })

})
