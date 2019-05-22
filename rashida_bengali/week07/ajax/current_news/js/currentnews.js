console.log('run');

$(document).ready(function () {
  $('#get').on('submit', function (event) {
    event.preventDefault();
    const name = $('#city').val();
    $('#content').empty();
    $('#info').empty();
    currentURL = 'https://api.openweathermap.org/data/2.5/weather?';
    $.getJSON(currentURL, {
        appid: '8fe679500564074b2e3001c4f520214c',
        q: name,
        units: 'Metric',
        format: 'json'
      }).done(function (data) {
        console.log(data);
          const details = data.weather[0].description;
          const $p1 = $('<p>').text('Current weather: ' + details);
          $('#content').append($p1);
          const temp = data.main.temp;
          const $p2 = $('<p>').text('Current Temperature: ' + temp.toFixed(2) + ' Celcius');
          $('#content').append($p1);
          $('#content').append($p2);
      });
  });
});
