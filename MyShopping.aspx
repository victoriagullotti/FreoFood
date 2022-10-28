<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyShopping.aspx.cs" Inherits="ShoppingHeart.MyShopping" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cafe Romma Fremantle || My Shoppings</title>
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
            font-size: x-large;
            line-height: 20px;
            margin: 0;
            padding: 0;
        }

        .auto-style13 {
            color: #FF6600;
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

            <table align="center" style="border: 1px ridge #999999; width: 952px;">
                <tr>
                    <td align="center">
                        <asp:Label ID="Label1" runat="server" Font-Names="Aharoni" ForeColor="White" Text="My  Shopping Details"
                            Style="font-weight: 700; font-size: large; color: #FF9900; background-color: #FFFFFF;" BackColor="Orange"></asp:Label>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:GridView ID="gvCustomerOrders" runat="server" BackColor="White" BorderColor="White"
                            BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None"
                            Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" ItemStyle-Width="100" />
                                <asp:BoundField DataField="CustomerName" HeaderText="Name" ItemStyle-Width="150" />
                                <asp:BoundField DataField="CustomerPhoneNo" HeaderText="PhoneNo" ItemStyle-Width="20" />
                                <asp:BoundField DataField="TotalProducts" HeaderText="Products" ItemStyle-Width="150" />
                                <asp:BoundField DataField="TotalPrice" HeaderText="Price" ItemStyle-Width="150" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("OrderNo", "~/TrackYourOrder.aspx?Id={0}") %>'
                                            Text="View Details" Target="_blank" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#594B9C" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#33276A" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="center"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
