console.log('run');

const form = document.querySelector('form');

const bookCover = function (event) {
  event.preventDefault(); //disable navigation to new page
  const xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {
    if (xhr.readyState !==4) {
      return;
    }

    const image = document.createElement('img');
    const data = JSON.parse(xhr.responseText);
    const link = data.items[0].volumeInfo.imageLinks.thumbnail;
    image.setAttribute('src', link);
    document.body.appendChild(image);
  };

  const title = document.getElementById('book').value;
  const link = 'https://www.googleapis.com/books/v1/volumes?q=title?' + title;
  xhr.open('GET', link);

  xhr.send();
};

form.addEventListener('submit', bookCover);
