# AJAX Flickr Lab
1. Support infinite scroll to show all results from Flickr (eventually, after a lot of scrolling). - **done**, let currentPage = 1; && page: currentPage++

1. Prevent your code from making too many requests: only one at a time, please - **done**, lastPage function and if statement inside of searchFlickr if (data.photos.page >= data.photos.pages)

1. Don't request more images when you reach the last "page" of Flickr results - **done**, throttle function 500ms

1. Make sure you go back to the first page when searching for a new term! - **done**, reset currentPage and lastPage on search

1. Make it beautiful - yeh nah?

1. Add other features as you see fit - as below

## bonus
1. Bonus: display larger images in an attractive slideshow
1. Bonus: add links back to each image's own page on Flickr.com - **done**

## my addons
1. back to top button - **done**
- modded - scrolls within the page **done**

1. added alt title - **done**
