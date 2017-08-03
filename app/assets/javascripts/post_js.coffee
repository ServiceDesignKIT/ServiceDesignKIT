# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#posts').imagesLoaded ->
    $('#posts').masonry
      itemSelector: '.box'
      isFitWidth: true

$(document).ready ->
  $('.multiple-input').each ->
    $(this).select2
      tags: true
      maximumSelectionLength: 2
      tokenSeparators: [ ',' ]
      theme: 'bootstrap'
      placeholder: 'Separated by comma'
    return
  return