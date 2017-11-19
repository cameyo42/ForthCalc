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
    long hh=0, mm=0, ss=0;
    String hh$="", mm$="", ss$="";
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
    //println(t1$,t2$);
    t1len = t1$.length();
    t2len = t2$.length();
    if (t1 < 0 || t2 < 0)
    {
      pila.push(t1);
      digitNUM = t2;
      outputSTR = "Time addition: bad numbers";
      isResult = true;
      isBlocked = false;
    }
    else
    {
      if (t1len == 1) { hh1$ = "00"; mm1$ = "00"; ss1$ = "0" + t1$; }
      else if (t1len == 2) { hh1$ = "00"; mm1$ = "00"; ss1$ = t1$.substring(t1len-2,t1len); }
      else if (t1len == 3) { hh1$ = "00"; mm1$ = t1$.substring(t1len-3,t1len-2); ss1$ = t1$.substring(t1len-2,t1len); }
      else if (t1len == 4) { hh1$ = "00"; mm1$ = t1$.substring(t1len-4,t1len-2); ss1$ = t1$.substring(t1len-2,t1len); }
      else
      {
        hh1$ = t1$.substring(0, t1len-4);
        mm1$ = t1$.substring(t1len-4,t1len-2);
        ss1$ = t1$.substring(t1len-2,t1len);
      }
      //println(hh1$, mm1$,ss1$);
      hh1 = Long.valueOf(hh1$);
      mm1 = Long.valueOf(mm1$);
      ss1 = Long.valueOf(ss1$);
      //println(hh1, mm1,ss1);

      if (t2len == 1) { hh2$ = "00"; mm2$ = "00"; ss2$ = "0" + t2$; }
      else if (t2len == 2) { hh2$ = "00"; mm2$ = "00"; ss2$ = t2$.substring(t2len-2,t2len); }
      else if (t2len == 3) { hh2$ = "00"; mm2$ = t2$.substring(t2len-3,t2len-2); ss2$ = t2$.substring(t2len-2,t2len); }
      else if (t2len == 4) { hh2$ = "00"; mm2$ = t2$.substring(t2len-4,t2len-2); ss2$ = t2$.substring(t2len-2,t2len); }
      else
      {
        hh2$ = t2$.substring(0, t2len-4);
        mm2$ = t2$.substring(t2len-4,t2len-2);
        ss2$ = t2$.substring(t2len-2,t2len);
      }
      //println(hh2$, mm2$,ss2$);
      hh2 = Long.valueOf(hh2$);
      mm2 = Long.valueOf(mm2$);
      ss2 = Long.valueOf(ss2$);
      //println(hh2, mm2,ss2);

      // calcolo di t1 + t2
      ss = ss1 + ss2;
      while (ss >= 60) { ss = ss - 60; mm = mm + 1; }

      mm = mm + mm1 + mm2;
      while (mm >= 60) { mm = mm - 60; hh = hh + 1; }

      hh = hh + hh1 + hh2;
      //println(hh,mm,ss);
      hh$ = String.valueOf(hh);
      mm$ = String.valueOf(mm);
      if (mm$.length() == 1) { mm$ = "0"+ mm$; }
      ss$ = String.valueOf(ss);
      if (ss$.length() == 1) { ss$ = "0"+ ss$; }
      String res$ = hh$ + mm$ +ss$;
      //println(res$);
      double res = Double.valueOf(res$);
      //println(res);
      //Example, the result of TIME('11:02:26') - '00:32:56' is 102930 (a duration of 10 hours, 29 minutes, and 30 seconds).
      digitNUM = res;
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
  }
  else { outputSTR = "Time addition: two numbers required."; }
}
// calc time subtraction
void fnTSUB()
{
  if (pila.stackSize() > 0)
  {

    long t1 = (long) pila.pop();
    long t2 = (long) digitNUM;
    long hh=0, mm=0, ss=0;
    long hh1=0, mm1=0, ss1=0;
    long hh2=0, mm2=0, ss2=0;
    int t1len, t2len;
    String hh$="", mm$="", ss$="";
    String hh1$="", mm1$="", ss1$="";
    String hh2$="", mm2$="", ss2$="";

    df = new DecimalFormat("#########################");
    String t1$ = df.format(t1);
    String t2$ = df.format(t2);
    //String t2$ = String.valueOf(t1);
    //String t2$ = String.valueOf(t2);
    //println(t1$,t2$);
    t1len = t1$.length();
    t2len = t2$.length();
    if (t1 < 0 || t2 < 0)
    {
      pila.push(t1);
      digitNUM = t2;
      outputSTR = "Time addition: bad numbers";
      isResult = true;
      isBlocked = false;
    }
    else
    {
      if (t1len == 1) { hh1$ = "00"; mm1$ = "00"; ss1$ = "0" + t1$; }
      else if (t1len == 2) { hh1$ = "00"; mm1$ = "00"; ss1$ = t1$.substring(t1len-2,t1len); }
      else if (t1len == 3) { hh1$ = "00"; mm1$ = t1$.substring(t1len-3,t1len-2); ss1$ = t1$.substring(t1len-2,t1len); }
      else if (t1len == 4) { hh1$ = "00"; mm1$ = t1$.substring(t1len-4,t1len-2); ss1$ = t1$.substring(t1len-2,t1len); }
      else
      {
        hh1$ = t1$.substring(0, t1len-4);
        mm1$ = t1$.substring(t1len-4,t1len-2);
        ss1$ = t1$.substring(t1len-2,t1len);
      }
      //println(hh1$, mm1$,ss1$);
      hh1 = Long.valueOf(hh1$);
      mm1 = Long.valueOf(mm1$);
      ss1 = Long.valueOf(ss1$);
      //println(hh1, mm1, ss1);

      if (t2len == 1) { hh2$ = "00"; mm2$ = "00"; ss2$ = "0" + t2$; }
      else if (t2len == 2) { hh2$ = "00"; mm2$ = "00"; ss2$ = t2$.substring(t2len-2,t2len); }
      else if (t2len == 3) { hh2$ = "00"; mm2$ = t2$.substring(t2len-3,t2len-2); ss2$ = t2$.substring(t2len-2,t2len); }
      else if (t2len == 4) { hh2$ = "00"; mm2$ = t2$.substring(t2len-4,t2len-2); ss2$ = t2$.substring(t2len-2,t2len); }
      else
      {
        hh2$ = t2$.substring(0, t2len-4);
        mm2$ = t2$.substring(t2len-4,t2len-2);
        ss2$ = t2$.substring(t2len-2,t2len);
      }
      //println(hh2$, mm2$,ss2$);
      hh2 = Long.valueOf(hh2$);
      mm2 = Long.valueOf(mm2$);
      ss2 = Long.valueOf(ss2$);
      //println(hh2, mm2,ss2);

//If SECOND(TIME2) <= SECOND(TIME1)
//   then SECOND(RESULT) = SECOND(TIME1) - SECOND(TIME2).
//If SECOND(TIME2) > SECOND(TIME1)
//   then SECOND(RESULT) = 60 + SECOND(TIME1) - SECOND(TIME2).
//   MINUTE(TIME2) is then incremented by 1.
      // adjust numbers > 60
      while (ss1 >= 60) { ss1 = ss1 - 60; mm1 = mm1 + 1; }
      while (mm1 >= 60) { mm1 = mm1 - 60; hh1 = hh1 + 1; }
      while (ss2 >= 60) { ss2 = ss2 - 60; mm2 = mm2 + 1; }
      while (mm2 >= 60) { mm2 = mm2 - 60; hh2 = hh2 + 1; }

      // find bigger time
      boolean scambio = false;
      //println((ss1 + mm1*1000 + hh1 *10000),(ss2 + mm2*1000 + hh2 *10000));
      if (ss1 + mm1*1000 + hh1 *10000 < ss2 + mm2*1000 + hh2 *10000)
      {
        long temp = hh1; hh1 = hh2; hh2 = temp;
        temp = mm1; mm1 = mm2; mm2 = temp;
        temp = ss1; ss1 = ss2; ss2 = temp;
        scambio = true;

      }
      //println("t1=",hh1,mm1,ss1);
      //println("t2=",hh2,mm2,ss2);
      // calcolo di t1 - t2
      if (ss2 <= ss1) {ss = ss1 - ss2; }
      else { ss = 60 + ss1 - ss2; mm2 = mm2 + 1; }
      if (mm2 <= mm1) { mm = mm1 - mm2; }
      else { mm = 60 + mm1 - mm2; hh2 = hh2 + 1; }
      hh = hh1 - hh2;
      //println(hh,mm,ss);
      hh$ = String.valueOf(hh);
      mm$ = String.valueOf(mm);
      //println(mm$);
      if (mm$.length() == 1) { mm$ = "0"+ mm$; }
      ss$ = String.valueOf(ss);
      if (ss$.length() == 1) { ss$ = "0"+ ss$; }
      String res$ = hh$ +mm$ +ss$;
      //println(res$);
      double res = Double.valueOf(res$);
      if (scambio) { res = -res; };
      //println(res);
      // The result of TIME('11:02:26') - '00:32:56' is 102930 (a duration of 10 hours, 29 minutes, and 30 seconds).
      digitNUM = res;
      outputSTR = String.valueOf(digitNUM);
      isResult = true;
      isBlocked = false;
    }
  }
  else { outputSTR = "Time subtraction: two numbers required."; }
}
