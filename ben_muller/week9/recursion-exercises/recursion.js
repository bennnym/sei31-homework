// Write code inside the functions
// You will have to figure out what parameters to include
// All functions must use recursion
// let testArray = [3, 4, 2, 1, 2];

function findMax(array) {
    // This function returns the largest number in a given array.
    /// see if number is bigger than current max
    nums = [...array]

    if (nums.length == 1) { return nums[0] }

    if (nums[0] < nums[1]) { nums.shift(); }
    else { nums.splice(1, 1) }

    return findMax(nums)
}

function factorial(num){

    return ( num <= 1 ) ? 1 : num * factorial( num - 1)

}

function fibonacci( num, a=1, b=1 ){
    if ( num <= 2 ) {
        return b;
    } else {
        return fibonacci(num-1, b, a+b)
    }
}

function coinFlips( tosses ) {
    const combinations = [];

    const flip = ( soFar="" ) => {
        if ( soFar.length === tosses ) {
            combinations.push( soFar ) // base case 
        } else {
            flip( soFar + 'H')
            flip( soFar + 'T')
        }
    }

    flip()

    return combinations
}

function letterCombinations(letters, index = 0, combinations = []) {

    if (index === letters.length) { return combinations }

    const letterNow = letters[index]  // finds the current letter
    combinations.push(letterNow) // adds the single letter to possible combos

    const lettersClone = [...letters] // creates a clone so to not alter the original
    let delInd = letters.indexOf(letterNow) //finds index to remove
    lettersClone.splice(delInd, 1) // removes it from the array to avoid counting it

    const letter = (letterNow, lettersClone) => {

        lettersClone.forEach( l => {

            newLetter = letterNow + l // reasigns a new letter so the loop can continue
            combinations.push(newLetter) // pushes to the array

            let copy = [...lettersClone] // creates a copy to edit
            const remove = copy.indexOf(l) // finds the index to remove
            copy.splice(remove, 1) // removes so it isnt counted again

            letter(newLetter, copy) // runs again with remaining letters
        })
    }

    letter(letterNow, lettersClone)

    return letterCombinations(letters, index + 1, combinations)

}

module.exports = {
    findMax,
    factorial,
    fibonacci,
    coinFlips,
    letterCombinations
}