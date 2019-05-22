const collatz = num => {
  let collection = [num];

  const makeCollection = () => {
    while (collection[collection.length - 1] > 1) {
      const currentNum = collection[collection.length - 1];

      const nextNum = currentNum % 2 === 0 ? (currentNum / 2) : (currentNum * 3 + 1)

      collection.push(nextNum)
      // console.log(collection);
    }
  } //makeCollection

  const answer = () => {
    console.log(`The function ran ${collection.length - 1} times.`);
    console.log(`The process was: ${collection.join(', ')}`);
  }

  makeCollection();
  answer();

  return {
    start: num,
    collection,
    steps: collection.length - 1
  }
}

console.log(collatz(2030));


// Adrian's Recursive Solution

const collatz = function(n, i=1) {
  if (n === 1){
  console.log(`${n} has been reached!`);
  return
  }

  if (n % 2 === 0){
    n = n / 2
    console.log(`${i}. ${n}`);
    i++
    collatz(n, i)
  } else {
    n = (n * 3) + 1
    console.log(`${i}. ${n}`);
    i++
    collatz(n, i)
  }
}

collatz(27)


// Mabeth's Solution
const collatz = (n) => {
    console.log("\ncollatz for ", n);
    let stepsodd = 0;
    let stepseven = 0;
    const coll = [];

    const collatzin = (n) => {
        coll.push(n);
        if (n===1) {
            console.log("stepstotal", (stepsodd + stepseven) );
            console.log("stepsodd", stepsodd);
            console.log("stepseven", stepseven);
            //console.log(coll);
            return;
        }

        if (n%2===0) {
            //even
            stepseven++;
            collatzin(n/2);
        } else {
            //odd
            stepsodd++;
            collatzin( (3*n)+1 );
        }

    }

    return collatzin( n );
};

collatz(9);
collatz(97);
collatz(27);
collatz(12);
collatz(2030);
