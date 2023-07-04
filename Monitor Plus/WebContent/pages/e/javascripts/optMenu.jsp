<%@ page contentType="application/x-javascript" %>

// Help Menu Global variable for english

var accountHelp=1;
var ledgerHelp=2;
var branchHelp=3;
var custdescidHelp=4;
var currencyHelp=5;
var conceptHelp=6;
var cnofHelp=7;
var costcenterHelp=8;
var accholdersHelp=9;
var codeDescCNOFC=10;
var causeHelp=11;
var conceptTransacHelp=12;
var staticFactHelp=13;
var staticFrecHelp=14;
var openingWireHelp=15;
var paymentWireHelp=16;
var documentsFeeCharges = 17;
var documentsFrecCharges = 18;
var documentsCurrency = 19;
var documentsPriority = 20;
var lnreferHelp=21;
var subaccountHelp=22;
var accholdersLoanHelp=23;
var subaccountCustomerHelp=24;
var accountCustomerHelp=25;
var documentsFrecuencyHelp=26;
var documentsTypeHelp=27;
var staticCstFactHelp=29;
var staticCstFrecHelp=30;


//var fieldAux1;
//var fieldAux2;
var fieldBank;
var fieldCCY;
var fieldOPCode;
var optHelp;
var menuactive = false;
var animactive = false;
var ontime = "";
var outtime = "";
var outtime2 = "";
var curlen = 0;
var popupStatus = "open"


//Help menu definitions
function getPdfForms(url) {
	CenterNamedWindow(
		url,
		'pdf',
		800,
		600,
		2);
}

function checkCombo(x,y,w,h){
 var coll = document.all.tags("select");
 var x1 = 0;
 var y1 = 0;
 var w1 = 0;
 var h1 = 0;
 var t1;
 var t2;
 var t3;
 var t4;
 var obj;
 if (coll!=null)
 {
    for (var i=0; i<coll.length; i++){
      obj = coll[i].offsetParent;
      x1 = obj.offsetLeft;
      y1 = obj.offsetTop; 
      while (obj !== document.body){
	obj = obj.offsetParent;
	x1 += obj.offsetLeft;
	y1 += obj.offsetTop;
	}
      x1 += coll[i].offsetLeft;
      y1 += coll[i].offsetTop;
	
      w1 = coll[i].offsetWidth;
      h1 = coll[i].offsetHeight; 
      t1 = x1 + w1;
      t2 = x + w;
      t3 = y1 + h1;
      t4 = y + h;
      //alert(coll[i].name + ' x1 = '+ x1 + ', y1 = '+ y1 + ', w1 = '+ w1 + ', h1 = '+ h1);
      if (((t1 > x) && (x1 < t2)) && ((t3 > y) && (y1 < t4))) {
        eval('document.forms[0].'+coll[i].name+'.style.visibility="hidden"');
          } 
      else {  
        eval('document.forms[0].'+coll[i].name+'.style.visibility="visible"');
	}
    }
 }

}

function getHelp() {
 
 switch (optHelp) {
   case 1 : 
      GetAccount(fieldName,fieldBank,fieldOPCode,'');
      break;
   case 2 : 
      GetLedger(fieldName,fieldBank,fieldCCY,'');
      break;
   case 3 : 
      GetBranch(fieldName,fieldBank);
      break;
   case 4 : 
      GetCustomerDescId(fieldName,fieldAux1,fieldAux2);
      break;
   case 5 : 
      GetCurrency(fieldName,fieldBank);
      break;
   case 6 : 
	  GetConcept(fieldName,fieldBank,fieldOPCode,fieldAux1,fieldAux2,fieldCCY);
      break;
   case 7 :
      GetCodeCNOFC(fieldName,fieldOPCode);
      break;
   case 8 : 
      GetCostCenter(fieldName,fieldBank);
      break;
   case 9 : 
      GetAccountHolders(fieldName);
      break;
   case 10 :
      GetCodeDescCNOFC(fieldName, fieldAux1, fieldOPCode);
      break;
   case 11 :
      GetCasualTable(fieldName);
      break;
   case 12 : 
      //GetConceptTransac(fieldCode1,fieldBank,fieldOPCode,fieldCode2,fieldCode3,fieldCode4,fieldCode5,fieldCode6);
      GetConceptTr(fieldName,fieldBank,fieldOPCode,fieldAux1,fieldAux2);
      break;
    case 13 :
      GetCode(fieldName,'STATIC_inv_factor.jsp');
      break;
    case 14 :
      GetCode(fieldName,'STATIC_inv_frecuency.jsp');
      break; 
    case 15 :
      if (fieldAux2 == "03") { 
      		GetWireOpening(fieldName,fieldAux1);
      } else {
      		GetAccount(fieldName,fieldBank,fieldOPCode,'');
      }
      break;
    case 16 : 
      if (fieldAux2 == "03") { 
      		GetWirePayment(fieldName,fieldAux1);
      } else {
      		GetAccount(fieldName,fieldBank,fieldOPCode,'');
      }
      break;
   case 17 :
      GetCode(fieldName,'STATIC_ln_tables_fee_charges.jsp');
      break;
   case 18 :
      GetFrecCode(fieldName,'STATIC_ln_tables_frec_charges.jsp');
      break;
   case 19 :
      GetCode(fieldName,'STATIC_ln_tables_currency.jsp');
      break;
   case 20 :
      GetCode(fieldName,'STATIC_ln_tables_priority.jsp');
      break;
   case 21 : 
      GetLNReference(fieldName,fieldBank,fieldOPCode,'',fieldAux1);
      break;
   case 22 :
   	  GetSubAcc(fieldName,fieldAux1);
   	  break;
   case 23 : 
      GetAccountHoldersLoans(fieldName);
      break;   	
   case 24 :
   	  GetSubAccCustomer(fieldName,fieldAux1,fieldAux2);
   	  break; 
   case 25 : 
      GetAccountCustomer(fieldName,fieldBank,fieldOPCode,'', fieldAux1);
      break;   
   case 26 : 
      GetCode(fieldName,'STATIC_document_freq.jsp');
      break;   	         
   case 27 : 
      GetCode(fieldName,'STATIC_document_type.jsp');
      break;   	         
    case 29 :
      GetCode(fieldName,'STATIC_invcst_factor.jsp');
      break;
    case 30 :
      GetCode(fieldName,'STATIC_invcst_frecuency.jsp');
      break; 
      
      	         
 }
}

function MoveMenu(){
 var obj = document.body;
 var y = obj.scrollTop + 2;
 var x = obj.clientWidth - MenuImg.clientWidth - 2 + obj.scrollLeft;
 var x2 = 0;

 if (!menuactive){
   eval('MenuImg.style.pixelTop=' + y);
   eval('Menu.style.pixelTop=' + y);
   eval('MenuImg.style.pixelLeft=' + x);
   checkCombo(x,y,MenuImg.clientWidth,MenuImg.clientHeight);
  }
 else {
   startMove();
   }
   
}

