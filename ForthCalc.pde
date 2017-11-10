// ForthCalc.pde
// A RPN calculator Forth oriented
// processing 3.x
// Copyright cameyo 2017
// MIT License

// * Fast Fibonacci code
// * Copyright (c) 2017 Project Nayuki
// * All rights reserved. Contact Nayuki for licensing.
// * https://www.nayuki.io/page/fast-fibonacci-algorithms

import java.text.*; // using DecimalFormat
import java.math.*;
import java.util.*; // sort array
import processing.sound.*; // keyboard click

SoundFile click;
DecimalFormat df;
// font
PFont font;
PFont digitFont;
PFont outputFont;
// font color
color digitCol = color(10,10,10);
//color digitCol = color(0);
color digitOutputCol = color(60,60,60);
color outputCol = color(50,10,10);

// global constant variables
double _PI    = Math.PI;
//double _PI  = 3.141592653589793;
double _E     = Math.E;
//double _E   = 2.718281828459045;
double _PHI   =   (1 + Math.sqrt(5))/2;
//double _PHI = 1.618033988749895;
// Number limits for formatting purpose
//double maxNum = 1e9;
//double minNum = -1e9;
//double maxEps = 1e-9;
//double minEps = -1e-9;
double maxNum = 1e12;
double minNum = -1e12;
double maxEps = 1e-12;
double minEps = -1e-12;
// Fraction objects
frazione f1, f2;
// background color
color backCol = color(54,54,54);
// global variables
boolean start;
boolean sound;
// stack of double (RPN)
StackDouble pila = new StackDouble();
int maxSlot = 4096;
// vector clipboard for stack (change with a link list)
double[] clipboard = new double[maxSlot];
int clipboardItems;
// shortcut help
boolean viewShortcuts;
// Input/Output Number (Top of stack)
int maxCharLCD = 24;
String digitSTR;
int maxDigits;
String digitRESET;
double digitNUM;
double lastX;
boolean isResult;
boolean isBlocked;
// Error Message
String outputSTR;
// floating point digits
int numFloating;
// trig in degrees
boolean inDegrees;
// Memory 1..5
double mem1, mem2, mem3, mem4, mem5;

// GUI
int baseX, baseY;
int stepH, stepV;
int baseDigitX, baseDigitY, stepDigitY;

PImage guiIMG, lcd_IMG, short_IMG;
PImage degrees_IMG, radians_IMG;

Button btnENTER, btnDEL, btnBACK, btnCLS;
PImage btnENTER_IMG, btnDEL_IMG, btnBACK_IMG, btnCLS_IMG;
Button btnFIX, btnLASTX, btnX_Y;
PImage btnFIX_IMG, btnLASTX_IMG, btnX_Y_IMG;

Button btnPLUS; PImage btnPLUS_IMG;
Button btnMINUS; PImage btnMINUS_IMG;
Button btnMULT; PImage btnMULT_IMG;
Button btnDIV; PImage btnDIV_IMG;

Button btn0, btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9;
PImage btn0_IMG, btn1_IMG, btn2_IMG, btn3_IMG, btn4_IMG, btn5_IMG, btn6_IMG, btn7_IMG, btn8_IMG, btn9_IMG;
Button btnDOT, btnCHS;
PImage btnDOT_IMG, btnCHS_IMG;

Button btnSQRT, btnEULER, btnPOWTEN, btnPOW, btnROOTS, btnINVERSE, btnABS;
PImage btnSQRT_IMG, btnEULER_IMG, btnPOWTEN_IMG, btnPOW_IMG, btnROOTS_IMG, btnINVERSE_IMG, btnABS_IMG;
Button btnX2, btnLN, btnLOG, btnPERC, btnDELTA;
PImage btnX2_IMG, btnLN_IMG, btnLOG_IMG, btnPERC_IMG, btnDELTA_IMG;

Button btnSIN, btnCOS, btnTAN, btnASIN, btnACOS, btnATAN;
PImage btnSIN_IMG, btnCOS_IMG, btnTAN_IMG, btnASIN_IMG, btnACOS_IMG, btnATAN_IMG;

Button btnSINH, btnCOSH, btnTANH, btnASINH, btnACOSH, btnATANH;
PImage btnSINH_IMG, btnCOSH_IMG, btnTANH_IMG, btnASINH_IMG, btnACOSH_IMG, btnATANH_IMG;

Button btnTODEG, btnTORAD; PImage btnTODEG_IMG, btnTORAD_IMG;
Button btnPI, btnE, btnPHI; PImage btnPI_IMG, btnE_IMG, btnPHI_IMG;

