images = ["https://s3.amazonaws.com/expatcpa/banner/expat1.jpg", "https://s3.amazonaws.com/expatcpa/banner/expat2.jpg", "https://s3.amazonaws.com/expatcpa/banner/expat3.jpg", "https://s3.amazonaws.com/expatcpa/banner/expat4.jpg", "https://s3.amazonaws.com/expatcpa/banner/w600.jpg", "https://s3.amazonaws.com/expatcpa/banner/w601.jpg"]
preloadedImgs = []
counter = 0

for num in [0..(images.length-1)]
  preloadedImgs[num] = new Image()
  preloadedImgs[num].src = images[num]

startGallery = () ->
  ++ counter
  if counter >= preloadedImgs.length then counter = 0
  document.getElementById("ban-pic2").src = preloadedImgs[counter].src
  stepOne()

stepOne = () ->
  $('#ban-pic1').fadeOut(4000,stepTwo);
  
stepTwo = () ->
  $('#ban-pic1').css("z-index","1")
  $('#ban-pic2').css("z-index","2")
  ++ counter
  if counter >= preloadedImgs.length then counter = 0
  document.getElementById("ban-pic1").src = preloadedImgs[counter].src
  $('#ban-pic1').show()
  stepThree()
  
stepThree = () ->
  $('#ban-pic2').fadeOut(4000,stepFour)
  
stepFour = () ->
  $('#ban-pic1').css("z-index","2")
  $('#ban-pic2').css("z-index","1")
  $('#ban-pic2').show()
  startGallery()

$ ->
  startGallery()
