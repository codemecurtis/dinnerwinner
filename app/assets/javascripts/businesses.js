$(document).ready(function(){
  $(window).on('page:change', function(){

    $.ajax({
      url: window.location+'/request_list',
      // data:
    }).done(function(data){
      var context =  { requests: data};
      var source = $('#requests-template').html();
      var template = Handlebars.compile(source);
      var html = template(context)
      $('#requests-list').append(html)
      console.log(html)
    }).fail(function(response){
      alert(response)
    });
  });

});
