/* console.log('love you');

const sum =  (arrayNumbers, num) => {
  arrayNumbers.forEach(element => { 
    
  });
}

sum([7, 9, 11, 13, 15], 20)
//pairwise([7, 9, 11, 13, 15], 20)

function add(array, sum) {
  
  for (var i = 0, j = array.length; i < j; i++) {
    sum += arguments[i];
  }
  
  return sum;
}

add([7, 9, 11, 13, 15], 20); */

const pairwise = (arr, sum) => {

  let result = 0

  for (let i = 0; i < arr.length; i++) {
    for (let j = i + 1; j < arr.length; j++) {
      if (arr[i] + arr[j] === sum) {
        result += i + j;

        arr[i] = "";
        arr[j] = "";
      }
    }
  }
  return result;
}

console.log(pairwise([7, 9, 11, 13, 15], 20)); // => 6

//version 2

const pairwise2 = (arr, sum) => {
  const result = arr.reduce(acc, cur, index) => {
    let theOtherElement = sum - cur;

    if ((arr.indexOf(theOtherElement)) !== -1) && (arr.indexOf(theOtherElement) !== index)) {
      let total = index + arr.indexOf(theOtherElement);

      arr.splice(index, 1, NaN);
      arr.splice(arr.indexOf(theOtherElement), 1, NaN);

      return acc + total;
    }
    return acc;
  }, 0)
  return result 
}

console.log(pairwise2([7, 9, 11, 13, 15], 20));