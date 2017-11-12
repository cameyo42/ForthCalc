// Triangle solution
// Parameters: a, b, c, alfa, beta, gamma
// epsilon 1e-6
double a, b, c, alfa, beta, gamma;
double a1, b1, c1, alfa1, beta1, gamma1;
double sinalfa, sinbeta, singamma;
String stato;

// Triangle function
void fnTRIANGLE()
{
  if (pila.stackSize() > 4)
  {
    // get variables (a,b,c,alfa,beta,gamma) from stack...and make a copy
    gamma = digitNUM;  double ggamma = gamma;
    beta = pila.pop(); double bbeta = beta;
    alfa = pila.pop(); double aalfa = alfa;
    c = pila.pop();    double cc = c;
    b = pila.pop();    double bb = b;
    a = pila.pop();    double aa = a;

    if (inDegrees)
    {
      alfa = Math.toRadians(alfa);
      beta = Math.toRadians(beta);
      gamma = Math.toRadians(gamma);
    }

    // Second solution variables
    a1 = -1; b1 = -1; c1 = -1;
    alfa1 = -1; beta1 = -1; gamma1 = -1;

    stato = ""; // all is ok
    int numTipo = 0;
    int lati = 0;
    int angoli = 0;
    if (a != 0.0)     { numTipo = numTipo + 32; lati++; }
    if (b != 0.0)     { numTipo = numTipo + 16; lati++; }
    if (c != 0.0)     { numTipo = numTipo +  8; lati++; }
    if (alfa  != 0.0) { numTipo = numTipo +  4; angoli++; }
    if (beta  != 0.0) { numTipo = numTipo +  2; angoli++; }
    if (gamma != 0.0) { numTipo = numTipo +  1; angoli++; }

    // check data
    if ((lati + angoli) != 3) { stato = "Triangle: give exactly three values."; }
    else if (lati == 0) { stato = "Triangle: give at least one side."; }
    else if (lati == 3)
    {
      if ((a + b <= c) || (b + c <= a) || (a + c <= b))
      { stato = "Triangle: no solution."; }
    }
    else if (angoli == 2)
    {
      if (alfa + beta + gamma > Math.PI)
      { stato = "Triangle: no solution."; }
    }

    // println("numtipo = "+numTipo);
    // println(a,b,c,alfa,beta,gamma);
    // println(stato);

    if (stato.equals(""))
    {
      solveTriangle(numTipo);
      //println("stato=",stato);
    }

    if (stato.equals("")) // put variables (a,b,c,alfa,beta,gamma) on stack...
    {
      if (inDegrees)
      {
        alfa =  Math.toDegrees(alfa);
        beta =  Math.toDegrees(beta);
        gamma = Math.toDegrees(gamma);
        if (alfa1 != -1)
        {
          alfa1 =  Math.toDegrees(alfa1);
          beta1 =  Math.toDegrees(beta1);
          gamma1 = Math.toDegrees(gamma1);
        }
      }

      if (alfa1 != -1) // push second solution on stack
      {
        pila.push(gamma1);
        pila.push(beta1);
        pila.push(alfa1);
        pila.push(c1);
        pila.push(b1);
        pila.push(a1);
      }

      // push first solution on stack
      pila.push(gamma);
      pila.push(beta);
      pila.push(alfa);
      pila.push(c);
      pila.push(b);
      digitNUM = a;
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
    else // stato != "" --> no solution
    {
      // push original data on stack
      pila.push(aa);
      pila.push(bb);
      pila.push(cc);
      pila.push(aalfa);
      pila.push(bbeta);
      digitNUM = ggamma;
      outputSTR = stato;
      isResult = true;
      isBlocked = false;
    }
  }
  else
  {
    outputSTR = "Triangle: six numbers required.";
  }
}

void solveTriangle(int tipo)
{
  switch(tipo)
  {
    case 11: solve11(); break;
    case 13: solve13(); break;
    case 14: solve14(); break;
    case 19: solve19(); break;
    case 21: solve21(); break;
    case 22: solve22(); break;
    case 25: solve25(); break;
    case 26: solve26(); break;
    case 28: solve28(); break;
    case 35: solve35(); break;
    case 37: solve37(); break;
    case 38: solve38(); break;
    case 41: solve41(); break;
    case 42: solve42(); break;
    case 44: solve44(); break;
    case 49: solve49(); break;
    case 50: solve50(); break;
    case 52: solve52(); break;
    case 56: solve56(); break;
  }
}

void solve11() // AAL
{ // c, beta, gamma
  alfa = Math.PI - beta - gamma;
  a = c*(Math.sin(alfa)/Math.sin(gamma));
  b = c*(Math.sin(beta)/Math.sin(gamma));
  control();
}

void solve13() // AAL ok
{ // c, alfa, gamma
  beta = Math.PI - alfa - gamma;
  a = c*(Math.sin(alfa)/Math.sin(gamma));
  b = c*(Math.sin(beta)/Math.sin(gamma));
  control();
}

void solve14() // AAL ok
{ // c, alfa, beta
  gamma = Math.PI - alfa - beta;
  a = c*(Math.sin(alfa)/Math.sin(gamma));
  b = c*(Math.sin(beta)/Math.sin(gamma));
  control();
}

void solve19() // AAL ok
{ // b, beta, gamma
  alfa = Math.PI - beta - gamma;
  a = b*(Math.sin(alfa)/Math.sin(beta));
  c = b*(Math.sin(gamma)/Math.sin(beta));
  control();
}

void solve21() // AAL ok
{ // b, alfa, gamma
  beta = Math.PI - alfa - gamma;
  a = b*(Math.sin(alfa)/Math.sin(beta));
  c = b*(Math.sin(gamma)/Math.sin(beta));
  control();
}

void solve22() // AAL ok
{ // b, alfa, beta
  gamma = Math.PI - alfa - beta;
  a = b*(Math.sin(alfa)/Math.sin(beta));
  c = b*(Math.sin(gamma)/Math.sin(beta));
  control();
}

void solve25() // LLA ok
{ // b, c, gamma
  sinbeta = (b/c) * Math.sin(gamma);
  if (sinbeta > 1) { stato = "Triangle: no solution"; }
  else
  {
    // first solution
    beta = Math.asin(sinbeta);
    if (beta + gamma > Math.PI) // no first solution
    { beta = -1; alfa = -1; gamma = -1; }
    else
    {
      alfa = Math.PI - beta - gamma;
      a = c*(Math.sin(alfa)/Math.sin(gamma));
    }
    // second solution
    beta1 = Math.PI - beta;
    if (beta1 + gamma > Math.PI) // no second solution
    { beta1 = -1; alfa1 = -1; gamma1 = -1; }
    else
    {
      alfa1 = Math.PI - beta1 - gamma;
      a1 = c*(Math.sin(alfa1)/Math.sin(gamma));
      b1 = b; c1 = c; gamma1 = gamma;
    }
    control();
  }
}

void solve26()  // LLA ok
{ // b, c, beta
  singamma = (c/b) * Math.sin(beta);
  if (singamma > 1) { stato = "Triangle: no solution"; }
  else
  {
    // first solution
    gamma = Math.asin(singamma);
    if (beta + gamma > Math.PI)
    { alfa = -1; beta = -1;  gamma = -1; } // no first solution
    else
    {
      alfa = Math.PI - beta - gamma;
      a = b*(Math.sin(alfa)/Math.sin(beta));
    }
    // second solution
    gamma1 = Math.PI - gamma;
    if (beta + gamma1 > Math.PI)
    { alfa1 = -1; beta1 = -1; gamma1 = -1; } // no second solution
    else
    {
      alfa1 = Math.PI - beta - gamma1;
      a1 = b*(Math.sin(alfa1)/Math.sin(beta));
      b1 = b; c1 = c; beta1 = beta;
    }
  }
  control();
}

void solve28() // LAL ok
{ // b, c, alfa
  a = Math.sqrt(b*b + c*c -2*b*c*Math.cos(alfa));
  beta  = Math.acos((a*a + c*c - b*b)/(2*a*c));
  gamma = Math.acos((a*a + b*b - c*c)/(2*a*b));
  control();
}

void solve35() // AAL ok
{ // a, beta, gamma
  alfa = Math.PI - beta - gamma;
  b = a*(Math.sin(beta)/Math.sin(alfa));
  c = a*(Math.sin(gamma)/Math.sin(alfa));
  control();
}

void solve37() // AAL ok
{ // a, alfa, gamma
  beta = Math.PI - alfa - gamma;
  b = a*(Math.sin(beta)/Math.sin(alfa));
  c = a*(Math.sin(gamma)/Math.sin(alfa));
  control();
}

void solve38() // AAL ok
{ // a, alfa, beta
  gamma = Math.PI - alfa - beta;
  b = a*(Math.sin(beta)/Math.sin(alfa));
  c = a*(Math.sin(gamma)/Math.sin(alfa));
  control();
}

void solve41() // LLA ok
{ // a, c, gamma
  sinalfa = (a/c)*Math.sin(gamma);
  if (sinalfa > 1) { stato = "Triangle: no solution"; }
  else
  {
    // first solution
    alfa = Math.asin(sinalfa);
    if (alfa + gamma > Math.PI)
    { alfa = -1; beta = -1; gamma = -1; } // no first solution
    else
    {
      beta = Math.PI - alfa - gamma;
      b = c*(Math.sin(beta)/Math.sin(gamma));
    }
    // second solution
    alfa1 = Math.PI - alfa;
    if (alfa1 + gamma > Math.PI)
    { alfa1 = -1; beta1 = -1; gamma1 = -1; } // no second solution
    else
    {
      beta1 = Math.PI - alfa1 - gamma;
      b1 = c*(Math.sin(beta1)/Math.sin(gamma));
      a1 = a; c1 = c; gamma1 = gamma;
    }
    control();
  }
}

void solve42() // LAL ok
{ // a, c, beta
  b = Math.sqrt(a*a + c*c -2*a*c*Math.cos(beta));
  alfa = Math.acos((b*b + c*c - a*a)/(2*b*c));
  gamma = Math.acos((a*a + b*b - c*c)/(2*a*b));
  control();
}

void solve44() // LLA ok
{ // a, c, alfa
  singamma = (c/a) * Math.sin(alfa);
  if (singamma > 1) { stato = "Triangle: no solution"; }
  else
  {
    // first solution
    gamma = Math.asin(singamma);
    if (alfa + gamma > Math.PI)
    { alfa = -1; beta = -1; gamma = -1; } // no first solution
    else
    {
      beta = Math.PI - alfa - gamma;
      b = a*(Math.sin(beta)/Math.sin(alfa));
    }
    // second solution
    gamma1 = Math.PI - gamma;
    if (alfa + gamma1 > Math.PI)
    { alfa1 = -1; beta1 = -1; gamma1 = -1; } // no second solution
    else
    {
      beta1 = Math.PI - alfa - gamma1;
      b1 = a*(Math.sin(beta1)/Math.sin(alfa));
      a1 = a; c1 = c; alfa1 = alfa;
    }
    control();
  }
}

void solve49() // LAL ok
{ // a, b, gamma
  c = Math.sqrt(a*a + b*b -2*a*b*Math.cos(gamma));
  alfa  = Math.acos((b*b + c*c - a*a)/(2*b*c));
  beta  = Math.acos((a*a + c*c - b*b)/(2*a*c));
  control();
}

void solve50() // LLA ok
{ // a, b, beta
  sinalfa = (a/b)*Math.sin(beta);
  if (sinalfa > 1) { stato = "Triangle: no solution"; }
  else
  {
    // first solution
    alfa = Math.asin(sinalfa);
    if (alfa + beta > Math.PI)
    { alfa = -1; beta = -1; gamma = -1; } // no first solution
    else
    {
      gamma = Math.PI - alfa - beta;
      c = b*(Math.sin(gamma)/Math.sin(beta));
    }
    // second solution
    alfa1 = Math.PI - alfa;
    if (alfa1 + beta > Math.PI)
    { alfa1 = -1; beta1 = -1; gamma1 = -1; } // no second solution
    else
    {
      gamma1 = Math.PI - alfa1 - beta;
      c1 = b*(Math.sin(gamma1)/Math.sin(beta));
      a1 = a; b1 = b; beta1 = beta;
    }
  }
  control();
}

void solve52() // LLA ok
{ // a, b, alfa
  sinbeta = (b/a)*Math.sin(alfa);
  if (sinbeta > 1) { stato = "Triangle: no solution"; }
  else
  {
    // first solution
    beta = Math.asin(sinbeta);
    if (alfa + beta > Math.PI)
    { alfa = -1; beta = -1; gamma = -1; } // no first solution
    else
    {
      gamma = Math.PI - alfa - beta;
      c = a*(Math.sin(gamma)/Math.sin(alfa));
    }
    // second solution
    beta1 = Math.PI - beta;
    if (alfa + beta1 > Math.PI)
    { alfa1 = -1; beta1 = -1; gamma1 = -1; } // no second solution
    else
    {
      gamma1 = Math.PI - alfa - beta1;
      c1 = a*(Math.sin(gamma1)/Math.sin(alfa));
      a1 = a; b1 = b; alfa1 = alfa;
    }
  }
  control();
}

void solve56() // LLL ok
{ // a, b, c
  alfa  = Math.acos((b*b + c*c - a*a)/(2*b*c));
  beta  = Math.acos((a*a + c*c - b*b)/(2*a*c));
  gamma = Math.acos((a*a + b*b - c*c)/(2*a*b));
  control();
}

void control()
{
  if (stato.equals(""))
  {
    double epsilon = 1e-6;
    if (Math.abs(alfa + beta + gamma - Math.PI)  > epsilon)
    { stato = "Triangle: malformed solution 1a"; }
    else if (Math.abs(a/Math.sin(alfa) - b/Math.sin(beta))  > epsilon)
    { stato = "Triangle: malformed solution 1b"; }
    else if (Math.abs(b/Math.sin(beta) - c/Math.sin(gamma)) > epsilon)
    { stato = "Triangle: malformed solution 1b"; }
    else if (Math.abs(a/Math.sin(alfa) - c/Math.sin(gamma)) > epsilon)
    { stato = "Triangle: malformed solution 1b"; }

    if (alfa1 != -1)
    {
      if (Math.abs(alfa1 + beta1 + gamma1 - Math.PI)  > epsilon)
      { stato = "Triangle: malformed solution 2a"; }
      else if (Math.abs(a1/Math.sin(alfa1) - b1/Math.sin(beta1))  > epsilon)
      { stato = "Triangle: malformed solution 2b)"; }
      else if (Math.abs(b1/Math.sin(beta1) - c1/Math.sin(gamma1)) > epsilon)
      { stato = "Triangle: malformed solution 2b)"; }
      else if (Math.abs(a1/Math.sin(alfa1) - c1/Math.sin(gamma1)) > epsilon)
      { stato = "Triangle: malformed solution 2b)"; }
    }
  }
}