function startMove(){
  
    var obj = document.body;
 	var y = obj.scrollTop + 2;
 	var x = MenuImg.offsetLeft;
 	var x2 = x + MenuImg.clientWidth + 2;
    var y2 = 2 + Menu.clientWidth;
    
    if (menuactive) { 
      x = x + y2  
      Menu.style.visibility="hidden";
      eval("MenuImg.style.pixelLeft="+ x );
      menuactive = false;
      checkCombo(x,y,MenuImg.clientWidth,MenuImg.clientHeight);
      
    }
    else {            
      x = x - y2;
      x2= x2 - y2;
      eval("MenuImg.style.pixelLeft="+ x);
      eval("Menu.style.pixelLeft="+ x2);
      Menu.style.visibility="visible";      
      menuactive = true;
      
      x = obj.clientWidth - MenuImg.clientWidth - 2 + obj.scrollLeft;
      x2 = 0;
      x -= Menu.clientWidth + 2;
   	  x2 += x + MenuImg.clientWidth + 2;
      eval('MenuImg.style.pixelLeft=' + x);
      eval('Menu.style.pixelLeft=' + x2);
      checkCombo(x,y,MenuImg.clientWidth + Menu.clientWidth + 2,Menu.clientHeight);
    }
}


function switchMenu() {
  if (popupStatus=="open"){
    popupStatus="close";
    hPopup.setCapture();
   }   
   el=event.srcElement;
   if (el.className=="menuItem") {
      el.className="highlightItem";
   } else if (el.className=="highlightItem") {
      el.className="menuItem";
   }
}

function doCut() {
 var el = document.forms[0][fieldName];
 if (doCopy()) { el.value = "";}
}

function doCopy() {
 var el = document.forms[0][fieldName];
 var bResult = window.clipboardData.setData("Text",el.value);
 return bResult;
}

function doPaste() {
 var el = document.forms[0][fieldName];
 el.value = window.clipboardData.getData("Text");
}

function doDelete() {
 var el = document.forms[0][fieldName];
 el.value = "";
}

function hideMenu() {
 hPopup.style.display="none";
}

function clickMenu() {
   hPopup.style.display="none";
   hPopup.releaseCapture();
   el=event.srcElement;
   document.forms[0][fieldName].style.cursor="auto";
   if (el.id=="mnuHelp") {
       getHelp();
   } else if (el.id=="mnuCut") {
       doCut();   
   } else if (el.id=="mnuCopy") {
       doCopy();   
   } else if (el.id=="mnuPaste") {
       doPaste();   
   } else if (el.id=="mnuDelete") {
       doDelete();   
   }  
}

function builtHPopUp() {
var styleHtml ="<STYLE>"+
   	      ".menuItem {font-family:sans-serif;font-size:8pt;width:80;padding:2;padding-left:20;background-Color:menu;color:black;cursor:default}"+	
   	      ".highlightItem {font-family:sans-serif;font-size:8pt;width:80;padding:2;padding-left:20;background-Color:highlight;color:white;cursor:default}"+
   	      " </STYLE>";
document.write(styleHtml);

var divHtml = "<div id=\"hPopup\" onmousedown=\"clickMenu()\" onmouseover=\"switchMenu()\" onmouseout=\"switchMenu()\" style=\"position:absolute; display:none; left:25px; top:-50px; z-index:5; padding:1; background-Color:menu; border-width:thin; border-style:outset; cursor:default\">"+
              "<div class=\"menuItem\" id=mnuHelp style=\"border-bottom-width:thin; border-bottom-style:groove;\">Help</div>"+
	      "<div class=\"menuItem\" id=mnuCut>Cut</div>"+
	      "<div class=\"menuItem\" id=mnuCopy>Copy</div>"+
	      "<div class=\"menuItem\" id=mnuPaste>Paste</div>"+
	      "<div class=\"menuItem\" id=mnuDelete>Delete</div>"+	              
  	      "</div>";						  
document.write(divHtml);
}

function cancelBub(){
  event.cancelBubble = true;
}

function builtNewMenu(options) {
var divHtml = "<div id=\"Menu\" style=\"position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0) \" onclick=\"cancelBub()\">"+
              "<table class=\"optMenuTB\">"+
    	      "<td align=\"left\" nowrap style=\"padding-right:9.5pt;\">"+ options +
    	      "</td>"+
              "</table>"+
  	      "</div><BR>";	
var divImg = "<div id=\"MenuImg\" style=\"position:absolute; visibility:hidden; left:-50px; top:-50px; z-index:4\">"+
             "<IMG SRC = '<%=request.getContextPath()%>/images/e/options.gif'onmouseover=\"startMove()\">"+
  	     "</div>";
document.write(divImg);						  
document.write(divHtml);

var hideHtml = "<SCRIPT language=\"JavaScript\">"+
	       "document.onclick= closeMenu;"+
	       "document.body.onload = MoveMenu;"+	       
	       "document.body.onscroll= MoveMenu;"+
	       "window.onresize = MoveMenu;"+
	       "</SCRIPT>";
document.write(hideHtml);
}

function showPopupHelp() {
     var y=event.clientY + document.body.scrollTop - 1;
     var x=event.clientX + document.body.scrollLeft - 1;
     var bodyW = document.body.clientWidth;
     var bodyH = document.body.clientHeight;
     var dif=0;
     hPopup.style.display="";
     if (bodyH < (event.clientY + hPopup.offsetHeight)) {
      dif = (event.clientY + hPopup.offsetHeight) - bodyH;
      y= y - dif - 5;
      }
     if (bodyW < (event.clientX + hPopup.offsetWidth)) {
      dif = (event.clientX + hPopup.offsetWidth) - bodyW;
      x= x - dif - 5;
      }
     event.returnValue = false;
     eval('hPopup.style.pixelTop=' + y);
     eval('hPopup.style.pixelLeft=' + x);
     //hPopup.style.display=""; 
     popupStatus = "open"   
     x= x - 3;
     y= y - 3;
     eval('hPopup.style.pixelTop=' + y);
     eval('hPopup.style.pixelLeft=' + x);
}

function closeMenu(){
 if (menuactive == true) startMove();
}

function initMenu(){
  
 var MSIEVER=getMSIEVer();

  eval('MenuImg.style.visibility="visible"');
  
  if ( MSIEVER < 5.5 ) { Menu.style.filter="blendTrans(duration=1)"; }
  
} 

function init(opt,name,bank,ccy,fieldname1,fieldname2,opcode) {
 fieldName = name;
 fieldBank = bank;
 fieldCCY = ccy;
 optHelp = opt;
 fieldAux1 = fieldname1;
 fieldAux2 = fieldname2;
 fieldOPCode = opcode;
}

function appPrint(){
	if(!window.print){
       var msg ="You must update your navigator to print";
	    alert(msg);
	    return;}
	    
	closeMenu();
    MenuImg.style.display="none";
    window.focus();
	window.print();
	MenuImg.style.display="";
	
}

// Corporative Customer option

