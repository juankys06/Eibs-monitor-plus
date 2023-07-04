<html>
	<head>
		<title>Monitor plus client Information</title>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
		<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
	</head>

	<jsp:useBean id= "ESACRM0101" class= "datapro.eibs.beans.ESACRM0101Message"  scope="session" />
	<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
	<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
	<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

	<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
	<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/e/javascripts/optMenu.jsp"> </SCRIPT>
 
	<SCRIPT Language="Javascript">

	
	
    <% 
		if ( userPO.getOption().equals("CLIENT_P") ) {
	%>
		builtNewMenu(client_personal_opt);
	<%      
   	}
   else
   {
   %>
		builtNewMenu(client_corp_opt);
   <%
   }
   %>

	</SCRIPT>

	<body bgcolor="#FFFFFF">


	<% 
 	if ( !error.getERRNUM().equals("0")  ) {
 		error.setERRNUM("0");
    	out.println("<SCRIPT Language=\"Javascript\">");
    	out.println("       showErrors()");
     	out.println("</SCRIPT>");
	}
    	out.println("<SCRIPT> initMenu();  </SCRIPT>");
	%>

	<h3 align="center">
		Monitor Plus <img
			src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
			name="EIBS_GIF" ALT="client_MP, ACRMPGM01">
	</h3>
	<hr size="4">
	<form METHOD="post"
		ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JACRMPGM01">
		<input TYPE="HIDDEN" NAME="SCREEN" VALUE="2">

		<table class="tableinfo">
  		<tr > 
      		<td nowrap > 
        	<table class=tbhead cellspacing="0" cellpadding="2" width="100%"   align="center">
        		<tr>
             	<td nowrap width="10%" align="right"> Client: 
               	</td>
          		<td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
          		</td>
            	<td nowrap width="6%" align="right">ID or Identification Number:  
            	</td>
          		<td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
          		</td>
            	<td nowrap width="8%" align="right"> Name: 
               	</td>
          		<td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
          		</td>
        		</tr>
      		</table>
    		</td>
  		</tr>
  	</table>
	
	<h4>Main Customer information</h4>
 	<table class="tableinfo">
    	<tr > 
        	<td nowrap> 
          		<table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
   		         	<tr id="trdark" > 
		          		<td nowrap width="25%"> 
  	    		        	<div align="right">Nationality 1:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSNAC1" size="3" maxlength="3" value="<%= ESACRM0101.getBUFSNAC1().trim()%>">	    
  		  	       	   		<a href="javascript:GetCodeCNOFCC('BUFSNAC1','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a>    	      	
 			            </td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Nationality 2:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSNAC2" size="3" maxlength="3" value="<%= ESACRM0101.getBUFSNAC2().trim()%>">	  
  		  	       	   		<a href="javascript:GetCodeCNOFCC('BUFSNAC2','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a>        	      	
 			            </td>   			                    
              
            		</tr>          		
            		<tr id="teclear"> 
	            		<td nowrap width="25%"> 
  	    		        	<div align="right">Expedition date ID:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSF1M" size="2" maxlength="2" value="<%= ESACRM0101.getBUFSF1M().trim()%>"> 
	       					<input type="text" name="BUFSF1D" size="2" maxlength="2" value="<%= ESACRM0101.getBUFSF1D().trim()%>">
                			<input type="text" name="BUFSF1A" size="4" maxlength="4" value="<%= ESACRM0101.getBUFSF1A().trim()%>">    
                			<a href="javascript:DOBPicker(document.forms[0].BUFSF1M,document.forms[0].BUFSF1D,document.forms[0].BUFSF1A)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="ayuda" align="middle" border="0"></a> 
                			(MM-DD-YYYY)  
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Expedition City ID:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSCEXP" size="15" maxlength="15" value="<%= ESACRM0101.getBUFSCEXP().trim()%>">   		  	       	   		       	      	
 			            </td>
 			        </tr>
 			        <tr id="trdark" > 
		          		<td nowrap width="25%"> 
  	    		        	<div align="right">Expedition Department ID::</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSDEXP" size="15" maxlength="15" value="<%= ESACRM0101.getBUFSDEXP().trim()%>">	    
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   </td> 
 			       </tr> 
 			       <tr id="teclear"> 
	            		<td nowrap width="25%"> 
  	    		        	<div align="right">Natural person with Commerce:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="checkbox" name="BUFSNCOM" size="2" maxlength="2" value="<%= ESACRM0101.getBUFSNCOM()%>"> 	       					
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Monthly Expenses:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSEGMN" size="17" maxlength="17" value="<%= ESACRM0101.getBUFSEGMN().trim()%>">   		  	       	   		       	      	
 			            </td>
 			        </tr>
 			         <tr id="trdark" > 
		          		<td nowrap width="25%"> 
  	    		        	<div align="right">Working city:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSCLAB" size="15" maxlength="15" value="<%= ESACRM0101.getBUFSCLAB().trim()%>">	    
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Working Country:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSPLAB" size="15" maxlength="15" value="<%= ESACRM0101.getBUFSPLAB().trim()%>">	  		  	       	   		
 			            </td> 
 			       </tr> 
 			        <tr id="teclear"> 
	            		<td nowrap width="25%"> 
  	    		        	<div align="right">Administer political funds:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="checkbox" name="BUFSFPOL" size="2" maxlength="2" value="<%= ESACRM0101.getBUFSFPOL() %>"> 	       					
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">It has accounts abroad:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="checkbox" name="BUFSPCEX" size="2" maxlength="2" value="<%= ESACRM0101.getBUFSPCEX() %>">   		  	       	   		       	      	
 			            </td>
 			        </tr>
 			        <tr id="trdark" > 
		          		<td nowrap width="25%"> 
  	    		        	<div align="right">Social Security Number (SSN):</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSSSOC" size="15" maxlength="15" value="<%= ESACRM0101.getBUFSSSOC().trim()%>">	    
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right"> Country where the SSN was issued:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSPSSO" size="3" maxlength="3" value="<%= ESACRM0101.getBUFSPSSO().trim()%>">	
  		  	       	   		<a href="javascript:GetCodeCNOFCC('BUFSPSSO','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a>          		  	       	   		
 			            </td> 
 			       </tr> 
 			       <tr id="teclear"> 
	            		<td nowrap width="25%"> 
  	    		        	<div align="right">Greencard Number:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="checkbox" name="BUFSNGCR" size="15" maxlength="15" value="<%= ESACRM0101.getBUFSNGCR() %>"> 	       					
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Driver's license Number:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="checkbox" name="BUFSNLCN" size="15" maxlength="15" value="<%= ESACRM0101.getBUFSNLCN() %>">   		  	       	   		       	      	
 			            </td>
 			        </tr>
 			       

          </table>
        </td>
      </tr>
    </table>

		



		<div align="center">
			<input id="EIBSBTN" type="submit" name="Submit" value="Submit">
		</div>

		<center></center>
	</form>
</body>
</html>