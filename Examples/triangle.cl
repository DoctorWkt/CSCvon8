// Print a triangle of stars. An example of function
// calling in the high level language.
// (c) 2017 Warren Toomey, GPL3.

function newline() {
  putchar('\n');
}

// Print a line of stars and a newline
function starline(count) {
  var x;

  x=1;
  while (x < count) {
    putchar('*');
    x++;
  }
  newline();
}

// Print the triangle
function main() {
  var start;
  var end;
  start=1;

  while (start < 70) {
    starline(start);
    start++;
  }
  exit;
}
