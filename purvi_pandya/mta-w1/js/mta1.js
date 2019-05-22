// const lineN = ['times square', '34th', '28thA', '23rdA', 'union square', '8thA'];
//
// const lineL = ['8thB', '6th', 'union square', '3rd', '1st'];
//
// const line6 = ['grand central', '33rd', '28thB', '23rdB', 'union square', 'astor place' ];
//
// const subway = {
//   "N": lineN,
//   "L": lineL,
//   "6": line6
// }
//
// const findIndex = function(line, station) {
//   return subway[line].indexOf(station);
// };
//
// const planTrip = function (strLine, strStationName, endLine, endStationName ){
//
//   if ( strLine === endLine) { //if the starting point and destiantion are on the same line.
//     if(strStationName === endStationName){ //if the starting point and destiantion are same.
//       return alert ('You are on your destination. Go home!')
//     }
//
//     console.log("No need to change the line. Your destination is on the same line.");
//
//     /*code for finding index of starting station and end station.
//     strLine and endLine are taken as string, and it won't take as array. To represent in array i have taken
//     subway as an object*/
//     // subway[].indexOf() : it will give me the index number of strStation.
//     let strStation  = subway[strLine].indexOf(strStationName);
//     let endStation = subway[endLine].indexOf(endStationName);
//
//     // console.log (strStation);//index of first station
//     // console.log (endStation); // index of destination
//
//     if ( strStation < endStation) {
//       //loop for listing out inbetween station names from strStation to endStation.
//       var inBetweenStnName = '';
//
//       for ( let i = strStation+1; i <= endStation; i++){
//         // i = strStation+1: it gives me the next station.
//         //here endStation will representthe index number from above code.
//         //i++ to add one by ine station.
//         inBetweenStnName = inBetweenStnName +', '+ subway[strLine][i];
//       }
//
//       console.log(`You must travel through the following stops on the ${strLine} line: ${inBetweenStnName.slice(1)}`);
//
//       //loop for listing out revese station name.
//       inBetweenStnName = '';
//       for ( let i = endStation-1; i > strStation; i--){
//         //i = endStation - 1: it gives me the previous station of the endStation.
//         //i > strStation: it will give the index number of the strStation.
//         // i-- : it will decrease the index value and will reach the strStation.
//         inBetweenStnName = inBetweenStnName +', '+ subway[endLine][i];
//
//       }
//
//       console.log(`You must travel through the following stops for going back from ${endLine} line: ${inBetweenStnName.slice(1)}`);
//
//       //Code for finding the number of the total staion (eg. 1 or 2 or 3 or 4 or 5)
//       let station = 2*(endStation - strStation) - 1 ;// As the line is same here, i have double the station and substracted 1.
//       console.log(`Total stops are : ${station}`); //total number of station in between.
//
//     } else { //endStation > strStation
//       //this loop goes from opposite direction. it starts from the end of the array and stops at the station towards array.
//
//       inBetweenStnName = '';
//       for ( let i = strStation-1; i > endStation; i--){
//         inBetweenStnName = inBetweenStnName +', '+ subway[strLine][i];
//       }
//       console.log(`You must travel through the following stops on the ${strLine} line: ${inBetweenStnName.slice(1)}`);
//
//       //this is reverse of the above loop logic. and reaching back to the start of the journey point.
//       inBetweenStnName = '';
//       for ( let i = endStation; i < strStation; i++){
//         inBetweenStnName = inBetweenStnName +', '+ subway[endLine][i];
//       }
//       console.log(`You must travel through the following stops for going back from ${endLine} line: ${inBetweenStnName.slice(1)}`);
//
//       var station = (strStation - endStation) ;
//       console.log(`Total stops  are : ${station}`);
//     }
//
//   } else { //strStation is not equal to endStation. then this codes will run.
//     let tempStationName = 'union square';/*the stop 'union square' is common for all the lines.
//     And that is why I have made this new variable as tempStationName*/
//     let tempLine = strLine; /*The tempLine is for 'union square'. The strLine value is assign to tempLine to find out
//     the index of tempStation.Because this i have used as strStation in few conditions.*/
//     // let tempStation = subway[tempLine].indexOf(tempStationName);
//     let tempStation = findIndex(tempLine, tempStationName)
//     console.log(tempStation); //it will give the index of tempStation.
//     // let strStation  = subway[strLine].indexOf(strStationName);
//     let strStation  = findIndex(strLine, strStationName)
//     // let endStation = subway[endLine].indexOf(endStationName);
//     let endStation = findIndex(endLine, endStationName)
//     console.log(endStation);
//
//     if (tempStation > strStation){ /*this is divison of the strLine to tempLine and tempLine to endLine.
//       Here we are taking tempLine to strLine.*/
//       var inBetweenStnName = '';//This is required here, otherwise the uot put will give 'undefine' along with the other station name.
//       for ( let i = strStation+1; i <= tempStation; i++){
//         inBetweenStnName = inBetweenStnName +', '+ subway[strLine][i];
//       }
//
//       console.log(`You must travel through the following stops on the ${strLine} line: ${inBetweenStnName.slice(1)}`);
//
//       console.log(`Change at union square and take the line ${endLine}.`);
//
//       station = tempStation - strStation;//tempStation is bigger than the strStation here.
//     } else { //strStation > tempStation
//       inBetweenStnName = '';
//       for ( let i = strStation-1; i > tempStation; i--){
//         inBetweenStnName = inBetweenStnName +', '+ subway[strLine][i];
//       }
//       console.log(`You must travel through the following stops on the ${strLine} line: ${inBetweenStnName.slice(1)}`);
//
//       console.log(`Change at union square and take the line ${endLine}.`)
//       station = strStation - tempStation; // strStation is bigger than the tempStation here.
//     }
//
//     tempLine = endLine; // this is used to find out the index of tempStation as end of the station.
//     tempStation = subway[tempLine].indexOf(tempStationName);//index of the tempStation as the endStation.
//
//     if ( tempStation > endStation ){
//
//       station = station + (tempStation - endStation);/*one line stops are alredy counted. and adding stops for another line.
//       That way we ll get total stops number.*/
//       var inBetweenStnName = '';
//       for ( let i = tempStation-1; i >= endStation; i--){
//         inBetweenStnName = inBetweenStnName +', '+ subway[endLine][i];
//       }
//
//       console.log(`You must travel through the following stops on the ${endLine} line: ${inBetweenStnName.slice(1)}`);
//
//     }  else {//endStation > tempStation
//       inBetweenStnName = '';
//       for ( let i = endStation; i > tempStation; i--){
//         inBetweenStnName = inBetweenStnName +', '+ subway[endLine][i];
//       }
//       console.log(`You must travel through the following stops on the ${endLine} line: ${inBetweenStnName.slice(1)}`);
//
//       station = station + (endStation - tempStation);
//     }
//     console.log(`Total stops in are : ${station}`);
//   }
//
// };

  // planTrip('N', 'times square', '6', '33rd');
  // planTrip('6', 'grand central', 'L', '1st');
  // planTrip('N', 'times square', 'N', 'union square');
  // planTrip('N', 'times square', 'N', 'times square');




  /*MTA Lab
Objectives:
Apply your knowledge of Javascript to solve a real world problem.
Get really good at array manipulation.
Activity
Create a program that models a simple subway system.

The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the journey and the total number of stops for the trip in the console:

planTrip('N', 'Times Square', '6', '33rd'); // This is only a suggested function name and signature.

// console.log() shows output similar to this:
// "You must travel through the following stops on the N line: 34th, 28th, 23rd, Union Square."
// "Change at Union Square."
// "Your journey continues through the following stops: 23rd, 28th, 33rd."
// "7 stops in total."
There are 3 subway lines:
The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.)
Tell the user the number of stops AND the stops IN ORDER that they will pass through or change at.
Hints:
Work out how you would do it on paper first! Then start to explain that process in Javascript.
Get the program to work for a single line before trying to tackle multiple lines.
Don't worry about prompting the user for input. Hard code some values to get it working. You can use prompt() later to make it more interactive.
Consider diagramming the lines by sketching out the subway lines and their stops and intersection.
The key to the lab is finding the index positions of each stop. (hint: indexOf())
Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)*/

