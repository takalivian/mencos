
// IDに数字付与
$(function(){
  $('div.categories-wrapper__contents__main__contents__title').each(function(i){
      $(this).attr('id','hide-text' + (i+1));
  });
});

$(function(){
  $('div.categories-wrapper__contents__main__contents__category').each(function(i){
      $(this).attr('id','text' + (i+1));
  });
});

// 子表示
$(function () {
  $('#hide-text1').on('click', () => {
      $('#text1').toggle('slow');
  });
});

$(function () {
  $('#hide-text2').on('click', () => {
      $('#text2').toggle('slow');
  });
});

$(function () {
  $('#hide-text3').on('click', () => {
      $('#text3').toggle('slow');
  });
});

$(function () {
  $('#hide-text4').on('click', () => {
      $('#text4').toggle('slow');
  });
});

$(function () {
  $('#hide-text5').on('click', () => {
      $('#text5').toggle('slow');
  });
});

$(function () {
  $('#hide-text6').on('click', () => {
      $('#text6').toggle('slow');
  });
});