var client_corp_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=17>Assets</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=11>Basic Information</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=15>Board of Directors</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=31>Classification Codes</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=37>Communications</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=13>Corporate Officers</A><BR> " + 
  "<A HREF= http://qspace.iplace.com/cobrands/364/3D_sample1.asp?sc=22550000>Credit Scoring</A><BR>"  + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=C>Documentation</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&APP_CODE=00>eIBS Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=19>Liabilities</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=33>Mailing Address</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=47>Marketing</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=61>Payment Instructions</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=35>Special Instructions</A><BR> " + 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=7>Teller Messages</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD9900?SCREEN=5>FATCA Information</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.params.JACRMPGM01?SCREEN=1&OPECOD=1>Monitor Plus</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var client_corp_opt_pi =
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=17' target='_parent'>Assets</A><BR> " +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=11' target='_parent'>Basic Information</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=15' target='_parent'>Board of Directors</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=31' target='_parent'>Classification Codes</A><BR>"  +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=37' target='_parent'>Communications</A><BR> " +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=13' target='_parent'>Corporate Officers</A><BR> " + 
  "<A HREF= http://qspace.iplace.com/cobrands/364/3D_sample1.asp?sc=22550000>Credit Scoring</A><BR>"  +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=C' target='_parent'>Documentation</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&APP_CODE=00' target='_parent'>eIBS Forms</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=19' target='_parent'>Liabilities</A><BR> " +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=33' target='_parent'>Mailing Address</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=47' target='_parent'>Marketing</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=61' target='_parent'>Payment Instructions</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=35' target='_parent'>Special Instructions</A><BR> " + 
  "<A HREF='<%=request.getContextPath()%>/pages/background.jsp' target='_parent'>Exit</A>";

// Inquiry Corporative Customer option

var client_inq_corp_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=17>Assets</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=11>Basic Information</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=15>Board of Directors</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=31>Classification Codes</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=37>Communications</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=13>Corporate Officers</A><BR>" +
  "<A HREF= http://qspace.iplace.com/cobrands/364/3D_sample1.asp?sc=22550000>Credit Scoring</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=C>Documentation</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=19>Liabilities</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=33>Mailing Address</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400&TYPE=C>Maintenance History</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=47>Marketing</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=61>Payment Instructions</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=35>Special Instructions</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=9>Teller Messages</A><BR> " +  
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD9900?SCREEN=104&OPECOD=3>FATCA Information</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.params.JACRMPGM01?SCREEN=1&OPECOD=1>Monitor Plus</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var client_inq_corp_opt_pi = 
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=17' target='_parent'>Assets</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=11' target='_parent'>Basic Information</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=15' target='_parent'>Board of Directors</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=31' target='_parent'>Classification Codes</A><BR>"  +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=37' target='_parent'>Communications</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=13' target='_parent'>Corporate Officers</A><BR>" +
  "<A HREF= http://qspace.iplace.com/cobrands/364/3D_sample1.asp?sc=22550000>Credit Scoring</A><BR>"  +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=C' target='_parent'>Documentation</A><BR> " +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=19' target='_parent'>Liabilities</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=33' target='_parent'>Mailing Address</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400&TYPE=C>Maintenance History</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=47' target='_parent'>Marketing</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=53' target='_parent'>Payment Instructions</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=35' target='_parent'>Special Instructions</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=9'tagert='_parent'>Teller Messages</A><BR> " +    
  "<A HREF='<%=request.getContextPath()%>/pages/background.jsp' target='_parent'>Exit</A>";

// Personal Customer option

var client_personal_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=17>Assets</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=1>Basic Information </A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=3>Beneficiary </A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=31>Classification Codes</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=37>Communications</A><BR>"  +
  "<A HREF= http://qspace.iplace.com/cobrands/364/3D_sample1.asp?sc=22550000>Credit Scoring</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=C>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&APP_CODE=00>eIBS Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=5>Employment Information</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=19>Liabilities</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=33>Mailing Address</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=47>Marketing</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=35>Special Instructions</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=7>Teller Messages</A><BR> " + 
   "<A HREF= javascript:getPdfForms('<%=request.getContextPath()%>/pages/e/EFRM000_pdf_form.jsp?SCREEN=1&OPE_CODE=01&APP_CODE=00')>Formularios (PDF)</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD9900?SCREEN=1>FATCA Information</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.params.JACRMPGM01?SCREEN=1&OPECOD=1>Monitor Plus</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Inquiry Personal Customer option

var client_inq_personal_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=17>Assets</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=1>Basic Information </A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=3>Beneficiary </A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=31>Classification Codes</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=37>Communications</A><BR> "  +
  "<A HREF= http://qspace.iplace.com/cobrands/364/3D_sample1.asp?sc=22550000>Credit Scoring</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=C>Documentations</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=5>Employment Information</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=19>Liabilities</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=33>Mailing Address</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400&TYPE=C>Maintenance History</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=47>Marketing</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=35>Special Instructions</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=9>Teller Messages</A><BR> " +  
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD9900?SCREEN=4&OPECOD=2>FATCA Information</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.params.JACRMPGM01?SCREEN=1&OPECOD=1>Monitor Plus</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
  
// Inquiry Relationship Customer option 

var client_inq_rela_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0083?SCREEN=100&OPTION=1>Customer Related</A><BR> " +  
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
  
  // Maintenace Relationship Customer option

var client_rela_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0083?SCREEN=100&OPTION=2>Customer Related</A><BR> " +  
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Customer Portfolio Options

 var cus_port_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0088?SCREEN=200>Portfolio Basic </A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0089?SCREEN=1>Portfolio Holders </A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010?SCREEN=200&OPCODE=0002>Investment Profile </A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010?SCREEN=3>Cash Accounts</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=33>Mailing Address</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010?SCREEN=52>Money Laundering</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var cus_i_port_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0088?SCREEN=500>Portfolio Basic</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0089?SCREEN=1>Portfolio Holders </A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010I?SCREEN=200>Investment Profile </A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010I?SCREEN=3>Cash Accounts</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=33>Mailing Address</A><BR>" + 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010I?SCREEN=52>Money Laundering</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
  	
var cus_a_port_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0088?SCREEN=501>Portfolio Basic</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0089?SCREEN=1>Portfolio Holders </A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010A?SCREEN=200>Investment Profile </A><BR>"+ 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=33>Mailing Address</A><BR>" +  
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010A?SCREEN=3>Cash Accounts</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010A?SCREEN=52>Money Laundering</A><BR>"+ 
 	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF=\"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF=\"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF=\"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";


// CD maintenance

var cd_m_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=7>Account Holders</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=49>Additional Transactions</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=3>Basic Information </A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&INTERFACE=B>Bankers Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=17>Beneficiaries</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=A>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEIRA010?SCREEN=1>IRA Activity Corrections</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=52>Money Laundering</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=50>Payment Disbursement Instructions</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=19>Rate Change</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=33>Roll-Over Instructions</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=55>Signers</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=21>Special Codes</A><BR>" +		 		 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=15>Special Instructions</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//CD Transactions

var cd_t_m_opt =
    "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=49>Additional Transactions</A><BR> " +
 	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=5>Basic Transactions</A><BR>"+
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";



// CD inquiry

