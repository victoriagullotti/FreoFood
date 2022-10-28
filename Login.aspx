<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShoppingHeart.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cafe Romma Fremantle | LogIn</title>
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
                        <span style="font-size:xx-large; color:#456580">Cafe Romma Fremantle</span></a><a href="Default.aspx" class="navbar-brand">
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
                        <asp:Label ID="Label1" runat="server" Font-Names="Aharoni" ForeColor="#0033CC" Text="Your Shopping Account"
                            Style="font-weight: 700; color: #FF9900; font-size: large;"></asp:Label>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style4">
                        <span class="auto-style1"><strong>Email  :</strong></span><b> </b>
                    </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtLoginId" runat="server" Width="200px" CssClass="auto-style2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLoginId"
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;" class="auto-style3">
                        <strong>Password :
                        </strong>
                    </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="200px" CssClass="auto-style2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 50%;">&nbsp;

                    </td>
                    <td style="width: 50%;">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Style="color: #FFFFFF; font-weight: 700; background-color: #33CC33" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" Style="color: #FFFFFF; font-weight: 700; background-color: #f17624" CausesValidation="false" />
                    </td>



                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <hr />
                        <asp:LinkButton ID="btnRegister" runat="server" OnClick="btnRegister_Click"
                            Style="font-weight: 700" CausesValidation="false">New User Register Here !!</asp:LinkButton>
                        <br />
                        <asp:Label ID="lblAlert" runat="server" Font-Names="Aharoni" ForeColor="Red" Style="font-weight: 700"></asp:Label>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtLoginId"
                            ErrorMessage="Please Enter Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Style="font-weight: 700"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