Button btnINT, btnFRAC;
PImage btnINT_IMG, btnFRAC_IMG;

Button btnFACT, btnRND;
PImage btnFACT_IMG, btnRND_IMG;

Button btnDMS, btnDD;
PImage btnDMS_IMG, btnDD_IMG;

Button btnDEG, btnRAD;
PImage btnDEG_IMG, btnRAD_IMG;

Button btnQEQ, btnGCD, btnLCM, btnFACTORIZE, btnPROP;
PImage btnQEQ_IMG, btnGCD_IMG, btnLCM_IMG, btnFACTORIZE_IMG, btnPROP_IMG;

Button btnRECT, btnPOLAR;
PImage btnRECT_IMG, btnPOLAR_IMG;

Button btnBINOMIAL, btnPERM, btnCOMB, btnFIBO, btnSTAT;
PImage btnBINOMIAL_IMG, btnPERM_IMG, btnCOMB_IMG, btnFIBO_IMG, btnSTAT_IMG;

Button btnFRACTADD, btnFRACTSUB, btnFRACTMUL, btnFRACTDIV, btnFRACTGEN;
PImage btnFRACTADD_IMG, btnFRACTSUB_IMG, btnFRACTMUL_IMG, btnFRACTDIV_IMG, btnFRACTGEN_IMG;

Button btnCRAMER, btnTRIANGLE;
PImage btnCRAMER_IMG, btnTRIANGLE_IMG;

Button btnHORNER, btnCEQ;
PImage btnHORNER_IMG, btnCEQ_IMG;

Button btnEEX, btnCBRT, btnROUND;
PImage btnEEX_IMG, btnCBRT_IMG, btnROUND_IMG;

Button btnCXADD, btnCXSUB, btnCXMUL, btnCXDIV, btnCXINV, btnCXPOW;
PImage btnCXADD_IMG, btnCXSUB_IMG, btnCXMUL_IMG, btnCXDIV_IMG, btnCXINV_IMG, btnCXPOW_IMG;

Button btnTADD, btnTSUB;
PImage btnTADD_IMG, btnTSUB_IMG;

Button btnASEQ, btnGSEQ;
PImage btnASEQ_IMG, btnGSEQ_IMG;

Button btnLR;
PImage btnLR_IMG;

// Forth Buttons
Button btnDUP, btnDROP, btnSWAP, btnOVER, btnROT, btnNIP, btnTUCK;
PImage btnDUP_IMG, btnDROP_IMG, btnSWAP_IMG, btnOVER_IMG, btnROT_IMG, btnNIP_IMG, btnTUCK_IMG;
Button btn2DUP, btn2DROP, btn2SWAP, btn2OVER, btn2ROT, btn2NIP, btn2TUCK;
PImage btn2DUP_IMG, btn2DROP_IMG, btn2SWAP_IMG, btn2OVER_IMG, btn2ROT_IMG, btn2NIP_IMG, btn2TUCK_IMG;
// Stack buttons
Button btnCOPYS, btnPASTES, btnTWINS, btnPICKS, btnROLLS, btnRUPS, btnRDOWNS, btnFLIPS;
PImage btnCOPYS_IMG, btnPASTES_IMG, btnTWINS_IMG, btnPICKS_IMG, btnROLLS_IMG, btnRUPS_IMG, btnRDOWNS_IMG, btnFLIPS_IMG ;
Button btnCLEAR, btnSAVE, btnLOAD, btnHELP;
PImage btnCLEAR_IMG, btnSAVE_IMG, btnLOAD_IMG, btnHELP_IMG;

// Store & Recall buttons
Button btnSTO1, btnSTO2, btnSTO3, btnSTO4, btnSTO5;
PImage btnSTO1_IMG, btnSTO2_IMG, btnSTO3_IMG, btnSTO4_IMG, btnSTO5_IMG;
Button btnRCL1, btnRCL2, btnRCL3, btnRCL4, btnRCL5;
PImage btnRCL1_IMG, btnRCL2_IMG, btnRCL3_IMG, btnRCL4_IMG, btnRCL5_IMG;