var cd_i_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=29>Account Holders</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300?SCREEN=200>Account Statement</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF040?SCREEN=1>Averages</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=13>Balances </A><BR>"+	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=41>Basic Information </A><BR>" +	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=44>Beneficiaries</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=45>Calculator</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=46>Collaterals</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=R>Customer Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=58>Display Statement Header</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=A>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300?SCREEN=6>Interest Analysis</A><BR>" +	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEIRA020?SCREEN=11>IRA Account Summary</A><BR>" +	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400>Maintenance History</A><BR>" +  
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=51>Money Laundering</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=50>Payment Disbursement Instructions</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=52>Penalty Calculator</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=43>Product</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=49>Rate Table</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=48>Relationship</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=55>Signers</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=27>Special Codes</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=31>Special Instructions</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// CP maintenance

var cp_m_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105?SCREEN=11>Additional Transactions </A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105?SCREEN=3>Basic Information </A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105?SCREEN=5>Rate Change</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105?SCREEN=9>Repricing</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105?SCREEN=7>Roll-Over Instructions</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0106?SCREEN=900>Call/Put Date Schedule</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// CP Inquiry

var cp_i_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105I?SCREEN=13>Account Statement</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105I?SCREEN=3>Basic Information </A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105I?SCREEN=11>Recap</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105I?SCREEN=9>Repricing</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105I?SCREEN=7>Roll-Over Instructions</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0305?SCREEN=3&SCRCOD=PR>Relations</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0106?SCREEN=800>Call/Put Date Schedule</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";


// Retail Accounts maintenance

var rt_m_opt = 	 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=101>Account Analysis</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=17>Account Holders</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0012?SCREEN=100>Account Link Balances</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=15>Account Status</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&INTERFACE=B>Bankers Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=3>Basic Information</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=23&Type=J>Beneficiaries</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH1100?SCREEN=200&E01ACTFLG=R>Checkbook Re-Order</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=A>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=23&Type=I>Legal Representatives</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=7>Line of Credit</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=11>Money Launder Control</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=5>Overdraft</A><BR>"+
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=45>Overnight Investments</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0095?SCREEN=1>Return Dep/Cheks Msgs</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=19>Signers </A><BR> " + 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=13>Special Codes </A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=21>Special Instructions</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=1>Teller Messages</A><BR> " +  
  "<A HREF=<%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var rt_n_opt = 	 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=17>Account Holders</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0012?SCREEN=100>Account Link Balances</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=15>Account Status</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&INTERFACE=B>Bankers Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=3>Basic Information</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=23&Type=J>Beneficiaries</A><BR>" + 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH1100?SCREEN=200&E01ACTFLG=N>Checkbook New Order</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=A>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=5>Overdraft</A><BR>"+
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=45>Overnight Investments</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=23&Type=I>Legal Representatives</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=7>Line of Credit</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=11>Money Launder Control</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=19>Signers </A><BR> " + 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=13>Special Codes </A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=21>Special Instructions</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
  
// Retail Account inquiry

var rt_i_opt = 	 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=105>Account Analysis</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=38>Account Holders</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0012?SCREEN=100&OPT=I>Account Link Balances</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0936?SCREEN=1>Account Receivable</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF030?SCREEN=200 >Account Statement</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=102>ACH Transactions</A><BR> "  +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF040?SCREEN=1>Averages</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=31>Balances</A><BR>"+
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=32>Basic Information</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=39&Type=J>Beneficiaries</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=R>Customer Documentation</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=42>Daily Balance</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=58>Display Statement Header</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=A>Documentation</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=39&Type=I>Legal Representatives</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400>Maintenance History</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=33>Money Launder Control</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=45>Overnight Investments</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=40>Product</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0095?SCREEN=3>Return Dep/Cheks Msgs</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=46>Service Charges</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=36>Signers</A><BR> " + 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=35>Special Codes</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=37>Special Instructions</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0405?SCREEN=1>Stop Payments</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=3>Teller Messages</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0395?SCREEN=1>Uncollected & Holds</A><BR> " +	
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=103>Wire Transfers</A><BR> "  + 	          
  "<A HREF=<%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Savings Accounts maintenance

var sv_m_opt =	 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=17>Account Holders</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=15>Account Status</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&INTERFACE=B>Bankers Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=27>Basic Information</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=23&Type=J>Beneficiaries</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=A>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=23&Type=I>Legal Representatives</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=7>Line of Credit</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=11>Money Launder</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0095?SCREEN=1>Return Dep/Cheks Msgs</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=19>Signers</A><BR> " + 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=13>Special Codes</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=21>Special Instructions</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=1>Teller Messages</A><BR> " +    
  "<A HREF=<%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Savings Account inquiry

var sv_i_opt =	 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=38>Account Holders</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0936?SCREEN=1>Account Receivable</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF030?SCREEN=200>Account Statement</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF040?SCREEN=1>Averages</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=31>Balances</A><BR>"+
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=32>Basic Information</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=39&Type=J>Beneficiaries</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=R>Customer Documentation</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=42>Daily Balance</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=58>Display Statement Header</A><BR> "  +          
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=A>Documentation</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=39&Type=I>Legal Representatives</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0990?SCREEN=1>Line to Print for Saving Passbook</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400>Maintenance History</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=33>Money Launder Control</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=40>Product</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0095?SCREEN=3>Return Dep/Cheks Msgs</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=46>Service Charges</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=36>Signers</A><BR> " + 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=35>Special Codes</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=37>Special Instructions</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0405?SCREEN=1>Stop Payments</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=3>Teller Messages</A><BR> " +   
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0395?SCREEN=1>Uncollected & Holds</A><BR> " +    
  "<A HREF=<%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Loans maintenance 

var ln_m_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=7>Account Holders</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0152?SCREEN=27>Additional Transactions </A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&INTERFACE=B>Bankers Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=A>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0370?SCREEN=9>Escrow Maintenance</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=3>General Information</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=35>Loan Policy Exceptions</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=8>Payments Schedule</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=13>Rate Change</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=11>Special Instructions</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0157?SCREEN=1>Floating Rates Schedule</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var ln_n_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=7>Account Holders</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&INTERFACE=B>Bankers Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=13>Change Rate</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=A>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0370?SCREEN=9>Escrow Maintenance</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=3>General Information</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=35>Loan Policy Exceptions</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=11>Special Instructions</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=25>Transactions</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var ln_t_m_opt =
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0152?SCREEN=27>Additional Transactions</A><BR> " + 
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0152?SCREEN=5>Basic Transactions</A><BR>"+ 
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Loans inquiry

var ln_i_1_opt  = 		 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=4>Account Holders</A><BR> "  +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300L?SCREEN=200>Account Statements</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=12>Assigned Collateral</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF040?SCREEN=1>Averages</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=1>Balance </A><BR>"+	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=2>Basic Information </A><BR>"+	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0290?SCREEN=1>Calculator</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=15>Credit Lines</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=R>Customer Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=A>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0816?SCREEN=1>Documents List</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0305?SCREEN=100>Escrow</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=13>Fees Table</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=6>Interest Analysis</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=18>Loan Policy Exceptions</A><BR>" +	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=59>Mailing Address</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400>Maintenance History</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=10>Product</A><BR>" +	 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=19>Projected Pay-Off</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0305?SCREEN=3>Relations</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=3>Special Codes</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=5>Special Instructions</A><BR>" + 
  "<A HREF=<%=request.getContextPath()%>/pages/background.jsp>Exit</A>";


