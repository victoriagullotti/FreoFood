<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderTemplate.aspx.cs" Inherits="ShoppingHeart.OrderTemplate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Cafe Romma Fremantle ||Your Order Details</title>
</head>
<body>
    <br />
    <label style=" font-size:40px;"> Roma Caffe Fremantle</label>
    
    <div style="border-top: 3px solid #00ff21">
        &nbsp;
    </div>
    <span style="font-family: Arial; font-size: 10pt">
        Hello <b>{CustomerName}</b>,<br />
        <br />
        We have Received Your Order.<br />
        <br />
        Your Order Number is<strong> {OrderNo}</strong><br />
        <br />
        To check your order status click on below link.<br />
        <br />
       <%-- <a href="{TransactionURL}">Click Here To Check Your Order Status</a>--%>

        
      <a href="Login.aspx">Click Here To Check Your Order Status</a>
        <br />
        <br />
        <br />
        Thanks<br />
       Cafee Romma
    </span>
</body>
</html>
