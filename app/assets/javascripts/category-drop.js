$(function(){
  $('.dropdwn li').hover(function(){
      $("ul:not(:animated)", this).slideDown();
  }, function(){
      $("ul.dropdwn_menu",this).slideUp();
  });
});