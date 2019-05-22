$('#submit').on('click', (e) => { 
  e.preventDefault()
  const search = $('#search').val();
  
  $.ajax({
    url: `https://pokeapi.co/api/v2/pokemon/${search}`,
    method: 'GET',
    success: (data) => {
      console.log(data.sprites.front_shiny);
      
      $('#pokemon').html(`<img src="${data.sprites.front_shiny}">`)
    },
    error:() => {
      const dictionary = {
        bulbassaur: 'bulbasaur',
        pika: 'pikachu',
        dito: 'ditto'
      };

      const suggestion = Object.keys(dictionary)
        .find(item =>  dictionary[item] === dictionary[search]);
          

      if (suggestion) {
        $('#pokemon').html(`
          <p> Did you mean <a id="link" href="#">${dictionary[search]}</a>? </p>
        `);

        $('#link').on('click', (e) => {
          $('#search').val(e.target.text);
          $('#submit').click();
        });
      } else {
        $('#pokemon').html(`<p> This pokemon was not found. </p>`);
      }
      
    }
  })
})




