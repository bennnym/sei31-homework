const fetchBook = function () {
  const xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {
  if (xhr.readyState !== 4) {
    return;
    }
  const p = document.createElement('p');
  const data = JSON.parse( xhr.responseText );
  p.innerHTML = 'Author: ' + data.items[0].volumeInfo.authors
  document.body.appendChild(p);
  const img = document.createElement('img')
  img.src = data.items[0].volumeInfo.imageLinks.thumbnail
  document.body.appendChild(img)
  const date = document.createElement('p')
  date.innerHTML = 'Published date: ' + data.items[0].volumeInfo.publishedDate
  document.body.appendChild(date)
  const desc = document.createElement('p')
  desc.innerHTML = 'Description: ' + data.items[0].volumeInfo.description
  document.body.appendChild(desc)
  }
title = document.getElementById('searchBox').value

xhr.open('GET', `https://www.googleapis.com/books/v1/volumes?q=title:${ title }`);
xhr.send(); //Asynchronous
};


document.getElementById('fetch').addEventListener('click', fetchBook);
