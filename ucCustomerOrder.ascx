<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCustomerOrder.ascx.cs"
    Inherits="ShoppingHeart.ucCustomerOrder" %>
<style type="text/css">
    .styleOrderDetails
    {
        width: 600px;
        border: 1px ridge red;
    }


    .auto-style1 {
        color: #009900;
    }
    .auto-style2 {
        color: #009933;
    }


</style>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
        rel="stylesheet" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>
        <div align="center">
            <asp:Label ID="lblTransactionNo" runat="server" Style="font-weight: 700; color: #009933;" Text="Transaction No :"></asp:Label>
            <asp:TextBox ID="txtTransactionNo" runat="server" Width="90px"></asp:TextBox>
            <asp:Button ID="btnGo" runat="server" Style="font-weight: 700" Text="Go" Width="36px"
                OnClick="btnGo_Click" />
            &nbsp;</div>
        <br />
        <table align="center" cellspacing="1" style="width: 100%; background-color: #FFFFFF;">
            <tr>
                <td align="center">
                    <hr />
                    <asp:RadioButtonList ID="rblOrderDetails" runat="server" RepeatDirection="Horizontal"
                        AutoPostBack="True" OnSelectedIndexChanged="rblOrderDetails_SelectedIndexChanged" ForeColor="Green">
                        <asp:ListItem Value="1" Selected="True">CustomerDetails</asp:ListItem>
                        <asp:ListItem Value="2">ProductDetails</asp:ListItem>
                        <asp:ListItem Value="3">DeliveryStatus</asp:ListItem>
                    </asp:RadioButtonList>
                    <hr />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Panel ID="Panel1" runat="server"><!--This one is ok-->
                        <table class="styleOrderDetails">
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/customerNew.jpg" Height="150px" />
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px;">
                                    Name :
                                </td>
                                <td align="left" style="width: 50%;">
                                    <asp:Label ID="lblCustomerName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px;">
                                    EmailId :
                                </td>
                                <td align="left" style="width: 50%;">
                                    <asp:Label ID="lblCustomerEmailId" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px;">
                                    PhoneNo :
                                </td>
                                <td align="left" style="width: 50%;">
                                    <asp:Label ID="lblCustomerPhoneNo" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px;">
                                    TotalProducts :
                                </td>
                                <td align="left" style="width: 50%;">
                                    <asp:Label ID="lblTotalProducts" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px;">
                                    TotalPrice :
                                </td>
                                <td align="left" style="width: 50%;">
                                    <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px;" valign="top">
                                    Address :
                                </td>
                                <td align="left" style="width: 50%;">
                                    <asp:TextBox ID="txtCustomerAddress" runat="server" Height="73px" ReadOnly="True"
                                        TextMode="MultiLine" Width="260px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 50%; padding-right: 30px;" valign="top">
                                    PaymentMethod :
                                </td>
                                <td align="left" style="width: 50%;">
                                    <asp:Label ID="lblPayementMethod" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 50%;">
                                    &nbsp;
                                </td>
                                <td align="left" style="width: 50%;">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 50%;">
                                    &nbsp;</td>
                                <td align="left" style="width: 50%;">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server">
                        <table class="styleOrderDetails">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/CustomerIcon.png" Height="150px" />
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:DataList ID="dlProducts" runat="server" Font-Bold="False" Font-Italic="False"
                                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False" RepeatColumns="3"
                                        Width="500px">
                                        <ItemTemplate>
                                            <div align="center">
                                                <table cellspacing="1" class="style4" style="border: 1px ridge #009900">
                                                    <tr>
                                                        <td style="border-bottom-style: ridge; border-width: 1px; border-color: #009900" colspan="2">
                                                            <asp:Label ID="lblProductName" runat="server" Style="font-weight: 700" Text='<%# Eval("Name")%>' ForeColor="Green"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <img alt="" src='<%# Eval("ImageUrl")%>' runat="server" id="imgProductPhoto" style="border: ridge 1px #009900;
                                                                width: 173px; height: 160px;" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td >
                                                            Price:<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price")%>' ForeColor="Green" Font-Bold="true"></asp:Label>
                                                        </td>
                                                         <td>
                                                            Quantity:<asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("ProductQuantity")%>' ForeColor="Green" Font-Bold="true"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="DELIVERY INFORMATION- Recipent Details" style="font-size: medium; color: #009900; font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                            <tr>

                                
                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: red"><span class="auto-style1"><strong>Recipient :</strong></span>
                                     <asp:Label ID="lblReceiverName" runat="server" Style="font-weight: 700" Text='<%# Eval("ReceiverName")%>'></asp:Label>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: red"><span class="auto-style1"><strong>Phone No :</strong></span>
                                     <asp:Label ID="lblReceiverPhoneNo" runat="server" Style="font-weight: 700" Text='<%# Eval("ReceiverPhoneNo")%>'></asp:Label>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: red"><span class="auto-style2"><strong>Email :</strong></span>
                                     <asp:Label ID="lblEmailId" runat="server" Style="font-weight: 700" Text='<%# Eval("EmailId")%>'></asp:Label>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: red"> <span class="auto-style2"><strong>Address :</strong></span>
                                     <asp:Label ID="lblReceiverAddress" runat="server" Style="font-weight: 700" Text='<%# Eval("ReceiverAddress")%>'></asp:Label>
                                    &nbsp;</td>
                            </tr>
                             <tr>
                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: red"> <span class="auto-style2"><strong>Suburb : </strong></span>
                                     <asp:Label ID="lblReceiverSuburb" runat="server" Style="font-weight: 700" Text='<%# Eval("ReceiverSuburb")%>'></asp:Label>
                                    &nbsp;</td>
                            </tr>
                            <tr> 
                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: red"><span class="auto-style2"><strong>Post Code :</strong></span>
                                     <asp:Label ID="lblReceiverPostCode" runat="server" Style="font-weight: 700" Text='<%# Eval("ReceiverPostCode")%>'></asp:Label>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: red"><span class="auto-style2"><strong>Message on the Card :</strong></span>
                                     <asp:Label ID="lblReceiverMessage" runat="server" Style="font-weight: 700" Text='<%# Eval("ReceiverMessage")%>'></asp:Label>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                     <span class="auto-style2"><strong>Delivery Date :</strong></span><asp:Label ID="lblDeliveryDate" runat="server" Style="font-weight: 700" Text='<%# Eval("DeliveryTime")%>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="Panel3" runat="server">
                        <table class="styleOrderDetails">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/deliveryWithQuestion.png" Height="150px" />
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="gvOrderStatus" runat="server" CellPadding="4" ForeColor="Black"
                                        GridLines="Horizontal" Width="100%" BackColor="White" 
                                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <RowStyle HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:TextBox ID="txtStatus" runat="server" Width="300px"></asp:TextBox>
                                    &nbsp;<asp:Button ID="btnAdd" runat="server" Style="font-weight: 700; height: 26px;" Text="Add"
                                        Width="36px" OnClick="btnAdd_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="Panel4" runat="server">
                        <table class="styleOrderDetails">
                            <tr>
                                <td align="center">
                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/NoResults.jpg" Height="150px" />
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel><br /><hr />
<footer><span><strong>©&nbsp; DIGITAL MANIFEST</strong></span></footer>
