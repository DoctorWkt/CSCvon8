// Program to test that <= and >= operators work
// (c) 2017 Warren Toomey, GPL3

function main() {
  var x;
  var y;

  // Print 10 stars
  x= 1;
  y= 10;

  while (x <= y) {
    putchar('*');
    x++;
  }
  putchar('\n');

  // Print another 10 stars
  x= 40;
  y= 31;

  while (x >= y) {
    putchar('*');
    x= x - 1;
  }
  putchar('\n');
  exit;
}
