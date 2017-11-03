// Forth Functions
// dup (a -- a a) Duplicate the top value
// drop (a --  )  Remove the top value
// swap (a b -- b a ) Exchage the top two value
// over (a b -- a b a) Copy the second value on top
// rot (a b c -- b c a) Move the third value on top
// nip (a b -- b) Delete the the second value
// tuck (a b -- b a b) Copy the top value below the second value.
//
// 2dup (a b -- a b a b) Duplicate the top couple of value
// 2drop (a b --  ) Remove the top couple of value
// 2swap (a b c d -- c d a b) Exchange the top two couple of value
// 2over (a b c d -- a b c d a b) Copy the second couple of value on top
// 2rot (a b c d e f -- c d e f a b) Move third couple of value on top
// 2nip (a b c d -- c d) Delete the second couple of value
// 2tuck (a b c d -- c d a b c d) Copy the top couple of value below the second couple of value.

// pick ( xu...x1 x0 u -- xu...x1 x0 xu ) Remove u. Copy the xu to the top of the stack. Num items >= u+2.
// roll ( xu xu-1 ... x0 u -- xu-1 ... x0 xu ) Remove u. Rotate u+1 items on the top of the stack.Num items > u+2.
//--------------------------------------------------------------------------

// DUP (a -- a a) Duplica il valore in cima alla pila
void fnDUP() // duplicate top value
{
  pila.push(digitNUM);
  digitSTR="";
  isResult = true;
  isBlocked = false;
  outputSTR = String.valueOf(digitNUM);
}

// DROP (a --  ) Elimina il valore in cima alla pila
void fnDROP() // eliminate top value
{
  if (pila.stackSize() > 0)
  {
    digitNUM = pila.pop();
    isResult = true;
    isBlocked = false;
  }
  else
  {
    digitNUM = 0.0;
    isResult = true;
    isBlocked = true;
  }
  outputSTR = String.valueOf(digitNUM);
}

// SWAP (a b -- b a) Scambia i due valori in cima alla pila
void fnSWAP() // swap the two top value
{
  if (pila.stackSize() > 0)
  {
    double temp = digitNUM;
    digitNUM = pila.pop();
    pila.push(temp);
    isResult = true;
    isBlocked = false;
    outputSTR = String.valueOf(digitNUM);
  }
  else { outputSTR = "SWAP: two numbers required."; }
}

// OVER (a b -- a b a) Copia il secondo valore in cima alla pila
void fnOVER() // copy the second value on top
{
  if (pila.stackSize() > 0)
  {
    double b = digitNUM;
    double a = pila.pop();
    pila.push(a);
    pila.push(b);
    digitNUM = a;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "OVER: two numbers required."; }
}

// ROT (a b c -- b c a) Sposta il terzo valore in cima alla pila
void fnROT() // Move third value on top
{
  if (pila.stackSize() > 1)
  {
    double c = digitNUM;
    double b = pila.pop();
    double a = pila.pop();
    pila.push(b);
    pila.push(c);
    digitNUM = a;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "ROT: three numbers required."; }
}

// NIP (a b -- b) Elimina il secondo valore
void fnNIP() // delete the second value
{
  if (pila.stackSize() > 0)
  {
    double b = digitNUM;
    double a = pila.pop();
    digitNUM = b;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "NIP: two numbers required."; }
}

// tuck (a b -- b a b)
void fnTUCK() // copy the top value below the second value
{
  if (pila.stackSize() > 0)
  {
    double b = digitNUM;
    double a = pila.pop();
    pila.push(b);
    pila.push(a);
    digitNUM = b;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "TUCK: two numbers required."; }
}

// 2DUP (dd -- dd dd) Duplica la coppia di valori in cima alla pila
// 2DUP (a b -- a b a b) Duplica la coppia di valori in cima alla pila
void fn2DUP()
{
  if (pila.stackSize() > 0)
  {

    double b = digitNUM;
    double a = pila.pop();
    pila.push(a);
    pila.push(b);
    pila.push(a);
    digitNUM = b;
    isResult = true;
    isBlocked = false;
    outputSTR = String.valueOf(digitNUM);
  }
  else { outputSTR = "2DUP: two numbers required."; }
}

