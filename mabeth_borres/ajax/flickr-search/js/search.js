let totalPages = 0;
let totalPics = 0;
let actualPage = 0;

let slideIndex = 0;

const state = {
    currentPage: 1,
    lastPageReached: false
};

const showModal = function () {
    const modal = $('#myModal');
  
    modal.css({
      display: "block"
    });
    
    // Get the <span> element that closes the modal
    const span = document.getElementsByClassName("close")[0];
  
    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {

        modal.css({
          display: "none"
        });
    }
  
};
  

const showSlides = function () {
  var i;

  var slides = document.getElementsByClassName("mySlides");

  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  

  }

  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    

  if (slides.length> 0) {
    slides[slideIndex-1].style.display = "block";  
  }

  setTimeout(showSlides, 2000); // Change image every 2 seconds
};

const showImages = function (results) {        
    //Nested AKA helper function that returns a thumbnail URL for a given photo object
    const generateThumbnailURL = function (p) {
        //const parts = 
        return [
            'http://farm',
            p.farm,
            '.static.flickr.com/',
            p.server,
            '/',
            p.id,
            '_',
            p.secret,
            '_q.jpg' //size, q for thumnail
        ].join('');

        //return parts;
    };

    const generateBiglURL = function (p) {
        return [
            'http://farm',
            p.farm,
            '.static.flickr.com/',
            p.server,
            '/',
            p.id,
            '_',
            p.secret,
            '_b.jpg' //size, q for thumbnail
        ].join('');
    };

    let picsOnDisplay = document.getElementsByTagName("IMG").length;
    actualPage = parseInt(results.photos.page);


    try {
        
    if (actualPage <= totalPages && picsOnDisplay < totalPics) {
        console.log(picsOnDisplay + " pics of " + totalPics );
        console.log("Page: " + actualPage + " of " + totalPages);

        //process results
        results.photos.photo.forEach( function (photo) {

            const thumbnailURL = generateThumbnailURL(photo);
            const largeImage = generateBiglURL(photo);

            // create a URL for the photo
            // create an image to display that photo
            // shove image to page
            //const $img = $('<img>').attr('src', thumbnailURL); //same
            const $img = $('<img>', {src: thumbnailURL});

            const $largeIMG = $('<a>', {href: largeImage, target: "_blank"});
            const $largeIMG2 = $('<img>', {src: largeImage});
    
            picsOnDisplay = document.getElementsByTagName("IMG").length;

            const $divMySlides = $('<div>', {class: "mySlides fade"});

            if (picsOnDisplay < totalPics) {
                $largeIMG.appendTo('#images');
                $img.appendTo($largeIMG);

                $divMySlides.appendTo('#slideshowcontainer');
                $largeIMG2.appendTo($divMySlides);

            }


        });

    }

    } catch (error) {
        //    
    }
    
};



const searchFlickrPage1 = function (terms, pageNum) {

    const flickrURL = 'https://api.flickr.com/services/rest?jsoncallback=?';
    $.getJSON(flickrURL, {
        method: 'flickr.photos.search',
        api_key: '2f5ac274ecfac5a455f38745704ad084', //not a secret key
        text: terms,
        format: 'json',
        page: 1 //pageNum
    }).done(function(results) {  
        totalPages = parseInt(results.photos.pages);   //set once
        console.log("Total Pages: " + totalPages);
        //console.log(results.photos.total);
        totalPics = parseInt(results.photos.total);   //set once
        console.log("Total Pics: " + totalPics);
    }).done( showImages ).done(function(data) {
        //console.log(data);
        showModal();
        showSlides();
    });
    
};

let currentPage = 2;

const searchFlickr = function (terms) {

    if (state.lastPageReached === true) {
        return;
    }

    console.log("Searching Flickr for " + terms );
    //console.log("Page " + pageNum );

    const flickrURL = 'https://api.flickr.com/services/rest?jsoncallback=?';
    $.getJSON(flickrURL, {
        method: 'flickr.photos.search',
        api_key: '2f5ac274ecfac5a455f38745704ad084', //not a secret key
        text: terms,
        format: 'json',
        page: currentPage++ //pageNum
    }).done( showImages ).done(function(data) {
        showSlides();
    });
    
};

$(document).ready( function() {
    let pageNum = 1;
    let docHeight = $(document).height();
    let windowHeight = $(window).height();
    let windowScrollTop = $(window).scrollTop();
    currentPage = 2;

    $('#search').on('submit', function(event) {
        event.preventDefault(); //stay on same page

        //search term
        const query = $('#query').val();
        //search flickr
        $('#images').empty(); //put here, related to infinite scroll
        searchFlickrPage1(query, 1);
    });

    const debouncedSearchFlickr = _.debounce (searchFlickr, 4000, {trailing: false} );

    $(window).on('scroll', function() {

    try {
        docHeight = $(document).height();
        windowHeight = $(window).height();
        windowScrollTop = $(window).scrollTop();

        const picsOnDisplay = document.getElementsByTagName("IMG").length;


            let scrollBottom = docHeight  - (windowHeight + windowScrollTop);
            if (scrollBottom <= 500) {

                // get more results from flickr

                const query = $('#query').val();
                pageNum += 1;
                

                if ( actualPage < totalPages && picsOnDisplay < totalPics ) { 

                    window.scrollTo(0, docHeight+501);

                    debouncedSearchFlickr(query);

                }
            }

    } catch (error) {
        //
    }
    });

});


