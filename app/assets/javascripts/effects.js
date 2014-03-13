var counter = 0;
var testimonies = [];
var workerList = {};

function testify(tes){
  testimonies = tes;
  setInterval(startTestimonies, 10000);
}

function startTestimonies() {
  counter++;
  if (counter >= testimonies.length) counter = 0;
  $("div.exerpt").fadeOut('slow', testimony2);
}
function testimony2() {
  $("div.exerpt").html(testimonies[counter]);
  $("div.exerpt").fadeIn();
}

function workerSelector(workers) {
  workerList = workers;
}

function swapWorker(label) {
  var i = new Image();
  i.src = workerList[label][0];
  $("#worker").stop();
  $("#worker").fadeTo("slow", 0.01);
  i.onload = function() {
    $("#worker").stop();
    $("#worker").fadeTo("slow", 1);
    $("#worker img").attr('src', i.src);
    if (i.width > 649){
      $("#worker img").removeClass("fl");
      $("#worker img").addClass("w100");
    }
    else {
      $("#worker img").removeClass("w100");
      $("#worker img").addClass("fl");
    }
  $('#worker').children().not('img').remove();
  $("#worker").append(workerList[label][1]);
  $("#worker").append('<div class="clear"></div>');
  }
}