// 2DROP (dd --  ) Elimina la coppia di valori in cima alla pila
// 2DROP (a b --  )
void fn2DROP()
{
  if (pila.stackSize() > 0)
  {
    if (pila.stackSize() == 1)
    {
      double b = digitNUM;
      double a = pila.pop();
      digitNUM = 0.0;
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = true;
    }
    else
    {
      double b = digitNUM;
      double a = pila.pop();
      digitNUM = pila.pop();
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
  }
  else { outputSTR = "2DROP: two numbers required."; }
}

// 2SWAP (d1 d2 -- d2 d1) Scambia le due coppie di valori in cima alla pila
// 2SWAP (a b c d -- c d a b)
void fn2SWAP()
{
  if (pila.stackSize() > 2)
  {
    double d = digitNUM;
    double c = pila.pop();
    double b = pila.pop();
    double a = pila.pop();
    pila.push(c);
    pila.push(d);
    pila.push(a);
    digitNUM = b;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "2SWAP: four numbers required."; }
}

// 2OVER (dd1 dd2 -- dd1 dd2 dd1) Copia la seconda coppia di valori in cima alla pila
// 2OVER (a b c d -- a b c d a b)
void fn2OVER()
{
  if (pila.stackSize() > 2)
  {
    double d = digitNUM;
    double c = pila.pop();
    double b = pila.pop();
    double a = pila.pop();
    pila.push(a);
    pila.push(b);
    pila.push(c);
    pila.push(d);
    pila.push(a);
    digitNUM = b;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "2OVER: four numbers required."; }
}

// 2ROT (dd1 dd2 dd3 -- dd2 dd3 dd1) Sposta la terza coppia di valori in cima alla pila
// 2ROT (a b c d e f -- c d e f a b)
void fn2ROT()
{
  if (pila.stackSize() > 4)
  {
    double f = digitNUM;
    double e = pila.pop();
    double d = pila.pop();
    double c = pila.pop();
    double b = pila.pop();
    double a = pila.pop();
    pila.push(c);
    pila.push(d);
    pila.push(e);
    pila.push(f);
    pila.push(a);
    digitNUM = b;
    isResult = true;
    isBlocked = false;
    outputSTR = String.valueOf(digitNUM);
  }
  else { outputSTR = "2ROT: six numbers required."; }
}

// 2NIP (dd1 dd2 -- dd2)
// 2NIP (a b c d -- c d)
void fn2NIP() // elimina la seconda coppia di valori
{
  if (pila.stackSize() > 2)
  {
    double d = digitNUM;
    double c = pila.pop();
    double b = pila.pop();
    double a = pila.pop();
    pila.push(c);
    digitNUM = d;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "2NIP: four numbers required."; }
}

// 2TUCK (dd1 dd2 -- dd2 dd1 dd2)
// 2TUCK (a b c d -- c d a b c d)
void fn2TUCK() // copy the top value below the second value
{
  if (pila.stackSize() > 2)
  {
    double d = digitNUM;
    double c = pila.pop();
    double b = pila.pop();
    double a = pila.pop();
    pila.push(c);
    pila.push(d);
    pila.push(a);
    pila.push(b);
    pila.push(c);
    digitNUM = d;
    isResult = true;
    isBlocked = false;
    outputSTR = String.valueOf(digitNUM);
  }
  else { outputSTR = "2TUCK: four numbers required."; }
}

// Duplicate Stack
void fnTWINS()
{
  lastX = digitNUM;
  // copy (pop) stack values to array
  int items = pila.stackSize() + 1;
  double[] lista = new double[items];
  lista[0] = digitNUM;
  for (int i=1; i<items; i++)
  {
    lista[i] = pila.pop();
  }
  // write (push) array values to stack (two times)
  for(int i=items-1; i > -1; i--)
  {
    pila.push(lista[i]);
  }
  for(int i=items-1; i>0; i--)
  {
    pila.push(lista[i]);
  }
  digitNUM = lista[0];
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

// Copy Stack
void fnCOPYS()
{
  int items = pila.stackSize() + 1;
  clipboardItems = items;
  // copy (pop) stack values to array
  clipboard[0] = digitNUM;
  for (int i=1; i<clipboardItems; i++)
  {
    clipboard[i] = pila.pop();
  }
  // write (push) array values to stack
  for(int i=items-1; i > 0; i--)
  {
    pila.push(clipboard[i]);
  }
}

// Paste Stack
// Paste function erase all previous values on stack
void fnPASTESold()
{
  lastX = digitNUM;
  pila.clearStack();
  for (int i=clipboardItems-1; i>0; i--)
  {
    pila.push(clipboard[i]);
  }
  digitNUM = clipboard[0];
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

void fnPASTES()
{
  lastX = digitNUM;
  //pila.clearStack();
  pila.push(digitNUM);
  for (int i=clipboardItems-1; i >= 0; i--)
  {
    pila.push(clipboard[i]);
  }
  digitNUM = pila.pop();
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}

// Rotate Down stack
void fnRDOWNS()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    // copy stack values to array
    int items = pila.stackSize() + 1;
    double[] lista = new double[items];
    lista[0] = digitNUM;
    for (int i=1; i<items; i++)
    {
      lista[i] = pila.pop();
    }
    // Left Rotate array
    double first = lista[lista.length-1];
    for (int i = lista.length-1; i > 0; i--)
    { lista[i] = lista[i-1]; }
    lista[0] = first;
    // Push array on stack
    for(int i=items-1; i>0; i--)
    {
      pila.push(lista[i]);
    }
    digitNUM = lista[0];
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "R DOWN: at least two numbers required."; }
}

// Rotate Up stack
void fnRUPS()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    // copy stack values to array
    int items = pila.stackSize() + 1;
    double[] lista = new double[items];
    lista[0] = digitNUM;
    for (int i=1; i<items; i++)
    {
      lista[i] = pila.pop();
    }
    // Right Rotate array
    double last = lista[0];
    for (int i = 0; i < lista.length-1; i++)
    { lista[i] = lista[i+1]; }
    lista[lista.length-1] = last;
    // Push array on stack
    for(int i=items-1; i>0; i--)
    {
      pila.push(lista[i]);
    }
    digitNUM = lista[0];
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "R UP: at least two numbers required."; }
}

