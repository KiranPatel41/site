<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="site.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
 
   
    <title>Jainam : Log in </title>
  
	
	<link rel="stylesheet" href="css/vendors_css.css"/>
	
	<link rel="stylesheet" href="css/horizontal-menu.css"/> 
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/skin_color.css"/>	
</head>
<body>
    <div class="container h-p100">
		<div class="row align-items-center justify-content-md-center h-p100">	
			
			<div class="col-12">
				<div class="row justify-content-center g-0">
					<div class="col-lg-5 col-md-5 col-12">
						<div class="bg-white rounded10 shadow-lg">
							<div class="content-top-agile p-20 pb-0">
                         
                            <h3>Login </h3>
													 
							</div>
							<div class="p-40">
								<form id="form1" runat="server">
									<div class="form-group">
										<div class="input-group mb-3">
											<span class="input-group-text bg-transparent"><i class="ti-user"></i></span>
                                            <asp:TextBox ID="txtUsername" runat="server" class="form-control ps-15 bg-transparent" placeholder="Username"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RFT" runat="server" ControlToValidate="txtUsername" ValidationGroup="LGV" ErrorMessage="Please Enter User Name" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                       
										</div>
									</div>
									<div class="form-group">
										<div class="input-group mb-3">
											<span class="input-group-text  bg-transparent"><i class="ti-lock"></i></span>
                                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="form-control ps-15 bg-transparent" placeholder="Password"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword" ValidationGroup="LGV" ErrorMessage="Please Enter Password" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
											
										</div>
									</div>
									  <div class="row">
									
										
									
										<div class="col-12 text-center">
                                            <asp:LinkButton ID="lnkLogin" runat="server" class="btn btn-primary mt-10"  ValidationGroup="LGV" OnClick="lnkLogin_Click">SIGN IN</asp:LinkButton>
										
										</div>
									
									  </div>
								</form>	
								
							</div>						
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

    	<script src="js/vendors.min.js"></script>
	<script src="js/pages/chat-popup.js"></script>
    <script src="assets/icons/feather-icons/feather.min.js"></script>	
       
       <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r134/three.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vanta@latest/dist/vanta.globe.min.js"></script>
</body>
</html>
