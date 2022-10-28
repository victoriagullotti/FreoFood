<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="ShoppingHeart.ContactUs" %>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="ShoppingHeart.ContactUs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Cafe Romma Fremantle || Contact Us</title>
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


    <style type="text/css">
        .auto-style {
            color: #456580;
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
                        <%--<li><a href="AboutUs.aspx"><i class="fa fa-info"></i>About</a></li>--%>
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
        <div class="border">
        </div>
        <table align="center" class="style1" style="border-bottom-style: ridge; border-width: thin; border-color: black">
            <tr>
                <td align="left" style="width: 30%">&nbsp;</td>
                <td align="center" style="width: 36%">&nbsp;</td>
                <td align="right" style="width: 33%">&nbsp;&nbsp;</td>
            </tr>
        </table>



        <div style="margin-top: 4em;">
            <table class="table table-bordered table-responsive" align="center" style="border: 1px ridge #999999; width: 35%;">
                <tr>
                    <td align="center" colspan="2">
                        <asp:Label ID="Label1" runat="server" Font-Names="Aharoni" ForeColor="White" Text=" Contact us"
                            Style="font-weight: 700; color: #456580; background-color: #FFFFFF; font-size: x-large;" BackColor="PaleGreen"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Name</span>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtContactName" runat="server" Width="99%"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td></td>
                    <td>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtContactName"
                            ErrorMessage="Please Enter Full Name" ForeColor="Red"></asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td>Phone No:</td>
                    <td>
                        <asp:TextBox ID="txtContactPhone" runat="server" Width="99%"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContactPhone"
                            ErrorMessage="Please Enter Valid Phone Number" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr>
                    <td>Email:
                    </td>
                    <td>
                        <asp:TextBox ID="txtContactEmail" runat="server" Width="99%"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtContactEmail"
                            ErrorMessage="Please Enter Valid Email" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Message:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="100%" TextMode="MultiLine" Width="99%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RequiredFieldValidator ID="MessageValidator" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="Please Enter Valid Message" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnRegister1" runat="server" Text="Send"
                            Width="99%" OnClick="btnRegister_Click" CssClass="btn-success" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnCancel1" runat="server" CssClass="btn-danger"
                            Text="Cancel" Width="99%" OnClick="btnCancel_Click" CausesValidation="false" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
