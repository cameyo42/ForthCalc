// ---------- CARTESIAN FUNCTION ----------
// dati due punti (x1,y1) e (x2,y2)
// calcolo distanza e pendenza e parametri della retta y = m*x + q
// using processing core function for Vectors (float)

void fnSLOPE()
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
    // calculate distance
    dd = Math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1));
    // calculate slope (pendenza)
    pp = Math.atan2(y2-y1,x2-x1);
    if(inDegrees) { pp = Math.toDegrees(pp); }
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
  else { outputSTR = "Slope: four numbers required."; }
}

//  ---------- VECTOR FUNCTIONS ----------
// Addition, Subtraction, scalar product, dot product, magnitude, angle, angle between vectors 3D
void fnVECADD()
{
  if (pila.stackSize() > 4)
  {
    lastX = digitNUM;
    PVector v1, v2;
    float x1=0.0, y1=0.0, z1=0.0;
    float x2=0.0, y2=0.0, z2=0.0;
    z2 = (float) digitNUM;
    y2 = (float) pila.pop();
    x2 = (float) pila.pop();
    z1 = (float) pila.pop();
    y1 = (float) pila.pop();
    x1 = (float) pila.pop();
    v1 = new PVector(x1, y1, z1);
    v2 = new PVector(x2, y2, z2);
    PVector v3 = PVector.add(v1, v2);
    pila.push(v3.z);
    pila.push(v3.y);
    digitNUM = v3.x;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Vector3D addition: six numbers required."; }
}

void fnVECSUB()
{
  if (pila.stackSize() > 4)
  {
    lastX = digitNUM;
    PVector v1, v2;
    float x1=0.0, y1=0.0, z1=0.0;
    float x2=0.0, y2=0.0, z2=0.0;
    z2 = (float) digitNUM;
    y2 = (float) pila.pop();
    x2 = (float) pila.pop();
    z1 = (float) pila.pop();
    y1 = (float) pila.pop();
    x1 = (float) pila.pop();
    v1 = new PVector(x1, y1, z1);
    v2 = new PVector(x2, y2, z2);
    PVector v3 = PVector.sub(v1, v2);
    pila.push(v3.z);
    pila.push(v3.y);
    digitNUM = v3.x;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Vector3D subtraction: six numbers required."; }
}

void fnVECCRO()
{
  if (pila.stackSize() > 4)
  {
    lastX = digitNUM;
    PVector v1, v2;
    float x1=0.0, y1=0.0, z1=0.0;
    float x2=0.0, y2=0.0, z2=0.0;
    z2 = (float) digitNUM;
    y2 = (float) pila.pop();
    x2 = (float) pila.pop();
    z1 = (float) pila.pop();
    y1 = (float) pila.pop();
    x1 = (float) pila.pop();
    v1 = new PVector(x1, y1, z1);
    v2 = new PVector(x2, y2, z2);
    PVector v3 = v1.cross(v2);
    pila.push(v3.z);
    pila.push(v3.y);
    digitNUM = v3.x;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Vector3D cross product: six numbers required."; }
}

void fnVECDOT()
{
  if (pila.stackSize() > 4)
  {
    lastX = digitNUM;
    PVector v1, v2;
    float x1=0.0, y1=0.0, z1=0.0;
    float x2=0.0, y2=0.0, z2=0.0;
    z2 = (float) digitNUM;
    y2 = (float) pila.pop();
    x2 = (float) pila.pop();
    z1 = (float) pila.pop();
    y1 = (float) pila.pop();
    x1 = (float) pila.pop();
    v1 = new PVector(x1, y1, z1);
    v2 = new PVector(x2, y2, z2);
    float dot = v1.dot(v2);
    digitNUM = dot;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Vector3D dot product: six numbers required."; }
}

void fnVECANG()
{
  if (pila.stackSize() > 4)
  {
    lastX = digitNUM;
    PVector v1, v2;
    float x1=0.0, y1=0.0, z1=0.0;
    float x2=0.0, y2=0.0, z2=0.0;
    z2 = (float) digitNUM;
    y2 = (float) pila.pop();
    x2 = (float) pila.pop();
    z1 = (float) pila.pop();
    y1 = (float) pila.pop();
    x1 = (float) pila.pop();
    v1 = new PVector(x1, y1, z1);
    v2 = new PVector(x2, y2, z2);
    float angle = PVector.angleBetween(v1, v2);
    if (inDegrees) { angle = degrees(angle); }
    digitNUM = angle;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Vector3D Angle between: six numbers required."; }
}

void fnVECMAG()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    float x1=0.0, y1=0.0, z1=0.0;
    z1 = (float) digitNUM;
    y1 = (float) pila.pop();
    x1 = (float) pila.pop();
    PVector v = new PVector(x1, y1, z1);
    float magnitude = v.mag();
    float angle = v.heading();
    if (inDegrees) { angle = degrees(angle); }
    pila.push(angle);
    digitNUM = magnitude;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Vector3D Magnitude and Heading: three numbers required."; }
}


