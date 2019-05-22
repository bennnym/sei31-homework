//MTA
const trainLines = {
  'N': ['Times Square','34th','28th','23rd','Union Square','8th'],
  'L': ['8th','6th','Union Square','3rd','1st'],
  '6': ['Grand Central','33rd','28th','23rd','Union Square','Astor Place']
}

//main function
const planTrip = function(line1, station1, line2, station2) {

  // index of start of trip
  let start = trainLines[line1].indexOf(station1);

  // index of trip until Union Square
  let unionSquareFirst = trainLines[line1].indexOf('Union Square');

  // start of trip from Union Square
  let unionSquareSecond = trainLines[line2].indexOf('Union Square');

  // index of end of trip
  let stop = trainLines[line2].indexOf(station2);

  let stations1 = trainLines[line1];
  let stations2 = trainLines[line2];

  //first trip
  let numberOfStopsFirst = 0;
  let stopNames1 = " ";
  if (start < unionSquareFirst) { // look into this section
    for (var i = start+1; i <= unionSquareFirst; i++) {
      numberOfStopsFirst++;
      stopNames1 += stations1[i] + ", ";
    }
  } else {
    for (var i = start-1; i >= unionSquareFirst; i--) {
      numberOfStopsFirst++;
      stopNames1 += stations1[i] + ", ";
    }
  }

  //second trip
  let numberOfStopsSecond = 0;
  let stopNames2 = "";
  if (unionSquareSecond > stop) {
    for (var i = stop; i < unionSquareSecond; i++) {
      numberOfStopsSecond++;
      stopNames2 = stations2[i] + ", " + stopNames2;
    }
  } else {
    for (var i = stop; i > unionSquareSecond; i--) {
      numberOfStopsSecond++;
      stopNames2 = stations2[i] + ", " + stopNames2;
    }
  }

  let stops = numberOfStopsFirst + numberOfStopsSecond;

  console.log(`You must travel through the following stops on the ${line1} line: ${stopNames1}`);
  if (numberOfStopsSecond > 0) {
    console.log(`Change at Union Square. Your journey continues through the following stops on the ${line2} line: ${stopNames2}`);
  }
  console.log(`You have ${stops} stops in total`);
};

planTrip('N', 'Times Square', 'N', 'Union Square');
planTrip('N', 'Times Square', '6', '33rd');
planTrip('6', '33rd', 'L', '8th');
planTrip('L', '1st', 'N', 'Times Square');