var ln_i_2_opt =  		 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=4>Account Holders</A><BR> "  +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300L?SCREEN=200>Account Statements</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=12>Assigned Collateral</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF040?SCREEN=1>Averages</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=1>Balance </A><BR>"+	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=2>Basic Information</A><BR>"+		
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0290?SCREEN=1>Calculator</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=15>Credit Lines</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=R>Customer Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=A>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0305?SCREEN=100>Escrow</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=13>Fees Table</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=6>Interest Analysis</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=18>Loan Policy Exceptions</A><BR>" +	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=59>Mailing Address</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400>Maintenance History</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=8>Payments Schedule</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=10>Product</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=19>Projected Pay-Off</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0305?SCREEN=3>Relations</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=3>Special Codes</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=5>Special Instructions</A><BR>" + 
  "<A HREF=<%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Credit cards maintenance

var cc_m_opt = 	 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010?SCREEN=3>Basic Information</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010?SCREEN=5>Primary Card</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010?SCREEN=7>Special Codes</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010?SCREEN=9>Special Instructions</A><BR>"+  
  "<A HREF=<%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Credit cards inquiry

var cc_i_opt = 	 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010I?SCREEN=3>Basic Information</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010I?SCREEN=5>Primary Card</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010I?SCREEN=7>Special Codes</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010I?SCREEN=9>Special Instructions</A><BR>"+  
  "<A HREF=<%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Collections inquiry

var coll_i_opt =      	  
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSESD0817C?SCREEN=1>Account Statement</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSEDC0100?SCREEN=1>Basic Information</A><BR> "+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0455C?SCREEN=1>Documents List</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSEDC0100?SCREEN=11>Fee Table</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450?SCREEN=9>Products</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSEDC0100?SCREEN=3>Special Codes</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSEDC0100?SCREEN=7>Special Instructions</A><BR> "  +           
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Letter of Credit inquiry

var lc_i_opt =       	  
   "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSESD0817?SCREEN=1>Account Statement</A><BR> " +
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450?SCREEN=1>Basic Information</A><BR>"+
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450?SCREEN=11>Charges Table</A><BR> "  +
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450?SCREEN=13>Collaterals</A><BR> "  + 
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0455?SCREEN=1>List of Documents</A><BR> "  +
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450?SCREEN=9>Products</A><BR> "  +
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450?SCREEN=3>Special Codes</A><BR>"  +
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450?SCREEN=7>Special Instructions</A><BR> "  +           
   "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Line of Credit Maintenance

var cl_m_opt =
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000?SCREEN=5>Additional Transactions</A><BR> " +
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000?SCREEN=3>Basic Information </A><BR>"+
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000?SCREEN=21>Special Codes</A><BR>" +		 		 
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000?SCREEN=15>Special Instructions<BR>" + 
   "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Line of Credit approval

var cl_a_opt = 		 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000A?SCREEN=3>Basic Information </A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000A?SCREEN=21>Special Codes</A><BR>" +		 		
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000A?SCREEN=15>Special Instructions</A><BR>" + 
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Line of Credit Inquiry

var cl_i_opt = 
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0060?SCREEN=1>Balances</A><BR>"+
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0060?SCREEN=3>Basic Information </A><BR>"+
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0060?SCREEN=5>Classification Codes</A><BR>"+
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0060?SCREEN=9>Line of Control</A><BR>"+
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0060?SCREEN=7>Special Instructions</A><BR>"+
   "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//ECIF010

var ecif10_i_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=9> Account List</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0300?SCREEN=1>Customer Portfolio</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=11> Customer Position</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0110?SCREEN=1> Lines Of Credit</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=7> Managment Inquiry</A><BR>"+
  "<A HREF= \"javascript:get_Gen_Summary();\" >Pension Summary</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECP001?SCREEN=2>Profitability</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=5> Totals</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Approval

// CP approvals

var cp_a_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105A?SCREEN=3>Basic Information </A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105A?SCREEN=9>Repricing</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105A?SCREEN=7>Roll-Over Instructions</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">" +
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";


//CD approvals

var cd_a_opt = 
    "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=7>Account Holders</A><BR> "  +
   	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=57>Account Title</A><BR> "  +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=47>Additonal Transactions</A><BR> " +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&INTERFACE=B>Bankers Forms</A><BR>" +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=3>Basic Informations</A><BR>"+
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=17>Beneficiaries</A><BR>" +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=19>Change Rate </A><BR> " +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=A>Documentation</A><BR>" +
  	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
    "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400>Maintenance History</A><BR>" +  	
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=41>Money Laundering</A><BR>" +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=48>Payment Disbursement Instructions</A><BR> " +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=33>Roll-Over Payment Instructions</A><BR>" +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=55>Signers</A><BR>" +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=21>Special Codes</A><BR>" +		 
   	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=15>Special Instructions</A><BR>" + 
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//CD Transactions Approval
var cd_t_a_opt =
    "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=47>Additional Transactions</A><BR> " +
 	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=5>Basic Transactions</A><BR>"+
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

   
//Loans Approvals

var ln_a_opt =
    "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150A?SCREEN=7>Account Holders</A><BR> "  +
  	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150A?SCREEN=57>Account Title</A><BR> "  +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0152A?SCREEN=27>Additional Transactions</A><BR> " +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&INTERFACE=B>Bankers Forms</A><BR>" +
 	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150A?SCREEN=3>Basic Informations </A><BR>"+
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150A?SCREEN=13>Change Rates</A><BR>" +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=A>Documentation</A><BR>" +
  	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
    "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150A?SCREEN=35>Loan Policy Exceptions</A><BR>" +	
    "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400>Maintenance History</A><BR>" +    
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0160?SCREEN=17&Type=A>Payments Schedule</A><BR>" +  		  		 
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150A?SCREEN=25>Transactions</A><BR>" + 		
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150A?SCREEN=11>Special Instructions</A><BR>" +
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Loans Transactions Approval
var ln_t_a_opt =
    "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0152A?SCREEN=27>Additional Transactions</A><BR> " +
 	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0152A?SCREEN=5>Basic Transactions</A><BR>"+
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Payment Conditions Approvals

var pm_cnd_opt =
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400>Maintenance History</A><BR>" +
  	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150A?SCREEN=62>Payment Conditions</A><BR>"+	
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
   	
//Credit Cards Approvals

var cc_a_opt =
    "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010A?SCREEN=13>Additional Cards</A><BR>" +
 	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010A?SCREEN=3>Basic Informations </A><BR>"+	 
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010A?SCREEN=5>Primary Card</A><BR>" +	 			  		 
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010A?SCREEN=7>Special Codes</A><BR>" +		 		
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010A?SCREEN=9>Special Instructions</A><BR>" +
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Retail Accounts Approvals

