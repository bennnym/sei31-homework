const state = {
  currentPage: 1,
  lastPageReached: false
};

const showImages = function (results) {

  // Nested AKA helper function that returns a thumbnail URL for a given photo object.
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

  console.log('Results', results);

  results.photos.photo.forEach(function (photo) {
    const thumbnailURL = generateURL(photo);
    const $img = $('<img>', {src: thumbnailURL}); // equivalent to .attr('src', thumbnailURL)
    $img.appendTo('#images'); // $('#images').append($img);
  });
};

const searchFlickr = function (terms) {
  console.log(`Searching Flickr for: ${terms}`);

    if (state.lastPageReached) return;

    const flickrURL = 'https://api.flickr.com/services/rest?jsoncallback=?';

    $.getJSON(flickrURL, {
      // Via Flickr docs:
      method: 'flickr.photos.search',
      api_key: '2f5ac274ecfac5a455f38745704ad084', // not a secret key
      text: terms,
      format: 'json',
      page: state.currentPage++
    }).done(showImages).done(function (results) {
      if (results.photos.page >= results.photos.pages) {
        state.lastPageReached = true;
      }
    });
  };

  $(document).ready(function () {
    $('#search').on('submit', function (event) {
    event.preventDefault();

    $('#images').empty();
    state.currentPage = 1;
    state.lastPageReached = false;

    const query = $('#query').val();
    $('#images').empty();
    searchFlickr(query);
  });

  // Extremely twitchy
  const debouncedSearchFlickr = _.throttle(searchFlickr, 2000, {trailing: false});
  $(window).on('scroll', function () {
    const scrollBottom = $(document).height() - ($(window).height() + $(window).scrollTop());

    if (scrollBottom <= 500) {
      const query = $('#query').val();
      debouncedSearchFlickr(query);
    }
  });
});
