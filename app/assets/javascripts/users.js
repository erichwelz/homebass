
$("#sort").change(
  function(){
    var value = $("#sort").val();
    $.ajax({
      type: "GET",
      dataType: "script",
      data: { order_by: value }
    })
  })