var rt_a_opt = 	 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=101>Account Analysis</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=17>Account Holders</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0012?SCREEN=100&OPT=A>Account Link Balances</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=15>Account Status</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC0010A?SCREEN=15>Additionals Cards</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&INTERFACE=B>Bankers Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=3>Basic Informations</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=39&Type=J>Beneficiaries</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=7>Customer/Lines of Credit</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=A>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=23&Type=I>Legal Representatives</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400>Maintenance History</A><BR>" +  
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=11>Money Launder Control</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=45>Overnight Investment</A><BR>"+
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0095?SCREEN=3>Return Dep/Cheks Msgs</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=5>Overdraft</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=19>Signers</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=13>Special Codes</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=21>Special Instructions</A><BR> "+
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=5>Teller Messages</A><BR> " + 
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
//Savings Accounts Approvals

var sv_a_opt =	 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=17>Account Holders</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=15>Accounts Status</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=57>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&INTERFACE=B>Bankers Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=27>Basic Informations</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=39&Type=J>Beneficiaries</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=7>Customers/Lines of Credit</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=A>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=23&Type=I>Legal Representatives</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400>Maintenance History</A><BR>" +    
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=11>Money Launder Control</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=5>Overdraft</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=19>Signers </A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=13>Special Codes</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=21>Special Instructions</A><BR> "+
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=5>Teller Messages</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.params.JACRMPGM01?SCREEN=1&OPECOD=1>Monitor Plus</A><BR> " + 
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

  // Approval Corporative Customer 

var client_ap_corp_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=65>Account Title</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=17>Assets</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=15>Board of Directors</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=37>Comunications</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=13>Corporate Officers</A><BR>" +
  "<A HREF= http://qspace.iplace.com/cobrands/364/3D_sample1.asp?sc=22550000>Credit Scoring</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=C>Documetations</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=11>Basic Informations</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=31>Classifications Code</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=19>Liabilities</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=33>Mailing Address</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400&TYPE=C>Maintenance History</A><BR>" +  
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=47>Marketing</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=61>Payment Instructions</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=35>Special Instructions</A><BR>" + 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=11>Teller Messages</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD9900?SCREEN=104&OPECOD=1>FATCA Information</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.params.JACRMPGM01?SCREEN=1&OPECOD=1>Monitor Plus</A><BR> " + 
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
  
var client_ap_corp_opt_pi = 
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=65' target='_parent'>Account Title</A><BR>" +
   "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=17' target='_parent'>Assets</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=11' target='_parent'>Basic Informations</A><BR>"+
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=15' target='_parent'>Board of Directors</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=31' target='_parent'>Classifications Code</A><BR> "  +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=37' target='_parent'>Comunications</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=13' target='_parent'>Corporate Officers</A><BR>" +
  "<A HREF= http://qspace.iplace.com/cobrands/364/3D_sample1.asp?sc=22550000>Credit Scoring</A><BR>"  +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=C' target='_parent'>Documentations</A><BR> " +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01' target='_parent'>eIBS Forms</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=19' target='_parent'>Liabilities</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=33' target='_parent'>Mailing Address</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400&TYPE=C>Maintenance History</A><BR>" +  
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=47' target='_parent'>Marketing</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=61' target='_parent'>Payment Instructions</A><BR>" +
  "<A HREF='<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=35' target='_parent'>Special Instructions</A><BR>" + 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=11>Teller Messages</A><BR> " +  
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goParentOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goParentOpenerAction('R')\" >Reject</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF='<%=request.getContextPath()%>/pages/background.jsp' target='_parent'>Exit</A>";
  
  // Approval Personal Customer option

var client_ap_personal_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=65>Account Title</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=1>Basic Informations</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=3>Beneficiaries</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=31>Classifications Codes</A><BR>"  +
  "<A HREF= http://qspace.iplace.com/cobrands/364/3D_sample1.asp?sc=22550000>Credit Scoring</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=37>Comunications</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=C>Documetations</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01>eIBS Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=5>Employment Information</A><BR> "  + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=33>Mailing Address</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400&TYPE=C>Maintenance History</A><BR>" +  
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=47>Marketing</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=35>Special Instructions</A><BR> "  +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=11>Teller Messages</A><BR> " +  
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD9900?SCREEN=4&OPECOD=1>FATCA Information</A><BR> " +  
   "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.params.JACRMPGM01?SCREEN=1&OPECOD=1>Monitor Plus</A><BR> " + 
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
  
  //Official Checks

//Print from Maintenance

var of_p_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115?SCREEN=11>Additional Transactions</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115?SCREEN=1>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115?SCREEN=9>Change Number</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115P?SCREEN=7>Print </A><BR>"+ 
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//No Print from Maintenance

var of_np_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115?SCREEN=11>Additional Transactions</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115?SCREEN=1>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115?SCREEN=9>Change Number</A><BR>"+ 
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Approval

var of_a_opt =
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Transactions</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115P?SCREEN=7>Print</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Print 

var of_p1_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115P?SCREEN=7>Print</A><BR>"+ 
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Paying and Receiving Swift

var tranS_i_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEDD0610?SCREEN=7>Document</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Paying and Receiving Fed

var tranF_i_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEDD0610?SCREEN=9>Document</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Paying and Receiving Telex

var tranT_i_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEDD0610?SCREEN=11>Document</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Finacial Transaction
var pr_a_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=200>Additional Transactions</A><BR> " +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=100>Basic Information</A><BR> " +
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var pr_r_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=200>Additional Transactions</A><BR> " +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=100>Basic Information</A><BR> " +
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= \"javascript:goOpenerAction('X')\" >Reversal</A><BR>" +
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var pr_m_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000?SCREEN=5>Additional Transactions</A><BR> " +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000?SCREEN=3>Basic Information</A><BR> " +
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var pr_inq_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060?SCREEN=3>Basic Information</A><BR> " +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060?SCREEN=7>Logs Inquiry</A><BR> " +
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
//Collaterals Maintenance

var colla_M_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0010?SCREEN=1>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0010?SCREEN=9>Classification Codes</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0010?SCREEN=11>Special Instructions</A><BR>"+ 
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Collaterals Approval

var colla_A_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0080A?SCREEN=3>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0080A?SCREEN=21>Classification Code</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0080A?SCREEN=15>Special Instructions</A><BR>"+ 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
 "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
 "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//collaterals Inquiry


var colla_i_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100?SCREEN=1>Basic Informations </A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0080A?SCREEN=21>Classification Code</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0080A?SCREEN=15>Special Instructions</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//only approval

var approval_opt =
 "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" + 
 "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
 "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
 
//Portofolio


var test_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.PORTFOLIO?SCREEN=500>Application of Purchases/Sales Orders</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.PORTFOLIO?SCREEN=700>Order Details</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.PORTFOLIO?SCREEN=100>Portfolio Inquiry List (Primary View)</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.PORTFOLIO?SCREEN=300>Portfolio Inquiry List (Secondary View)</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";


//Foreign Exchange 

