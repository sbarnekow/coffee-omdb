$(document).ready -> 
$('form').on('submit', (event) =>
  event.preventDefault()
  toSubmit = $(this)
  searchInput = $('#searchbox').val()
  console.log searchInput
  $.ajax
    url: 'http://www.omdbapi.com/?s=' + searchInput
    method: 'get'
    dataType: 'jsonp'
    success: (searchResult) ->
      movieArray = searchResult["Search"]
      titleList = $('#movielist')
      for num in movieArray
        $.ajax
          url: 'http://www.omdbapi.com/?i=' + searchResult["Search"][_i]["imdbID"]
          method: 'get'
          dataType: 'json'
          success: (movie)-> 
            console.log 'indivMovie:', movie
            plot = movie["Plot"]
            released = movie["Released"]
            poster = movie["Poster"]
            titleLink = $('<li><div class="container"><div id="movieposter"><img src=' + poster + '/></div>' + '<div id="movie">' + movie["Title"] + '</div><div id="movieplot"><div id="releasedate">' + released + '</div>' + plot + '</div></div></li>')
            titleLink.appendTo titleList
)