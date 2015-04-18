$(document).ready(function() {
  $('#wrapper').load(function(e){
    $.ajax({
      url: window.location+'deals',
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

  //this is to get the modal to appear
  $('#wrapper').on('click', '.edit-button', function(e){
    e.preventDefault();
    document.getElementById("edit"+$(this).attr("href")).style.display = "block";
  })

  // //this is to submit stuff to the DB
  // $('.edit_form').on("submit", function(e){
  //   e.preventDefault();
  //   $.ajax({
  //     url: window.location+/deals/+ $(this).attr('action')+/edit,
  //     type: 'PATCH',
  //   }).done(function(data){
  //     document.getElementById('tile-'+data).remove();
  //   })
  // })

  $('#wrapper').on("click", ".delete-button", function(e){
    e.preventDefault();
    $.ajax({
      url: window.location+/deals/+ $(this).attr('href'),
      type: 'DELETE',
    }).done(function(data){
      document.getElementById('tile-'+data).remove();
    })
  })

  $('#wrapper').on("click", ".cancel-button", function(e){
    e.preventDefault();
    document.getElementById($(this).attr("href")).style.display = "none";
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
