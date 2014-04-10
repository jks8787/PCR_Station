

$(document).ready(function(){
  $(".PCR-Steps").hide();
  $("h3").click(function(){
    var pcrText = $(this).next().css('display');
    if(pcrText=='block') {
      $(this).next().slideUp(400);
    } else {
      $(this).next().slideDown(200);
      $(this).next().siblings('div').slideUp("slow");
    }
  });
});
