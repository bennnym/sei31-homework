//
// // version 1
//
// const atbash = {
//   alphabet: "abcdefghijklmnopqrstuvwxyz".split(''),
//
//   encode: function(input) {
//     output = "";
//
//     input = input.split("");
//
//     for ( let i = 0; i < input.length; i++ ) {
//       const index = this.alphabet.indexOf( input[i] )
//       output += this.alphabet.reverse()[index]
//     }
//
//     return output
//   }
// };
//
// console.log(atbash.encode('test'));
// console.log(atbash.encode('gvhg'));


// version 2

const atbash = {
  alphabet: String.fromCharCode(..._.range('a'.charCodeAt(0), 'z'.charCodeAt(0) + 1)).split(''),

  encode: function(input, output="") {
    // Thank you Ritika :)
    // let alphabet = this.alphabet;
    input.split("").forEach(function(letter) {
      const index = atbash.alphabet.indexOf( letter );
      // I guess my main concern with hardcoding atbash here is that if someone were to ever change the object name then we would receive an error. 
      output += atbash.alphabet.reverse()[index]
    })
    return output
  }
}

console.log(atbash.encode('abcd'));
