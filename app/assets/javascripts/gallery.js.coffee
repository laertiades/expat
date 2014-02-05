images = ["https://s3.amazonaws.com/expatcpa/banner/expat1.jpg", "https://s3.amazonaws.com/expatcpa/banner/expat2.jpg", "https://s3.amazonaws.com/expatcpa/banner/expat3.jpg", "https://s3.amazonaws.com/expatcpa/banner/expat4.jpg", "https://s3.amazonaws.com/expatcpa/banner/expat5.jpg"]
preloadedImgs = []
counter = 0

for num in [0..(images.length-1)]
  preloadedImgs[num] = new Image()
  preloadedImgs[num].src = images[num]
  
gallery = ->
  $('#gallery').prepend '<img class="ban-pic" />'
  $('.ban-pic:first').attr "src", preloadedImgs[counter].src
  ++ counter
  if counter >= preloadedImgs.length then counter = 0
  $('.ban-pic:last').fadeOut 1000, ->
    if $('.ban-pic').length >= 2 then $('.ban-pic:last').remove()
  
$ ->
  $('#gallery').append '<img class="ban-pic" />'
  $('.ban-pic:first').attr "src", preloadedImgs[0].src
  counter = 1
  setInterval gallery, 6000

reload = ->
  $('#gallery').append '<img class="ban-pic" />'
  $('.ban-pic:first').attr "src", preloadedImgs[counter].src
  ++ counter
  if counter >= preloadedImgs.length then counter = 0
  
$(document).on('page:load', reload)