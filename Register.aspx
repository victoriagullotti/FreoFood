<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ShoppingHeart.ConatctUs" %>
<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI" TagPrefix="BotDetect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cafe Romma Fremantle |Register</title>
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
        .auto-style12 {
            float: left;
            font-size: 18px;
            line-height: 20px;
            margin: 0;
            padding: 0;
        }

        .auto-style13 {
            color: #CC6600;
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
        <table align="center" class="style1" style="border-bottom-style: ridge; border-width: thin; border-color: black">
            <tr>
                <td align="left" style="width: 30%">&nbsp;</td>
                <td align="center" style="width: 36%">&nbsp;</td>
                <td align="right" style="width: 33%">&nbsp;&nbsp;</td>
            </tr>
        </table>



        <div style="margin-top: 80px;">

            <table align="center" style="border: 1px ridge #999999; width: 450px;">
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="Label1" runat="server" Font-Names="Aharoni" ForeColor="White" Text=" Register with us"
                            Style="font-weight: 700; color: #FF9900; background-color: #FFFFFF; font-size: large;" BackColor="Orange"></asp:Label>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style1">Full Name :
                    </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtName" runat="server" Width="200px" CssClass="auto-style2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                            ErrorMessage="Please Enter Full Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="center" style="width: 50%;" class="auto-style1">&nbsp;
                    Phone No :</td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtPhoneNo" runat="server" Width="200px" MaxLength="10" CssClass="auto-style2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhoneNo"
                            ErrorMessage="Please Enter Valid Phone Number" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style1">Street:
                    </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtAddress" runat="server" Width="200px" CssClass="auto-style2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress"
                            ErrorMessage="Please Enter Your Address" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style1">Suburb:
                    </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtAddress1" runat="server" Width="200px" CssClass="auto-style2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress1"
                            ErrorMessage="Please Enter Your Suburb" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style1">PostCode :
                    </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtPostcode" runat="server" Width="200px" CssClass="auto-style2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                            ErrorMessage="Please Enter Your Postcode" ForeColor="Red" ControlToValidate="txtPostCode"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style1">Email :
                    </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtEmailID" runat="server" Width="200px" CssClass="auto-style2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmailID"
                            ErrorMessage="Please Enter Valid Email" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style1">Password</td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="200px" CssClass="auto-style2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style1">Confirm Password :</td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtCPassword" runat="server" TextMode="Password" Width="200px" CssClass="auto-style2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCPassword"
                            ErrorMessage="Your Passwords do not match" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <BotDetect:WebFormsCaptcha ID="ExampleCaptcha" runat="server" />
                        <asp:TextBox ID="CaptchaCodeTextBox" runat="server" />
                </tr>
                <tr>
                    <td align="center" style="width: 50%;">&nbsp;</td>
                    <td style="width: 50%;">
                        <asp:Button ID="btnRegister" runat="server" Text="Register"
                            Width="200px" OnClick="btnRegister_Click" Style="font-weight: 700; color: #FFFFFF; background-color: #33CC33;" />
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
    <footer><span><strong>© DIGITAL MANIFEST><strong>© DIGITAL MANIFEST</strong></span></footer>
</body>
</html>


