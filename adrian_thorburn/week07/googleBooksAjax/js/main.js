console.log("YO");

const fetchBook = function() {
  const xhr = new XMLHttpRequest(); // Get an XHR instance
  xhr.onreadystatechange = function () {
    // Ignore all the ready States except 4. Get out of this function ASAP.
    if (xhr.readyState !== 4) { // xhr state, same as class example
      return;
    }
    const p = document.createElement('p');
    const data = JSON.parse( xhr.responseText ) //convert the JSON string into a JS object
    const author = data["items"][0]["volumeInfo"]["authors"] //has path to author, put it in a variable
    const image = data["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"] //hash path to image
    const description = data["items"][0]["volumeInfo"]["description"] // has path to description

    let resTitle = document.getElementById('resTitle'); // get the empty h2 field with Id "resTitle"
    resTitle.innerHTML += title //update empty field with title information
    let resAuth = document.getElementById('resAuth'); // same as above
    resAuth.innerHTML += author //etc
    let resImg = document.getElementById('resImg');
    resImg.innerHTML += `<img src=${image} />` // add the image url into the div/img
    let resDescription = document.getElementById('resDescription')
    resDescription.innerHTML += description
  };
  title = document.getElementById('searchBox').value // set serach data and get via "searchBox ID"
  xhr.open('GET', 'https://www.googleapis.com/books/v1/volumes?q=title:' + title); //open the connection
  xhr.send(); //Asynchronous - happens in the background
};

document.getElementById('fetch').addEventListener('submit', fetchBook);
//event.preventDefault();
