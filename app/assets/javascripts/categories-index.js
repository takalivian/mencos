$(function(){
  $('div.categories-wrapper__contents__main__contents__title').on('click', function() {
    $(this).next('div.categories-wrapper__contents__main__contents__category').toggle('slow');
  });
});