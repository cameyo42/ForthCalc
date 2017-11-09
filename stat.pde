//  ---------- STATISTIC FUNCTIONS ----------
// Calculate Number of items, Sum, Mean, Media, Mode, Variance and Standard Deviation of all numbers on stack
void fnSTAT()
{
  if (pila.stackSize() > 0)
  {
    lastX = digitNUM;
    int items = pila.stackSize() + 1;
    double[] lista = new double[items];
    // copy stack on array
    lista[0] = digitNUM;
    for (int i=1; i<items; i++)
    {
      lista[i] = pila.pop();
    }
    // calculate statistic parameters
    Arrays.sort(lista); // sort array
    double somma = sum(lista);
    double media = mean(lista);
    double mediana = median(lista);
    double moda = mode(lista);
    double varianza = variance(lista);
    double stddev = Math.sqrt(varianza);
    // write results on stack
    pila.push(stddev);
    pila.push(varianza);
    pila.push(moda);
    pila.push(mediana);
    pila.push(media);
    pila.push(somma);
    digitNUM = items;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "Stat: at least two numbers required."; }
}

// SUM
double sum(double[] m)
{
  double sum = 0.0;
  for (int i = 0; i < m.length; i++)
  {
    sum += m[i];
  }
  return sum;
}

// MEAN
double mean(double[] m)
{
  double sum = 0.0;
  for (int i = 0; i < m.length; i++)
  {
    sum += m[i];
  }
  return sum / m.length;
}

// MEDIAN
double median(double[] m) // the array double[] m MUST BE SORTED
{
  int middle = m.length/2;
  if (m.length%2 == 1)
  {
    return m[middle];
  }
  else
  {
    return (m[middle-1] + m[middle]) / 2.0;
  }
}

// MODE (return only the first MODE value)
double mode(double m[])
{
    double maxValue=0;
    int maxCount=0;
    for (int i = 0; i < m.length; ++i)
    {
      int count = 0;
      for (int j = 0; j < m.length; ++j)
      {
        if (m[j] == m[i]) ++count;
      }
      if (count > maxCount)
      {
        maxCount = count;
        maxValue = m[i];
      }
    }
    return maxValue;
}

// VARIANCE
double variance(double m[])
{
  double variance = 0.0;
  double media = mean(m);
  for(int i=0; i < m.length; i++)
  {
     variance = variance + ((m[i] - media) * (m[i] - media));
  }
  variance = variance / (m.length - 1);
  return variance;
}

// Linear Regression of data
// y = a + b*x
void fnLR()
{
  if (pila.stackSize() > 0 && (pila.stackSize() & 1) != 0)
  //if ( (x & 1) == 0 ) { even... } else { odd... }
  {
    lastX = digitNUM;
    int items = (pila.stackSize() + 1) / 2;
    double[] listaX = new double[items];
    double[] listaY = new double[items];
    // copy stack on array
    listaY[0] = digitNUM;
    listaX[0] = pila.pop();
    for (int i=1; i<items; i++)
    {
      listaY[i] = pila.pop();
      listaX[i] = pila.pop();
    }
    println(items);
    for (int i=0; i<items; i++)
    {
      println(listaX[i],listaY[i]);
    }
    // calculate statistic parameters
    //Arrays.sort(listaX); // sort array
    //Arrays.sort(listaY); // sort array
    double mediaX = 0.0;
    double mediaY = 0.0;
    double sommaXY = 0.0; double mediaXY = 0.0;
    double X2 = 0.0; double mediaX2 = 0.0;
    double Y2 = 0.0; double mediaY2 = 0.0;
    
    for (int i = 0; i < listaX.length; i++)
    {
      mediaX += listaX[i];
      mediaY += listaY[i];
      sommaXY = sommaXY + listaX[i]*listaY[i];
      println(listaX[i]*listaY[i]);
      X2 = X2 + listaX[i]*listaX[i];
      Y2 = Y2 + listaY[i]*listaY[i];
    }
    
    mediaX = mediaX / listaX.length;
    mediaY = mediaY / listaY.length;
    mediaX2 = X2 / listaX.length;
    mediaY2 = Y2 / listaY.length;
    mediaXY = sommaXY / listaX.length;
    
    println("medie=",mediaX, mediaY);
    println("sommaXY=",sommaXY);
    println("X2=",X2);
    if ((X2/items - mediaX*mediaX) == 0) { b = 0; }
    else { b = ((sommaXY/items) - mediaX*mediaY) / (X2/items - mediaX*mediaX); }
    a = mediaY - b*mediaX;
    println(a,b);
    // coefficiente di correlazione
    println(mediaX,mediaY,mediaX2,mediaY2,mediaXY);
    double R = 0.0;
    double sX = 0.0, sY = 0.0, sXY = 0.0;
    sX = mediaX2 - mediaX*mediaX;
    sY = mediaY2 - mediaY*mediaY;
    sXY = mediaXY - mediaX*mediaY;
    println(sX,sY,sXY);
    if (sX == 0 || sY == 0 || sX*sY < 0 ) { R = 0; }
    else { R = sXY/Math.sqrt(sX*sY); }
    println("correlazione = ", R);
    //println(Math.toDegrees(Math.asin(b)));
    // write results on stack
    pila.push(R);
    pila.push(b);
    digitNUM = a;
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;
  }
  else { outputSTR = "L.R.: data must be pair (x,y)."; }
}