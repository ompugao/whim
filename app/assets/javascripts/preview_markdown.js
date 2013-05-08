$(function(){
  $.ajaxSetup({ "scriptCharset":'utf-8',
    "error":function(XMLHttpRequest,textStatus, errorThrown) {   
      console.log(textStatus);
      console.log(errorThrown);
      console.log(XMLHttpRequest.responseText);
    }
  });
  $('textarea.be_previewed').each(function(){
    $(this).bind('keyup', detect_textarea_change(this));
  });
});

function detect_textarea_change(elm){
  var v, old = elm.value;
  return function(){
    if(old != (v=elm.value)){
      old = v;
      $.post(mkd2html_api,{"markdown":elm.value},function(json){$('#preview').html(json.html)})
    }
  }
}
