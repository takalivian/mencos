$(function() {
  $('#login-show').click(function() {
    $('#login-modal').fadeIn();
  });

  $('.follow-up-show').click(function() {
    $('#follow-up-modal').fadeIn();
  });
  
  $('.close-modal').click(function() {
    $('#login-modal').fadeOut();
    $('#follow-up-modal').fadeOut();
  });
});
