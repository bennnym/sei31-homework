/////////////
let pageNumber = 1;
let finishedLoad = false;
let maxImages = 0;
let imageTotal =  $('img').length
/////////////

const showImages = function (results) {
  maxImages = results.photos.total
  const generateURL = function (p) {
    return [
      'http://farm',
      p.farm,
      '.static.flickr.com/',
      p.server,
      '/',
      p.id,
      '_',
      p.secret,
      '_q.jpg' // Change 'q' to something else for different sizes
    ].join('');
  };

  results.photos.photo.forEach(function (photo) {
    const thumbnailURL = generateURL(photo);
    const $img = $('<img>', {src: thumbnailURL}); // equivalent to .attr('src', thumbnailURL)
    $img.appendTo('#images'); // $('#images').append($img);
  });
};
// Don't request more images when you reach the last "page" of Flickr results

const searchFlickr = function (terms) {
  finishedLoad = false;
  console.log(`Searching Flickr for ${ terms }`);
  ///////////////////
  const flickrURL = 'https://api.flickr.com/services/rest?jsoncallback=?';
  $.getJSON(flickrURL, {
    method: 'flickr.photos.search',
    api_key: '2f5ac274ecfac5a455f38745704ad084', // not a secret key
    text: terms,
    page: pageNumber++,
    format: 'json'
  }).done( showImages ).done(function (data) {

    finishedLoad = true;
  });
};


$(document).ready(function () {
  $('#search').on('submit', function (event) {
    event.preventDefault(); // Stay on this page.

    const query = $('#query').val();
    $('#images').empty();
    searchFlickr(query);
  });


  $(window).on('scroll', function () {
    const scrollBottom = $(document).height() - ($(window).height() + $(window).scrollTop());
    if (( scrollBottom <= 500 ) && ( imageTotal % 100 == 0 ) && ( finishedLoad === true ) && ( imageTotal <= maxImages)) {
      const query = $('#query').val();
      searchFlickr(query);
      console.log(pageNumber);
    }
  });
});
