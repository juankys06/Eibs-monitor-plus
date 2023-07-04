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
			name="EIBS_GIF" ALT="corp_MP, ACRMPGM01">
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
  	    		        	<div align="right">Entity code/company:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSBNK" size="6" maxlength="6" value="<%= ESACRM0101.getBUFSBNK().trim()%>">	
 			            </td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Total Employees:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSNEMP" size="6" maxlength="6" value="<%= ESACRM0101.getBUFSNEMP().trim()%>">   	      	
 			            </td>   			                    
              
            		</tr>          		
            		<tr id="teclear"> 
	            		<td nowrap width="25%"> 
  	    		        	<div align="right">Total Assets:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSVPAT" size="14,2" maxlength="14,2" value="<%= ESACRM0101.getBUFSVPAT().trim()%>"> 	   
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Other Income:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSVOING" size="14,2" maxlength="14,2" value="<%= ESACRM0101.getBUFSVOING().trim()%>">   		  	       	   		       	      	
 			            </td>
 			        </tr>
 			        <tr id="trdark" > 
		          		<td nowrap width="25%"> 
  	    		        	<div align="right">Gross equity:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSVPATB" size="14,2" maxlength="14,2" value="<%= ESACRM0101.getBUFSVPATB().trim()%>">	    
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
 			            	<div align="right">Training company Y/N:</div>	
   		  	     	    </td>               
  		  	       	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="checkbox" name="BUFSEFOR" size="2" maxlength="2" value="<%= ESACRM0101.getBUFSEFOR() %>"> 	
 			           </td>
 			       </tr> 
 			       <tr id="teclear"> 
	            		<td nowrap width="25%"> 
  	    		        	<div align="right">Net worth:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSVPATL" size="14,2" maxlength="14,2" value="<%= ESACRM0101.getBUFSVPATL().trim()%>"> 	       					
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Net Income:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSRNTL" size="14,2" maxlength="14,2" value="<%= ESACRM0101.getBUFSRNTL().trim()%>">   		  	       	   		       	      	
 			            </td>
 			        </tr>
 			         <tr id="trdark" > 
		          		<td nowrap width="25%"> 
  	    		        	<div align="right">Financial Obligations:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSOFIN" size="14" maxlength="14" value="<%= ESACRM0101.getBUFSOFIN().trim()%>">	    
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Operating Income:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSIOPR" size="14" maxlength="14" value="<%= ESACRM0101.getBUFSIOPR().trim()%>">	  		  	       	   		
 			            </td> 
 			       </tr> 
 			        <tr id="teclear"> 
	            		<td nowrap width="25%"> 
  	    		        	<div align="right">Current Asset:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSACTC" size="14" maxlength="14" value="<%= ESACRM0101.getBUFSACTC().trim()%>"> 	       					
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Fixed Asset:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSACTF" size="14" maxlength="14" value="<%= ESACRM0101.getBUFSACTF().trim()%>">   		  	       	   		       	      	
 			            </td>
 			        </tr>
 			        <tr id="trdark" > 
		          		<td nowrap width="25%"> 
  	    		        	<div align="right">Other Assets:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSACTO" size="14" maxlength="14" value="<%= ESACRM0101.getBUFSACTO().trim()%>">	    
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right"> Current Liabilities:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSPASC" size="14" maxlength="14" value="<%= ESACRM0101.getBUFSPASC().trim()%>">	         		  	       	   		
 			            </td> 
 			       </tr> 
 			       <tr id="teclear"> 
	            		<td nowrap width="25%"> 
  	    		        	<div align="right">Long-term Liabilities:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSPASL" size="14" maxlength="14" value="<%= ESACRM0101.getBUFSPASL().trim()%>">	 	       					
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Date Data Update:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSF3M" size="2" maxlength="2" value="<%= ESACRM0101.getBUFSF3M().trim()%>"> 
	       					<input type="text" name="BUFSF3D" size="2" maxlength="2" value="<%= ESACRM0101.getBUFSF3D().trim()%>">
                			<input type="text" name="BUFSF3A" size="4" maxlength="4" value="<%= ESACRM0101.getBUFSF3A().trim()%>">    
                			<a href="javascript:DOBPicker(document.forms[0].BUFSF3M,document.forms[0].BUFSF3D,document.forms[0].BUFSF3A)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="ayuda" align="middle" border="0"></a> 
                			(MM-DD-YYYY)    		  	       	   		       	      	
 			            </td>
 			        </tr>
 			        <tr id="trdark" > 
		          		<td nowrap width="25%"> 
  	    		        	<div align="right">Country of Incorporation:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BUFSPCON" size="10" maxlength="10" value="<%= ESACRM0101.getBUFSPCON().trim()%>">	    
  		  	       	   	</td>    
 			            <td nowrap width="25%"> 
  	    		        	<div align="right">Client's Profile:</div>
   		  	     	    </td>              
  		   	    	   <td nowrap bordercolor="#FFFFFF" width="25%">  
  		  	       	   		<input type="text" name="BBUFSPERF" size="14,2" maxlength="14,2" value="<%= ESACRM0101.getBUFSPERF().trim()%>">	         		  	       	   		
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
  	