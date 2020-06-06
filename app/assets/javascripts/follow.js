$(function() {
  $('.follower-up-show').click(function() {
    $('#follower-up-modal').fadeIn();
  });

  $('.follow-up-show').click(function() {
    $('#follow-up-modal').fadeIn();
  });
  
  $('.close-modal').click(function() {
    $('#follower-up-modal').fadeOut();
    $('#follow-up-modal').fadeOut();
  });
});