// Rotate Up the stack by N items (BUG: negative roll)
void fnROLLS()
{
  int idx = (int) digitNUM;
  if ((pila.stackSize() > 0) && (idx != 0))
  {
    lastX = digitNUM;
    // copy stack values to array
    int items = pila.stackSize();
    double[] lista = new double[items];
    for (int i=0; i<items; i++)
    {
      lista[i] = pila.pop();
    }
    if (idx > 0) // Right Rotate array N times
    {
      for (int n = 0; n < idx; n++)
      {
        double last = lista[0];
        for (int i = 0; i < lista.length-1; i++)
        { lista[i] = lista[i+1]; }
        lista[lista.length-1] = last;
      }
    }
    else // Left Rotate array N times
    {
      idx = Math.abs(idx);
      for (int n = 0; n < idx; n++)
      {
        double first = lista[lista.length-1];
        for (int i = lista.length-1; i > 0; i--)
        { lista[i] = lista[i-1]; }
        lista[0] = first;
      }
    }
    // Push array on stack
    for(int i=items-1; i>0; i--)
    {
      pila.push(lista[i]);
    }
    digitNUM = lista[0];
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "ROLL: at least two numbers required."; }
}

// Pick the N-th items from stack and copy it on top
// The number N is taken from top of stack
// Index of stack start by one (The number N has index 0)
void fnPICKS()
{
  int idx = (int) digitNUM;
  if (pila.stackSize() >= idx && idx > 0)
  {
    lastX = digitNUM;
    double pickValue = 0.0;
    // copy stack values to array
    int items = pila.stackSize();
    double[] lista = new double[items];
    for (int i=0; i<items; i++)
    {
      lista[i] = pila.pop();
      if (i == idx-1) { pickValue = lista[i]; }
    }
    // push array on stack
    for(int i=items-1; i>=0; i--)
    {
      pila.push(lista[i]);
    }
    digitNUM = pickValue;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else
  {
    //outputSTR = "PICK: positive number required [1..Items-on-stack].";
    fnDROP();
  }
}

// Invert the stack order value
void fnFLIPS()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    // copy stack values to array
    int items = pila.stackSize()+1;
    double[] lista = new double[items];
    lista[0] = digitNUM;
    for (int i=1; i<items; i++)
    {
      lista[i] = pila.pop();
    }
    // Push array on stack
    for(int i=0; i<items; i++)
    {
      pila.push(lista[i]);
    }
    digitNUM = pila.pop();
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
}
//------------------------------------------------------------
// Memory function
void fnSTO1() { mem1 = digitNUM; outputSTR = String.valueOf(digitNUM); isResult = true; isBlocked = false; }
void fnSTO2() { mem2 = digitNUM; outputSTR = String.valueOf(digitNUM); isResult = true; isBlocked = false; }
void fnSTO3() { mem3 = digitNUM; outputSTR = String.valueOf(digitNUM); isResult = true; isBlocked = false; }
void fnSTO4() { mem4 = digitNUM; outputSTR = String.valueOf(digitNUM); isResult = true; isBlocked = false; }
void fnSTO5() { mem5 = digitNUM; outputSTR = String.valueOf(digitNUM); isResult = true; isBlocked = false; }

void fnRCL1()
{
  lastX = digitNUM;
  if (!isBlocked && isResult) { pila.push(digitNUM); }
  //pila.push(digitNUM);
  digitNUM = mem1;
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}
void fnRCL2()
{
  lastX = digitNUM;
  if (!isBlocked && isResult) { pila.push(digitNUM); }
  //pila.push(digitNUM);
  digitNUM = mem2;
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}
void fnRCL3()
{
  lastX = digitNUM;
  if (!isBlocked && isResult) { pila.push(digitNUM); }
  //pila.push(digitNUM);
  digitNUM = mem3;
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}
void fnRCL4()
{
  lastX = digitNUM;
  if (!isBlocked && isResult) { pila.push(digitNUM); }
  //pila.push(digitNUM);
  digitNUM = mem4;
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}
void fnRCL5()
{
  lastX = digitNUM;
  if (!isBlocked && isResult) { pila.push(digitNUM); }
  //pila.push(digitNUM);
  digitNUM = mem5;
  outputSTR = String.valueOf(digitNUM);
  isResult = true;
  isBlocked = false;
}