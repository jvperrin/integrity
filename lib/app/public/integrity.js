$(document).ready(function() {
  $('a#show_output').click(function(e) {
    if($(e.target).html() == "(show)") {
      $(e.target).html("(hide)");
    } else {
      $(e.target).html("(show)");
    }
    $('pre.output').slideToggle();
  });



  $('#send').click(function(event) {
    event.preventDefault();

    var notifcation = { notifcation: $('#message').val() };
    console.log(notifcation)

    $.post('/push', notifcation, 'json');
  });

  var es = new EventSource('/connect');
  es.onmessage = function(e) {
    var msg = $.parseJSON(event.data);
    $("#test-output").html($("#test-output").html() + msg.notifcation);
    // $("html,body").animate({ scrollTop: $('pre.output')[0].scrollHeight}, 100);
  }
});