const lineN = ['times square', '34th', '28thA', '23rdA', 'union square', '8thA'];

const lineL = ['8thB', '6th', 'union square', '3rd', '1st'];

const line6 = ['grand central', '33rd', '28thB', '23rdB', 'union square', 'astor place' ];

const findStopIndex = function(station, line) {
  console.log("findStopIndex function");
  console.log("station", station, "line", line, "index", line.indexOf(station));
  return line.indexOf(station);
};

const checkIndex = function(stopIndex, exchangeIndex, line) {
  console.log("checkIndex function");
  if (stopIndex < exchangeIndex) {
    console.log("checkIndex returns: ", line.slice( stopIndex, (exchangeIndex + 1) ));
    return line.slice( stopIndex, (exchangeIndex + 1) )
  } else {
    console.log("checkIndex returns: ", line.reverse().slice( (line.length - stopIndex - 1), (line.length - exchangeIndex) ));
    return line.reverse().slice( (line.length - stopIndex - 1), (line.length - exchangeIndex) )
  }
}

const createArray = function( stop, line ) {

  const exchange = "union square"

  const strStationIndex = findStopIndex(stop, line);
  const strLineExchange = findStopIndex(exchange, line);

  const lineArray = checkIndex( strStationIndex, strLineExchange, line)

  console.log("Create Array function");
  console.log("this is the line array we are giving to planTrip: ", lineArray);

  return lineArray;


}

const planTrip = function(strLine, strStationName, endLine, endStationName, strLineName, endLineName) {

  let strLineArray = createArray( strStationName, strLine )
  console.log(strLineArray);
  let endLineArray = createArray( endStationName, endLine ).reverse()
  console.log("this has been reversed", endLineArray);

  let noOfStops = strLineArray.length + endLineArray.length - 2;

  if (strLine === endLine) {
    console.log( `You must travel on the ${strLineName}. Your trip goes through ${strLineArray} ${endLineArray.slice(1)}. You must travel through ${noOfStops} number of stops`)
  } else {
    console.log(`You must travel on the ${strLineName}. Your trip goes through ${strLineArray}. You must get off at Union Square and travel on the ${endLineName}. Your trip continues and you must travel through ${endLineArray} until you reach your destination. You must travel through ${noOfStops} number of stops`)
  }


}

console.log( planTrip( lineN, 'times square', line6, '33rd', 'lineN', 'line6' ) );
