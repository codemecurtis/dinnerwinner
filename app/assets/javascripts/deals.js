$(document).on("page:change",function(){
  //READ
  //lists all of the deals in the current business

    $.ajax({
      url: window.location+'/deals',
      method: 'GET',
      dataType: 'JSON'
    }).done(function(data){
      var context = { deals: data };
      var source = $('#deals-template').html();
      var template = Handlebars.compile(source);
      var html = template(context);
      $('#wrapper').append(html);
    })

//UPDATE
  //this is to get the edit modal to appear
  $('#wrapper').on('click', '.edit-button', function(e){
    e.preventDefault();
    $("#edit"+ $(this).attr("href")).modal({
      overlayClose: true
    })
  })

  // and disappear
  $('#wrapper').on("click", ".cancel-button", function(e){
    e.preventDefault();
    $($(this).attr("href")).close()
  })

  // //this is to submit stuff to the DB
  $('#wrapper').on("submit",'#edit_form', function(e){
    e.preventDefault();
    var that  = $(this).attr('action')
    $.ajax({
      url: window.location+'/'+$(this).attr('action'),
      data:$(this).serialize(),
      type: 'PATCH',
    }).done(function(data){
      document.getElementById("edit-"+ that).style.display = "none";
      document.getElementById('h3-'+ that).innerHTML = data.name;
      document.getElementById(that).innerHTML = data.short_description;
      document.getElementById('img-'+that).src = data.deal_image;
    })
  })

//DESTROY
// to delete fom a database
$('#wrapper').on("click", ".delete-button", function(e){
  e.preventDefault();
  $.ajax({
    url: window.location+'/'+ $(this).attr('href'),
    type: 'DELETE',
  }).done(function(data){
    document.getElementById('tile-'+data).remove();
  })
})

//CREATE
//getting the create modal to appear
$('body').on('click', '.create-button', function(e){
  e.preventDefault();
  $('create-form-container').modal({
    overlayClose: true
  })
})
// and disappear
$('body').on("click", ".cancel-button", function(e){
  e.preventDefault();
  $('.create-form-container').close();
})

 //sending create data to the DB
 $('body').on("submit",'.create-form', function(e){
  e.preventDefault();
  $.ajax({
    url: window.location,
    data:$(this).serialize(),
    dataType: 'JSON',
    type: 'POST',
  }).done(function(data){
    $('.create-form-container').modal({
      overlayClose: true
    });
    $('#create-form').trigger('reset')
    console.log(data)
    console.log("created data base entry")
    var context = { deals: data };
    var source = $('#deals-template').html();
    var template = Handlebars.compile(source);
    var html = template(context);
    document.getElementById('wrapper').innerHTML=html
  })
})

})
