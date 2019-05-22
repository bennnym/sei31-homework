const state = {
    currentPage: 1,
    lastPageReached: false
  };
 
/*
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
  
    results.photos.photo.forEach(function (photo) {
      const thumbnailURL = generateURL(photo);
      const $img = $('<img>', {src: thumbnailURL}); // equivalent to .attr('src', thumbnailURL)
      $img.appendTo('#images'); // $('#images').append($img);
    });
  };
  
  
  const searchFlickr = function (terms) {
    if (state.lastPageReached) return;
  
    console.log(`Searching Flickr for ${ terms }`);
  
    const flickrURL = 'https://api.flickr.com/services/rest?jsoncallback=?';
  
    $.getJSON(flickrURL, {
      method: 'flickr.photos.search',
      api_key: '2f5ac274ecfac5a455f38745704ad084', // not a secret key
      text: terms,
      format: 'json',
      page: state.currentPage++
    }).done( showImages ).done(function (data) {
      console.log( data );
      if (data.photos.page >= data.photos.pages) {
        state.lastPageReached = true;
      }
    });
  };
  */

///
let dogURL;
let firstDog;

const getDog = function() {
  const selectedDog=$(".dog-selector option:selected").val();
  //console.log(selectedDog)
  dogURL=selectedDog.replace(/-/g,'/');
  //console.log("dogURL=" + dogURL);
  $.getJSON("https://dog.ceo/api/breed/"+dogURL+"/images/random",
  function(result){
    //console.log("getDog result=" + result.message);
    const dispDog = selectedDog.charAt(0).toUpperCase() + selectedDog.substring(1, selectedDog.length);
    $(".demo-image").html("<b>Selected Dog: "+ dispDog +"</b><br> <br> <img src='"+result.message+"'>");
    //$(".demo-image").html("<img src='"+result.message+"'>");
  });
};

const loadDogs = function() {
  $.getJSON("https://dog.ceo/api/breeds/list/all",
  function(result){
    const breeds=result.message;
    //console.log("breeds len=" + Object.keys(breeds).length);
    const ridx = Math.floor(Math.random() *  Object.keys(breeds).length);
    
    firstDog=Object.keys(breeds)[ridx]; //random selection
    console.log("Featured: " + firstDog);
    let selectedValue = false;

    $.each(breeds,function(dog,breed){
      if(breeds[dog].length>=1){
        for(i=0;i<breeds[dog].length;i++){
          //console.log("breeds[dog][i]=" + breeds[dog][i]);
          //console.log("dog=" + dog);
          let tempbreeds_dog_i = breeds[dog][i];
          tempbreeds_dog_i = tempbreeds_dog_i.charAt(0).toUpperCase() + tempbreeds_dog_i.substring(1, tempbreeds_dog_i.length);
          //console.log(tempbreeds_dog_i);
          let tempdog = dog;
          tempdog = tempdog.charAt(0).toUpperCase() + tempdog.substring(1, tempdog.length);
          //console.log(tempdog);
          //
          let optionDogValue = dog+'-'+breeds[dog][i];
          //console.log(optionDogValue);

          selectedValue = optionDogValue.includes(firstDog);  //(firstDog === optionDogValue);
          //console.log(selectedValue);

          $(".dog-selector").append('<option value="'+optionDogValue+'"' + (selectedValue ? "selected" : "") + ' >'+tempbreeds_dog_i+' '+tempdog+'</option>');
        }
      } else if(breeds[dog].length<1){
        //console.log("dog=" + dog);
        let tempdog = dog;
          tempdog = tempdog.charAt(0).toUpperCase() + tempdog.substring(1, tempdog.length);
          //console.log(tempdog);
          selectedValue = dog.includes(firstDog); //(firstDog === dog);
          //console.log(selectedValue);

        $(".dog-selector").append('<option value="'+dog+'"' + (selectedValue ? "selected" : "") + ' >'+tempdog+'</option>');
      }
    });

    $.getJSON("https://dog.ceo/api/breed/"+firstDog+"/images/random",
    function(result){
      //console.log(result);
      const dispDog = firstDog.charAt(0).toUpperCase() + firstDog.substring(1, firstDog.length);
      $(".demo-image").html("<b>Featured Dog: "+ dispDog +"</b><br> <br> <img src='"+result.message+"'>");
    });
  });
};

/*
$(".dog-selector").change(function(){
  $(".dog-selector option:selected").each(function(){
    getDog();
  });
});

$(".get-dog").click(function(){
  getDog();
});
*/

$(document).ready(function(){
  loadDogs();

  $('#search').on('submit', function (event) {
    event.preventDefault(); // Stay on this page.
    getDog();
  });

});


////

/*
  $(document).ready(function () {
    $('#search').on('submit', function (event) {
      event.preventDefault(); // Stay on this page.
  
      const query = $('#query').val();
      $('#images').empty();
  
      state.lastPageReached = false;
      state.currentPage = 1;
  
      searchFlickr(query);
    });
  
    const debouncedSearchFlickr = _.debounce( searchFlickr, 4000, { trailing: false } );

    // Extremely twitchy
    $(window).on('scroll', function () {
      const scrollBottom = $(document).height() - ($(window).height() + $(window).scrollTop());
  
      if (scrollBottom <= 500) {
        const query = $('#query').val();
        debouncedSearchFlickr(query);
        //const result = searchFlickr(query);
        //_.debounce( undefined, 4000, { trailing: false } );
      }
    });
  });
  */