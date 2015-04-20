$(document).ready(function(){

$(document).on('page:change', function(){

// $(document).on('page:load', function(){
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
  })
// })
$('body').on('click','.create-mass-deal', function(e){
e.preventDefault();
$('#create-form-container').modal({overlayClose: true});
        $.ajax({
          url: $(this).attr('href'),
      }).done(function(data){

        $.modal.close();
        //put the stuff in the modal

      })


})

  $("#requests-list").on('click','.make_an_offer_link', function(event){
    event.preventDefault();
    var customerDealID=$(this).attr('href')
    $('#wrapper-for').modal({overlayClose: true});
    console.log(customerDealID)
      $("body").on('submit', '#make-offer', function(e){
        e.preventDefault();
        $.ajax({
          url: '/customer_deals/'+customerDealID,
          data: $('#make-offer').serialize(),
          type: 'PATCH'
      }).done(function(data){
        $.modal.close();
        // $(this).modal('hide');
        $('#requests-list').find($('#list'+data.id)).remove();
        // $('#make-offer').find("input[type='submit']").attr("class","simplemodal-close")
        console.log(data)


        // document.getElementById("wrapper-for").style.display="none"
        // $('#wrapper-for').modal('hide');
        // $('#wrapper-for').popover('show')

      })
      });

  });
// })





}); //close document





});

