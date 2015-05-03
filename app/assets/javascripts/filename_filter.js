// http://php.o0o0.jp/article/jquery-filter_text
$(function () {
  $('input#filterwordinput').keyup(function(){
    var keyword = $(this).val();
    var regkeyword = new RegExp( keyword.replace(/ /g, '.*'), 'i' )
    $('li#blobelem').each(function(){
      if ($(this).text().match(regkeyword)) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  });
});
