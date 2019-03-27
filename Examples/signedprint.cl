// Program to print out all signed 8-bit numbers
// in decimal. (c) 2017 Warren Toomey, GPL3.

// Print out the parameter in decimal
function printdec(x) {
  var tencount;
  var asciizero;
  var hundredormore;

  tencount= 48;		// ASCII '0'
  asciizero= 48;	// ASCII '0'
  hundredormore= 0;	// Will be !0 if x >= 100


  // Print out sign
  if (x < 0) {
    putchar('-');
    x= 0 - x;
  }

  // Print out any hundred digit
  if (x >= 100) {
    putchar('1');
    x= x - 100;
    hundredormore= 1;	// "Boolean" flag :)
  }

  // Count number of ten digits
  while (x >= 10) {
    tencount++;
    x= x - 10;
  }

  // What we want: print out the tencount
  // if it is bigger than '0' or if x was
  // originally 100 or more. But we don't
  // have an OR operator. So, use nested if
  // statements and print in the right places!
  if (hundredormore == 1) {
      putchar(tencount);
  } else {
    if (tencount > asciizero) {
      putchar(tencount);
    }
  }

  // Convert remaining count to ASCII
  x= x + asciizero;
  putchar(x);
  putchar('\n');
}

function main() {
  var num;

  num= -128;
  while (1) {
    printdec(num);
    num++;
    if (num == -128) {
      break;
    }
  }
  exit;
}
