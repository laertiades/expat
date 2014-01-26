var counter = 0;
var timerOn = false;

var testimonies = [];
var workerList = {};

function testify(tes){
  if (timerOn == false) {
    testimonies = tes;
    timerOn = true;
    setInterval(startTestimonies, 10000);
  }  
}

function startTestimonies() {
  counter++;
  if (counter >= testimonies.length) counter = 0;
  $("div.exerpt").fadeOut('slow', testimony2);
}
function testimony2() {
  $("div.exerpt h6").text(testimonies[counter]);
  $("div.exerpt").fadeIn();
}

function workerSelector(workers) {
  workerList = workers;
  alert("here");
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
    if (i.width > 899){
      $("#worker img").removeClass("fl");
      $("#worker img").addClass("w100");
    }
    else {
      $("#worker img").removeClass("w100");
      $("#worker img").addClass("fl");
    }
  $("#worker h2, #worker p, .clear").remove();
  $("#worker").append(workerList[label][1]);
  $("#worker").append('<div class="clear"></div>');
  }
}

function imageLinks(element){
  $(element).hover(function(){
    $(this).stop();
    $(this).fadeTo("fast", .5);
    }, function(){
    $(this).stop();
    $(this).fadeTo("fast", 1);
  });
}
