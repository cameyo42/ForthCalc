//*********************************
void keyPressed()
{
  loop();
  start = true;
  // discover keys....
  // println((int)key, hex(key), keyCode);
  
  // play sound
  if (sound) { click.play(); }

  if (key == ']') // test
  {
    //fnTRIANGLE();
    //fnCXPOW();
    fnTADD();
  }
  
  if (key == '[') // test
  {
    //fnTRIANGLE();
    //fnCXINV();
    fnCXMUL();
  }
  if (key == ';') // test
  {
    //fnTRIANGLE();
    fnCXDIV();
    //fnCXMUL();
  }
  
  // Sound keys (on/off)
  if (key == '=') { sound = !sound; }  
  
  // Create number with exponent
  if (key == 'l' || key == 'L') { fnEEX(); }  
  
  // open PDF manual (HELP)
  if (key == '?') { fnHELP(); }
  
  // clear stack
  if (key == ESC) { key = 0; fnCLS(); }

  // input a digit "0..9"
  if ((key >= '0') && (key <= '9')) { numberPressed(); }

  // change sign
  if (key == '_' || key == '\\') { changeSignPressed(); }

  // insert floating point "."
  if (key == '.' || key == ',') { dotPressed(); }

  // insert BACKSPACE --> delete a input digit
  if (key == BACKSPACE) { backspacePressed(); }

  // insert DELETE or ESC--> clear input number
  if (key == DELETE) { deletePressed(); }

  // insert RETURN | ENTER --> Push number on stack
  if ((key == RETURN) || (key == ENTER) || (key == ' ')) { enterPressed(); }

  // Press "+" --> sum top two number of the stack
  if (key == '+') { fnPLUS(); }
  // Press "-" --> subtract top two number of the stack
  if (key == '-') { fnMINUS(); }
  // Press "*" --> multiply top two number of the stack
  if (key == '*') { fnMULT(); }
  // Press "-" --> divide top two number of the stack
  if (key == '/') { fnDIV(); }

  // Common maths (two rows)
  // first row
  if (key == 'q' || key == 'Q')  { fnX2(); }
  if (key == 'w' || key == 'W')  { fnEULER(); }
  if (key == 'e' || key == 'E')  { fnPOWTEN(); }
  if (key == 'r' || key == 'R')  { fnPOW(); }
  if (key == 't' || key == 'T')  { fnINVERSE(); }
  if (key == 'y' || key == 'Y')  { fnPERC(); }
  if (key == 'u' || key == 'U')  { fnINT(); }
  // second row
  if (key == 'a' || key == 'A')  { fnSQRT(); }
  if (key == 's' || key == 'S')  { fnLN(); }
  if (key == 'd' || key == 'D')  { fnLOG(); }
  if (key == 'f' || key == 'F')  { fnROOTS(); }
  if (key == 'g' || key == 'G')  { fnABS(); }
  if (key == 'h' || key == 'H')  { fnDELTA(); }
  if (key == 'j' || key == 'J')  { fnFRAC(); }

  // recover last X
  if (key == 'x' || key == 'X')  { fnLASTX(); }
  
  // math constant
  if (key == 'i' || key == 'I')  { fnPHI(); }
  if (key == 'o' || key == 'O')  { fnE(); }
  if (key == 'p' || key == 'P')  { fnPI(); }

  // Forth button
  if (keyCode==112) { fnDUP(); }  // F1
  if (keyCode==113) { fnDROP(); } // F2
  if (keyCode==114) { fnSWAP(); } // F3
  if (keyCode==115) { fnOVER(); } // F4
  if (keyCode==116) { fnROT(); }  // F5
  if (keyCode==117) { fnNIP(); }  // F6
  if (keyCode==118) { fnTUCK(); } // F7
  
  // paste stack  (Ctrl+v)
  if (key == 0x16) { fnPASTES(); }
  // copy stack (Ctrl+c)
  if (key == 0x03) { fnCOPYS(); }
  
  if (keyCode==119) { fnChangeTrigUnit(); } // F8 (Degrees <-> Radians)
  
  if (keyCode==120) { fnPICKS(); } // F9
  if (keyCode==121) { fnROLLS(); } // F10
  if (keyCode==122) { fnFLIPS(); } // F11
  if (keyCode == UP)   { fnRUPS(); }   // roll up the stack (+1)
  if (keyCode == DOWN) { fnRDOWNS(); } // roll down the stack (-1)
  if (keyCode==123) { fnCLS(); } // F12  clear stack
  
  // load stack from file  (n)
  if (key == 'n' || key == 'N') { fnloadFILE(); }
  // save stack on file (m)
  if (key == 'm' || key == 'M') { fnsaveFILE(); }

  // Change number of floating digits (+/-)
  if (keyCode == LEFT) // more digits
  {
    numFloating = numFloating + 1;
    if (numFloating > 9 ) { numFloating = -1; }
    digitRESET = "0." + nf(0, numFloating);
  }
  
  if (keyCode == RIGHT) // less digits
  {
    numFloating = numFloating - 1;
    if (numFloating < -1 ) { numFloating = 9; }
    digitRESET = "0." + nf(0, numFloating);
  }

  // show/hide shortcuts
  if (key==TAB) { viewShortcuts = !viewShortcuts; }

  // save image
  if (key=='z'||key=='Z') { saveImage(); }

  // print stack (console)
  if (key == '`') { println(digitNUM); pila.printStack(); }  
}
