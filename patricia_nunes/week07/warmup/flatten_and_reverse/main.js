console.log('love you')

/* # Flatten and Reverse

The goal of this exercise is to manipulate arrays by creating a function that can reverse an array and by creating a function that can flatten an array. Do not use any libraries to complete this task - write this stuff from scratch using standard JS methods and objects.

- Make two functions
  - reverse
  - flatten

```js
reverse( [1, 2, 3, 4] );
// => [ 4, 3, 2, 1 ]
flatten( ["Hello", ["World", 42] ] );
// => [ "Hello", "World", 42 ]
```
You only need to make flatten work to one level deep! You should be able to flatten this - `["Hello", ["World"]]` - but not this - `["Hello", [[["World"]]]]`

Hint: You're going to need to be looping through the arrays to get a solution. */

const reverse = (array) => {
  const reversedArray = [] 

  for (let i = 0; i < array.length; i++) {
    reversedArray.push(array[i])
  }
  console.log(reversedArray)
   return reversedArray
};



reverse( [1, 2, 3, 4] );

const flatten = (array) => {

};


flatten( ["Hello", ["World", 42] ] );