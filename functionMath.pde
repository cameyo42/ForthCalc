// Math functions
// NaN is formatted as a string, which typically has a single character \uFFFD.
// This string is determined by the DecimalFormatSymbols object.
// This is the only value for which the prefixes and suffixes are not used.
//
// Infinity is formatted as a string, which typically has a single character \u221E,
// with the positive or negative prefixes and suffixes applied.
// The infinity string is determined by the DecimalFormatSymbols object.

// Type Size in Bytes Range
// byte 1 byte -128 to 127
// short 2 bytes -32,768 to 32,767
// int 4 bytes -2,147,483,648 to 2,147,483,647
// long 8 bytes -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
// float 4 bytes approximately ±3.40282347E+38F (6-7 significant decimal digits) Java implements IEEE 754 standard
// double 8 bytes approximately ±1.79769313486231570E+308 (15 significant decimal digits)
// char 2 byte 0 to 65,536 (unsigned)
// boolean 2 bit true or false

// double MAX_VALUE
// A constant holding the largest positive finite value of type double, (2 - 2^-52)*2^1023.
// double MIN_NORMAL
// A constant holding the smallest positive normal value of type double, 2^-1022.
// double MIN_VALUE
// A constant holding the smallest positive nonzero value of type double, 2^-1074.

//long MAX_VALUE
//A constant holding the maximum value a long can have, 2^63 - 1.
//long MIN_VALUE
//A constant holding the minimum value a long can have, -2^63.

// number > 10e12 ==> show eng format

// Binary functions and conversion
// Statistic functions and probability functions
// Units conversion
// Physical Constant
// Solve Phytagoras (solve for zero)
// leap year
// luna (1,28)

void fnLASTX()
{
  if (!isBlocked && isResult) { pila.push(digitNUM); }
  digitNUM = lastX;
  outputSTR = String.valueOf(digitNUM);
}

// create number with exponent Yx10^X
void fnEEX()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    double y = digitNUM;
    double x = pila.pop();
    digitNUM = x * Math.pow(10, y);
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "EEX: two numbers required."; }
}

void fnChangeTrigUnit()
{
  if (inDegrees) { inDegrees = false; }
  else { inDegrees = true; }
}

void fnCLS()
{
  lastX = digitNUM;
  pila.clearStack();
  digitNUM = 0.0;
  digitSTR = digitRESET;
  isBlocked = true;
  isResult = true;
  outputSTR = String.valueOf(digitNUM);
}

void fnX_Y()
{
  fnSWAP();
}

void fnPLUS()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    double x = digitNUM;
    double y = pila.pop();
    digitNUM = y + x;
    //pila.push(digitNUM);
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "+: two numbers required."; }
}

void fnMINUS()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    double x = digitNUM;
    double y = pila.pop();
    digitNUM = y - x;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "-: two numbers required."; }
}

void fnMULT()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    double x = digitNUM;
    double y = pila.pop();
    digitNUM = y * x;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "*: two numbers required."; }
}

void fnDIV()
{
  if (pila.stackSize() > 0)
  {
    if (digitNUM != 0.0)
    {
      lastX = digitNUM;
      double x = digitNUM;
      double y = pila.pop();
      digitNUM = y / x;
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
    else { outputSTR = "/: can't divide by zero."; }
  }
  else { outputSTR = "/: two numbers required."; }
}

void fnSQRT()
{
  if (digitNUM >= 0.0)
  {
    lastX = digitNUM;
    digitNUM = Math.sqrt(digitNUM);
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Square Root: positive number required."; }
}

void fnEULER()
{
  lastX = digitNUM;
  digitNUM = Math.exp(digitNUM);
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnPOWTEN()
{
  lastX = digitNUM;
  digitNUM = Math.pow(10, digitNUM);
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnPOW()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    double x = digitNUM;
    double y = pila.pop();
    digitNUM = Math.pow(y,x);
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "y^x: two numbers required."; }
}

void fnROOTS()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    if (digitNUM == 0.0)
    {
      pila.pop();
      digitNUM = 0.0;
    }
    else
    {
      double x = digitNUM;
      double y = pila.pop();
      digitNUM = Math.pow(y,1/x);
    }
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "roots: two numbers required."; }
}

void fnINVERSE()
{
  if (digitNUM != 0.0)
  {
    lastX = digitNUM;
    digitNUM = 1 / digitNUM;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "1/x: Zero does not have a reciprocal."; }
}

void fnCBRT()
{
  if (digitNUM >= 0.0)
  {
    lastX = digitNUM;
    digitNUM = Math.cbrt(digitNUM);
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Cube Root: positive number required."; }
}

void fnABS()
{
  lastX = digitNUM;
  digitNUM = Math.abs(digitNUM);
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnX2()
{
  lastX = digitNUM;
  digitNUM = digitNUM * digitNUM;
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnLN()
{
  if (digitNUM >= 0.0)
  {
    lastX = digitNUM;
    digitNUM = Math.log(digitNUM);
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "LN: positive number required."; }
}

void fnLOG()
{
  if (digitNUM >= 0.0)
  {
    lastX = digitNUM;
    digitNUM = Math.log10(digitNUM);
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "LOG: positive number required."; }
}

void fnPERC()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    double x = digitNUM;
    double y = pila.pop();
    digitNUM = (y * x) / 100.0;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "%: two numbers required."; }
}

void fnDELTA()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    double x = digitNUM;
    double y = pila.pop();
    digitNUM = (x - y)*100.0 / y;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Delta%: two numbers required."; }
}

void fnSIN()
{
    lastX = digitNUM;
    if (inDegrees) { digitNUM = Math.sin(Math.toRadians(digitNUM)); }
    else { digitNUM = Math.sin(digitNUM); };
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
}

void fnCOS()
{
    lastX = digitNUM;
    if (inDegrees) { digitNUM = Math.cos(Math.toRadians(digitNUM)); }
    else { digitNUM = Math.cos(digitNUM); };
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
}

