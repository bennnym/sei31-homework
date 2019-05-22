const bookCover = function (){


  const xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {


    if (xhr.readyState!==4){
      return;
    }

    const title = document.createElement('p');
    const data = JSON.parse(xhr.responseText);
    title.innerHTML = data.items[0].volumeInfo.title;
    document.body.appendChild(title);

    // const image = document.createElement('img');
    // const data = JSON.parse(xhr.responseText);
    // const link = data.items[0].volumeInfo.imageLinks.thumbnail;
    // image.setAttribute("src", link);//data["text"]
    // document.body.appendChild(image);

};

  const book = document.getElementById('cover').value;
  const title = 'https://www.googleapis.com/books/v1/volumes?q=title:' + book;
  xhr.open('GET',title);


  xhr.send();//asynchronous


};
  document.getElementById('book-cover').addEventListener('click', bookCover);

======NOTES========

  const form = document.querySelector(form)
  form.addEventListener('submit', function(){
  event.preventDefault;//diabled nevigation to a new page.

// const searchButton = document.getElementById('book-cover')
// searchButton.addEventListener('click', function(){
//   console.log('click');
  const bookCover= document.getElementById('cover').value
  const xhr = new XMLHttpRequest();
  const url = 'https://www.googleapis.com/books/v1/volumes?q=title: ${title}';
  xhr.open('GET', url);

  xhr.onreadystatechange = function () {


    if (xhr.readyState!==4) return;

    }
    const data = JSON.parse(xhr.responseText);

});
