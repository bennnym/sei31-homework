console.log('hi');
// const catImg = document.getElementsByTagName('img')[0];
// catImg.style.left = '0px';
// // const movepx = 50;
//
// const catWalk = function(){
//   let catLeft = parseInt(catImg.style.left);
//   let catMove = catLeft + 10;
//   catImg.style.left = catMove +'px';
//   if (catLeft > (window.innerWidth-catImg.width)){
//     //catImg.style.left = '0px';
//   }
// };
// window.setInterval(catWalk, 50);


const catImg = document.getElementsByTagName('img')[0];
catImg.style.left = '0px';
let walkForwards = true;
function catReturn() {
  let currentLeft = parseInt(catImg.style.left);

  if (walkForwards && (currentLeft > (window.innerWidth-catImg.width))) {
    walkForwards = false;
    catImg.style.transform="rotateY(180deg)";
  }
  if (!walkForwards && (currentLeft <= 0)) {
    walkForwards = true;
    catImg.style.transform="rotateY(360deg)";
  }

  if (walkForwards) {
    catImg.style.left = (currentLeft + 10) + 'px';

  } else {
    catImg.style.left = (currentLeft - 10) + 'px';

  }
}
window.setInterval(catReturn, 50);
