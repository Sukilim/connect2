$(function(){
  $("#datepicker").datepicker({dateFormat: 'yy-mm-dd',onClose: function(){update_date(this);}});
    function update_date(data)
  {
    alert($(data).attr("id"));
  }
})

// $(window).load(function() {
//   $("html, body").animate({ scrollTop: $(document).height() }, 1000);
// });

// $("#downclick").on("click" ,function(){
//     scrolled=scrolled-300;

//     $(".cover").animate({
//         scrollBottom:  scrolled
//     });

// });