//*********************************
void setup()
{
  size(1000, 500);
  //size(1024, 720);
  //size(1280, 720);
  smooth();
  frameRate(25);
  String OS = platformNames[platform];
  if (platformNames[platform].equals("windows"))
  {
    PImage icon = loadImage("icon.png"); // set icon
    surface.setIcon(icon);
  }
  background(backCol);
  sound = false;
  // load click sound from the /data folder
  click = new SoundFile(this, "click.wav");
  // load fonts
  font = createFont("Consolas Bold", 12);
  digitFont = createFont("wwwDigital.ttf", 30); // with Infinity and NaN
  // Michelle Laura - developer@webworks-usa.com - http://www.webworks-usa.com
  outputFont = createFont("Courier New Bold", 14);
  textFont(digitFont);
  // set global variables
  viewShortcuts = false;
  numFloating = -1;
  digitRESET = "0." + nf(0, numFloating);
  digitSTR = digitRESET;
  maxDigits = maxCharLCD - 2;
  inDegrees = true;
  digitNUM = 0.0;
  lastX = digitNUM;
  isResult = true;
  isBlocked = true;
  baseDigitX = 514;
  baseDigitY = 66;
  stepDigitY = 33;
  outputSTR = String.valueOf(digitNUM);
  // set GUI interface
  setGUI();
  showInfo();
  init();
}
//*********************************
void init()
{
  start = true;
}
//*********************************
void draw()
{
  //println("Redraw: ",frameCount);
  if (start)
  {
    background(backCol);
    drawLCD();
    showGUI();
    if (viewShortcuts) { image(short_IMG, 0, 0); }
    //start=false;
  }
  noLoop();
}

//*********************************
void mousePressed()
{
  loop();
  start = true;
  int mx = mouseX;
  int my = mouseY;
  //println(mx,my);

  // check click on Degrees <--> Radians text
  //degrees_IMG = guiIMG.get(630, 0, 47, 13);
  //radians_IMG = guiIMG.get(677, 0, 47, 13);
  //image(degrees_IMG, 548, 301); }
  if (mouseX > 548 && mouseX < (548+47) && mouseY > 301 && mouseY < (301+13))
  {
    fnChangeTrigUnit();
  }

  // check buttons click
  btn7.onClick();
  btn8.onClick();
  btn9.onClick();
  btnDIV.onClick();
  btnCLS.onClick();
  btnEEX.onClick();
  btnFIX.onClick();

  btn4.onClick();
  btn5.onClick();
  btn6.onClick();
  btnMULT.onClick();
  btnENTER.onClick();
  btnDEL.onClick();

  btn1.onClick();
  btn2.onClick();
  btn3.onClick();
  btnMINUS.onClick();
  btnBACK.onClick();

  btn0.onClick();
  btnDOT.onClick();
  btnCHS.onClick();
  btnPLUS.onClick();
  btnLASTX.onClick();

  btnX2.onClick();
  btnEULER.onClick();
  btnPOWTEN.onClick();
  btnPOW.onClick();
  btnINVERSE.onClick();
  btnINT.onClick();
  btnABS.onClick();

  btnSQRT.onClick();
  btnLN.onClick();
  btnLOG.onClick();
  btnROOTS.onClick();
  btnCBRT.onClick();
  btnFRAC.onClick();
  btnROUND.onClick();

  btnSIN.onClick();
  btnCOS.onClick();
  btnTAN.onClick();
  btnSINH.onClick();
  btnCOSH.onClick();
  btnTANH.onClick();
  btnPI.onClick();

  btnASIN.onClick();
  btnACOS.onClick();
  btnATAN.onClick();
  btnASINH.onClick();
  btnACOSH.onClick();
  btnATANH.onClick();
  btnE.onClick();

  btnTODEG.onClick();
  btnTORAD.onClick();
  btnRECT.onClick();
  btnPOLAR.onClick();
  btnDMS.onClick();
  btnDD.onClick();
  btnPHI.onClick();

  btnGCD.onClick();
  btnLCM.onClick();
  btnFACTORIZE.onClick();
  btnPROP.onClick();
  btnCEQ.onClick();
  btnQEQ.onClick();
  btnHORNER.onClick();

  //btnDEG.onClick();
  //btnRAD.onClick();

  btnFRACTADD.onClick();
  btnFRACTSUB.onClick();
  btnFRACTMUL.onClick();
  btnFRACTDIV.onClick();
  btnFRACTGEN.onClick();
  btnCRAMER.onClick();
  btnTRIANGLE.onClick();

  btnFACT.onClick();
  btnFIBO.onClick();
  //btnBINOMIAL.onClick();
  btnPERM.onClick();
  btnCOMB.onClick();
  btnSTAT.onClick();
  btnRND.onClick();

  // column buttons
  btnPERC.onClick();
  btnDELTA.onClick();
  btnCXADD.onClick();
  btnCXSUB.onClick();
  btnCXMUL.onClick();
  btnCXDIV.onClick();
  btnCXINV.onClick();
  btnCXPOW.onClick();
  btnTADD.onClick();
  btnTSUB.onClick();
  btnASEQ.onClick();
  btnGSEQ.onClick();
  btnLR.onClick();
  
  // Forth
  btnDUP.onClick();
  btnDROP.onClick();
  btnSWAP.onClick();
  btnOVER.onClick();
  btnROT.onClick();
  btnNIP.onClick();
  btnTUCK.onClick();
  btn2DUP.onClick();
  btn2DROP.onClick();
  btn2SWAP.onClick();
  btn2OVER.onClick();
  btn2ROT.onClick();
  btn2NIP.onClick();
  btn2TUCK.onClick();
  btnCOPYS.onClick();
  btnPASTES.onClick();
  //btnTWINS.onClick();
  btnPICKS.onClick();
  btnROLLS.onClick();
  btnFLIPS.onClick();
  btnRUPS.onClick();
  btnRDOWNS.onClick();
  btnCLEAR.onClick();
  btnLOAD.onClick();
  btnSAVE.onClick();
  btnHELP.onClick();

  // Memory
  btnSTO1.onClick();
  btnSTO2.onClick();
  btnSTO3.onClick();
  btnSTO4.onClick();
  btnSTO5.onClick();
  btnRCL1.onClick();
  btnRCL2.onClick();
  btnRCL3.onClick();
  btnRCL4.onClick();
  btnRCL5.onClick();

  }

