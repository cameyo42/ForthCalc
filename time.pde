// Time Arithmetic
// Add and Sub hours, minutes, seconds
// How to call functions
// int result = TADD(t1, t2));
// double re = sol[0];
// double im = sol[1];

// calc complex ADDITION
void fnTADD()
{
  if (pila.stackSize() > 0)
  {
  
    long t1 = (long) pila.pop();
    long t2 = (long) digitNUM;
    long hh1=0, mm1=0, ss1=0;
    long hh2=0, mm2=0, ss2=0;
    int t1len, t2len;
    String hh1$="", mm1$="", ss1$="";
    String hh2$="", mm2$="", ss2$="";
    
    df = new DecimalFormat("#########################");
    String t1$ = df.format(t1);    
    String t2$ = df.format(t2);    
    //String t2$ = String.valueOf(t1);
    //String t2$ = String.valueOf(t2);
    println(t1$);
    t1len = t1$.length();
    t2len = t2$.length();
    if (t1len < 2 || t2len < 2)
    {
      pila.push(t1);
      digitNUM = t2;
      outputSTR = "Time addition: bad numbers";
      isResult = true;
      isBlocked = false;      
    }
    else
    {
      if (t1len == 2) { hh1$ = "0"; mm1$ = "0"; ss1$ = t1$.substring(t1len-2,t1len); }
      else if (t1len == 3) { hh1$ = "0"; mm1$ = t1$.substring(t1len-3,t1len-2); ss1$ = t1$.substring(t1len-2,t1len); }
      else if (t1len == 4) { hh1$ = "0"; mm1$ = t1$.substring(t1len-4,t1len-2); ss1$ = t1$.substring(t1len-2,t1len); }
      else
      {
        hh1$ = t1$.substring(0, t1len-4);
        mm1$ = t1$.substring(t1len-4,t1len-2); 
        ss1$ = t1$.substring(t1len-2,t1len); 
      }
      println(hh1$, mm1$,ss1$);
      hh1 = Long.valueOf(hh1$);
      mm1 = Long.valueOf(mm1$);
      
      if (t2len == 2) { hh2$ = "0"; mm2$ = "0"; ss2$ = t2$.substring(t2len-2,t2len); }
      else if (t2len == 3) { hh2$ = "0"; mm2$ = t2$.substring(t2len-3,t2len-2); ss2$ = t2$.substring(t2len-2,t2len); }
      else if (t2len == 4) { hh2$ = "0"; mm2$ = t2$.substring(t2len-4,t2len-2); ss2$ = t2$.substring(t2len-2,t2len); }
      else
      {
        hh2$ = t2$.substring(0, t2len-4);
        mm2$ = t2$.substring(t2len-4,t2len-2); 
        ss2$ = t2$.substring(t2len-2,t2len); 
      }
      println(hh2$, mm2$,ss2$);
      
      
      pila.push(t1);
      digitNUM = t2;
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
  }
  else { outputSTR = "Time addition: two numbers required."; }
}
