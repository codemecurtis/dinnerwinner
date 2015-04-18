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

  //this is to get the modal to appear
  $('#wrapper').on('click', '.edit-button', function(e){
    e.preventDefault();
    document.getElementById("edit"+$(this).attr("href")).style.display = "block";
  })
  // and disappear
  $('#wrapper').on("click", ".cancel-button", function(e){
    e.preventDefault();
    document.getElementById($(this).attr("href")).style.display = "none";
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
      document.getElementById("edit"+that).style.display = "none";
      document.getElementById('h3'+that).innerHTML = data.name;
      document.getElementById('p'+that).innerHTML = data.short_description;
    })
  })

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

//getting the create modal to appear
$(document).on('click', '.create-button', function(e){
  e.preventDefault();
  document.getElementById('create_form_container').style.display = "block";
})
// and disappear
$(document).on("click", ".cancel-button", function(e){
  e.preventDefault();
  document.getElementById('create_form_container').style.display = "none";
})

 //sending create data to the DB
 $(document).on("submit",'#create_form', function(e){
  e.preventDefault();
  $.ajax({
    url: window.location,
    data:$(this).serialize(),
    type: 'POST',
  }).done(function(data){
    document.getElementById('create_form_container').style.display = "none";
    console.log(data)
    console.log("created data base entry")
    var context = { deals: data };
    var source = $('#deals-template').html();
    var template = Handlebars.compile(source);
    var html = template(context);
    $('#wrapper').append(html);
  })
})

})