//void mouseMoved()
//{
//  int mx = mouseX;
//  int my = mouseY;
//  //println(mx,my);
//}

//*********************************
// set window title
void showInfo()
{
  String info;
  info = "Forth Calculator";
  //info = info + " (" + nf(int(frameRate),0) + ")";
  surface.setTitle(info);
}

//*********************************
void saveImage()
{
  String filename = newFilename(1);
  save(filename+".png");
}

//*********************************
String newFilename(int c)
{
  int y, m, d;
  int hh, mm, ss;
  String name="", out;
  y = year();
  m = month();
  d = day();
  hh = hour();
  mm = minute();
  ss = second();
  if (c == 1) { name = getClass().getSimpleName(); }
  if (c == 2) { name = "stack"; }
  out = name+"_"+y+"-"+nf(m, 2)+"-"+nf(d, 2)+"_"+nf(hh, 2)+"."+nf(mm, 2)+"."+nf(ss, 2);
  return out;
}

void fnloadFILE()
{
  String file = dataPath("stack.lst");
  if (fileExists(file))
  {
    pila.clearStack();
    String lista[] = loadStrings(file);
    //int items = lista.length - 1;
    int items = lista.length;
    for (int i=items-1; i >= 0; i--)
    {
      if (!lista[i].equals("") && !lista[i].equals(null))
      {
        double val = Double.valueOf(lista[i]);
        pila.push(val);
      }
    }
    digitNUM = pila.pop();
    outputSTR = String.valueOf(digitNUM);
    isResult = true;
    isBlocked = false;

    // Update window (read is another thread)
    //background(backCol);
    //drawLCD();
    //showGUI();
    //if (viewShortcuts) { image(short_IMG, 0, 0); }
    loop();
  }
  else
  {
    outputSTR = "File 'stack.lst' is missing.";
  }
}

boolean fileExists(String path)
{
  File file=new File(path);
  boolean exists = file.exists();
  if (exists) { return true; }
  else { return false; }
}

void fnsaveFILE()
{
  String lista="", numero="";
  numero = String.valueOf(digitNUM);
  lista = numero + "|";
  int items = pila.stackSize();
  if (items > maxSlot) { items = maxSlot; }
  for (int i=0; i < items-1; i++)
  {
    numero = String.valueOf(pila.getItem(i)) + "|";
    lista = lista + numero;
  }
  numero = String.valueOf(pila.getItem(items-1));
  lista = lista + numero;
  String[] outLST = split(lista, "|");
  String filename = newFilename(2) + ".lst";
  saveStrings(dataPath(filename), outLST);
  filename = "stack.lst";
  saveStrings(dataPath(filename), outLST);
}

void fnHELP()
{
  cursor(WAIT);
  if (fileExists(dataPath("ForthCalculator.pdf")))
  {
    launch(dataPath("ForthCalculator.pdf"));
  }
  else { outputSTR = "File 'ForthCalculator.pdf' is missing."; }
  cursor(ARROW);
}