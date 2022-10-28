<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ShoppingHeart.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cafe Romma Fremantle | HOME</title>
    
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <link href="css/slicebox.css" rel="stylesheet" type="text/css" />   
    <link href="css/animate.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/main.css" rel="stylesheet" type="text/css" />    
    <link href="css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />  
   <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
        rel="stylesheet" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
        }
    </script>
    <script src="https://js.stripe.com/v3/"></script>
    
    <style type="text/css">
        .auto-style11 {
            color: #456599;
        }
        .auto-style12 {
            color: #456580;
        }
        .auto-style13 {
            float: left;
            font-size: 18px;
            line-height: 20px;
            margin: 0;
            padding: 0;
        }
        .auto-style14 {
            color: #00CC00;
        }
        .auto-style17 {
            font-size: medium;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
                <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNav">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                   
                    <a href="Default.aspx">
                        <span style="font-size:xx-large; color:#456580">Cafe Romma Fremantle</span></a><a href="Default.aspx" class="navbar-brand">
                        </a>
                </div>
                <div id="myNav" class="collapse  navbar-collapse">
                    <ul class="nav nav-tabs navbar-right">
                        <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="Index.aspx"><i class="fa fa-search"></i>Our Menu</a></li>
                        
                        <li><a href="ContactUs.aspx"><i class="fa fa-question"></i>Contact Us</a></li>
                      
                    </ul>
                </div>
            </div>
        </div>
    <br />
        <br /> <br />
        <hr />
    <div class="border">
        <br />
        <br />
        <table align="center" style="border-bottom-style: ridge; border-width: medium; border-color: #FFFFFF">
                                <tr>
                                    <td align="left" style="width: 40%">
                                        <asp:Label ID="lblCustomerName" runat="server" Text="Welcome:Moe Owner" ForeColor="seagreen" Font-Bold="true"  Font-Size="Larger"></asp:Label>
                                    </td>
                                    <%--<td align="center" style="width: 20%">
                                        <asp:TextBox ID="txtSearch" runat="server" Width="18%" Visible="false" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                                        <asp:Label ID="Label1" runat="server" Text="Search Products" ForeColor="seagreen" Font-Bold="true"  Font-Size="Larger"></asp:Label>
                                        
                                    </td>--%>
                                   </tr>
            <tr>
                                    <td align="left" style="width: 40%" >
                                        <asp:LinkButton ID="btnMyShopping" runat="server" CausesValidation="false" ForeColor="seagreen" Font-Bold="true">MyShopping</asp:LinkButton>
                                        </td>
                </tr>
            <tr>
                
                <td><asp:LinkButton ID="btnMyProfile" runat="server" OnClick="btnMyProfile_Click"
                                            CausesValidation="false" ForeColor="seagreen" Font-Bold="true">MyProfile</asp:LinkButton>

                </td>
                </tr>
                <tr>
                    <td><asp:LinkButton ID="btnRegister" runat="server" OnClick="btnRegister_Click"
                                            CausesValidation="false" ForeColor="seagreen" Font-Bold="true">Register</asp:LinkButton></td>
                </tr>
                   <tr>

                    <td>
                           <asp:LinkButton ID="btnLogin" runat="server" OnClick="btnLogin_Click" CausesValidation="false" ForeColor="seagreen" Font-Bold="true">Login</asp:LinkButton>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" CausesValidation="false" ForeColor="seagreen" Font-Bold="true">Logout</asp:LinkButton>
                   </td>
                </tr>
               
        </table>
        <br/>

    </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <table align="center">
                    <tr>
                        <td>
                            
                            <table align="center" class="style1" style="border-bottom-style: ridge; border-width: medium; border-color:#FFFFFF">
                                <tr>
                                    <td class="style8" align="center" rowspan="2">
                                     <asp:LinkButton ID="lblLogo" runat="server" Visible="false" CausesValidation="False" Font-Names="Eras Demi ITC" Font-Size="20pt" ForeColor="#6600CC" OnClick="lblLogo_Click" Text="Cafee Romma"></asp:LinkButton>
                                       <asp:ImageButton ID="imgBtnHome" runat="server" ImageUrl="~/Images/LogoTyres.png" CausesValidation="False" OnClick="imgBtnHome_Click" Visible="false" />
                                    </td>
                                    <td class="style7" rowspan="2">
                                        <br />
                                    </td>
                                    <td rowspan="2" align="right">
                                        
                                    </td>
                                    
                                    
                                </tr>
                                <tr>
                                    <td class="style3" valign="middle">&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <table align="center" >
                                            <tr>
                                                
                                                    
                                                <td class="style2">
                                                    &nbsp;
                                                    <asp:Label ID="lblCategoryName" runat="server" BackColor="White" Font-Size="15pt" ForeColor="Green" style="font-size: medium" Visible="false"></asp:Label>
                                                </td>
                                                <td align="right">
                                        <asp:LinkButton ID="btnShoppingHeart" runat="server" Font-Underline="False" Font-Size="3em"
                                            ForeColor="Red" OnClick="btnShoppingHeart_Click" CausesValidation="False">0</asp:LinkButton>
                                    </td>
                                                <td>
                                        <asp:Image ID="Image2" runat="server" Height="53px" ImageUrl="~/Images/basket2.jpg"
                                            Width="70px" />
                                    </td>
                                                <td class="text-right" >
                                                   
                                                    &nbsp;
                                                    <asp:Label ID="lblProducts" runat="server" BackColor="Orange" Font-Size="15pt" ForeColor="White" style="color: forestgreen; background-color: #FFFFFF" Text="Products" Visible="false"></asp:Label>
                                                </td>
                                                <caption>
                                                    
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                </caption>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="All Products" ForeColor="Green" BackColor="White" Font-Bold="true" BorderStyle="Inset" CausesValidation="false" Visible="false" />
                                                     <asp:Label ID="Label9" runat="server" BackColor="Orange" Font-Size="15pt" ForeColor="White" style="color: forestgreen; background-color: #FFFFFF" Text="Products" Visible="false"></asp:Label>
                                                    
                                                </td>
                                            </tr>
                                            <caption>
                                                <br />
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:DataList ID="dlCategories1" runat="server" DataKeyField="CategoryID" DataSourceID="SqlDataSource1" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Button ID="CategoryNameLabel" runat="server" BackColor="White" BorderStyle="Inset" CommandArgument='<%# Eval("CategoryID") %>' Font-Bold="true" ForeColor="Green" OnClick="lbtnCategory_Click" Text='<%# Eval("CategoryName") %>' CausesValidation="false" />
                                                                <br />
                                                                <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' Visible="false" />
                                                                <br />
                                                                <br />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingCartDB1ConnectionString %>" SelectCommand="SELECT [CategoryName], [CategoryID] FROM [Category]"></asp:SqlDataSource>
                                                    </td>
                                                    <!-- -->
                                                </tr>
                                            </caption>
                                        </table>

                    <caption>
                        
                       <!-- <br />-->
                        
                                        
                                    </td>
                                </tr>
                                <caption>
                                    <tr>
                                        <td>
                                            <table align="center" class="style1">
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="pnlCategories" runat="server" BackColor="WhiteSmoke" BorderColor="Orange" BorderStyle="Inset" BorderWidth="2px" Height="700px" ScrollBars="Auto" Visible="true">
                                                            <asp:DataList ID="dlCategories" runat="server" AlternatingItemStyle-BackColor="WhiteSmoke" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Bold="true" FooterStyle-ForeColor="Orange" ForeColor="Black" GridLines="Horizontal" Width="100%">
                                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lbtnCategory" runat="server" CommandArgument='<%# Eval("CategoryID") %>' OnClick="lbtnCategory_Click1" Text='<%# Eval("CategoryName") %>'></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                            </asp:DataList>
                                                        </asp:Panel>
                                                    </td>
                                                    <td>

                                                    </td>
                                                    <td class="style2" valign="top">
                                                        <asp:Panel ID="pnlProducts" runat="server" BackColor="WhiteSmoke" BorderColor="#FEA400" BorderStyle="Inset" BorderWidth="2px" Height="700px" ScrollBars="Auto">
                                                            <asp:DataList ID="dlProducts" runat="server" BackColor="WhiteSmoke" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" FooterStyle-BackColor="WhiteSmoke" FooterStyle-BorderColor="Orange" ForeColor="Green" HeaderStyle-ForeColor="WhiteSmoke" RepeatColumns="4" Width="100%">
                                                                <ItemTemplate>
                                                                    <div align="left">
                                                                        <table cellspacing="2" class="style4" style="border: 3px ridge #FEA400">
                                                                            <tr>
                                                                                <td style="border-bottom-style: ridge; border-width: 2px; top:5px; border-color: #FEA400" align="center">
                                                                                    <asp:Label ID="lblProductName" runat="server" ForeColor="Green" Style="font-weight: 700" Text='<%# Eval("Name") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:ImageButton ID="imgBtnProductPhoto" runat="server" data-target="#myModal" data-toggle="modal" ImageUrl='<%# Eval("ImageUrl") %>' OnClick="imgBtnProductPhoto_Click" Style="border: ridge 2px #FEA400; width: 220px; height: 250px;" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="center">Price: $ 
                                                                                    <asp:Label ID="lblPrice" runat="server" ForeColor="Blue" Text='<%# Eval("Price") %>'></asp:Label>
                                                                                    <br />
                                                                                 <%--VIC delivery is not avalible--%>
                                                                                  
                                                                                    <asp:Image ID="imgStar" runat="server" ImageUrl="~/Images/GreenStar.png" Height="10px" Width="10px" Visible="false" />
                                                                                    <br />
                                                                                    

                                                                                    <asp:Label ID="lblAvailableStock" runat="server" Font-Bold="true" ForeColor="Red" Text='<%# Eval("AvailableStock") %>' ToolTip="Available Stock" Visible="false"></asp:Label>
                                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Pick Up 20 min"></asp:Label><br />
                                                                                 
                                                                                    <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Button ID="btnAddToCart" runat="server" BackColor="Orange" BorderColor="Black" BorderStyle="Inset" BorderWidth="2px" CausesValidation="false" CommandArgument='<%# Eval("ProductID") %>' Font-Bold="true" ForeColor="White" OnClick="btnAddToCart_Click" Text="Add To Cart" Width="100%" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="33%" />
                                                            </asp:DataList>
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnlMyCart" runat="server" BackColor="WhiteSmoke" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" FooterStyle-BackColor="Orange" Height="100%" ScrollBars="Auto" Visible="false" style="font-size: medium">
                                                            <table align="center" cellspacing="1">
                                                                <%--<caption>--%>
                                                                      <tr>
                                                                         <td>
                                                                            <asp:Panel ID="pnlCheckOut" runat="server" BackColor="WhiteSmoke" BorderColor="White"   Height="100%" ScrollBars="Auto" Visible="false">
                                                                                <table style="width: 100%;">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Label ID="Label8" runat="server" style="color: #ef0f31; font-size: medium; font-weight: 700" Text="Your Details will be populated when you Register or LogIn" Visible="false"></asp:Label>
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="text-left">&nbsp;<span class="auto-style1">&nbsp;</span><span class="auto-style2"> </span><span class="auto-style12"><strong><span class="auto-style11">
                                                                                            <asp:Label ID="Label7" runat="server" style="color: #009933" Text="Full Name:" Visible="false"></asp:Label>
                                                                                            </span></strong></span></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="text-left">
                                                                                            <asp:TextBox ID="txtCustomerName" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Enabled="false" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" Width="100%" style="color: #FFFFFF; background-color: #009900" Visible="false"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <%--<td class="text-left">&nbsp;&nbsp; <span class="auto-style12"><strong><span class="auto-style11">PhoneNo: </span></strong></span></td>--%>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="text-left">
                                                                                            <asp:TextBox ID="txtCustomerPhoneNo" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Enabled="false" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" MaxLength="10" Width="100%" style="color: #FFFFFF; background-color: #009900" Visible="false"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustomerPhoneNo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <%--<td class="text-left">&nbsp;&nbsp;<strong><span class="auto-style2"> </span></strong><span class="auto-style12"><strong><span class="auto-style11">Email Address </span></strong></span></td>--%>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="text-left">
                                                                                            <asp:TextBox ID="txtCustomerEmailID" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Enabled="false" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" Width="100%" style="color: #FFFFFF; background-color: #009900" Visible="false"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCustomerEmailID" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <%--<td class="text-left">&nbsp;&nbsp;<span class="auto-style2"> </span><span class="auto-style12"><strong><span class="auto-style11">Address </span></strong></span></td>--%>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left" class="text-left">&nbsp;<asp:TextBox ID="txtCustomerAddress" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" Height="50px" ReadOnly="True" Width="100%" style="color: #FFFFFF; background-color: #009900" Visible="false"></asp:TextBox>
                                                                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCustomerAddress" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <%--<td class="text-left">&nbsp;&nbsp;<span class="auto-style2"> </span><span class="auto-style12"><strong><span class="auto-style11">Suburb </span></strong></span></td>--%>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left" class="text-left">&nbsp;<asp:TextBox ID="txtCustomerAddress1" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" Height="50px" ReadOnly="True" Width="100%" style="color: #FFFFFF; background-color: #009900" Visible="false"></asp:TextBox>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCustomerAddress" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                       <%--<asp:Label ID="Label2" runat="server" Text="PostCode :" style="color: #009933; text-align: left;"></asp:Label>--%>
                                                                                        <%--<td class="text-left">&nbsp;&nbsp;<span class="auto-style2"> </span><span class="auto-style12"><strong><span class="auto-style11">PostCode : </span></strong></span></td>--%>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left" class="text-left">&nbsp;<asp:TextBox ID="txtCustomerPostCode" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Visible="false" Enabled="false" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" Height="50px" ReadOnly="true" Width="100%" style="color: #FFFFFF; background-color: #009900"></asp:TextBox>
                                                                                          <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCustomerPostCode" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <%--<td class="text-left">&nbsp;&nbsp;<span class="auto-style2"> </span><span class="auto-style12"><strong><span class="auto-style11">Total Products :</span></strong></span> </td>--%>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="center" class="text-left">&nbsp;
                                                                                       <%-- <asp:TextBox ID="txtTotalProducts" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" ReadOnly="True" Width="100%" style="color: #FFFFFF; background-color: #009900"></asp:TextBox>--%>
                                                                                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTotalProducts" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <%--<td class="text-left"><span class="auto-style10">&nbsp;&nbsp;</span><span class="auto-style7"><strong><span class="auto-style11"> </span></strong><span class="auto-style3"><strong><span class="auto-style11">Total Price $AU:</span></strong></span></span> </td>--%>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="text-left">
                                                                                           <%-- <asp:TextBox ID="txtTotalPrice" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" ReadOnly="True" Width="100%" style="color: #FFFFFF; background-color: #009900"></asp:TextBox>--%>
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTotalPrice" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                   
                                                                                   
                                                                                    
                                                                                </table>
                                                                            </asp:Panel>
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Label ID="lblAvailableStockAlert" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                                            <asp:DataList ID="dlCartProducts" runat="server" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" RepeatColumns="1" Width="100%">
                                                                                <ItemTemplate>
                                                                                    <div align="left">
                                                                                        <table cellspacing="1" style="border: 3px ridge #FF9900; text-align: center; width: 320px; margin-top:10px">
                                                                                            <tr>
                                                                                                <td style="border-bottom-style: ridge; border-width: 4px; border-color: #FF9900">
                                                                                                    <asp:Label ID="lblProductName" runat="server" ForeColor="#1ed335" Style="font-weight: 700" Text='<%# Eval("Name")%>'></asp:Label>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <img alt="" src='<%# Eval("ImageUrl") %>' runat="server" id="imgProductPhoto" style="border: ridge 5px #FF9900; width: 260px; height: 330px;" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="true" ForeColor="#1ed335" Text="Available Stock"></asp:Label>
                                                                                                    :&nbsp;
                                                                                                    <asp:Label ID="lblAvailableStock" runat="server" Font-Bold="true" ForeColor="Red" Text='<%# Eval("AvailableStock") %>' ToolTip="Available Stock"></asp:Label>
                                                                                                    <br />
                                                                                                    <asp:Label ID="lblMoney1" runat="server" ForeColor="Orange" Text="Perth Only**"></asp:Label>
                                                                                                    <br />
                                                                                                    <asp:Label ID="Label5" runat="server" Text="PRICE $:"></asp:Label>
                                                                                                  
                                                                                                    <asp:Label ID="lblPrice" runat="server" Font-Bold="true" ForeColor="#1ed335" Text='<%# Eval("Price") %>'></asp:Label>
                                                                                                    &nbsp;x&nbsp;
                                                                                                    <asp:TextBox ID="txtProductQuantity" runat="server" AutoPostBack="true" BorderColor="Red" BorderStyle="Double" Height="16px" MaxLength="1" OnTextChanged="txtProductQuantity_TextChanged" Text='<%# Eval("ProductQuantity")%>' Width="16px"></asp:TextBox>
                                                                                                    <asp:Label ID="lblQty" runat="server" ForeColor="#1ed335" Text="Qty"></asp:Label>
                                                                                                    <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <hr />
                                                                                                    <asp:Button ID="btnRemoveFromCart" runat="server" BackColor="Orange" BorderColor="Black" BorderStyle="Inset" BorderWidth="2px" CausesValidation="false" CommandArgument='<%# Eval("ProductID") %>' ForeColor="White" OnClick="btnRemoveFromCart_Click" Text="Remove From Cart" Width="100%" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="33%" />
                                                                            </asp:DataList>
                                                                        </td>
                                                                        <td align="center">
                                                                            <br /><br /><br />
                                                                            
                                                                            <%--<asp:Label ID="Label2" runat="server" style="color: #ef0f31; font-size: medium; font-weight: 700" Text="DELIVERY TO :"></asp:Label>--%>
                                                                            <br />
                                                                            
                                                                            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="To My House" CausesValidation="false" Visible="false" />
                                            <%--                                <br />

                                                                            <asp:Label ID="Label10" runat="server" style="color: #009933; font-weight: 700;" Text="Receiver's Name:" Visible="false"></asp:Label>
                                                                            <br />--%>
                                                                            <asp:TextBox ID="txtReceiverName1" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" ReadOnly="False" Width="33%" Visible="false"></asp:TextBox>
                                                                            <br />
                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtReceiverName1" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>--%><br />
                                                                            <%--<span class="auto-style12"><strong>Receiver&#39;s PhoneNo: </strong></span>--%>
                                                                            <%--<br/>--%>
                                                                            <asp:TextBox ID="txtReceiverPhoneNo1" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" ReadOnly="false" Width="33%" Visible="false"></asp:TextBox>
                                                                            <br />
                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtReceiverPhoneNo1" ErrorMessage="Please Enter Phone" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                            <br />
                                                                            <%--<span class="auto-style11"><strong>Receiver&#39;s Email:</strong></span><br />--%>
                                                                            <asp:TextBox ID="txtEmailID11" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" ReadOnly="false" Width="33%" Visible="false"></asp:TextBox>
                                                                            <br />
                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtEmailID11" ErrorMessage="Please Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                            <%--<br />
                                                                            <span class="auto-style12"><strong>Receiver&#39;s Address :</strong></span>
                                                                            <br />--%>
                                                                            <asp:TextBox ID="txtRecipientAddress1" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" ReadOnly="false" Width="33%" Visible="false"></asp:TextBox>
                                                                            <br />
                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtRecipientAddress1" ErrorMessage="Please Enter Address" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                            <%--<br />
                                                                            <span class="auto-style12"><strong>Receiver&#39;s Suburb </strong></span>:
                                                                            <br />--%>
                                                                            <asp:TextBox ID="txtRecipientSuburb1" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" ReadOnly="false" Width="33%" Visible="false"></asp:TextBox>
                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtRecipientSuburb1" ErrorMessage="Please Enter Suburb" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                            <br />
                                                                            <span class="auto-style12"><strong>Receiver&#39;s Postcode </strong></span>:</span></strong></span>
                                                                            <asp:TextBox ID="txtRecipientPostCode1" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" ReadOnly="false" Width="33%" Visible="false"></asp:TextBox>
                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtRecipientPostCode1" ErrorMessage="Please Enter PostCode" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                            <br />
                                                                            <asp:Label ID="Label14" runat="server" Text="TOTAL PRODUCTS:" style="font-size: medium"></asp:Label><br />
                                                                             <asp:TextBox ID="txtTotalProducts" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" ReadOnly="True" Width="33%" style="color: #FFFFFF; background-color: #009900"></asp:TextBox><br />
                                                                            <asp:Label ID="Label15" runat="server" Text="TOTAL PRICE $AU" style="font-size: medium"></asp:Label><br />
                                                                                            
                                                                                    
                              
                                                                                            <asp:TextBox ID="txtTotalPrice" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" ReadOnly="True" Width="33%" style="color: #FFFFFF; background-color: #009900"></asp:TextBox><br />
                                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTotalPrice" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                                                     
                                                                            <asp:Label ID="Label11" runat="server" ForeColor="Red" style="font-weight: 700; color: #009900; font-size: medium;" Text="Your Message :"></asp:Label><br />
                                                                            <asp:TextBox ID="txtMessage1" runat="server" BackColor="#47AC12" BorderColor="#47AC12" BorderStyle="Solid" CssClass="auto-style8" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="White" Height="20%" ReadOnly="false" TextMode="MultiLine" Width="43%"></asp:TextBox><br />
                                                                             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtMessage1" ErrorMessage="Please Enter Message" ForeColor="Red"></asp:RequiredFieldValidator>--%><br />
                                                                            <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" SelectionMode="Day" OnDayRender="Calendar2_DayRender" ShowGridLines="True"><WeekendDayStyle BackColor="YellowGreen"></WeekendDayStyle></asp:Calendar>
                                                                            <asp:Label ID="Label16" runat="server" Text="Pick Up In 30 Minutes" style="color: #FF0000"></asp:Label><br />
                                                                            <asp:Label ID="txtCalendar2" runat="server" ForeColor="Red" style="font-size: large; font-weight: 700"></asp:Label><br/>

                                                                            <br/>
                                                                            <br/>
                                                                                     
                                                                                    
                                                                                        <br />
                                                                                       
                                                                                            </span class="auto-style17">Payment Mode:</strong></span></span> 
                                                                                       
                                                                                    
                                                                                      
                                                                                                    <asp:RadioButtonList ID="rblPaymentMethod1" runat="server">
                                                                                                        <%--<asp:ListItem Value="1" Selected="True">1.Pay 50% & Pick In Store</asp:ListItem>--%>
                                                                                                        <asp:ListItem Selected="True" Value="2">CreditCard</asp:ListItem>
                                                                                                    </asp:RadioButtonList>
                                                                                              
                                                                                                    <asp:Label ID="Label19" runat="server" style="color: #FF0000; font-weight: 700; font-size: medium;" Text="Pick Up Only"></asp:Label>
                                                                                                    <br />
                                                                                            
                                                                                                
                                                                                                    <asp:Button ID="btnPlaceOrder1" runat="server" OnClick="btnPlaceOrder_Click" Style="font-weight: 700; background-color: #009933;" Text="Place Order" Width="100%" />
                                                                            <asp:Button ID="btnPlaceOrder2" runat="server" Text="Stripe payments" Height="29px" Visible="false" />
                                                                              
                                                                                            
                                                                                            
                                                                                       
                                                                                
                                                        
                                                                   
                                                                </table>
                                                            </asp:Panel>
                                                              
                                                            </table>
                                                        
                                                    </td>
                                                    </tr>

                                                    <tr>
                                                        <td align="center" class="style3" valign="top">
                                                       
                                                            <br />
                                                           
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false">
                                                            <div style="text-align: center;">
                                                                <br />
                                                                <br />
                                                                <br />
                                                                <br />
                                                                <br />
                                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/emptyShoppingCart2.jpg" Width="300px" />
                                                                <br />
                                                                <br />
                                                                <br />
                                                                <br />
                                                                <br />
                                                            </div>
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnlOrderPlacedSuccessfully" runat="server" Visible="false">
                                                            <div style="text-align: center;">
                                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/HappyShopping.jpg" Width="500px" />
                                                                <br />
                                                                <br />
                                                                <span class="auto-style5">
                                                                <label>
                                                                Order Placed Successfully.</label></span><br />
                                                                <br />
                                                                <strong>Transaction Details Are Sent At Email Provided By You.</strong><br />
                                                                <br />
                                                                <br />
                                                                <asp:Label ID="lblTransactionNo" runat="server" Style="font-weight: 700; color: #33CC33; font-size: large;"></asp:Label>
                                                                <br />
                                                                <br />
                                                                <br />
                                                                <a href="TrackYourOrder.aspx" target="_self">TrackYourTransactionDetailsHere</a>
                                                                <br />
                                                                <br />
                                                                <br />
                                                            </div>
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnlTransactionFailed" runat="server" Visible="false">
                                                            <div style="text-align: center;">
                                                                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/TransactionFailedError.png" />
                                                                <br />
                                                                <span class="auto-style6"><strong>Transaction Has Been Cancelled or Failed </strong></span>
                                                            </div>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="border: thin ridge #33CC33">&nbsp;<span class="auto-style7"><%-- <a href="TrackYourOrder.aspx"
                                        target="_self">TrackOrderStatus</a>--%></span></span>|</strong></span> <%--<a class="auto-style15" href="https://play.google.com/store/apps/details?id=appsomnia.tyres" target="_self"><strong>Android App</strong></a>--%><span class="auto-style13"><strong><%-- <a href="TrackYourOrder.aspx"
                                        target="_self">TrackOrderStatus</a>--%><span class="auto-style14"><%-- <a href="TrackYourOrder.aspx"
                                        target="_self">TrackOrderStatus</a>--%></span></strong></span></td>
                                                </tr>
                                                </tr>
                                                </table>



                <div class="container">
                    <div class="row">

                        <button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                        </button>

                        <div class="modal fade" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content" style="color:forestgreen">
                                    <div class="modal-header" style="color:#34b091">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title"><asp:Label ID="Label6" runat="server" Text="Product Details" ForeColor="#FEA400" Font-Size="Large" Font-Bold="true"></asp:Label></h4>
                                        <asp:Label ID="lblProduct1" runat="server" Text="Product Name"></asp:Label>

                                    </div>
                                    <div class="modal-body">
                                        <table>
                                            <tr>
                                                <td style="width: 60%;" rowspan="2">

                                                    
                                                     <asp:Label ID="lblDescription" runat="server" Text="Description"  Font-Size="Medium" ForeColor="#1ed335" Font-Bold="true"></asp:Label>
                                                     <asp:TextBox ID="txtDescription1" runat="server" TextMode="MultiLine"  Width="250px" Height="200px"  ReadOnly="true" Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                                                </td>
                                               
                                                <td style="width: 40%;">
                                                   <asp:Image ID="imgBtnPreview" runat="server" Style="border: ridge 2px #FEA400; width: 300px; height: 300px;"  BackColor="WhiteSmoke"/>
                                                   

                                                </td>
                                 
                                            </tr>
                                             <tr>
                                                  <td style="width: 40%;" align="left" >
                                                   <asp:Label ID="lblPrice1" runat="server" Text="Price:     $"  Font-Bold="true" ForeColor="#1ed335" Font-Size="Large"></asp:Label> <asp:Label runat="server" ID="lblPriceOfProduct"  ForeColor="#FEA400" Font-Size="Large"></asp:Label>
                                                    

                                                </td>
                                            </tr>
                                            <caption>
                                                <hr />
                                                
                                                <tr>
                                                    <td>
                                                        <%--<img src="Images/people.png" alt=""width="35px" height="35px" />
                                                        <asp:Label ID="Label11" runat="server" Text="People Looking for this product" Font-Bold="true" ForeColor="#1ed335" Font-Size="Medium"></asp:Label>--%><br />
                                                    </td>
                                                   
                                                </tr>
                                                <tr>
                                                    <td>
                                                        
                                                        <asp:Label ID="Label13" runat="server" Text="Key Features :"  Font-Size="Medium" ForeColor="#1ed335" Font-Bold="true"></asp:Label>
                                                         
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label12" runat="server" Text="Key Benefits:" Font-Size="Medium" ForeColor="#1ed335" Font-Bold="true"></asp:Label>
                                                    </td>
                                                    <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtDescription2" runat="server" TextMode="MultiLine"  Width="250px" Height="200px"  ReadOnly="true" Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                                                    </td>
                                                        <td>
                                                            <asp:TextBox ID="txtDescription3" runat="server" TextMode="MultiLine"  Width="250px" Height="200px"  ReadOnly="true" Font-Bold="true" Font-Size="Medium"></asp:TextBox>
                                                        </td>
                                                </tr>
                                                
                                               
                                            </caption>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal" style="color:#34b091">
                                            Close</button>

                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
                  <footer id="footer" class="midnight-blue">
        <div class="container ">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2017    <a target="_se0 lf"  title="DIGITAL MANIFEST">DIGITAL MANIFEST</a>. All Rights Reserved. </div>
                <div class="text-right"> ABN: 84 381 794 895 </div>
                
                <%--    <ul class="pull-right">
                        <li><a href="Default.aspx"><i class="fa fa-home" style="color:whitesmoke"></i> Home</a></li>
                        <li><a href="Index.aspx"><i class="fa fa-search" style="color:whitesmoke"></i> Our Menu</a></li>
                        <li><a href="AboutUs.aspx"><i class="fa fa-info"  style="color:whitesmoke"></i> About</a></li>
                        <li><a href="ContactUs.aspx"><i class="fa fa-question" style="color:whitesmoke"></i> Contact Us</a></li>
                    </ul>
                --%>    </div>
            </div>
        </div>
</body>
</html>