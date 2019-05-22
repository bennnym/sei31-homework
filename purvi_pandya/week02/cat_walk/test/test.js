console.log('hello?');

const img = document.getElementsByTagName('img')[0];
img.style.position = 'absolute';
img.style.top = '0px';
const watchBillFall = function() {
  var oldTop = parseInt(img.style.top);
  var newTop = oldTop + 1;
  img.style.top = newTop + 'px';
};
window.setInterval(watchBillFall, 10);
