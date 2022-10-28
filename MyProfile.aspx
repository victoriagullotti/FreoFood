<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="ShoppingHeart.MyProfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cafe Romma Fremantle || My Profile</title>
    <meta name="trustpilot-one-time-domain-verification-id" content="kt52VSjXBCXyeC87XFNdav8rk5ymKFsP12cXBVI7" />
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
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
        }
    </script>

    <style type="text/css">
        .auto-style11 {
            color: #009900;
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
                    <%--<img src="img/8LF.jpg" alt="" width="50px" height="50px"/>--%>
                    <a href="#">
                        <span style="font-size: xx-large; color: #456580">Cafe Romma Fremantle</span></a><a href="Default.aspx" class="navbar-brand">
                        </a>
                </div>
                <div id="myNav" class="collapse  navbar-collapse">
                    <ul class="nav nav-tabs navbar-right">
                        <li><a href="Default.aspx"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="Index.aspx"><i class="fa fa-search"></i>Our Menu</a></li>
                        <li><a href="AboutUs.aspx"><i class="fa fa-info"></i>About</a></li>
                        <li><a href="ContactUs.aspx"><i class="fa fa-question"></i>Contact Us</a></li>
                        <%--<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Dropdown1
                        <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Dropdown1</a></li>
                            <li><a href="#">Dropdown2</a></li>
                            <li><a href="#">Dropdown3</a></li>
                            <li><a href="#">Dropdown4</a></li>
                            <li class="divider"></li>
                            <li><a href="Index.aspx">Products</a></li>
                        </ul>
                    </li>--%>
                    </ul>
                </div>
            </div>
        </div>
        <br />

        <div style="margin-top: 80px;">
            <%--<div style=" text-align:center;">
        <asp:ImageButton ID="imgShoppingBag" runat="server" Height="99px" 
            ImageUrl="~/Images/shoppingbag.png" Width="90px" 
            onclick="imgShoppingBag_Click" CausesValidation="false" />
            <br />
    </div>--%>
            <table align="center" style="border: 1px ridge #000000; width: 450px;">
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="Label1" runat="server" Font-Names="Aharoni" ForeColor="Orange" Text="My Profile"
                            Style="font-weight: 700; font-size: large;" BackColor="White"></asp:Label>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="center" class="auto-style4">
                        <strong>Name :</strong><b> </b>
                    </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtName" runat="server" Width="200px" MaxLength="20" Enabled="false" CssClass="auto-style5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                            ErrorMessage="Please Enter Full Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="center" class="auto-style2">
                        <b>&nbsp;
                        </b>
                        <strong>Phone No :</strong></td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtPhoneNo" runat="server" Width="200px" MaxLength="10" CssClass="auto-style5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhoneNo"
                            ErrorMessage="Please Enter Valid Phone Number" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style3">Address
                    :</td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtAddress" runat="server" Width="200px" MaxLength="200" CssClass="auto-style5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress"
                            ErrorMessage="Please Enter Valid Address" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style3">Suburb : </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtAddress1" runat="server" Width="200px" MaxLength="200" CssClass="auto-style5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress1"
                            ErrorMessage="Please Enter Valid Address" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style3">PostCode : </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtPostCode" runat="server" Width="200px" MaxLength="200" CssClass="auto-style5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPostCode"
                            ErrorMessage="Please Enter Valid Address" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style3">Email ID :
                    </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtEmailID" runat="server" Width="200px" CssClass="auto-style5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmailID"
                            ErrorMessage="Please Enter Valid Email" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style3">Password :</td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="200px" MaxLength="20" CssClass="auto-style5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Please Enter Valid Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;">&nbsp;</td>
                    <td style="width: 50%;">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;">&nbsp;</td>
                    <td style="width: 50%;">
                        <asp:Button ID="btnSave" runat="server" Text="Update Profile Info"
                            Width="200px" OnClick="btnSave_Click" Style="font-weight: 700"
                            BackColor="#1ed335" ForeColor="White" Font-Bold="true" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="200px" OnClick="btnCancel_Click" Style="color: #FFFFFF; font-weight: 700; background-color: #f17624" CausesValidation="false" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <hr />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailID"
                            ErrorMessage="Please Enter Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Style="font-weight: 700"></asp:RegularExpressionValidator>
                        <br />
                        <asp:Label ID="lblAlert" runat="server" Font-Names="Aharoni" ForeColor="Red" Style="font-weight: 700"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
