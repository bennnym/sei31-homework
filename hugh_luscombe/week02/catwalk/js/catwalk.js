// const img = document.getElementsByTagName('img')[0];
// img.style.position = 'absolute';
// img.style.left = '0px';
//
// const catWalk = function() {
//
//   let oldLeft = parseInt(img.style.left);
//   let newLeft = oldLeft + 1;
//
//   img.style.left = newLeft + 'px';
//
//   var w = parseInt(window.innerWidth);
//   console.log(w);
//
//   if (newLeft > w-20) {
//     newLeft = oldLeft - 1;
//     img.style.transform = 'scaleX(-1)'
//     // clearInterval( timerID );
//   }
//
// };
// //
// const timerID = setInterval(catWalk, 10);




// img.style.left = '0px';
// img.style.bottom = '0px';



// let oldLeft = parseInt(img.style.left);
// let newLeft = oldLeft + 1;
// img.style.left = newLeft + 'px';
//
// let oldUp = parseFloat(img.style.bottom);
// let newUp = oldUp + 1;
// img.style.bottom = newUp + 'px';
//
// let w = parseInt(window.innerWidth);
//
// let h = parseInt(window.innerHeight);

const img = document.getElementsByTagName('img')[0];
img.style.position = 'absolute';
// walk start
const catWalk = function () {

  // let pos = 0;
  let oldLeft = parseInt(img.style.left);
  // let newLeft = oldLeft + 1;
  // img.style.left = newLeft + 'px';
  img.style.left = '0px';

  let oldUp = parseFloat(img.style.bottom);
  // let newUp = oldUp + 1;
  // img.style.bottom = newUp + 'px';
  img.style.bottom = '0px';


  let w = parseInt(window.innerWidth);

  let h = parseInt(window.innerHeight);

  const catWalkLeft = function () {
      if ( img.style.left >= w ) {
      clearInterval ( timerID )
      img.style.transform = 'scaleX ( -1 )';
      newLeft = oldLeft - 1;
      img.style.left = newLeft + 'px';
    } else {
      newLeft = oldLeft + 1;
      img.style.left = newLeft + 'px';
    }
  };

    // img.style.left = newLeft + 'px';

  const catWalkUp = function () {
      if ( img.style.bottom >= h ) {
      clearInterval ( timerID )
      img.style.transform = 'scaleX ( -1 )';
      newUp = oldUp - 1;
      img.style.bottom = newUp + 'px';
    } else {
      img.style.bottom = 'scaleX ( -1 )';
      newUp = oldUp +1;
      img.style.bottom = newUp + 'px';
    }
  };
  catWalkLeft();
  catWalkUp();
};
const timerID = setInterval(catWalk, 10);
