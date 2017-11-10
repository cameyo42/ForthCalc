//  ---------- CARTESIAN FUNCTION ----------
// dati due punti (x1,y1) e (x2,y2)
// calcolo distanza e pendenza
// calcolo parametri retta y = m*x + q
void fnDIST()
{
  if (pila.stackSize() > 2)
  {
    lastX = digitNUM;
    double dd=0.0, pp=0.0;
    double m=0.0, q=0.0;
    double x1=0.0, y1=0.0;
    double x2=0.0, y2=0.0;
    y2 = digitNUM;
    x2 = pila.pop();
    y1 = pila.pop();
    x1 = pila.pop();
    println(x1,y1,x2,y2);
    // calculate distance
    dd = Math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1));
    // calculate slope (pendenza)
    pp = Math.toDegrees(Math.atan2(y2-y1,x2-x1));
    // calculate m and q (y = m*x + q)
    if ((x2 - x1) == 0.0)
    {
      m = Double.POSITIVE_INFINITY;
      q = Double.POSITIVE_INFINITY;
    }
    else
    {
      m = (y2 - y1)/(x2 - x1);
      q = (x2*y1 - x1*y2)/(x2 - x1);
    }
    pila.push(q);
    pila.push(m);
    pila.push(pp);
    digitNUM = dd;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Distance 3D: at least six numbers required."; }
}


//  ---------- VECTOR FUNCTIONS ----------
// Addition, Subtraction scal product, dot product
void fnVECADD()
{
  if (pila.stackSize() > 4)
  {
    lastX = digitNUM;

    digitNUM = 0;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Vector addition: at least six numbers required."; }
}

