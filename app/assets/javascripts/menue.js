$(function () {
  $('#nav-toggle').on('click', function() {
    $('body').toggleClass('open');
  });
});

$(function(){
  $('.dropdwn li').hover(function(){
      $("ul:not(:animated)", this).slideDown();
  }, function(){
      $("ul.dropdwn_menu",this).slideUp();
  });
});

$(function() {
  $(".toppage__footer-nav-category").hover(function() {
  $("ul.category1").toggle();
  });
  $(".toppage__footer-nav-category li ul").hide();
  $(".toppage__footer-nav-category li").hover(function() {
      $(">ul:not(:animated)", this).stop(true, true).slideDown("fast");
      $(">a", this).addClass("active");
  }, function() {
      $(">ul:not(:animated)", this).stop(true, true).slideUp("fast");
      $(">a", this).removeClass("active");
});
});