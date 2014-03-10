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

    var notification = { notification: $('#message').val() };
    console.log(notification)

    $.post(window.location.href + '/push', notification, 'json');
  });

  // Build log streaming:
  var es = new EventSource(window.location.href + '/connect');

  es.addEventListener("message", function(e) {
    var msg = $.parseJSON(event.data);
    $("#build_status").html(msg.status);
    $("pre.output").html(msg.build_output);
    $("html, body").animate({ scrollTop: $('pre.output')[0].scrollHeight }, 100);
  }, false);
});
