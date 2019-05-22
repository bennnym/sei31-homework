console.log('run');

$(document).ready(function () {
  $('#get').on('submit', function (event) {
    event.preventDefault();
    const name = $('#dish').val();
    $('#pic').empty();
    const url = `https://www.themealdb.com/api/json/v1/1/search.php?s=${name}`;
    $.ajax(url).done(function (data) {
      console.log(data);
      data.meals.forEach(function (photo) {
        const thumbnail = photo.strMealThumb;
        const $img = $('<img>').attr('src', thumbnail);
        $('#pic').append($img);
      });
    });
  });
});
