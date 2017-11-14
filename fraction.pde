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
    df = new DecimalFormat("######################0.0######################");
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