//CDS
var cd_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=51>Account Holders</A><BR> "  +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=1>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=57>Beneficiaries</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=65>Money Laundering</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=63>Redemption</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=61>Special Codes</A><BR>" +		 		 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=55>Special Instructions</A><BR>" + 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=41>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=31>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var cd_bo_act_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=51>Account Holders</A><BR> "  +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=1>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=57>Beneficiaries</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=65>Money Laundering</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=63>Redemption</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=61>Special Codes</A><BR>" +		 		 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=55>Special Instructions</A><BR>" + 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=41>Confirmation Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//TDS
var td_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=51>Account Holders</A><BR> "  +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=3>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=57>Beneficiaries</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=65>Money Laundering</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=63>Redemption</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=61>Special Codes</A><BR>" +		 		 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=55>Special Instructions</A><BR>" + 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+ 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=43>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=33>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+ 
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
var td_bo_act_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=51>Account Holders</A><BR> "  +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=3>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=57>Beneficiaries</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=65>Money Laundering</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=63>Redemption</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=61>Special Codes</A><BR>" +		 		 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=55>Special Instructions</A><BR>" + 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+ 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=43>Confirmation Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+ 
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
//FFS
var ff_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=51>Account Holders</A><BR> "  +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=5>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=57>Beneficiaries</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=65>Money Laundering</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=63>Redemption</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=61>Special Codes</A><BR>" +		 		 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=55>Special Instructions</A><BR>" + 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+  
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=47>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=37>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+ 
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var ff_bo_act_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=51>Account Holders</A><BR> "  +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=5>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=57>Beneficiaries</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=65>Money Laundering</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=63>Redemption</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=61>Special Codes</A><BR>" +		 		 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=55>Special Instructions</A><BR>" + 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+  
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=47>Confirmation Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+ 
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//TPS
var tp_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=51>Account Holders</A><BR> "  +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=7>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=57>Beneficiaries</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=65>Money Laundering</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=63>Redemption</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=61>Special Codes</A><BR>" +		 		 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=55>Special Instructions</A><BR>" + 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+   
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=45>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=35>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+  
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var tp_bo_act_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=51>Account Holders</A><BR> "  +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=7>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=57>Beneficiaries</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=65>Money Laundering</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=63>Redemption</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=61>Special Codes</A><BR>" +		 		 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=55>Special Instructions</A><BR>" + 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+   
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=45>Confirmation Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+  
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";


//ACC
var ac_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=51>Account Holders</A><BR> "  +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=9>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=57>Beneficiaries</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=65>Money Laundering</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=63>Redemption</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=61>Special Codes</A><BR>" +		 		 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=55>Special Instructions</A><BR>" + 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+    
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=49>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=39>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var ac_bo_act_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=51>Account Holders</A><BR> "  +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=9>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=57>Beneficiaries</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=65>Money Laundering</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=63>Redemption</A><BR>" +
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=61>Special Codes</A><BR>" +		 		 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130B?SCREEN=55>Special Instructions</A><BR>" + 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+    
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130B?SCREEN=49>Confirmation Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";


//Spot
var sf_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B?SCREEN=1>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=41>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=73>Notice to Receive</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=31>Swift Message</A><BR>"+
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
//Forward
var fw_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B?SCREEN=3>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=43>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=75>Notice to Receive</A><BR>"+
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
//NDF
var nd_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B?SCREEN=5>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=45>Confirmation Message</A><BR>"+
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Option
var op_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B?SCREEN=7>Basic Information</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=47>Confirmation Message</A><BR>"+
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
    
//Swap
var sw_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B?SCREEN=9>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0120B?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=49>Confirmation Spot</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=59>Confirmation Forward</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=79>Notice to Receive</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=39>Swift Message</A><BR>"+
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
     
//PLP
var cp_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120B?SCREEN=1>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0120B?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=11>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100B?SCREEN=7>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
//FRA
var fra_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSETR0130?SCREEN=1>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=3>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=1>Swift Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";


// IRS
var irs_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSETR0130?SCREEN=2>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=3>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=1>Swift Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";


//Maintenance

//Swap
var swm_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140?SCREEN=9>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100M?SCREEN=49>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100M?SCREEN=87>Notice to Receive</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100M?SCREEN=39>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Option
var opm_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140?SCREEN=7>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+ 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100M?SCREEN=47>Confirmation Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//NDF
var ndm_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140?SCREEN=5>Basic Information</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100M?SCREEN=45>Confirmation Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+ 
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Forward
var fwm_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140?SCREEN=3>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+ 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100M?SCREEN=43>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100M?SCREEN=85>Notice to Receive</A><BR>"+ 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>" ; 
 
//Spot
var sfm_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140?SCREEN=1>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+ 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100M?SCREEN=41>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100M?SCREEN=81>Notice to Receive</A><BR>"+ 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100M?SCREEN=31>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>"; 
 
//Approval
//Swap
var swa_bo_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140A?SCREEN=9>Basic Information</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+   
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=49>Confirmation Spot<BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=59>Confirmation Forward</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=67>Notice to Receive</A><BR>"+  
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=39>Swift Message</A><BR>"+
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
   "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Option
var opa_bo_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140A?SCREEN=7>Basic Information</A><BR>"+
    "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=47>Confirmation Message</A><BR>"+  
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=37>Swift Message</A><BR>"+
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+  
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//NDF
var nda_bo_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140A?SCREEN=5>Basic Information</A><BR>"+
    "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=45>Confirmation Message</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=35>Swift Message</A><BR>"+
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+  
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Forward
var fwa_bo_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140A?SCREEN=3>Basic Information</A><BR>"+
    "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=33>Swift Message</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=43>Confirmation Message</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=63>Notice to Receive</A><BR>"+ 
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+  
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
//Spot
var sfa_bo_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140A?SCREEN=1>Basic Information</A><BR>"+
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=41>Confirmation Message</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=61>Notice to Receive</A><BR>"+ 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100A?SCREEN=31>Swift Message</A><BR>"+
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+  
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Deals

var cdt_a_opt = 
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=3>Basic Information</A><BR>"+
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=33>Redemption</A><BR>" +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=21>Special Codes</A><BR>" +		 
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130A?SCREEN=63>Confirmation Message</A><BR>"+
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130A?SCREEN=61>Swift Message</A><BR>"+
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
   	
var cdt_a_act_opt = 
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=3>Basic Information</A><BR>"+
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=33>Redemption</A><BR>" +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=21>Special Codes</A><BR>" +		 
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130A?SCREEN=63>Confirmation Message</A><BR>"+
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//FRA

//FRA
var fra_app_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140A?SCREEN=80>Basic Information</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=7>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=5>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
 "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
 "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
//FRA
var fra_inq_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSETR0160I?SCREEN=100>Basic Information</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=71>Confirmation Message</A><BR>"+ 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=51>Swift Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";  
   	
// IRS
var irs_app_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0140A?SCREEN=80>Basic Information</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=7>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=5>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
 "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
 "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";


var irs_inq_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSETR0130?SCREEN=2>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=3>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0340?SCREEN=1>Swift Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

// Deals back office maintenance

var cdm_m_opt =
     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=7>Account Holders</A><BR> "  +
	 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=3>Basic Information </A><BR>"+
     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=17>Beneficiaries</A><BR>" +
     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=52>Money Laundering</A><BR>" +
	 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=19>Rate Change</A><BR> " + 
	 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=33>Redemption</A><BR>" +
     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=21>Special Codes</A><BR>" +		 		 
     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=15>Special Instructions</A><BR>" + 
	 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  	 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130M?SCREEN=63>Confirmation Message</A><BR>"+
	 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130M?SCREEN=61>Swift Message</A><BR>"+
  	 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
     "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var cdm_m_act_opt =
     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=7>Account Holders</A><BR> "  +
	 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=3>Basic Information </A><BR>"+
     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=17>Beneficiaries</A><BR>" +
     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=52>Money Laundering</A><BR>" +
	 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=19>Rate Change</A><BR> " + 
	 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=33>Redemption</A><BR>" +
     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=21>Special Codes</A><BR>" +		 		 
     "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M?SCREEN=15>Special Instructions</A><BR>" + 
	 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  	 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130M?SCREEN=63>Confirmation Message</A><BR>"+
  	 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
     "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";     
     
