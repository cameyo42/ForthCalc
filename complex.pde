// Complex Number Arithmetic
// Add, Sub, Mul, Div, Inverse, Power
// How to call functions
// double[] sol = CXADD(re1, im1, re2, im2);
// double re = sol[0];
// double im = sol[1];

// calc complex ADDITION
void fnCXADD()
{
  if (pila.stackSize() > 2)
  {
    lastX = digitNUM;
    double im2 = digitNUM;
    double re2 = pila.pop();
    double im1 = pila.pop();
    double re1 = pila.pop();
    double[] sol = CXADD(re1, im1, re2, im2);
    double re = sol[0];
    double im = sol[1];
    pila.push(im);
    digitNUM = re;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Complex addition: four numbers required."; }
}
// somma di due numeri complessi
double[] CXADD(double re1, double im1, double re2, double im2)
{
  double re, im;
  re = re1 + re2;
  im = im1 + im2;
  double[] result = { re, im };
  return(result);
}

// calc complex SUBTRACTION
void fnCXSUB()
{
  if (pila.stackSize() > 2)
  {
    lastX = digitNUM;
    double im2 = digitNUM;
    double re2 = pila.pop();
    double im1 = pila.pop();
    double re1 = pila.pop();
    double[] sol = CXSUB(re1, im1, re2, im2);
    double re = sol[0];
    double im = sol[1];
    pila.push(im);
    digitNUM = re;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Complex suctraction: four numbers required."; }
}
// sottrazione di due numeri complessi
double[] CXSUB(double re1, double im1, double re2, double im2)
{
  double re, im;
  re = re1 - re2;
  im = im1 - im2;
  double[] result = { re, im };
  return(result);
}

// calc complex MULTIPLICATION
void fnCXMUL()
{
  if (pila.stackSize() > 2)
  {
    lastX = digitNUM;
    double im2 = digitNUM;
    double re2 = pila.pop();
    double im1 = pila.pop();
    double re1 = pila.pop();
    double[] sol = CXMUL(re1, im1, re2, im2);
    double re = sol[0];
    double im = sol[1];
    pila.push(im);
    digitNUM = re;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Complex multiplication: four numbers required."; }
}
// moltiplicazione di due numeri complessi
double[] CXMUL(double re1, double im1, double re2, double im2)
{
  double re, im;
  re = (re1*re2) - (im1*im2);
  im = (im1*re2) + (re1*im2);
  double[] result = { re, im };
  return(result);
}

// calc complex DIVISION
void fnCXDIV()
{
  if (pila.stackSize() > 2)
  {
    double im2 = digitNUM;
    double re2 = pila.pop();
    double im1 = pila.pop();
    double re1 = pila.pop();
    if (re2 == 0.0 && im2 == 0.0)
    {
       pila.push(re1);
       pila.push(im1);
       pila.push(re2);
       digitNUM = re2;
       outputSTR = "Complex division: can't divide by zero.";
       isResult = true;
       isBlocked = false;
    }
    else
    {
      lastX = digitNUM;
      double[] sol = CXDIV(re1, im1, re2, im2);
      double re = sol[0];
      double im = sol[1];
      pila.push(im);
      digitNUM = re;
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
  }
  else { outputSTR = "Complex division: four numbers required."; }
}
// divisione di due numeri complessi
double[] CXDIV(double re1, double im1, double re2, double im2)
{
  double re, im;
  if (re2 == 0.0 && im2 == 0.0)
  {
    re = Double.POSITIVE_INFINITY;
    im = Double.POSITIVE_INFINITY;
  }
  else
  {
    re = ((re1*re2)+(im1*im2))/(re2*re2 + im2*im2);
    im = ((im1*re2)-(re1*im2))/(re2*re2 + im2*im2);
  }
  double[] result = { re, im };
  return(result);
}

// calc complex INVERSE
void fnCXINV()
{
  if (pila.stackSize() > 0)
  {
    //lastX = digitNUM;
    double im1 = digitNUM;
    double re1 = pila.pop();
    if (re1 == 0.0 && im1 == 0.0)
    {
      pila.push(re1);
      digitNUM = im1;
      outputSTR = "Complex inverse: 0+i0 does not have a reciprocal.";
      isResult = true;
      isBlocked = false;
    }
    else
    {
      lastX = digitNUM;
      double[] sol = CXINV(re1, im1);
      double re = sol[0];
      double im = sol[1];
      pila.push(im);
      digitNUM = re;
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
  }
  else { outputSTR = "Complex inverse: two numbers required."; }
}
// reciproco di un numero complesso
double[] CXINV(double re1, double im1)
{
  double re, im;
  if (re1 == 0.0 && im1 == 0.0)
  {
    re = Double.POSITIVE_INFINITY;
    im = Double.POSITIVE_INFINITY;
  }
  else
  {
    re = (re1)/(re1*re1+im1*im1);
    im = -(im1)/(re1*re1+im1*im1);
  }

  double[] result = { re, im };
  return(result);
}

// calc complex POWER
void fnCXPOW()
{
  if (pila.stackSize() > 1)
  {
    if ((int)digitNUM == digitNUM)
    {
      lastX = digitNUM;
      int n = (int) digitNUM;
      double im1 = pila.pop();
      double re1 = pila.pop();
      double[] sol = CXPOW(re1, im1, n);
      double re = sol[0];
      double im = sol[1];
      pila.push(im);
      digitNUM = re;
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
    else { outputSTR = "Complex power: power must be integer."; }
  }
  else { outputSTR = "Complex power: three numbers required."; }
}
// potenza di un numero complesso
double[] CXPOW(double re1, double im1, int n)
{
  double re=0.0, im=0.0;
  if (n == 0)
  {
    if (re1 == 0.0) { re = 0.0; }
    else { re = 1; }
    im = 0.0;
  }
  else if (n == 1)
  {
    re = re1;
    im = im1;
  }
  else if (n > 1)
  {
    double[] t = { re1, im1};
    for(int i=1; i< n; i++)
    {
       t = CXMUL(t[0], t[1], re1,im1);
    }
    re = t[0];
    im = t[1];
  }
  else if (n < 0)
  {
    n = Math.abs(n);
    double[] t = { re1, im1};
    for(int i=1; i< n; i++)
    {
       t = CXMUL(t[0], t[1], re1,im1);
    }
    t = CXINV(t[0], t[1]);
    re = t[0];
    im = t[1];
  }
  double[] result = { re, im };
  return(result);
}

//double CX