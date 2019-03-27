// A working Minsky sine generator
// in a semi-high level language
// (c) 2017 Warren Toomey, GPL3

function main() {
  var x;
  var y;
  var i;
  var tmp;

  x=58;
  y=0;

  while (1) {
    tmp= x >> 4;
    y= y - tmp;		// y= y - (x>>4)
    tmp= y >> 4;
    x= x + tmp;		// x= x + (y>>4)

    i=0;
    tmp= x + 59;
    while( i < tmp) {	// print x+59 spaces
      putchar(' ');
      i++;
    }
    putchar('*');	// then a "*\n"
    putchar('\n');
  }
}