void fnTAN()
{
  lastX = digitNUM;
  if (inDegrees) { digitNUM = Math.tan(Math.toRadians(digitNUM)); }
  else { digitNUM = Math.tan(digitNUM); };
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnASIN()
{
  if ((digitNUM >= -1.0) && (digitNUM <= 1.0))
  {
    lastX = digitNUM;
    digitNUM = Math.asin(digitNUM);
    if (inDegrees) { digitNUM = Math.toDegrees(digitNUM); }
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "ASIN: Number must be in the range [-1, 1]."; }
}

void fnACOS()
{
  if ((digitNUM >= -1.0) && (digitNUM <= 1.0))
  {
    lastX = digitNUM;
    digitNUM = Math.acos(digitNUM);
    if (inDegrees) { digitNUM = Math.toDegrees(digitNUM); }
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "ACOS: Number must be in the range [-1, 1]."; }
}

void fnATAN()
{
  lastX = digitNUM;
  digitNUM = Math.atan(digitNUM);
  if (inDegrees) { digitNUM = Math.toDegrees(digitNUM); }
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnSINH()
{
  lastX = digitNUM;
  digitNUM = Math.sinh(digitNUM);
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnCOSH()
{
  lastX = digitNUM;
  digitNUM = Math.cosh(digitNUM);
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnTANH()
{
  lastX = digitNUM;
  digitNUM = Math.tanh(digitNUM);
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnASINH()
{
    lastX = digitNUM;
    //digitNUM = Math.asinh(digitNUM);
    digitNUM = Math.log(digitNUM + Math.sqrt(digitNUM*digitNUM + 1));
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
}

void fnACOSH()
{
  if (digitNUM >= 1.0)
  {
    lastX = digitNUM;
    //digitNUM = Math.acosh(digitNUM);
    digitNUM = Math.log(digitNUM + Math.sqrt(digitNUM*digitNUM - 1));
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "ACOSH: Number must be equal or greater than 1."; }
}

void fnATANH()
{
  if ((digitNUM > -1.0) || (digitNUM < 1.0))
  {
    lastX = digitNUM;
    //digitNUM = Math.atanh(digitNUM);
    digitNUM = 0.5 * Math.log((1 + digitNUM)/(1 - digitNUM));
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "ATANH: Number must be in the range (-1, 1)."; }
}

void fnTODEG()
{
  lastX = digitNUM;
  //println(digitNUM * (180.0/_PI) - Math.toDegrees(digitNUM) );
  //digitNUM = digitNUM * (180.0/_PI);
  digitNUM = Math.toDegrees(digitNUM);
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnTORAD()
{
  lastX = digitNUM;
  //println(digitNUM * (_PI/180.0) - Math.toRadians(digitNUM) );
  //digitNUM = digitNUM * (_PI/180.0);
  digitNUM = Math.toRadians(digitNUM);
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnPI()
{
  lastX = digitNUM;
  if (!isBlocked && isResult) { pila.push(digitNUM); }
  //pila.push(digitNUM);
  digitNUM = Math.PI;
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnE()
{
  lastX = digitNUM;
  if (!isBlocked ) { pila.push(digitNUM); }
  //pila.push(digitNUM);
  digitNUM = Math.E;
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnPHI()
{
  lastX = digitNUM;
  if (!isBlocked ) { pila.push(digitNUM); }
  //pila.push(digitNUM);
  digitNUM = (1 + Math.sqrt(5))/2;
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnINT()
{
  double n = digitNUM;
  if (((n < maxNum) && (n > maxEps)) || ((n > minNum) && (n < minEps)))
  {
    lastX = digitNUM;
    df = new DecimalFormat("#########################.#########################");
    String n$ = df.format(n);
    int idx = n$.indexOf(".");
    String iPart$ = "";
    String fPart$ = "";
    double iPart=0, fPart=0;;
    if (idx == -1)
    {
      fPart = 0;
      iPart = digitNUM;
    }
    else
    {
      iPart$ = n$.substring(0, idx);
      fPart$ = n$.substring(idx, n$.length());
      iPart = Double.valueOf(iPart$);
      fPart = Double.valueOf(fPart$);
    }
    digitNUM = iPart;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Int: number our of range"; }
}

void fnFRAC()
{
  double n = digitNUM;
  if (((n < maxNum) && (n > maxEps)) || ((n > minNum) && (n < minEps)))
  {
    lastX = digitNUM;
    df = new DecimalFormat("#########################.#########################");
    String n$ = df.format(n);
    int idx = n$.indexOf(".");
    String iPart$ = "";
    String fPart$ = "";
    double iPart=0, fPart=0;;
    if (idx == -1)
    {
      fPart = 0;
      iPart = digitNUM;
    }
    else
    {
      iPart$ = n$.substring(0, idx);
      fPart$ = n$.substring(idx, n$.length());
      iPart = Double.valueOf(iPart$);
      fPart = Double.valueOf(fPart$);
    }
    digitNUM = fPart;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Frac: number out of range"; }
}

void fnDMS() // from decimal degrees to degrees minute second
{
  lastX = digitNUM;
  double num = Math.abs(digitNUM);
  long iPart = (long) num;
  double fPart = num - iPart;
  double integralPart = (double) iPart;
  double fractionalPart = fPart;
  double gg = integralPart;
  if (digitNUM < 0.0) { gg = -gg; }

  num = fractionalPart * 60.0;
  iPart = (long) num;
  fPart = num - iPart;
  integralPart = (double) iPart;
  fractionalPart = fPart;
  double mm = integralPart;
  double ss = fractionalPart * 60.0;
  pila.push(ss);
  pila.push(mm);
  digitNUM = gg;
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnDD() // from degrees minute second to decimal degrees
{
  if (pila.stackSize() > 1)
  {
    lastX = digitNUM;
    double ss = digitNUM;
    double mm = pila.pop();
    double gg = pila.pop();
    if (gg < 0.0) { digitNUM = gg + (-mm/60.0) + (-ss/3600.0); }
    else { digitNUM = gg + mm/60.0 + ss/3600.0; }
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Decimal Degrees: three numbers required (grad min sec)."; }
}
//------------------------------------------------------------


//------------------------------------------------------------
// MISCELLANEA FUNCTIONS
//------------------------------------------------------------
// Generate Random Number
void fnRND()
{
  lastX = digitNUM;
  if (!isBlocked && isResult) { pila.push(digitNUM); }
  digitNUM = Math.random();
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnROUND()
{
  if (pila.stackSize() > 0)
  {
    if ((digitNUM >= 0.0) && (digitNUM < 10.0) && ((int)digitNUM == digitNUM))
    {
      lastX = digitNUM;
      int n = (int) digitNUM;
      double x = pila.pop();
      if (n == 0) { digitNUM = Math.rint(x); }
      else
      {
        digitNUM = Math.round(x * Math.pow(10,(double) n)) / Math.pow(10,(double) n);
      }
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
    else { outputSTR = "Round: integer number required [0, 9]"; }
  }
  else { outputSTR = "Round: two number required."; }
}

// ---------- ALGEBRIC FUNCTIONS ----------
// Solve quadratic equation (a*x^2 +b*x + c = 0 )
void fnQUADRATIC()
{
  if (pila.stackSize() > 1)
  {
    lastX = digitNUM;
    double x1, x2, i1, i2;
    double c = digitNUM;
    double b = pila.pop();
    double a = pila.pop();

    if (a == 0.0)
    {
      if (b != 0.0) { x1 = -c/b; }
      else { x1 = 0.0; }
      x2 = 0.0;
      i1 = 0.0;
      i2 = 0.0;
    }
    else
    {
      double delta = b*b - 4*a*c;
      if (delta == 0.0) // one double solution
      {
        x1 = -b/(2*a);
        x2 = -b/(2*a);
        i1 = 0.0;
        i2 = 0.0;
      }
      else if (delta > 0.0) // two positive solutions
      {
        x1 = (-b + Math.sqrt(delta))/(2*a);
        x2 = (-b - Math.sqrt(delta))/(2*a);
        i1 = 0.0;
        i2 = 0.0;
      }
      else // two complex solution
      {
        x1 = -b/(2*a);
        x2 = -b/(2*a);
        i1 = Math.sqrt(-delta)/(2*a);
        i2 = -Math.sqrt(-delta)/(2*a);
      }
    }
    pila.push(i2);
    pila.push(x2);
    pila.push(i1);
    digitNUM = x1;
    isResult = true;
    isBlocked = false;
    outputSTR = String.valueOf(digitNUM);
  }
  else { outputSTR = "QUADRATIC: three numbers required."; }
}

// Calculate GCD of n numbers
void fnGCD()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    int items = pila.stackSize() + 1;
    long[] lista = new long[items];
    // copy stack on array
    lista[0] = (long) digitNUM;
    for (int i=1; i<items; i++)
    {
      lista[i] = (long) pila.pop();
    }
    // calculate GCD of numbers in the array
    digitNUM = (double) calcGCD(lista);
    //println(digitNUM);
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "GCD: at least two numbers required."; }
}

// Find GCD of n numbers
long calcGCD(long[] m)
{
  long gcdVal = m[0];
  for (int i=1; i < m.length; i++)
  {
    gcdVal = calcGCD2(m[i], gcdVal);
  }
  return gcdVal;
}
// Find GCD of two numbers
long calcGCD2(long p, long q)
{
  while (q != 0)
  {
    long temp = q;
    q = p % q;
    p = temp;
  }
  return p;
}

// Calculate LCM of n numbers
void fnLCM()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    int items = pila.stackSize() + 1;
    long[] lista = new long[items];
    // copy stack on array
    lista[0] = (long) digitNUM;
    for (int i=1; i<items; i++)
    {
      lista[i] = (long) pila.pop();
    }
    // calculate LCM of numbers in the array
    digitNUM = (double) calcLCM_B(lista);
    //println(digitNUM);
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "LCM: at least two numbers required."; }
}

// Find LCM of n numbers (method A)
long calcLCM(long[] m)
{
  long lcmVal = 1;
  int divisor = 2;
  while (true)
  {
    int counter = 0;
    boolean divisible = false;
    for (int i = 0; i < m.length; i++)
    {
      if (m[i] == 0) { return 0; }
      else if (m[i] < 0) { m[i] = m[i] * (-1); }
      if (m[i] == 1) { counter++; }
      if (m[i] % divisor == 0)
      {
        divisible = true;
        m[i] = m[i] / divisor;
      }
    }
    if (divisible) { lcmVal = lcmVal * divisor; }
    else { divisor++; }
    if (counter == m.length) { return lcmVal; }
  }
}
// Find LCM of n numbers (method B)
long calcLCM_B(long[] m)
{
  long lcmVal = m[0];
  for(int i = 1; i < m.length; i++)
  { lcmVal = calcLCM2(lcmVal, m[i]); }
  return lcmVal;
}
// Find LCM of two numbers
long calcLCM2(long p, long q)
{
  return (p*q)/(calcGCD2(p,q));
}

// Factorize a number
void fnFACTORIZE()
{
  // max long value: 9,223,372,036,854,775,807
  long maxVALUE = 999999999999999L;
  if (digitNUM < maxVALUE)
  {
    lastX = digitNUM;
    long n = (long) digitNUM;
    for (long factor = 2; factor*factor <= n; factor++)
    {
      while (n % factor == 0)
      {
        pila.push((double) factor);
        n = n / factor;
      }
      if (n > 1) { digitNUM = (double) n; }
      else { digitNUM = pila.pop(); }
    }
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Factorize: number too high (+-999999999999)"; }
}

// Solve proportion a:b = c:d
// solve for ZERO number
void fnPROPORTION()
{
  if (pila.stackSize() > 2)
  {
    lastX = digitNUM;
    double d = digitNUM;
    double c = pila.pop();
    double b = pila.pop();
    double a = pila.pop();
    digitNUM = -1;
    if (a == 0.0) { if (d != 0.0) { a = (b*c)/d; digitNUM = a; } }
    else if (b == 0.0) { if (c != 0.0) { b = (a*d)/c; digitNUM = b; } }
    else if (c == 0.0) { if (b != 0.0) { c = (a*d)/b; } digitNUM = c; }
    else if (d == 0.0) { if (a != 0.0) { d = (b*c)/a; } digitNUM = d; }
    //pila.push(a); //pila.push(b); //pila.push(c); //digitNUM = d;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "a/b = c/d: four numbers required."; }
}

// Polar coordinates <--> Cartesian coordinate (ok)
// r, theta:  x = r*cos(theta); y = r*sin(theta);
// x, y:      r = sqrt(x*x + y*y); theta = atan(y/x);
void fnPOLAR()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    double y = digitNUM;
    double x = pila.pop();
    double r = Math.sqrt(x*x + y*y);
    double theta = Math.atan2(y,x);
    //double theta = Math.acos(x/r);
    if (inDegrees) { theta = Math.toDegrees(theta); }
    pila.push(theta);
    digitNUM = r;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Polar coord: two numbers required."; }
}

void fnRECT()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    double theta = digitNUM;
    double r = pila.pop();
    double x = 0.0;
    double y = 0.0;
    if (inDegrees)
    {
      x = r*Math.cos(Math.toRadians(theta));
      y = r*Math.sin(Math.toRadians(theta));
    }
    else
    {
      x = r*Math.cos(theta);
      y = r*Math.sin(theta);
    }
    pila.push(y);
    digitNUM = x;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Rect coord: two numbers required."; }
}

// ---------- COMBINATORIAL FUNCTIONS ----------
// Factorial x!
void fnFACT()
{
  if ( (digitNUM > 0.0) && ((int)digitNUM == digitNUM))
  {
    cursor(WAIT);
    lastX = digitNUM;
    // Must convert the double into a BigDecimal and then into a BigInteger
    BigInteger num = new BigDecimal(digitNUM).toBigInteger();
    BigInteger f = factorial(num);
    digitNUM = f.doubleValue();
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;

    // write result on file
    String s = f.toString();
    String n = num.toString();
    String[] data = split(s, ' ');
    String filename = "fact" + n + ".txt";
    saveStrings(dataPath(filename), data);
    cursor(ARROW);

    // Update window (write is another thread)
    //background(backCol);
    //drawLCD();
    //showGUI();
    //if (viewShortcuts) { image(short_IMG, 0, 0); }
    loop();


  }
  else { outputSTR = "x!: positive integer number required."; }
}

// Calculate Factorial
BigInteger factorial(BigInteger n)
{
    BigInteger result = BigInteger.ONE;
    while (!n.equals(BigInteger.ZERO))
    {
      result = result.multiply(n);
      n = n.subtract(BigInteger.ONE);
    }
    return result;
}
//BigInteger factorial(int num)
//{
//  BigInteger factorial = BigInteger.ONE;
//  for (int i = num; i > 0; i--)
//  { factorial = factorial.multiply(BigInteger.valueOf(i)); }
//  return factorial;
//}

// Fibonacci
void fnFIBO()
{
  if (digitNUM > 0.0)
  {
    cursor(WAIT);
    lastX = digitNUM;
    int num = (int) digitNUM;
    //digitNUM = fastFibonacciDoubling((int) digitNUM).doubleValue();
    //println(fastFibonacciDoubling((int) digitNUM));
    //BigInteger f = Fibonacci(num);
    BigInteger f = fastFibonacciDoubling(num);
    digitNUM = f.doubleValue();
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;

    // write result on file
    String s = f.toString();
    String n = Integer.toString(num);
    String[] data = split(s, ' ');
    String filename = "fibo" + n + ".txt";
    saveStrings(dataPath(filename), data);
    //println(r);
    cursor(ARROW);

    // Update window (write is another thread)
    //background(backCol);
    //drawLCD();
    //showGUI();
    //if (viewShortcuts) { image(short_IMG, 0, 0); }
    loop();

  }
  else { outputSTR = "Fibonacci: positive number required."; }
}
// Fibonacci
// F(n+2) = F(n+1) + F(n)
BigInteger Fibonacci(int n)
{
  BigInteger a = BigInteger.ZERO;
  BigInteger b = BigInteger.ONE;
  for (int i=0; i < n; i++)
  {
    BigInteger c = a.add(b);
    a = b;
    b = c;
  }
  return a;
}

// Binomial Coefficient
// numero delle combinazioni semplici di n elementi di classe k
void fnBINOMIAL()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    int x = (int) digitNUM;
    int y = (int) pila.pop();
    long bin = calcBinomial(y,x);
    digitNUM = (double) calcBinomial(y,x);
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Binomial: two numbers required."; }
}
long calcBinomial(int n, int k)
{
  long[][] binomial = new long[n+1][k+1];
  // base cases
  for (int i = 0; i <= n; i++) binomial[i][0] = 1;
  for (int j = 1; j <= k; j++) binomial[0][j] = 0;
  // bottom-up dynamic programming
  for (int i = 1; i <= n; i++)
  {
    for (int j = 1; j <= k; j++)
    {
      binomial[i][j] = binomial[i-1][j-1] + binomial[i-1][j];
    }
  }
  return(binomial[n][k]);
}

// Permutations
// nPr = n! / (n-r)!
// numero di gruppi con r elementi scelti da n elementi (con diverso ordinamento)
// Permutation:
// Def: The number of possibilities for choosing an ordered set of r objects (a permutation) from a total of n objects.
// Definition: nPr(n,r)=n!/(n−r)!nPr(n,r)=n!/(n−r)!
// Assume there are three persons namely A, B and C in the park.
// But there is only two seats available for them.
// Then possible ways of people can sit over the seat using permutation is:
// {AB, BA, AC, CA, BC, CB} = 6 ways persons can sit on that seats.
// nPr(n,r) = n!/(n−r)! = 6 ways
void fnPERM()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    long r = (long) digitNUM;
    long n = (long) pila.pop();
    digitNUM = (double) calc_nPr(n, r);
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Permutations: two numbers required."; }
}
long calc_nPr(long n, long r)
{
  long result = 1;
  if (r > n) return 0;
  for(long i=(n-r+1); i<(n+1); i++)
  {
    result = result * i;
  }
  return result;
}

// Combinations
// nCr = n!/((n-r)!*r!) = nPr / r!
// numero di gruppi con r elementi scelti da n elementi (indipendenti dall'ordinamento)
// Combination:
// Def: The number of different, unordered combinations of r objects from a set of n objects.
// Definition: nCr(n,r) = nPr(n,r)/r! = n!/r!(n−r)!
// Where combination says AB and BA are same since order is doesn't matters.
// So {AB, AC, BC} = 3 (combination) ways persons can sit on that seats
// nCr(n,r) = n!/r!(n−r)! = 3 ways
void fnCOMB()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    long r = (long) digitNUM;
    long n = (long) pila.pop();
    long nCr = calc_nPr(n, r);
    for(int i=1; i<(r+1); i++)
    {
      nCr = nCr / i;
    }
    digitNUM = (double) nCr;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Combinations: two numbers required."; }
}

//--------------------------------------------------------------------------
// Solve Linear Equation System 2x2, 3x3, 4x4, 5x5
void fnCRAMER()
{
  int NN = (int) digitNUM;
  if (NN < 2 || NN > 5) { outputSTR = "Linear System: only 2x2, 3x3, 4x4, 5x5 matrix."; }
  else if (pila.stackSize() > NN*NN + NN - 1)
  {
    double a11, a12, a13, a14, a15;
    double a21, a22, a23, a24, a25;
    double a31, a32, a33, a34, a35;
    double a41, a42, a43, a44, a45;
    double a51, a52, a53, a54, a55;
    double k1,  k2,  k3,  k4,  k5;

    lastX = digitNUM;
    if (NN == 2)
    {
      // get data from stack
      k2  = pila.pop();
      a22 = pila.pop();
      a21 = pila.pop();

      k1  = pila.pop();
      a12 = pila.pop();
      a11 = pila.pop();

      // solve system
      double[] solution = cramer.solve2x2
      (a11, a12,
       a21, a22,
        k1,  k2);

      if (solution == null) { outputSTR = "Linear System: no unique solution."; }
      else // write solution on stack
      {
        pila.push(solution[1]);
        digitNUM = solution[0];
        outputSTR = String.valueOf(digitNUM);
      }
    }
    else if (NN == 3)
    {
      // get data from stack
      k3  = pila.pop();
      a33 = pila.pop();
      a32 = pila.pop();
      a31 = pila.pop();

      k2  = pila.pop();
      a23 = pila.pop();
      a22 = pila.pop();
      a21 = pila.pop();

      k1 = pila.pop();
      a13 = pila.pop();
      a12 = pila.pop();
      a11 = pila.pop();

      // solve system
      double[] solution = cramer.solve3x3
      (a11, a12, a13,
       a21, a22, a23,
       a31, a32, a33,
        k1,  k2,  k3);

      if (solution == null) { outputSTR = "Linear System: no unique solution."; }
      else // write solution on stack
      {
        pila.push(solution[2]);
        pila.push(solution[1]);
        digitNUM = solution[0];
        outputSTR = String.valueOf(digitNUM);
      }
    }

    else if (NN == 4)
    {
      // get data from stack
      k4  = pila.pop();
      a44 = pila.pop();
      a43 = pila.pop();
      a42 = pila.pop();
      a41 = pila.pop();

      k3  = pila.pop();
      a34 = pila.pop();
      a33 = pila.pop();
      a32 = pila.pop();
      a31 = pila.pop();

      k2  = pila.pop();
      a24 = pila.pop();
      a23 = pila.pop();
      a22 = pila.pop();
      a21 = pila.pop();

      k1 = pila.pop();
      a14 = pila.pop();
      a13 = pila.pop();
      a12 = pila.pop();
      a11 = pila.pop();

      // solve system
      double[] solution = cramer.solve4x4
      (a11, a12, a13, a14,
       a21, a22, a23, a24,
       a31, a32, a33, a34,
       a41, a42, a43, a44,
        k1,  k2,  k3,  k4);

      if (solution == null) { outputSTR = "Linear System: no unique solution."; }
      else // write solution on stack
      {
        pila.push(solution[3]);
        pila.push(solution[2]);
        pila.push(solution[1]);
        digitNUM = solution[0];
        outputSTR = String.valueOf(digitNUM);
      }
    }

    else if (NN == 5)
    {
      // get data from stack
      k5  = pila.pop();
      a55 = pila.pop();
      a54 = pila.pop();
      a53 = pila.pop();
      a52 = pila.pop();
      a51 = pila.pop();

      k4  = pila.pop();
      a45 = pila.pop();
      a44 = pila.pop();
      a43 = pila.pop();
      a42 = pila.pop();
      a41 = pila.pop();

      k3  = pila.pop();
      a35 = pila.pop();
      a34 = pila.pop();
      a33 = pila.pop();
      a32 = pila.pop();
      a31 = pila.pop();

      k2  = pila.pop();
      a25 = pila.pop();
      a24 = pila.pop();
      a23 = pila.pop();
      a22 = pila.pop();
      a21 = pila.pop();

      k1  = pila.pop();
      a15 = pila.pop();
      a14 = pila.pop();
      a13 = pila.pop();
      a12 = pila.pop();
      a11 = pila.pop();

      // solve system
      double[] solution = cramer.solve5x5
      (a11, a12, a13, a14, a15,
       a21, a22, a23, a24, a25,
       a31, a32, a33, a34, a35,
       a41, a42, a43, a44, a45,
       a51, a52, a53, a54, a55,
        k1,  k2,  k3,  k4,  k5);

      if (solution == null) { outputSTR = "Linear System: no unique solution."; }
      else // write solution on stack
      {
        pila.push(solution[4]);
        pila.push(solution[3]);
        pila.push(solution[2]);
        pila.push(solution[1]);
        digitNUM = solution[0];
        outputSTR = String.valueOf(digitNUM);
      }
    }

    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Linear System: too few numbers."; }
}

// Risolve Sistemi Lineari di Equazioni con il metodo di Cramer (2x2, 3x3, 4x4, 5x5)
SisLin cramer = new SisLin();

class SisLin
{
// ------------------- SOLVE 2x2 -------------------
 double[] solve2x2(double a11, double a12,
                   double a21, double a22,
                   double k1,  double k2)
 {
   double det = calcDet2x2(a11, a12, a21, a22);
   if (det == 0.0) { return(null); }
   double[] soluzione = { (k1*a22 - k2*a12)/det, (k2*a11 - k1*a21)/det };
   return(soluzione);
 }

 double calcDet2x2(double a11, double a12, double a21, double a22)
 {
   return(a11*a22 - a21*a12);
 }

// ------------------- SOLVE 3x3 -------------------
 double[] solve3x3(double a11, double a12, double a13,
                   double a21, double a22, double a23,
                   double a31, double a32, double a33,
                   double k1,  double k2,  double k3)
 {
   double det = calcDet3x3(a11, a12, a13, a21, a22, a23, a31, a32, a33);
   if(det == 0.0) { return(null); }
   double[] soluzione = new double[3];
   soluzione[0] = calcDet3x3( k1, a12, a13,  k2, a22, a23,  k3, a32, a33)/det;
   soluzione[1] = calcDet3x3(a11,  k1, a13, a21,  k2, a23, a31,  k3, a33)/det;
   soluzione[2] = calcDet3x3(a11, a12,  k1, a21, a22,  k2, a31, a32,  k3)/det;
   return(soluzione);
 }

 double calcDet3x3(double a11, double a12, double a13,
                   double a21, double a22, double a23,
                   double a31, double a32, double a33)
 {
   return(a11*a22*a33 + a12*a23*a31 + a13*a21*a32 -
          a13*a22*a31 - a12*a21*a33 - a11*a23*a32);
 }

// ------------------- SOLVE 4x4 -------------------
 double[] solve4x4(double a11, double a12, double a13, double a14,
                   double a21, double a22, double a23, double a24,
                   double a31, double a32, double a33, double a34,
                   double a41, double a42, double a43, double a44,
                   double k1,  double k2,  double k3,  double k4)
 {
   double det = calcDet4x4(a11, a12, a13, a14, a21, a22, a23, a24,
                           a31, a32, a33, a34, a41, a42, a43, a44);
   if(det == 0.0) { return(null); }
   double[] soluzione = new double[4];
   soluzione[0] = calcDet4x4( k1, a12, a13, a14,  k2, a22, a23, a24,
                              k3, a32, a33, a34,  k4, a42, a43, a44)/det;
   soluzione[1] = calcDet4x4(a11,  k1, a13, a14, a21,  k2, a23, a24,
                             a31,  k3, a33, a34, a41,  k4, a43, a44)/det;
   soluzione[2] = calcDet4x4(a11, a12,  k1, a14, a21, a22,  k2, a24,
                             a31, a32,  k3, a34, a41, a42,  k4, a44)/det;
   soluzione[3] = calcDet4x4(a11, a12, a13,  k1, a21, a22, a23,  k2,
                             a31, a32, a33,  k3, a41, a42, a43,  k4)/det;
   return(soluzione);
 }

 double calcDet4x4(double a11, double a12, double a13, double a14,
                   double a21, double a22, double a23, double a24,
                   double a31, double a32, double a33, double a34,
                   double a41, double a42, double a43, double a44)
 {
   return(a11*calcDet3x3(a22, a23, a24, a32, a33, a34, a42, a43, a44) -
          a12*calcDet3x3(a21, a23, a24, a31, a33, a34, a41, a43, a44) +
          a13*calcDet3x3(a21, a22, a24, a31, a32, a34, a41, a42, a44) -
          a14*calcDet3x3(a21, a22, a23, a31, a32, a33, a41, a42, a43));
 }

// ------------------- SOLVE 5x5 -------------------
 double[] solve5x5(double a11, double a12, double a13, double a14, double a15,
                   double a21, double a22, double a23, double a24, double a25,
                   double a31, double a32, double a33, double a34, double a35,
                   double a41, double a42, double a43, double a44, double a45,
                   double a51, double a52, double a53, double a54, double a55,
                   double k1,  double k2,  double k3,  double k4,  double k5)
 {
   double det = calcDet5x5(a11, a12, a13, a14, a15, a21, a22, a23, a24, a25,
                           a31, a32, a33, a34, a35, a41, a42, a43, a44, a45,
                           a51, a52, a53, a54, a55);

   if(det == 0.0) { return(null); }
   double[] soluzione = new double[5];
   soluzione[0] = calcDet5x5( k1, a12, a13, a14, a15,  k2, a22, a23, a24, a25,
                              k3, a32, a33, a34, a35,  k4, a42, a43, a44, a45,
                              k5, a52, a53, a54, a55)/det;
   soluzione[1] = calcDet5x5(a11,  k1, a13, a14, a15, a21,  k2, a23, a24, a25,
                             a31,  k3, a33, a34, a35, a41,  k4, a43, a44, a45,
                             a51,  k5, a53, a54, a55)/det;
   soluzione[2] = calcDet5x5(a11, a12,  k1, a14, a15, a21, a22,  k2, a24, a25,
                             a31, a32,  k3, a34, a35, a41, a42,  k4, a44, a45,
                             a51, a52,  k5, a54, a55)/det;
   soluzione[3] = calcDet5x5(a11, a12, a13, k1, a15, a21,  a22, a23,  k2, a25,
                             a31, a32, a33, k3, a35, a41,  a42, a43,  k4, a45,
                             a51, a52, a53, k5, a55)/det;
   soluzione[4] = calcDet5x5(a11, a12, a13, a14,  k1, a21, a22, a23, a24,  k2,
                             a31, a32, a33, a34,  k3, a41, a42, a43, a44,  k4,
                             a51, a52, a53, a54,  k5)/det;
   return(soluzione);
 }

 double calcDet5x5(double a11, double a12, double a13, double a14, double a15,
                   double a21, double a22, double a23, double a24, double a25,
                   double a31, double a32, double a33, double a34, double a35,
                   double a41, double a42, double a43, double a44, double a45,
                   double a51, double a52, double a53, double a54, double a55)
 {
   return(a11*calcDet4x4(a22, a23, a24, a25, a32, a33, a34, a35, a42, a43, a44, a45, a52, a53, a54, a55) -
          a12*calcDet4x4(a21, a23, a24, a25, a31, a33, a34, a35, a41, a43, a44, a45, a51, a53, a54, a55) +
          a13*calcDet4x4(a21, a22, a24, a25, a31, a32, a34, a35, a41, a42, a44, a45, a51, a52, a54, a55) -
          a14*calcDet4x4(a21, a22, a23, a25, a31, a32, a33, a35, a41, a42, a43, a45, a51, a52, a53, a55) +
          a15*calcDet4x4(a21, a22, a23, a24, a31, a32, a33, a34, a41, a42, a43, a44, a51, a52, a53, a54));
 }

}
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Simple Fraction Class
// frazione f1, f2;
// f1 = new frazione(2,5);
// f2 = new frazione(1,6);
// f1 = f1 + f2  ->  f1.add(f2);
// f1 = f1 - f2  ->  f1.sub(f2);
// f1 = f1 * f2  ->  f1.mul(f2);
// f1 = f1 / f2  ->  f1.div(f2);
// auto simplify result

class frazione
{
  long numeratore;
  long denominatore;

  frazione(long numeratore, long denominatore)
  {
    this.numeratore = numeratore;
    this.denominatore = denominatore;
  }

  void add(frazione f)
  {
    numeratore = numeratore*f.denominatore + f.numeratore*denominatore;
    denominatore = denominatore*f.denominatore;
    semplifica();
  }

  void sub(frazione f)
  {
    numeratore = numeratore*f.denominatore - f.numeratore*denominatore;
    denominatore = denominatore*f.denominatore;
    semplifica();
  }

  void mul(frazione f)
  {
    numeratore = numeratore*f.numeratore;
    denominatore = denominatore*f.denominatore;
    semplifica();
  }

  void div(frazione f)
  {
    numeratore = numeratore*f.denominatore;
    denominatore = denominatore*f.numeratore;
    semplifica();
  }

  void semplifica()
  {
    long n1=numeratore, n2=denominatore, temp;
    while (n2!=0)
    {
      temp = n2;
      n2 = n1%temp;
      n1 = temp;
    }
    numeratore = numeratore/n1;
    denominatore = denominatore/n1;
  }
}

// ADD FRACTIONS
void fnFRACTadd()
{
  if (pila.stackSize() > 2)
  {
    lastX = digitNUM;
    long d = (long) digitNUM;
    long c = (long) pila.pop();
    long b = (long) pila.pop();
    long a = (long) pila.pop();
    f1 = new frazione(a,b);
    f2 = new frazione(c,d);
    f1.add(f2);
    pila.push((double) f1.denominatore);
    digitNUM = (double) f1.numeratore;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Fractions Sum: four numbers required."; }
}

// SUB FRACTIONS
void fnFRACTsub()
{
  if (pila.stackSize() > 2)
  {
    lastX = digitNUM;
    long d = (long) digitNUM;
    long c = (long) pila.pop();
    long b = (long) pila.pop();
    long a = (long) pila.pop();
    f1 = new frazione(a,b);
    f2 = new frazione(c,d);
    f1.sub(f2);
    pila.push((double) f1.denominatore);
    digitNUM = (double) f1.numeratore;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Fractions Sub: four numbers required."; }
}

// MUL FRACTIONS
void fnFRACTmul()
{
  if (pila.stackSize() > 2)
  {
    lastX = digitNUM;
    long d = (long) digitNUM;
    long c = (long) pila.pop();
    long b = (long) pila.pop();
    long a = (long) pila.pop();
    f1 = new frazione(a,b);
    f2 = new frazione(c,d);
    f1.mul(f2);
    pila.push((double) f1.denominatore);
    digitNUM = (double) f1.numeratore;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Fractions Mul: four numbers required."; }
}

// DIV FRACTIONS
void fnFRACTdiv()
{
  if (pila.stackSize() > 2)
  {
    lastX = digitNUM;
    long d = (long) digitNUM;
    long c = (long) pila.pop();
    long b = (long) pila.pop();
    long a = (long) pila.pop();
    f1 = new frazione(a,b);
    f2 = new frazione(c,d);
    f1.div(f2);
    pila.push((double) f1.denominatore);
    digitNUM = (double) f1.numeratore;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Fractions Div: four numbers required."; }
}

// From decimal number to fraction
void fnFRACTgen()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    double numeratore = 0;
    double denominatore = 0;
    String numero$="";
    String i$="", a$="", p$="";

    int cifrePeriodo = (int) Math.abs(digitNUM);
    double numero = pila.pop();
    df = new DecimalFormat("#,##0.0######################");
    numero$ = df.format(numero);
    if (cifrePeriodo > (numero$.length() - numero$.indexOf('.') - 1))
    {
      pila.push(numero);
      digitNUM = cifrePeriodo;
      outputSTR = "Fraction Generator: incompatible numbers.";
      isResult = true;
      isBlocked = true;
      return ;
    }
    else
    {
      if (cifrePeriodo == 0) { cifrePeriodo = 1; numero$ = numero$ + "0"; } // simple decimal number (no period)
      i$ = numero$.substring(0, numero$.indexOf('.'));
      a$ = numero$.substring(numero$.indexOf('.') + 1, numero$.length() - cifrePeriodo);
      p$ = numero$.substring(numero$.length() - cifrePeriodo, numero$.length());
      String all$ = i$ + a$ + p$;
      double allNumber = Double.valueOf(all$);
      String sub$ = i$ + a$;
      double subNumber = Double.valueOf(sub$);
      // Calcolo numeratore
      numeratore = allNumber - subNumber;
      if (numero < 0) { numeratore = -numeratore; }
      // Calcolo denominatore
      String denom$ = "";
      for(int i = 0; i < p$.length(); i++) { denom$ = denom$ + "9"; };
      for(int i = 0; i < a$.length(); i++) { denom$ = denom$ + "0"; };
      denominatore = Double.valueOf(denom$);
      // Semplifica numeratore/denominatore
      double n1 = numeratore;
      double n2 = denominatore;
      double temp;
      while (n2!=0)
      {
        temp = n2;
        n2 = n1%temp;
        n1 = temp;
      }
      numeratore = numeratore/n1;
      denominatore = denominatore/n1;
      // Write result on stack
      pila.push(denominatore);
      digitNUM = numeratore;
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
  }
  else { outputSTR = "Fraction Generator: two numbers required."; }
}
//--------------------------------------------------------------------------

// EVALUATE POLYNOMIAL
void fnHORNER()
{
  if (pila.stackSize() > 2)
  {
    lastX = digitNUM;
    double x = digitNUM;
    int grado = (int) pila.pop();
    double[] coeff = new double[grado+1];
    if (pila.stackSize() > grado)
    {
      for (int i=0; i < grado+1; i++)
      {
        coeff[i] = pila.pop();
      }
    }
    else
    {
      pila.push(grado);
      digitNUM = x;
      outputSTR = "Eval Poly: numbers of coefficients differs from degree.";
      return;
    }
    double eval = Horner(grado, x, coeff);
    // Push input data on stack
    //for(int i=grado; i >= 0; i--)
    //{
    //  pila.push(coeff[i]);
    //}
    //pila.push((double) grado);
    digitNUM = eval;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Eval Polynomial: at least four numbers required."; }
}
// Evaluate polynomial with Horner method
double Horner(int grado, double x, double[] coeff)
{
  double eval = 0.0;
  for(int i=grado; i >= 0; i--)
  {
    eval = eval*x + coeff[i];
  }
  return eval;
}

// Solve cubic equation
void fnCUBIC()
{
  if (pila.stackSize() > 2)
  {
    lastX = digitNUM;
    // read data from stack
    double d = digitNUM;
    double c = pila.pop();
    double b = pila.pop();
    double a = pila.pop();

    if ( a == 0.0 ) // Quadratic Equation --> Use Solve Quaddratic
    {
      pila.push(a);
      pila.push(b);
      pila.push(c);
      digitNUM = d;
      isResult = true;
      isBlocked = false;
      outputSTR = "Solve Cubic: a*x^3 = 0 --> use Solve Quadratic.";
      return;
    }

    // solve cubic equation
    double[] radici = solveCubic(a, b, c, d);

    // write solution on stack
    pila.push(radici[5]); // i3
    pila.push(radici[4]); // x3
    pila.push(radici[3]); // i2
    pila.push(radici[2]); // x2
    pila.push(radici[1]); // i1
    digitNUM = radici[0]; // x1
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Solve Cubic: four numbers required."; }
}

// http://mathworld.wolfram.com/CubicFormula.html
// https://courses.cs.washington.edu/courses/cse590b/13au/lecture_notes/solvecubic_p2.pdf
double[] solveCubic(double a, double b, double c, double d)
{
  // a  Coefficient of x^3
  // b  Coefficient of x^2
  // c  Coefficient of x
  // d  Constant coefficient
  //println(a,b,c,d);
  // variables (no 'E' for euler and no 'O' for similarity with '0')
  double F, G, H, I, J, K, L, M, N, P, Q, R, S, T, U;
  // Roots values
  double x1, i1, x2, i2, x3, i3;
  // set initial root values
  x1 = 0.0; i1 = 0.0;
  x2 = 0.0; i2 = 0.0;
  x3 = 0.0; i3 = 0.0;

  // Calculate Discriminants F, G, H
  F = (3*(c/a) - (b*b)/(a*a)) / 3;
  //println("F = "+F);

  G = ((2*(b*b*b)/(a*a*a)) - (9*b*c/(a*a)) + (27*(d/a))) / 27;
  //println("G = "+G);

  H = ((G*G)/4) + ((F*F*F)/27);
  //println("H = "+H);

  // Check Discriminants to determine type of roots
  if (H > 0) // 1 real root AND 2 complex roots
  {
    I = -(G/2) + Math.sqrt(H);
    //println("I = "+I);

    J = Math.cbrt(I);
    //println("J = "+J);

    K = (-G/2) - Math.sqrt(H);
    //println("K = "+K);

    L = Math.cbrt(K);
    //println("L ="+L);

    x1 =  (J + L) - (b/(3*a));
    x2 = -(J + L)/2 - (b/(3*a));
    i2 =  (J - L) * Math.sqrt(3)/2;
    x3 =  x2;
    i3 = -i2;
  }

  else if (F == 0.0 && G == 0.0 && H == 0.0 ) // 3 equal real roots
  {
    x1 = Math.cbrt(d/a) * (-1);
    x2 = x1;
    x3 = x1;
  }

  else if (H <= 0) // 3 real roots
  {
    M = Math.sqrt((G*G)/4 - H);
    //println("M = "+M);

    N = Math.cbrt(M);
    //println("N = "+N);

    P = Math.acos(-(G/(2*M)));
    //println("P = "+P);

    Q = N*(-1);
    //println("Q = "+Q);

    R = Math.cos(P/3);
    //println("R = "+R);

    S = Math.sqrt(3) * Math.sin(P/3);
    //println("S = "+S);

    T = (b/(3*a)) * (-1);
    //println("T = "+T);

    x1 = 2*N*Math.cos(P/3) - (b/(3*a));
    x2 = Q * (R + S) + T;
    x3 = Q * (R - S) + T;

  }
  else // error
  { println("Solve Cubic Error"); }

  // return solution (error will return: 0,0,0,0,0,0)
  double[] rootList = { x1, i1, x2, i2, x3, i3 };
  return(rootList);
}

// Arithmetic sequence
void fnASEQ()
{
  if (pila.stackSize() > 1)
  {
    lastX = digitNUM;
    int n = (int) digitNUM; // how many numbers in sequence
    double step = pila.getItem(0); // step value
    double x0 = pila.getItem(1); // start value
    if (((int)digitNUM != digitNUM) || (n > maxSlot) || (digitNUM < 0))
    {
      outputSTR = "Arithmetic sequence: bad numbers.";
    }
    else
    {
      step = pila.pop();
      x0 = pila.pop();
      for (int i=0; i<n-1; i++)
      {
        pila.push(x0 + step*(i));
      }
      digitNUM = x0 + step*(n-1);
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
  }
  else { outputSTR = "Arithmetic sequence: three numbers required."; }
}

// Geometric sequence
void fnGSEQ()
{
  if (pila.stackSize() > 1)
  {
    lastX = digitNUM;
    int n = (int) digitNUM; // how many numbers in sequence
    double ratio = pila.getItem(0); // ratio value
    double x0 = pila.getItem(1); // start value
    if (((int)digitNUM != digitNUM) || (n > maxSlot) || (digitNUM < 0))
    {
      outputSTR = "Geometric sequence: bad numbers.";
    }
    else
    {
      ratio = pila.pop();
      x0 = pila.pop();
      for (int i=0; i<n-1; i++)
      {
        pila.push(x0*Math.pow(ratio,i));
      }
      digitNUM = x0*Math.pow(ratio,n-1);
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
  }
  else { outputSTR = "Geometric sequence: three numbers required."; }
}

// Decimal to Binary
void fnTOBIN()
{
  if (digitNUM > 4095 || digitNUM < 0) // 111111111111 in binary
  {
    outputSTR = "To Binary: number out of range [0,4095].";
  }
  else
  {
    lastX = digitNUM;
    int n = (int) digitNUM;
    df = new DecimalFormat("#########################");
    String n$ = df.format(n);
    n$ = Integer.toBinaryString(n);
    long binaryValue = Long.valueOf(n$);
    digitNUM = (double) binaryValue;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
}

// Binary to Decimal
void fnTODEC()
{
  if (digitNUM > 111111111111L || digitNUM < 0) // 4095 in decimal
  {
    outputSTR = "To Decimal: number out of range [0,111111111111].";
  }
  else
  {
    int n = (int) digitNUM;
    df = new DecimalFormat("#########################");
    String n$ = df.format(digitNUM);
    boolean ok = true;
    for (int i=0; i<n$.length(); i++)
    {
      if (n$.charAt(i) != '1' && n$.charAt(i) != '0') { ok = false; }
    }
    if (ok)
    {
      lastX = digitNUM;
      int decimalValue = Integer.parseInt(n$, 2);
      digitNUM = (double) decimalValue;
      outputSTR = String.valueOf(digitNUM);
      outputSTR = n$;
      isResult = true;
      isBlocked = false;
    }
    else
    {
      outputSTR = "To Decimal: only 0 and 1 for binary number.";
    }
  }
}