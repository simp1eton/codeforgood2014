function increment(val) {
 // $('#hi').attr('value',val);
  //alert($('#yay').serialize());
  $.ajax({
    url: '/update',
    type: "POST",
    data: {'vote_id': val},//$('#yay').serialize(),          //$('#yay').seralize(),
    success: function(data) {
   //   alert(data);
      //alert(data);
      var arr = data.split(' ');
      var a = arr[0];
      var b = arr[1];
      $('#vote_' + a).html(b);
    }
  });
 /* 
  $.getJSON( "public/test.json", function( data ) {
    var items = [];
    $.each( data, function( key, val ) {
      items.push( "<li id='" + key + "'>" + val + "</li>" );
    });

    $( "<ul/>", {
      "class": "my-new-list",
      html: items.join( "" )
    }).appendTo( "body" );      
  });
  alert("done");*/
}
