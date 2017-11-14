
void fnINDEG() { inDegrees = true; }

void fnINRAD() { inDegrees = false; }

void fnFIX()
{
  if ((digitNUM >= -2.0) && (digitNUM < 10.0) && ((int)digitNUM == digitNUM))
  {
    int num = (int) digitNUM;
    numFloating = num;
    digitRESET = "0." + nf(0, numFloating);
    fnDROP();
  }
  else { outputSTR = "FIX: integer number required [-2, 9]"; }
}

void enterPressed()
{
  pila.push(digitNUM);
  isBlocked = true;
  isResult = true;
  digitSTR="";
  outputSTR = String.valueOf(digitNUM);
}

void fn0() { numberButtonPressed("0"); }
void fn1() { numberButtonPressed("1"); }
void fn2() { numberButtonPressed("2"); }
void fn3() { numberButtonPressed("3"); }
void fn4() { numberButtonPressed("4"); }
void fn5() { numberButtonPressed("5"); }
void fn6() { numberButtonPressed("6"); }
void fn7() { numberButtonPressed("7"); }
void fn8() { numberButtonPressed("8"); }
void fn9() { numberButtonPressed("9"); }

void numberButtonPressed (String num)
{
  if (isResult)
  {
    if (!isBlocked) { pila.push(digitNUM); }
    digitSTR = "";
  }
  isResult = false;
  if (digitSTR.length() < maxDigits)
  {
    digitSTR = digitSTR + num;
    digitNUM = Double.valueOf(digitSTR);
  }
  outputSTR = String.valueOf(digitNUM);
}

void numberPressed()
{
  if (isResult)
  {
    if (!isBlocked) { pila.push(digitNUM); }
    digitSTR = "";
  }
  isResult = false;
  if (digitSTR.length() < maxDigits)
  {
    int num = key - 48;
    digitSTR = digitSTR + str(num);
    digitNUM = Double.valueOf(digitSTR);
  }
  outputSTR = String.valueOf(digitNUM);
}

void changeSignPressed()
{
  if ((!isResult) && (digitSTR.length() != 0) && (digitNUM != 0.0))
  {
    if (digitSTR.charAt(0) == '-')
    { digitSTR = digitSTR.substring(1, digitSTR.length()); }
    else { digitSTR = '-' + digitSTR; }
    digitNUM = Double.valueOf(digitSTR);
  }
  else if ((isResult) && (digitNUM != 0.0))
  {
    digitNUM = - digitNUM;
  }
  outputSTR = String.valueOf(digitNUM);
}

void dotPressed()
{
  if (isResult)
  {
    digitSTR = "0.";
    if (!isBlocked) pila.push(digitNUM);
    digitNUM = 0.0;
    isResult = false;
    isBlocked = false;
  }
  else if (digitSTR.indexOf('.') < 0)
  {
    digitSTR = digitSTR + ".";
  }
}

void backspacePressed()
{
  if (isResult)
  {
   digitSTR = digitRESET;
   digitNUM = 0.0;
   isBlocked = true;
  }
  else
  {
    if (digitSTR.length() > 1)
    {
      digitSTR = digitSTR.substring(0, digitSTR.length() - 1);
      if (digitSTR.equals("-"))
      { digitNUM = 0.0; digitSTR = digitRESET; isResult = true;}
      else { digitNUM = Double.valueOf(digitSTR); }
    }
    else
    {
      digitSTR = digitRESET;
      digitNUM = 0.0;
      isResult = true;
      isBlocked = true;
    }
  }
  outputSTR = String.valueOf(digitNUM);
}

void deletePressed()
{
  lastX = digitNUM;
  digitNUM = 0.0;
  digitSTR = digitRESET;
  isResult = true;
  isBlocked = true;
  outputSTR = String.valueOf(digitNUM);
}
