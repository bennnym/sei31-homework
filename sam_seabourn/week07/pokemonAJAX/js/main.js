console.log("Sup bro, I'm working");

const zeroAdder = function( number ){
  let stringedNumber = number + ''
  if (stringedNumber.length === 1){
    return ("00" + stringedNumber)
  } if (stringedNumber.length === 2){
    return ("0" + stringedNumber)
  } else {
    return stringedNumber
  }
}


const showData = function(results){
console.log( results.height );
let pokemonHeight = 0
let pokemonId = 0
pokemonHeight = results.height + 'em'
pokemonId = results.id;
$('#pokepic').remove()
const pokemonImage = `<img src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/${ zeroAdder(pokemonId) }.png" id="pokepic">`
$('#mon').append(pokemonImage)
$('#pokepic').css('height', pokemonHeight + '');
}

const catchPokemon = function(pokemonName){
  console.log("fetching Json for " + pokemonName);
  const pokeURL = `https://pokeapi.co/api/v2/pokemon/${ pokemonName }`
  $.getJSON(pokeURL).done(showData) // <--- This is working but I don't get it
}

$(document).ready(function () {
  $('#search').on('submit', function (event) {
    event.preventDefault(); // Stay on this page.

    const $input = $('#input').val();
    $('#pokemon').empty();
    console.log('test')
    catchPokemon($input);
  });
});
