/*$(document).ready(function() {
  var placeholderDiv = document.getElementById("tableauViz");
  var url = "http://public.tableausoftware.com/views/WorldIndicators/GDPpercapita";
  var options = {
    hideTabs: true,
    hideToolbar: true,
    width: "800px",
    height: "400px",
    onFirstInteractive: function () {
      workbook = viz.getWorkbook();
      activeSheet = workbook.getActiveSheet();
    }
  };
  viz = new tableauSoftware.Viz(placeholderDiv, url, options);
});*/

function gen() {
  $.ajax({
    url: '/mostRequested',
    type: "POST",
    success: function(blah) {
      var ctx = document.getElementById("myChart").getContext("2d");
      var options = {
        scaleBeginAtZero: true,
        barStrokeWidth: 5
      }
      names = [];
      values = [];
      info = JSON.parse(blah);
      for (var i=0;i<Math.min(10,info.length);i++) {
        names.push(info[i][1]);
        values.push(info[i][0]);
      }
      var data = {
        labels: names,//["A","B","C","D","E","F","G"],
        datasets: [
          {
            label: "My First dataset",
            fillColor: "rgba(150,150,150,0.9)",
            strokeColor: "rgba(220,220,220,0.8)",
            highlightFill: "rgba(220,220,220,0.75)",
            highlightStroke: "rgba(220,220,220,1)",
            data: values//[65, 59, 80, 81, 56, 55, 40]
          }
        ]
      };
      var myBarChart = new Chart(ctx).Bar(data, {
        barShowStroke: false
      });
    }
  });
}

function filterSingleValue() {
     console.log('test');
 activeSheet.applyFilterAsync(
    "Region",
    "The Americas",
    tableauSoftware.FilterUpdateType.REPLACE);
} 


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
