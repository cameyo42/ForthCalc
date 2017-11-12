void setGUI()
{
  // set GUI
  guiIMG = loadImage("guiIMAGES.png");
  // get buttons image
  //lcd_IMG = guiIMG.get(0, 137, 600, 376);
  lcd_IMG = loadImage("gui.png");
  short_IMG = loadImage("short.png");
  btnPLUS_IMG = guiIMG.get(0, 0, 37, 33);
  btnMINUS_IMG = guiIMG.get(37, 0, 37, 33);
  btnMULT_IMG = guiIMG.get(74, 0, 37, 33);
  btnDIV_IMG = guiIMG.get(111, 0, 37, 33);
  btn0_IMG = guiIMG.get(148, 0, 37, 33);
  btn1_IMG = guiIMG.get(185, 0, 37, 33);
  btn2_IMG = guiIMG.get(222, 0, 37, 33);
  btn3_IMG = guiIMG.get(259, 0, 37, 33);
  btn4_IMG = guiIMG.get(296, 0, 37, 33);
  btn5_IMG = guiIMG.get(333, 0, 37, 33);
  btn6_IMG = guiIMG.get(370, 0, 37, 33);
  btn7_IMG = guiIMG.get(407, 0, 37, 33);
  btn8_IMG = guiIMG.get(444, 0, 37, 33);
  btn9_IMG = guiIMG.get(481, 0, 37, 33);
  btnDOT_IMG = guiIMG.get(518, 0, 37, 33);
  btnCHS_IMG = guiIMG.get(555, 0, 37, 33);
  btnENTER_IMG = guiIMG.get(592, 0, 37, 113);
  degrees_IMG = guiIMG.get(630, 0, 47, 13);
  radians_IMG = guiIMG.get(677, 0, 47, 13);

  btnSQRT_IMG = guiIMG.get(0, 33, 37, 33);
  btnEULER_IMG = guiIMG.get(37, 33, 37, 33);
  btnPOWTEN_IMG = guiIMG.get(74, 33, 37, 33);
  btnPOW_IMG = guiIMG.get(111, 33, 37, 33);
  btnINVERSE_IMG = guiIMG.get(148, 33, 37, 33);
  btnSIN_IMG = guiIMG.get(185, 33, 37, 33);
  btnCOS_IMG = guiIMG.get(222, 33, 37, 33);
  btnTAN_IMG = guiIMG.get(259, 33, 37, 33);
  btnSINH_IMG = guiIMG.get(296, 33, 37, 33);
  btnCOSH_IMG = guiIMG.get(333, 33, 37, 33);
  btnTANH_IMG = guiIMG.get(370, 33, 37, 33);
  btnTODEG_IMG = guiIMG.get(407, 33, 37, 33);
  btnTORAD_IMG = guiIMG.get(444, 33, 37, 33);
  btnBACK_IMG = guiIMG.get(481, 33, 37, 33);
  btnDEL_IMG = guiIMG.get(518, 33, 37, 33);
  btnCLS_IMG = guiIMG.get(555, 33, 37, 33);

  btnX2_IMG = guiIMG.get(0, 66, 37, 33);
  btnLN_IMG = guiIMG.get(37, 66, 37, 33);
  btnLOG_IMG = guiIMG.get(74, 66, 37, 33);
  btnPERC_IMG = guiIMG.get(111, 66, 37, 33);
  btnDELTA_IMG = guiIMG.get(148, 66, 37, 33);
  btnASIN_IMG = guiIMG.get(185, 66, 37, 33);
  btnACOS_IMG = guiIMG.get(222, 66, 37, 33);
  btnATAN_IMG = guiIMG.get(259, 66, 37, 33);
  btnASINH_IMG = guiIMG.get(296, 66, 37, 33);
  btnACOSH_IMG = guiIMG.get(333, 66, 37, 33);
  btnATANH_IMG = guiIMG.get(370, 66, 37, 33);
  btnPI_IMG = guiIMG.get(407, 66, 37, 33);
  btnE_IMG = guiIMG.get(444, 66, 37, 33);
  btnPHI_IMG = guiIMG.get(481, 66, 37, 33);
  btnLASTX_IMG = guiIMG.get(518, 66, 37, 33);
  btnFIX_IMG = guiIMG.get(555, 66, 37, 33);
  //btnFIX_IMG = guiIMG.get(630, 13, 60, 28);

  btnINT_IMG = guiIMG.get(0, 99, 37, 33);
  btnFRAC_IMG = guiIMG.get(37, 99, 37, 33);
  btnFACT_IMG = guiIMG.get(74, 99, 37, 33);
  btnRND_IMG = guiIMG.get(111, 99, 37, 33);
  btnDMS_IMG = guiIMG.get(148, 99, 37, 33);
  btnDD_IMG = guiIMG.get(185, 99, 37, 33);
  btnROOTS_IMG = guiIMG.get(222, 99, 37, 33);
  //btnDEG_IMG = guiIMG.get(259, 99, 37, 33);
  //btnRAD_IMG = guiIMG.get(296, 99, 37, 33);
  btnQEQ_IMG = guiIMG.get(333, 99, 37, 33);
  btnGCD_IMG = guiIMG.get(370, 99, 37, 33);
  btnLCM_IMG = guiIMG.get(407, 99, 37, 33);
  btnFACTORIZE_IMG = guiIMG.get(444, 99, 37, 33);
  btnPROP_IMG = guiIMG.get(481, 99, 37, 33);
  btnRECT_IMG = guiIMG.get(518, 99, 37, 33);
  btnPOLAR_IMG = guiIMG.get(555, 99, 37, 33);

  //btnBINOMIAL_IMG = guiIMG.get(0, 612, 37, 33);
  btnPERM_IMG = guiIMG.get(37, 612, 37, 33);
  btnCOMB_IMG = guiIMG.get(74, 612, 37, 33);
  btnFIBO_IMG = guiIMG.get(111, 612, 37, 33);
  btnSTAT_IMG = guiIMG.get(148, 612, 37, 33);
  btnABS_IMG  = guiIMG.get(185, 612, 37, 33);
  btnFRACTADD_IMG = guiIMG.get(222, 612, 37, 33);
  btnFRACTSUB_IMG = guiIMG.get(259, 612, 37, 33);
  btnFRACTMUL_IMG = guiIMG.get(296, 612, 37, 33);
  btnFRACTDIV_IMG = guiIMG.get(333, 612, 37, 33);
  btnCRAMER_IMG   = guiIMG.get(370, 612, 37, 33);
  btnTRIANGLE_IMG = guiIMG.get(407, 612, 37, 33);
  btnHORNER_IMG   = guiIMG.get(444, 612, 37, 33);
  btnCEQ_IMG      = guiIMG.get(481, 612, 37, 33);
  btnCBRT_IMG     = guiIMG.get(518, 612, 37, 33);
  btnEEX_IMG      = guiIMG.get(555, 612, 37, 33);
  btnFRACTGEN_IMG = guiIMG.get(592, 612, 37, 33);
  btnROUND_IMG = guiIMG.get(629, 612, 37, 33);

  // columns buttons
  btnCXADD_IMG = guiIMG.get(0, 645, 37, 33);
  btnCXSUB_IMG = guiIMG.get(37, 645, 37, 33);
  btnCXMUL_IMG = guiIMG.get(74, 645, 37, 33);
  btnCXDIV_IMG = guiIMG.get(111, 645, 37, 33);
  btnCXINV_IMG = guiIMG.get(148, 645, 37, 33);
  btnCXPOW_IMG = guiIMG.get(185, 645, 37, 33);
  btnTADD_IMG = guiIMG.get(222, 645, 37, 33);
  btnTSUB_IMG = guiIMG.get(259, 645, 37, 33);
  btnASEQ_IMG = guiIMG.get(296, 645, 37, 33);
  btnGSEQ_IMG = guiIMG.get(333, 645, 37, 33);
  btnLR_IMG   = guiIMG.get(370, 645, 37, 33);
  btnSLOPE_IMG   = guiIMG.get(407, 645, 37, 33);

  btnSTOALL_IMG = guiIMG.get(0, 678, 37, 33);
  btnRCLALL_IMG = guiIMG.get(37, 678, 37, 33);
  btnVECADD_IMG = guiIMG.get(74, 678, 37, 33);
  btnVECSUB_IMG = guiIMG.get(111, 678, 37, 33);
  btnVECCRO_IMG = guiIMG.get(148, 678, 37, 33);
  btnVECDOT_IMG = guiIMG.get(185, 678, 37, 33);
  btnVECANG_IMG = guiIMG.get(222, 678, 37, 33);
  btnVECMAG_IMG = guiIMG.get(259, 678, 37, 33);
  btnX_Y_IMG    = guiIMG.get(296, 678, 37, 33);


  // Forth Image Buttons
  btnDUP_IMG = guiIMG.get(0, 513, 55, 33);
  btnDROP_IMG = guiIMG.get(55, 513, 55, 33);
  btnSWAP_IMG = guiIMG.get(110, 513, 55, 33);
  btnOVER_IMG = guiIMG.get(165, 513, 55, 33);
  btnROT_IMG = guiIMG.get(220, 513, 55, 33);
  btnNIP_IMG = guiIMG.get(275, 513, 55, 33);
  btnTUCK_IMG = guiIMG.get(330, 513, 55, 33);
  btn2DUP_IMG = guiIMG.get(385, 513, 55, 33);
  btn2DROP_IMG = guiIMG.get(440, 513, 55, 33);
  btn2SWAP_IMG = guiIMG.get(495, 513, 55, 33);
  btn2OVER_IMG = guiIMG.get(550, 513, 55, 33);
  btn2ROT_IMG = guiIMG.get(605, 513, 55, 33);
  btn2NIP_IMG = guiIMG.get(660, 513, 55, 33);
  btn2TUCK_IMG = guiIMG.get(715, 513, 55, 33);

  btnCOPYS_IMG = guiIMG.get(0, 579, 55, 33);
  btnPASTES_IMG = guiIMG.get(55, 579, 55, 33);
  //btnTWINS_IMG = guiIMG.get(110, 579, 55, 33);
  btnPICKS_IMG = guiIMG.get(165, 579, 55, 33);
  btnROLLS_IMG = guiIMG.get(220, 579, 55, 33);
  btnRUPS_IMG = guiIMG.get(275, 579, 55, 33);
  btnRDOWNS_IMG = guiIMG.get(330, 579, 55, 33);

  btnCLEAR_IMG = guiIMG.get(385, 546, 55, 33);

  btnSAVE_IMG = guiIMG.get(385, 579, 55, 33);
  btnLOAD_IMG = guiIMG.get(440, 579, 55, 33);
  btnFLIPS_IMG = guiIMG.get(495, 579, 55, 33);
  btnHELP_IMG = guiIMG.get(550, 579, 24, 33);

  // Memory Image Buttons
  btnSTO1_IMG = guiIMG.get(0, 546, 37, 33);
  btnSTO2_IMG = guiIMG.get(37, 546, 37, 33);
  btnSTO3_IMG = guiIMG.get(74, 546, 37, 33);
  btnSTO4_IMG = guiIMG.get(111, 546, 37, 33);
  btnSTO5_IMG = guiIMG.get(148, 546, 37, 33);
  btnRCL1_IMG = guiIMG.get(185, 546, 37, 33);
  btnRCL2_IMG = guiIMG.get(222, 546, 37, 33);
  btnRCL3_IMG = guiIMG.get(259, 546, 37, 33);
  btnRCL4_IMG = guiIMG.get(296, 546, 37, 33);
  btnRCL5_IMG = guiIMG.get(333, 546, 37, 33);

  saveButtons(); // for manual

  // Define buttons
  int baseX = 620;
  int baseY = 16;
  int stepX = 45;
  int stepY = 40;
  btn7     = new Button(baseX,         baseY, btn7_IMG, "", color(240), "fn7");
  btn8     = new Button(baseX+stepX,   baseY, btn8_IMG, "", color(240), "fn8");
  btn9     = new Button(baseX+stepX*2, baseY, btn9_IMG, "", color(240), "fn9");
  btnDIV   = new Button(baseX+stepX*3, baseY, btnDIV_IMG, "", color(240), "fnDIV");
  btnEEX   = new Button(baseX+stepX*4, baseY, btnEEX_IMG, "", color(240), "fnEEX");
  btnBACK  = new Button(baseX+stepX*5, baseY, btnBACK_IMG, "", color(240), "backspacePressed");

  btn4     = new Button(baseX,         baseY+stepY, btn4_IMG, "", color(240), "fn4");
  btn5     = new Button(baseX+stepX,   baseY+stepY, btn5_IMG, "", color(240), "fn5");
  btn6     = new Button(baseX+stepX*2, baseY+stepY, btn6_IMG, "", color(240), "fn6");
  btnMULT  = new Button(baseX+stepX*3, baseY+stepY, btnMULT_IMG, "", color(240), "fnMULT");
  btnENTER = new Button(baseX+stepX*4, baseY+stepY, btnENTER_IMG, "", color(240), "enterPressed");
  btnDEL   = new Button(baseX+stepX*5, baseY+stepY, btnDEL_IMG, "", color(240), "deletePressed");

  btn1     = new Button(baseX,         baseY+stepY*2, btn1_IMG, "", color(240), "fn1");
  btn2     = new Button(baseX+stepX,   baseY+stepY*2, btn2_IMG, "", color(240), "fn2");
  btn3     = new Button(baseX+stepX*2, baseY+stepY*2, btn3_IMG, "", color(240), "fn3");
  btnMINUS = new Button(baseX+stepX*3, baseY+stepY*2, btnMINUS_IMG, "", color(240), "fnMINUS");
  btnCLS   = new Button(baseX+stepX*5, baseY+stepY*2, btnCLS_IMG, "", color(240), "fnCLS");

  btn0     = new Button(baseX,         baseY+stepY*3, btn0_IMG, "", color(240), "fn0");
  btnDOT   = new Button(baseX+stepX,   baseY+stepY*3, btnDOT_IMG, "", color(240), "dotPressed");
  btnCHS   = new Button(baseX+stepX*2, baseY+stepY*3, btnCHS_IMG, "", color(240), "changeSignPressed");
  btnPLUS  = new Button(baseX+stepX*3, baseY+stepY*3, btnPLUS_IMG, "", color(240), "fnPLUS");
  btnLASTX = new Button(baseX+stepX*5, baseY+stepY*3, btnLASTX_IMG, "", color(240), "fnLASTX");

  baseX = 612;
  baseY = 180;
  stepX = 40;
  stepY = 36;
  btnX2      = new Button(baseX,         baseY, btnX2_IMG, "", color(240), "fnX2");
  btnEULER   = new Button(baseX+stepX,   baseY, btnEULER_IMG, "", color(240), "fnEULER");
  btnPOWTEN  = new Button(baseX+stepX*2, baseY, btnPOWTEN_IMG, "", color(240), "fnPOWTEN");
  btnPOW     = new Button(baseX+stepX*3, baseY, btnPOW_IMG, "", color(240), "fnPOW");
  btnINVERSE = new Button(baseX+stepX*4, baseY, btnINVERSE_IMG, "", color(240), "fnINVERSE");
  btnINT     = new Button(baseX+stepX*5, baseY, btnINT_IMG, "", color(240), "fnINT");
  btnABS     = new Button(baseX+stepX*6, baseY, btnABS_IMG, "", color(240), "fnABS");

  btnSQRT    = new Button(baseX,         baseY+stepY, btnSQRT_IMG, "", color(240), "fnSQRT");
  btnLN      = new Button(baseX+stepX,   baseY+stepY, btnLN_IMG, "", color(240), "fnLN");
  btnLOG     = new Button(baseX+stepX*2, baseY+stepY, btnLOG_IMG, "", color(240), "fnLOG");
  btnROOTS   = new Button(baseX+stepX*3, baseY+stepY, btnROOTS_IMG, "", color(240), "fnROOTS");
  btnCBRT    = new Button(baseX+stepX*4, baseY+stepY, btnCBRT_IMG, "", color(240), "fnCBRT");
  btnFRAC    = new Button(baseX+stepX*5, baseY+stepY, btnFRAC_IMG, "", color(240), "fnFRAC");
  btnROUND   = new Button(baseX+stepX*6, baseY+stepY, btnROUND_IMG, "", color(240), "fnROUND");

  baseX = baseX;
  baseY = baseY+stepY + 40;
  stepX = 40;
  stepY = 36;
  btnSIN  = new Button(baseX,         baseY, btnSIN_IMG, "", color(240), "fnSIN");
  btnCOS  = new Button(baseX+stepX,   baseY, btnCOS_IMG, "", color(240), "fnCOS");
  btnTAN  = new Button(baseX+stepX*2, baseY, btnTAN_IMG, "", color(240), "fnTAN");
  btnSINH = new Button(baseX+stepX*3, baseY, btnSINH_IMG, "", color(240), "fnSINH");
  btnCOSH = new Button(baseX+stepX*4, baseY, btnCOSH_IMG, "", color(240), "fnCOSH");
  btnTANH = new Button(baseX+stepX*5, baseY, btnTANH_IMG, "", color(240), "fnTANH");
  btnPI   = new Button(baseX+stepX*6, baseY, btnPI_IMG, "", color(240), "fnPI");

  btnASIN  = new Button(baseX,         baseY+stepY, btnASIN_IMG, "", color(240), "fnASIN");
  btnACOS  = new Button(baseX+stepX,   baseY+stepY, btnACOS_IMG, "", color(240), "fnACOS");
  btnATAN  = new Button(baseX+stepX*2, baseY+stepY, btnATAN_IMG, "", color(240), "fnATAN");
  btnASINH = new Button(baseX+stepX*3, baseY+stepY, btnASINH_IMG, "", color(240), "fnASINH");
  btnACOSH = new Button(baseX+stepX*4, baseY+stepY, btnACOSH_IMG, "", color(240), "fnACOSH");
  btnATANH = new Button(baseX+stepX*5, baseY+stepY, btnATANH_IMG, "", color(240), "fnATANH");
  btnE     = new Button(baseX+stepX*6, baseY+stepY, btnE_IMG, "", color(240), "fnE");

  btnTODEG = new Button(baseX,         baseY+stepY*2, btnTODEG_IMG, "", color(240), "fnTODEG");
  btnTORAD = new Button(baseX+stepX,   baseY+stepY*2, btnTORAD_IMG, "", color(240), "fnTORAD");
  btnRECT  = new Button(baseX+stepX*2, baseY+stepY*2, btnRECT_IMG, "", color(240), "fnRECT");
  btnPOLAR = new Button(baseX+stepX*3, baseY+stepY*2, btnPOLAR_IMG, "", color(240), "fnPOLAR");
  btnDMS   = new Button(baseX+stepX*4, baseY+stepY*2, btnDMS_IMG, "", color(240), "fnDMS");
  btnDD    = new Button(baseX+stepX*5, baseY+stepY*2, btnDD_IMG, "", color(240), "fnDD");
  btnPHI   = new Button(baseX+stepX*6, baseY+stepY*2, btnPHI_IMG, "", color(240), "fnPHI");

  baseX = baseX;
  baseY = baseY+stepY*2 + 40;
  stepX = 40;
  stepY = 36;
  btnGCD       = new Button(baseX,         baseY, btnGCD_IMG, "", color(240), "fnGCD");
  btnLCM       = new Button(baseX+stepX,   baseY, btnLCM_IMG, "", color(240), "fnLCM");
  btnFACTORIZE = new Button(baseX+stepX*2, baseY, btnFACTORIZE_IMG, "", color(240), "fnFACTORIZE");
  btnPROP      = new Button(baseX+stepX*3, baseY, btnPROP_IMG, "", color(240), "fnPROPORTION");
  btnQEQ       = new Button(baseX+stepX*4, baseY, btnQEQ_IMG, "", color(240), "fnQUADRATIC");
  btnCEQ       = new Button(baseX+stepX*5, baseY, btnCEQ_IMG, "", color(240), "fnCUBIC");
  btnHORNER    = new Button(baseX+stepX*6, baseY, btnHORNER_IMG, "", color(240), "fnHORNER");
  //btnDEG   = new Button(baseX+stepX*5, baseY, btnDEG_IMG, "", color(240), "fnINDEG");
  //btnRAD   = new Button(baseX+stepX*6, baseY, btnRAD_IMG, "", color(240), "fnINRAD");

  btnFRACTADD  = new Button(baseX,         baseY+stepY, btnFRACTADD_IMG, "", color(240), "fnFRACTadd");
  btnFRACTSUB  = new Button(baseX+stepX,   baseY+stepY, btnFRACTSUB_IMG, "", color(240), "fnFRACTsub");
  btnFRACTMUL  = new Button(baseX+stepX*2, baseY+stepY, btnFRACTMUL_IMG, "", color(240), "fnFRACTmul");
  btnFRACTDIV  = new Button(baseX+stepX*3, baseY+stepY, btnFRACTDIV_IMG, "", color(240), "fnFRACTdiv");
  btnFRACTGEN  = new Button(baseX+stepX*4, baseY+stepY, btnFRACTGEN_IMG, "", color(240), "fnFRACTgen");
  btnCRAMER    = new Button(baseX+stepX*5, baseY+stepY, btnCRAMER_IMG, "", color(240), "fnCRAMER");
  btnTRIANGLE  = new Button(baseX+stepX*6, baseY+stepY, btnTRIANGLE_IMG, "", color(240), "fnTRIANGLE");

  baseX = baseX;
  baseY = baseY+stepY + 40;
  stepX = 40;
  stepY = 36;
  btnFACT      = new Button(baseX,         baseY, btnFACT_IMG, "", color(240), "fnFACT");
  btnFIBO      = new Button(baseX+stepX,   baseY, btnFIBO_IMG, "", color(240), "fnFIBO");
  //btnBINOMIAL  = new Button(baseX+stepX,   baseY, btnBINOMIAL_IMG, "", color(240), "fnBINOMIAL");
  btnPERM      = new Button(baseX+stepX*2, baseY, btnPERM_IMG, "", color(240), "fnPERM");
  btnCOMB      = new Button(baseX+stepX*3, baseY, btnCOMB_IMG, "", color(240), "fnCOMB");
  btnSTAT      = new Button(baseX+stepX*4, baseY, btnSTAT_IMG, "", color(240), "fnSTAT");
  btnLR        = new Button(baseX+stepX*5, baseY,  btnLR_IMG, "", color(240), "fnLR");
  btnRND       = new Button(baseX+stepX*6, baseY, btnRND_IMG, "", color(240), "fnRND");

  // Column buttons
  baseX = 909;
  baseY = 16;
  stepX = 44;
  stepY = 36;
  btnX_Y    = new Button(baseX,        baseY,         btnX_Y_IMG, "", color(240), "fnX_Y");
  btnFIX    = new Button(baseX+stepX,  baseY,         btnFIX_IMG, "", color(240), "fnFIX");
  btnSTOALL = new Button(baseX,        baseY+stepY,    btnSTOALL_IMG, "", color(240), "fnSTOALL");
  btnRCLALL = new Button(baseX+stepX,  baseY+stepY,    btnRCLALL_IMG, "", color(240), "fnRCLALL");
  btnPERC   = new Button(baseX,        baseY+stepY*2,  btnPERC_IMG, "", color(240), "fnPERC");
  btnDELTA  = new Button(baseX+stepX,  baseY+stepY*2,  btnDELTA_IMG, "", color(240), "fnDELTA");
  btnCXADD  = new Button(baseX,        baseY+stepY*3,  btnCXADD_IMG, "", color(240), "fnCXADD");
  btnCXSUB  = new Button(baseX+stepX,  baseY+stepY*3,  btnCXSUB_IMG, "", color(240), "fnCXSUB");
  btnCXMUL  = new Button(baseX,        baseY+stepY*4,  btnCXMUL_IMG, "", color(240), "fnCXMUL");
  btnCXDIV  = new Button(baseX+stepX,  baseY+stepY*4,  btnCXDIV_IMG, "", color(240), "fnCXDIV");
  btnCXINV  = new Button(baseX,        baseY+stepY*5,  btnCXINV_IMG, "", color(240), "fnCXINV");
  btnCXPOW  = new Button(baseX+stepX,  baseY+stepY*5,  btnCXPOW_IMG, "", color(240), "fnCXPOW");
  btnVECADD = new Button(baseX,        baseY+stepY*6,  btnVECADD_IMG, "", color(240), "fnVECADD");
  btnVECSUB = new Button(baseX+stepX,  baseY+stepY*6,  btnVECSUB_IMG, "", color(240), "fnVECSUB");
  btnVECCRO = new Button(baseX,        baseY+stepY*7,  btnVECCRO_IMG, "", color(240), "fnVECCRO");
  btnVECDOT = new Button(baseX+stepX,  baseY+stepY*7,  btnVECDOT_IMG, "", color(240), "fnVECDOT");
  btnVECANG = new Button(baseX,        baseY+stepY*8,  btnVECANG_IMG, "", color(240), "fnVECANG");
  btnVECMAG = new Button(baseX+stepX,  baseY+stepY*8,  btnVECMAG_IMG, "", color(240), "fnVECMAG");
  btnTADD   = new Button(baseX,        baseY+stepY*9,  btnTADD_IMG, "", color(240), "fnTADD");
  btnTSUB   = new Button(baseX+stepX,  baseY+stepY*9,  btnTSUB_IMG, "", color(240), "fnTSUB");
  btnASEQ   = new Button(baseX,        baseY+stepY*10, btnASEQ_IMG, "", color(240), "fnASEQ");
  btnGSEQ   = new Button(baseX+stepX,  baseY+stepY*10, btnGSEQ_IMG, "", color(240), "fnGSEQ");
  btnSLOPE  = new Button(baseX,        baseY+stepY*11, btnSLOPE_IMG, "", color(240), "fnSLOPE");


  // Forth buttons
  baseX = 8;
  baseY = 384;
  stepX = 57;
  stepY = 37;
  btnDUP   = new Button(baseX,         baseY, btnDUP_IMG, "", color(240), "fnDUP");
  btnDROP  = new Button(baseX+stepX,   baseY, btnDROP_IMG, "", color(240), "fnDROP");
  btnSWAP  = new Button(baseX+stepX*2, baseY, btnSWAP_IMG, "", color(240), "fnSWAP");
  btnOVER  = new Button(baseX+stepX*3, baseY, btnOVER_IMG, "", color(240), "fnOVER");
  btnROT   = new Button(baseX+stepX*4, baseY, btnROT_IMG, "", color(240), "fnROT");
  btnNIP   = new Button(baseX+stepX*5, baseY, btnNIP_IMG, "", color(240), "fnNIP");
  btnTUCK  = new Button(baseX+stepX*6, baseY, btnTUCK_IMG, "", color(240), "fnTUCK");

  btn2DUP  = new Button(baseX,         baseY+stepY, btn2DUP_IMG, "", color(240), "fn2DUP");
  btn2DROP = new Button(baseX+stepX,   baseY+stepY, btn2DROP_IMG, "", color(240), "fn2DROP");
  btn2SWAP = new Button(baseX+stepX*2, baseY+stepY, btn2SWAP_IMG, "", color(240), "fn2SWAP");
  btn2OVER = new Button(baseX+stepX*3, baseY+stepY, btn2OVER_IMG, "", color(240), "fn2OVER");
  btn2ROT  = new Button(baseX+stepX*4, baseY+stepY, btn2ROT_IMG, "", color(240), "fn2ROT");
  btn2NIP  = new Button(baseX+stepX*5, baseY+stepY, btn2NIP_IMG, "", color(240), "fn2NIP");
  btn2TUCK = new Button(baseX+stepX*6, baseY+stepY, btn2TUCK_IMG, "", color(240), "fn2TUCK");

  btnCOPYS  = new Button(baseX,         baseY+stepY*2, btnCOPYS_IMG, "", color(240), "fnCOPYS");
  btnPASTES = new Button(baseX+stepX,   baseY+stepY*2, btnPASTES_IMG, "", color(240), "fnPASTES");
  btnPICKS  = new Button(baseX+stepX*2, baseY+stepY*2, btnPICKS_IMG, "", color(240), "fnPICKS");
  btnROLLS  = new Button(baseX+stepX*3, baseY+stepY*2, btnROLLS_IMG, "", color(240), "fnROLLS");
  btnFLIPS  = new Button(baseX+stepX*4, baseY+stepY*2, btnFLIPS_IMG, "", color(240), "fnFLIPS");
  btnRUPS   = new Button(baseX+stepX*5, baseY+stepY*2, btnRUPS_IMG, "", color(240), "fnRUPS");
  btnRDOWNS = new Button(baseX+stepX*6, baseY+stepY*2, btnRDOWNS_IMG, "", color(240), "fnRDOWNS");
  btnCLEAR  = new Button(baseX+stepX*7, baseY+stepY*2, btnCLEAR_IMG, "", color(240), "fnCLS");
  btnLOAD   = new Button(baseX+stepX*8, baseY+stepY*2, btnLOAD_IMG, "", color(240), "fnloadFILE");
  btnSAVE   = new Button(baseX+stepX*9, baseY+stepY*2, btnSAVE_IMG, "", color(240), "fnsaveFILE");
  btnHELP   = new Button(baseX+stepX*10, baseY+stepY*2, btnHELP_IMG, "", color(240), "fnHELP");

  //btnTWINS  = new Button(baseX+stepX*2, baseY+stepY*2, btnTWINS_IMG, "", color(240), "fnTWINS");
  // Memory buttons
  baseX = 409;
  baseY = 384;
  stepX = 39;
  stepY = 37;
  btnSTO1 = new Button(baseX,         baseY, btnSTO1_IMG, "", color(240), "fnSTO1");
  btnSTO2 = new Button(baseX+stepX,   baseY, btnSTO2_IMG, "", color(240), "fnSTO2");
  btnSTO3 = new Button(baseX+stepX*2, baseY, btnSTO3_IMG, "", color(240), "fnSTO3");
  btnSTO4 = new Button(baseX+stepX*3, baseY, btnSTO4_IMG, "", color(240), "fnSTO4");
  btnSTO5 = new Button(baseX+stepX*4, baseY, btnSTO5_IMG, "", color(240), "fnSTO5");
  btnRCL1 = new Button(baseX,         baseY+stepY, btnRCL1_IMG, "", color(240), "fnRCL1");
  btnRCL2 = new Button(baseX+stepX,   baseY+stepY, btnRCL2_IMG, "", color(240), "fnRCL2");
  btnRCL3 = new Button(baseX+stepX*2, baseY+stepY, btnRCL3_IMG, "", color(240), "fnRCL3");
  btnRCL4 = new Button(baseX+stepX*3, baseY+stepY, btnRCL4_IMG, "", color(240), "fnRCL4");
  btnRCL5 = new Button(baseX+stepX*4, baseY+stepY, btnRCL5_IMG, "", color(240), "fnRCL5");
}