//Foreign Exchange Inquiry

//Option
var opi_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0160?SCREEN=7>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0160?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100I?SCREEN=47>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100I?SCREEN=37>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//NDF
var ndi_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0160?SCREEN=5>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0160?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100I?SCREEN=45>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100I?SCREEN=35>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

//Forward
var fwi_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0160?SCREEN=3>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0160?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100I?SCREEN=39>Swift Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100I?SCREEN=59>Confirmation Message</A><BR>"+ 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100I?SCREEN=63>Notice to Receive</A><BR>"+ 
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";  
 
//Spot
var sfi_bo_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0160?SCREEN=1>Basic Information</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0160?SCREEN=55>Special Instructions</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100I?SCREEN=41>Confirmation Message</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100I?SCREEN=61>Notice to Receive</A><BR>"+ 
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF100I?SCREEN=31>Swift Message</A><BR>"+
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
//Payment Approval
var swf_a_opt = 
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEWD0341A?SCREEN=5>Logs Inquiry</A><BR>" +
	"<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEWD0341A?SCREEN=3>Swift Message</A><BR>"+
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";   	

//Treasury Deals Inquiry   	
var cdt_i_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130IT?SCREEN=57>Account Statement</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130IT?SCREEN=13>Balances </A><BR>"+	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130IT?SCREEN=41>Basic Information </A><BR>"+	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130IT?SCREEN=56>Recap</A><BR> " +		  
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130IT?SCREEN=27>Special Codes</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130IT?SCREEN=31>Special Instructions</A><BR>" + 
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130I?SCREEN=63>Confirmation Message</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF0130I?SCREEN=61>Swift Message</A><BR>"+
  "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
   	

//Investments Instruments   	
var inst_basic_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0050?SCREEN=400>Basic Information </A><BR>"+	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0070?SCREEN=900>Payment Schedule</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0060?SCREEN=4>Quotes</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
  
var inst_inq_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0050?SCREEN=800>Basic Information</A><BR>"+	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0070I?SCREEN=900>Payment Schedule</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0060I?SCREEN=4>Quotes</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
  
var inst_app_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0050?SCREEN=1000>Basic Information</A><BR>"+	
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0070A?SCREEN=900>Payment Schedule</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0060A?SCREEN=4>Quotes</A><BR>"+
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
  
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";  
    
var trade_a_ticket_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0130A?SCREEN=400>Basic Information </A><BR>"+	
	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
   	"<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>"; 
   	  	
 var inv_port_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010?SCREEN=3>Cash Accounts</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010?SCREEN=1>Portfolio </A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010?SCREEN=52>Money Laundering</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var inv_i_port_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010I?SCREEN=3>Cash Accounts</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010I?SCREEN=1>Portfolio </A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010I?SCREEN=52>Money Laundering</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
  	
var inv_a_port_opt =
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010A?SCREEN=3>Cash Accounts</A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010A?SCREEN=1>Portfolio </A><BR>"+
 "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010A?SCREEN=52>Money Laundering</A><BR>"+ 
 	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
	"<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
  	"<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
  	"<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var coupon_ap_opt =
 "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
 "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
 "<A HREF= \"javascript:goOpenerAction('R')\" >Reject</A><BR>" +
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";

var free_a_opt =
 "<A HREF= \"javascript:appPrint();\" >Print</A><BR>" +
 "<A HREF= \"javascript:goOpenerAction('A')\" >Approval</A><BR>" +
 "<hr align=\"center\" style=\"height:1pt;color:navy\">"+
 "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
 
 // Modulo de Solicitudes
 
 // Individual customer
 var erq_client_personal_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=1>Información Basica</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=3>Beneficiarios</A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=31>Códigos de Clasificación</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=C>Documentación</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=33>Direcciones de Correos</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=35>Instrucciones Especiales</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Salir</A>";
 
 // Corporative customer
 var erq_client_corp_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=11>Información Basica</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=31>Códigos de Clasificación</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=13>Oficiales Corporativos</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=C>Documentación</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=33>Direcciones de Correos</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=35>Instrucciones Especiales</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Salir</A>";

// Inquiry Personal Customer 
var erq_client_inq_personal_opt =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=1>Basic Information </A><BR>"+
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=3>Beneficiary </A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=31>Classification Codes</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=C>Documentación</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=33>Mailing Address</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=35>Special Instructions</A><BR> "  +
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Salir</A>";


// Inquiry Corporative Customer 
var erq_client_inq_corp_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=11>Información Basica</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=31>Códigos de Clasificación</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=13>Oficiales Corporativos</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=C>Documentación</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=33>Direcciones de Correos</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.request.JSERQ0080?SCREEN=35>Instrucciones Especiales</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Salir</A>";  
 
 // Personal Customer option - Hide Options for Encrypted Customers

var client_personal_opt_Enc = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=17>Assets</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=1>Basic Information </A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=31>Classification Codes</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=37>Communications</A><BR>"  +
  "<A HREF= http://qspace.iplace.com/cobrands/364/3D_sample1.asp?sc=22550000>Credit Scoring</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=C>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&APP_CODE=00>eIBS Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=5>Employment Information</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=19>Liabilities</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=47>Marketing</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=35>Special Instructions</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=7>Teller Messages</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
 // Corporative Customer option - Hide Options for Encrypted Customers

var client_corp_opt_Enc =
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=17>Assets</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=11>Basic Information</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=31>Classification Codes</A><BR>"  +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=37>Communications</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=13>Corporate Officers</A><BR> " + 
  "<A HREF= http://qspace.iplace.com/cobrands/364/3D_sample1.asp?sc=22550000>Credit Scoring</A><BR>"  + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=C>Documentation</A><BR>" + 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=1&OPE_CODE=01&APP_CODE=00>eIBS Forms</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=19>Liabilities</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=47>Marketing</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=61>Payment Instructions</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=35>Special Instructions</A><BR> " + 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0090?SCREEN=7>Teller Messages</A><BR> " + 
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
 
  	  	// General Ledger Accounts 

var gl_inquiry_opt = 	 
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340?SCREEN=9>Basic Information</A><BR> " +
  "<A HREF=<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340?SCREEN=7>Cross References</A><BR> " +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400>Maintenance History</A><BR>" +
  "<A HREF=<%=request.getContextPath()%>/pages/background.jsp>Exit</A>";
  	  	
// Fixed Assets option

var fix_m_opt = 
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX000?SCREEN=900>Basic Information </A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=F>Documentation</A><BR>" +
  "<A HREF= <%=request.getContextPath()%>/pages/background.jsp>Exit</A>";  	  	
  	  	
//end help menu def