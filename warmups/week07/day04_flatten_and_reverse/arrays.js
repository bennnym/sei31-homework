
console.log('hello');

const arr1 = ["one", "two", "three", "four"]

const reverseArray = function(array) {
  let reversed = [];

  for ( let i = 0; i < array.length; i++ ) {
    reversed.unshift(array[i])
  }

  // OR

  // for ( let i = array.length - 1; i >= 0; i-- ) {
  //   reversed.push(array[ i ])
  // }

  // console.log(reversed);
  return reversed;

  // OR

  // return array.reverse()

}

console.log(reverseArray(arr1));

const arr2 = ["one", "two", ["three", "four"]];

const flattenArray = function(array) {
  let flatten = [];

  for ( let i = 0; i < array.length; i++ ) {
    let currentElem = array[ i ]

    if (currentElem instanceof Array) {
    // if (Array.isArray(currentElem)) {
    // if (currentElem.constructor === Array) {
      // console.log("this is an instance of an array");

      for ( let j = 0; j < currentElem.length; j++ ) {
        flatten.push(currentElem[ j ]);
      }
    } else {
      flatten.push(currentElem);
    }
  }

  console.log(flatten);

  return flatten;

  // OR

  // return array.flat();
}

console.log(flattenArray(arr2));
