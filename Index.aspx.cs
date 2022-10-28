using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ShoppingHeart.BusinessLayer;//We are refering to BusinessLayer class here
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;


namespace ShoppingHeart
{
    public partial class Default : System.Web.UI.Page
    {
        /// <summary>
        /// On Page Load we are calling GetCategory and GetProducts with zero as paramter to get all products
        /// query string fid and sid are to show alerts on order placed failure and sucess
        /// They are executed when there is an order placed by the customer
        /// We are also checking the customer is logged in or not 
        /// If customer is logged in then we are showing some link buttons and showing the name of customer as welcome text
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ClearHeaders();
            Response.AppendHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            Response.AppendHeader("Pragma", "no-cache"); // HTTP 1.0.
            Response.AppendHeader("Expires", "0"); // Proxies.

            if (!IsPostBack)
            {
                lblCategoryName.Text = "Popular Products At Romma";
                GetCategory();
                GetCategory2();
                GetProducts2(0);//Get ALL Products 
                Calendar2.DayRender += new DayRenderEventHandler(this.DayRender);
                
            }
            lblAvailableStockAlert.Text = string.Empty;

            if (!string.IsNullOrEmpty(Request.QueryString["fid"]))
            {
                string TransactionNo = Request.QueryString["fid"];
                OrderPlacedStatus(TransactionNo,"fail");
                
            }
            if (!string.IsNullOrEmpty(Request.QueryString["sid"]))
            {
                string TransactionNo = Request.QueryString["sid"];
                OrderPlacedStatus(TransactionNo,"success");
               
            }

            if (!string.IsNullOrEmpty(Convert.ToString(Session["CustomerName"])))
            {
                lblCustomerName.Text = "Welcome : " + Convert.ToString(Session["CustomerName"]);
                btnRegister.Visible = false;
                btnLogin.Visible = false;
                btnLogout.Visible = true;
                btnMyProfile.Visible = true;
                btnMyShopping.Visible = true;
            }
            else
            {
                lblCustomerName.Text = "Welcome : ";
                btnRegister.Visible = true;
                btnLogin.Visible = true;
                btnLogout.Visible = false;
                btnMyProfile.Visible = false;
                btnMyShopping.Visible = false;
            }
            HighlightCartProducts();
            
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }

        /// <summary>
        /// on btnLogin_Click we are redireting the user to Login.aspx page so that user can login into the website
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        /// <summary>
        /// On btnLogout_Click  we are clearing the session and redirecting the user to Default.aspx page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["CustomerName"] = null;
            Session["CustomerID"] = null;
            Response.Redirect("~/Index.aspx");
        }

        /// <summary>
        /// On btnMyShopping_Click we are redireting the customer to MyShopping Page
        /// MyShopping Page shows all the orders which are placed by the customer and customer can also view all the details also 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMyShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MyShopping.aspx");
        }

        /// <summary>
        /// on btnMyProfile_Click we are redirecting the user to MyProfile.aspx page
        /// MyProfile Page shows all the customer info which customer can update by login into the website
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMyProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MyProfile.aspx");
        }

        /// <summary>
        /// This method will get all the product categories and show on default.aspx page
        /// It will bind all the data to datalist dlCategories
        /// Internally this method is calling GetCategories function of Business Layer
        /// ShoppingCart k = new ShoppingCart is an object of business layer
        /// </summary>
        private void GetCategory()
        {
            ShoppingCart k = new ShoppingCart();
            dlCategories.DataSource = null;
            dlCategories.DataSource = k.GetCategories();
            //dlCategories.RepeatColumns = 2;
            //dlCategories.RepeatDirection = RepeatDirection.Horizontal;  ///
            dlCategories.DataBind();

            
            dlCategories1.DataSource = null;
            //dlCategories1.DataSource = k.GetCategories();
            dlCategories1.RepeatColumns = 10;
            dlCategories1.RepeatDirection = RepeatDirection.Horizontal;  ///
            dlCategories1.DataBind();
        }
       
        private void GetProducts(int CategoryID)
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryID = CategoryID,
                SearchText=string.Empty
            };

            dlProducts.DataSource = null;
            dlProducts.DataSource = k.GetAllProducts(); 
            dlProducts.DataBind();
        }

        /// <summary>
        /// This method is called on the click of lbtnCategory on default.aspx page
        /// lbtnCategory is inside dlCategories
        /// Here we are getting the categoryID which is bind to lbtnCategory
        /// And based on CategoryID we are getting the Products in that Category
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtnCategory_Click(object sender, EventArgs e)
        {
            pnlMyCart.Visible = false;
            //pnl2.Visible = false;
            pnlProducts.Visible = true;
            int CategoryID = Convert.ToInt16((((Button)sender).CommandArgument));
            GetProducts(CategoryID);
            HighlightCartProducts();
            
        }
        protected void lbtnCategory_Click1(object sender, EventArgs e)
        {
            pnlMyCart.Visible = false;
            //pnl2.Visible = false;
            pnlProducts.Visible = true;
            int CategoryID = Convert.ToInt16((((LinkButton)sender).CommandArgument));
            GetProducts(CategoryID);
            HighlightCartProducts();

        }

        /// <summary>
        /// On btnAddToCart_Click we are getting ProductID from sender Object
        /// From the currentItem we are getting the available stock
        /// Then we are checking whether the cart is empty using MyCart session object
        /// if the cart is not empty we are converting the session to datatable and getting the product using getdata method 
        /// Before that we are cheking whether that product is already added to shopping cart or not
        /// If cart is empty then it is a first product to be added to cart then we are simply getting the details and adding it to cart and updating the MyCart session object
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString();
            string ProductQuantity = "1";

            DataListItem currentItem = (sender as Button).NamingContainer as DataListItem;
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;

            if (Session["MyCart"] != null)
            {
                DataTable dt = (DataTable)Session["MyCart"];
                var checkProdcut = dt.AsEnumerable().Where(r => r.Field<string>("ProductID") == ProductID);
                if (checkProdcut.Count() == 0)
                {
                    string query = "select * from Products where ProductID = " + ProductID + "";
                    DataTable dtProducts = GetData2(query);

                    DataRow dr = dt.NewRow();
                    dr["ProductID"] = ProductID;
                    dr["Name"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                    dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);
                    dr["Description1"] = Convert.ToString(dtProducts.Rows[0]["Description1"]);
                    dr["Description2"] = Convert.ToString(dtProducts.Rows[0]["Description2"]);
                    dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                    dr["ImageUrl"] = Convert.ToString(dtProducts.Rows[0]["ImageUrl"]);
                    dr["ProductQuantity"] = ProductQuantity;
                    dr["AvailableStock"] = lblAvailableStock.Text;
                    dt.Rows.Add(dr);

                    Session["MyCart"] = dt;
                    btnShoppingHeart.Text = dt.Rows.Count.ToString();
                }

            }
            else
            {

                string query = "select * from Products where ProductID = " + ProductID + "";
                DataTable dtProducts = GetData2(query);

                DataTable dt = new DataTable();

                dt.Columns.Add("ProductID", typeof(string));
                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("Description", typeof(string));
                dt.Columns.Add("Description1", typeof(string));
                dt.Columns.Add("Description2", typeof(string));
                dt.Columns.Add("Price", typeof(string));
                dt.Columns.Add("ImageUrl", typeof(string));
                dt.Columns.Add("ProductQuantity", typeof(string));
                dt.Columns.Add("AvailableStock", typeof(string));

                DataRow dr = dt.NewRow();
                dr["ProductID"] = ProductID;
                dr["Name"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);
                dr["Description1"] = Convert.ToString(dtProducts.Rows[0]["Description1"]);
                dr["Description2"] = Convert.ToString(dtProducts.Rows[0]["Description2"]);
                dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                dr["ImageUrl"] = Convert.ToString(dtProducts.Rows[0]["ImageUrl"]);
                dr["ProductQuantity"] = ProductQuantity;
                dr["AvailableStock"] = lblAvailableStock.Text;

                dt.Rows.Add(dr);

                Session["MyCart"] = dt;
                btnShoppingHeart.Text = dt.Rows.Count.ToString();

            }

            HighlightCartProducts();
        }

        /// <summary>
        /// This is linkbutton which is Main Logo on the Home Page
        /// On this linkbutton click we are hiding the unwanted panels and showing what is necessary
        /// And at the end we are getting all the products as we are passing 0 to GetProducts that means we want all the products
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lblLogo_Click(object sender, EventArgs e)
        {
            lblCategoryName.Text = "Products At Romma";
            lblProducts.Text = "Products";

            pnlCategories.Visible = true;
            pnlProducts.Visible = true;
            pnlMyCart.Visible = false;
            //pnl2.Visible = false;
            pnlCheckOut.Visible = false;
            pnlEmptyCart.Visible = false;
            pnlOrderPlacedSuccessfully.Visible = false;
            pnlTransactionFailed.Visible = false;

            GetProducts2(0);
            HighlightCartProducts();
            
        }

        /// <summary>
        /// This link button is used to show the couter on the default.aspx page
        /// On click of this button we are calling GetMyCart() Method and and IsUserLoggedIn() Method
        /// And we are chainging the text of two labels as shown in method
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnShoppingHeart_Click(object sender, EventArgs e)
        {
            GetMyCart();
            IsUserLoggedIn();
            lblCategoryName.Text = "Products in Your Shopping Cart.";
            lblProducts.Text = "Customer Details";
        }

        /// <summary>
        /// This is to check whether customer is logged in
        /// If customer session is active then we are getting all the details from database and showing
        /// Else we are displaying the text please login to place your order
        /// CustomerName and CustomerID are sessions related to Customer
        /// This sessions are created on customer login
        /// </summary>
        private void IsUserLoggedIn()
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["CustomerName"])))
            {
                btnPlaceOrder1.Enabled = true;
                btnPlaceOrder1.Text = "Place Order";

                ShoppingCart k = new ShoppingCart()
                {
                    CustomerID = Convert.ToInt32(Session["CustomerID"])
                };

                DataTable dtCustomerDetails = k.GetCustomerInfo();

                txtCustomerName.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerName"]);
                txtCustomerPhoneNo.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerPhoneNo"]);
                txtCustomerAddress.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerAddress"]);
                txtCustomerAddress1.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerAddress1"]);
                txtCustomerPostCode.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerPostCode"]);
                txtCustomerEmailID.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerEmailID"]);

            }
            else
            {
                btnPlaceOrder1.Enabled = false;
                btnPlaceOrder1.Text = "Login To Place Order";
            }
        }

        /// <summary>
        /// Here we are checking if MyCart is empty or not
        /// and then we are looping through each item in datalist dlProducts
        /// We are getting the productID from hiddenfield hfProductID
        /// </summary>
        private void HighlightCartProducts()
        {
            if (Session["MyCart"] != null)
            {
                DataTable dtProductsAddedToCart = (DataTable)Session["MyCart"];
                if (dtProductsAddedToCart.Rows.Count > 0)
                {
                    foreach (DataListItem item in dlProducts.Items)
                    {
                        HiddenField hfProductID = item.FindControl("hfProductID") as HiddenField;
                        if (dtProductsAddedToCart.AsEnumerable().Any(row => hfProductID.Value == row.Field<String>("ProductID")))
                        {
                            //item.BackColor = System.Drawing.Color.Red;

                            Button btnAddToCart = item.FindControl("btnAddToCart") as Button;
                            btnAddToCart.BackColor = System.Drawing.Color.Green;
                            btnAddToCart.Text = "Added To Cart";

                            Image imgGreenStar = item.FindControl("imgStar") as Image;
                            imgGreenStar.Visible = true;
                        }
                    }

                    btnShoppingHeart.Text = Convert.ToString(dtProductsAddedToCart.Rows.Count);
                }
                else
                {

                    btnShoppingHeart.Text = "0";
                }

            }
        }

        /// <summary>
        /// This event is fired when user wants to remove any item which is added to cart
        /// We are getting ProductID from the sender of the event button and then removing the product from session MyCart and then again updating the session MyCart
        /// At the end we are calling GetMyCart method to get the updated list of items in shoppingcart
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRemoveFromCart_Click(object sender, EventArgs e)
        {
            string ProductID = Convert.ToInt16((((Button)sender).CommandArgument)).ToString();
            if (Session["MyCart"] != null)
            {
                DataTable dt = (DataTable)Session["MyCart"];

                DataRow drr = dt.Select("ProductID=" + ProductID + " ").FirstOrDefault();

                if (drr != null)
                    dt.Rows.Remove(drr);

                Session["MyCart"] = dt;
            }

            GetMyCart();
        }

        /// <summary>
        /// This method is called when user wants to see the items in the cart
        /// If there are products already added to the cart then we get them from session MyCart
        /// If the customer is doing for first time and the cart is empty we create a new datatable
        /// </summary>
        private void GetMyCart()
        {
            DataTable dtProducts;
            if (Session["MyCart"] != null)
            {
                dtProducts = (DataTable)Session["MyCart"];
            }
            else
            {
                dtProducts = new DataTable();
            }

            if (dtProducts.Rows.Count > 0)
            {
                txtTotalProducts.Text = dtProducts.Rows.Count.ToString();
                btnShoppingHeart.Text = dtProducts.Rows.Count.ToString();
                dlCartProducts.DataSource = dtProducts;
                dlCartProducts.DataBind();
                UpdateTotalBill();


                pnlMyCart.Visible = true;
                //pnl2.Visible = true;
                pnlCheckOut.Visible = true;
                pnlEmptyCart.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
                pnlOrderPlacedSuccessfully.Visible = false;
                pnlTransactionFailed.Visible = false;

            }
            else
            {
                pnlEmptyCart.Visible = true;
                pnlMyCart.Visible = false;
                //pnl2.Visible = false;
                pnlCheckOut.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
                pnlOrderPlacedSuccessfully.Visible = false;
                pnlTransactionFailed.Visible = false;

                dlCartProducts.DataSource = null;
                dlCartProducts.DataBind();
                txtTotalProducts.Text = "0";
                txtTotalPrice.Text = "0";
                btnShoppingHeart.Text = "0";
            }
        }

        /// <summary>
        /// This event is fired when there is a change in the ProductQuantity in the shopping cart
        /// First we are getting the current item from datalist which user is trying increase quanity and find the productid from it
        /// Once all the updates are done to the product quantity in the cart we are updating the session MyCart
        /// Session MyCart contains all the details related to products in the shopping cart
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtProductQuantity_TextChanged(object sender, EventArgs e)
        {
            TextBox txtQuantity = (sender as TextBox);

            DataListItem currentItem = (sender as TextBox).NamingContainer as DataListItem;
            HiddenField ProductID = currentItem.FindControl("hfProductID") as HiddenField;
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;


            if (txtQuantity.Text == string.Empty || txtQuantity.Text == "0" || txtQuantity.Text == "1")
            {
                txtQuantity.Text = "1";
            }
            else
            {

                if (Session["MyCart"] != null)
                {

                    if (Convert.ToInt32(txtQuantity.Text) <= Convert.ToInt32(lblAvailableStock.Text))
                    {

                        DataTable dt = (DataTable)Session["MyCart"];

                        DataRow[] rows = dt.Select("ProductID='" + ProductID.Value + "'");

                        int index = dt.Rows.IndexOf(rows[0]);

                        dt.Rows[index]["ProductQuantity"] = txtQuantity.Text;

                        Session["MyCart"] = dt;
                    }
                    else
                    {
                        lblAvailableStockAlert.Text = "Alert :Product Buyout should not be More than AvailableStock!!";
                        txtQuantity.Text = "1";
                    }
                }
            }

            UpdateTotalBill();

        }

        /// <summary>
        /// In this method we are looping through all the items in datalist dlCartProducts and calculating the total Price
        /// dlCartProducts contains all the products which are added to the cart
        /// </summary>
        private void UpdateTotalBill()
        {
            long TotalPrice = 0;
            long TotalProducts = 0;
            foreach (DataListItem item in dlCartProducts.Items)
            {
                Label PriceLabel = item.FindControl("lblPrice") as Label;
                TextBox ProductQuantity = item.FindControl("txtProductQuantity") as TextBox;
                long ProductPrice = Convert.ToInt64(PriceLabel.Text) * Convert.ToInt64(ProductQuantity.Text);
                TotalPrice = TotalPrice + ProductPrice;
                TotalProducts = TotalProducts + Convert.ToInt32(ProductQuantity.Text);
            }
            txtTotalPrice.Text = Convert.ToString(TotalPrice);
            txtTotalProducts.Text = Convert.ToString(TotalProducts);
        }

        /// <summary>
        /// On Placed order here we have two options either paypal or other is cash on delivery
        /// If user selects Paypal then we are generating paypal url to redirect the user to paypal account to pay us money
        /// We are saving customer order and then we are saving all the customer products in that particular order
        /// Finally we are calling method OrderPlacedStatus for cash on delivery and Response.Redirect(redirectUrl);
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            string productids = string.Empty;
            DataTable dt;
            if (Session["MyCart"] != null)
            {

                string redirectUrl = "";

                //Mention URL to redirect content to paypal site
                redirectUrl += "https://www.paypal.com/cgi-bin/webscr?cmd=_cart&business=" + WebConfigurationManager.AppSettings["PaypalEmail"].ToString();
               
                //First name I assign static based on login details assign this value
                redirectUrl += "&first_name=" + txtCustomerName.Text;//correct
                redirectUrl += "&last_name=" + txtCustomerName.Text;
                redirectUrl += "&address1=" + txtCustomerAddress.Text;
                redirectUrl += "&address2=" + txtCustomerAddress1.Text;
                redirectUrl += "&city=" + txtCustomerAddress1.Text;
                redirectUrl +="&zip=" +txtCustomerPostCode.Text;
                redirectUrl += "&customer_phone=" + txtCustomerPhoneNo.Text;
                
                redirectUrl += "&email=" + txtCustomerEmailID.Text;    //correct
                
                redirectUrl += "&no_shipping=" + 1;

         
                //redirectUrl += "&business=something@gmail.com";

                redirectUrl += "&upload=1";

                dt = (DataTable)Session["MyCart"];


                ShoppingCart k = new ShoppingCart()
                {
                    CustomerID = Convert.ToInt32(Session["CustomerID"]),
                    TotalProducts = Convert.ToInt32(txtTotalProducts.Text),
                    TotalPrice = Convert.ToInt32(txtTotalPrice.Text),
                    PaymentMethod = rblPaymentMethod1.SelectedItem.Text,
                    ReceiverName= txtReceiverName1.Text,
                    ReceiverPhoneNo = txtReceiverPhoneNo1.Text,
                    EmailID1 = txtEmailID11.Text,
                    ReceiverAddress = txtRecipientAddress1.Text,
                    ReceiverSuburb= txtRecipientSuburb1.Text,
                    ReceiverPostCode = txtRecipientPostCode1.Text,
                    ReceiverMessage = txtMessage1.Text,
                    DeliveryTime = txtCalendar2.Text
                };

                DataTable dtResult = k.SaveCustomerOrder1();

                //ShoppingCart kr = new ShoppingCart()
                //{
                //    RecipeintName = txtReceiverName.Text,
                //    RecipeintEmailID = txtEmailID1.Text,
                //    RecipeintAddress = txtReceiverPhoneNo.Text,
                //    RecipeintAddress1 = txtRecipientSuburb.Text,
                //    RecipeintPostCode = txtRecipientPostCode.Text,
                //    RecipeintMessage = txtMessage.Text

                //};
                //DataTable dtResult1 = kr.Delivery();


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ShoppingCart SaveProducts = new ShoppingCart()
                    {
                        OrderNo = Convert.ToString(dtResult.Rows[0][0]),
                        ProductID = Convert.ToInt32(dt.Rows[i]["ProductID"]),
                        TotalProducts = Convert.ToInt32(dt.Rows[i]["ProductQuantity"])
                    };
                    SaveProducts.SaveCustomerProducts();

                    //Product Name
                    redirectUrl += "&item_name_" + (i + 1) + "=" + Convert.ToString(dt.Rows[i]["Name"]);


                    //Product Amount
                    redirectUrl += "&amount_" + (i + 1) + "=" + Convert.ToInt32(dt.Rows[i]["Price"]);

                    //Quantiy of product, Here statically added quantity 1
                    redirectUrl += "&quantity_" + (i + 1) + "=" + Convert.ToInt32(dt.Rows[i]["ProductQuantity"]);

                }


                //Shipping charges if any, or available or using shopping cart system
                //redirectUrl += "&shipping=12";

                //Handling charges if any, or available or using shopping cart system
                //redirectUrl += "&handling=5";

                //Tax charges if any, or available or using shopping cart system
                //redirectUrl += "&tax=5";


                redirectUrl += "&currency_code=AUD";
                //"https://www.paypal.com/cgi-bin/webscr?cmd=_cart&business=milanmason76@gmail.com&first_name=Name&upload=1&item_name_1=Test&amount_1=1&quantity_1=1&currency_code=AUD"
                //If transactioin has been successfully performed, redirect SuccessURL page- this page will be designed by developer
                redirectUrl += "&return=" + WebConfigurationManager.AppSettings["SuccessURL"].ToString() + "?sid=" + dtResult.Rows[0][0];

                //If transactioin has been failed, redirect FailedURL page- this page will be designed by developer
                redirectUrl += "&cancel_return=" + WebConfigurationManager.AppSettings["FailedURL"].ToString() + "?fid=" + dtResult.Rows[0][0]; ;


                if (rblPaymentMethod1.SelectedValue == "2")
                {
                    Response.Redirect(redirectUrl);
                }


                OrderPlacedStatus(Convert.ToString(dtResult.Rows[0][0]),"success");

    
            }


        }

        /// <summary>
        /// This Method is called to show the status of order after the order is placed 
        /// It is having two parameters OrderNo and OrderStatus 
        /// if status is fail then we are removing all the records from database for that particular order
        /// If status is sucess then we are showing sucess message and sending email to customer
        /// To send email, uncomment the SendOrderPlacedAlert Method
        /// </summary>
        /// <param name="OrderNo"></param>
        /// <param name="OrderStatus"></param>
        private void OrderPlacedStatus(string OrderNo,string OrderStatus)
        {
            ShoppingCart k = new ShoppingCart()
            {
                Flag = Convert.ToInt32(OrderNo)
            };

            DataTable dtCustomerDetails = k.GetOrdersList();

            if (dtCustomerDetails.Rows.Count > 0)
            {

                if (OrderStatus == "fail")
                {
                    Session["MyCart"] = null;
                    RollBackOrder(OrderNo);
                    GetMyCart();

                    pnlTransactionFailed.Visible = true;
                    pnlOrderPlacedSuccessfully.Visible = false;
                    pnlCheckOut.Visible = false;
                    pnlCategories.Visible = false;
                    pnlMyCart.Visible = false;
                    pnlEmptyCart.Visible = false;
                    pnlProducts.Visible = false;
                    pnlEmptyCart.Visible = false;

                    

                    txtCustomerAddress.Text = string.Empty;
                    txtCustomerAddress1.Text = string.Empty;
                    txtCustomerPostCode.Text = string.Empty;
                    txtCustomerEmailID.Text = string.Empty;
                    txtCustomerName.Text = string.Empty;
                    txtCustomerPhoneNo.Text = string.Empty;
                    txtTotalPrice.Text = "0";
                    txtTotalProducts.Text = "0";
                }

                if (OrderStatus == "success")
                {

                    Session["MyCart"] = null;
                    GetMyCart();

                    lblTransactionNo.Text = "Your Transactin No :-" + OrderNo;

                    pnlOrderPlacedSuccessfully.Visible = true;
                    pnlTransactionFailed.Visible = false;
                    pnlCheckOut.Visible = false;
                    pnlCategories.Visible = false;
                    pnlMyCart.Visible = false;
                    pnlEmptyCart.Visible = false;
                    pnlProducts.Visible = false;
                    pnlEmptyCart.Visible = false;

                    //SendOrderPlacedAlert(txtCustomerName.Text, txtCustomerEmailID.Text, OrderNo);

                    txtCustomerAddress.Text = string.Empty;
                    txtCustomerAddress1.Text = string.Empty;
                    txtCustomerPostCode.Text = string.Empty;
                    txtCustomerEmailID.Text = string.Empty;
                    txtCustomerName.Text = string.Empty;
                    txtCustomerPhoneNo.Text = string.Empty;
                    txtTotalPrice.Text = "0";
                    txtTotalProducts.Text = "0";
                }
            }
            else
            {
                Response.Redirect("~/Index.aspx");
            }
        }

        /// <summary>
        /// This method is called when there is failure in placing the order
        /// In this method we are rolling back the details and deleting all the information related to that order as it is a failed order
        /// </summary>
        /// <param name="OrderNo"></param>
        private void RollBackOrder(string OrderNo)
        {
            ShoppingCart k = new ShoppingCart()
            {
                OrderNo = OrderNo
            };

            k.RollBackOrder();
        }

        /// <summary>
        /// This Method is called when we want to send email to the customer once the order is placed successfully
        /// Here we are first preparing what to send in email using PopulateOrderEmailBody
        /// And then we are send email using the SendEmail method from EmailEngine Class
        /// </summary>
        /// <param name="CustomerName"></param>
        /// <param name="CustomerEmailID"></param>
        /// <param name="TransactionNo"></param>
        private void SendOrderPlacedAlert(string CustomerName, string CustomerEmailID, string TransactionNo)
        {
            string body = this.PopulateOrderEmailBody(CustomerName, TransactionNo);

            EmailEngine.SendEmail(CustomerEmailID, "Food Freo-- Your OrderDetails", body);
        }

        /// <summary>
        /// This called to prepare the email template 
        /// In this method we are making use of OrderTemplate.html page which have already created with its css and everything
        /// We are just adding the CustomerName and TransactionNo to the template and returning the body back to the caller of this method
        /// </summary>
        /// <param name="customerName"></param>
        /// <param name="transactionNo"></param>
        /// <returns></returns>
        private string PopulateOrderEmailBody(string customerName, string transactionNo)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/OrderTemplate.aspx")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{CustomerName}", customerName);
            body = body.Replace("{OrderNo}", transactionNo);
            //body = body.Replace("{TransactionURL}", "http://www.ShoppingHeart.com/TrackYourOrder.aspx?Id=" + transactionNo);
            //body = body.Replace("{TransactionURL}", "TrackYourOrder.aspx" + transactionNo);
            body = body.Replace("{TransactionURL}", "Login.aspx" + transactionNo);
            return body;
            
        }

        /// <summary>
        /// On btnRegister_Click we are redirecting the user to Register Page so that user can register on website
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
       

        /// <summary>
        /// On Search button click we are calling this btnSearch_Click method
        /// Here we are getting all the products based on searchtext 
        /// At the end we are binding the matching products to dlProducts
        /// CategoryID is 0 because we want to search all the products
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    ShoppingCart k = new ShoppingCart()
        //    {
        //        CategoryID = 0,
        //        SearchText = txtSearch.Text.Trim()
        //    };

        //    dlProducts.DataSource = k.GetAllProducts(); ;
        //    dlProducts.DataBind();
        //}

        public DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string Conn = WebConfigurationManager.ConnectionStrings["MyConn"].ConnectionString;
            SqlConnection con = new SqlConnection(Conn);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            da.Fill(dt);

            con.Close();
            return dt;
        }

        protected void imgBtnHome_Click(object sender, ImageClickEventArgs e)
        {
            lblCategoryName.Text = "Popular Products At Freo Food";
            lblProducts.Text = "Products";

            pnlCategories.Visible = true;
            pnlProducts.Visible = true;
            pnlMyCart.Visible = false;
            pnlCheckOut.Visible = false;
            pnlEmptyCart.Visible = false;
            pnlOrderPlacedSuccessfully.Visible = false;
            pnlTransactionFailed.Visible = false;

            GetProducts2(0);
            HighlightCartProducts();
        }

        protected void imgBtnProductPhoto_Click(object sender, ImageClickEventArgs e)
        {
           
            DataListItem currentItem = (sender as ImageButton).NamingContainer as DataListItem;

            HiddenField ProductID = currentItem.FindControl("hfProductID") as HiddenField;

            ShoppingCart k = new ShoppingCart()
            {
                ProductID = Convert.ToInt32(ProductID.Value)
            };

            DataTable dt = k.GetProductByID();
           
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;

            ScriptManager.RegisterStartupScript(UpdatePanel3, UpdatePanel3.GetType(), "alert", "ShowPopup();", true);

            this.lblProduct1.Text = Convert.ToString(dt.Rows[0]["Name"]);
            this.imgBtnPreview.ImageUrl = Convert.ToString(dt.Rows[0]["ImageUrl"]);
            this.txtDescription1.Text =Convert.ToString(dt.Rows[0]["Description"]);
            this.txtDescription2.Text = Convert.ToString(dt.Rows[0]["Description1"]);
            this.txtDescription3.Text = Convert.ToString(dt.Rows[0]["Description2"]);
            this.lblPriceOfProduct.Text= Convert.ToString(dt.Rows[0]["Price"]);
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GetProducts2(0);  //all products
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            //TableCell tc = e.Cell;
            //CalendarDay d = e.Day;
            //if (d.Date < DateTime.Now)
            //{
                DateTime now = DateTime.Now;
                //CalendarDateRange cdr = new CalendarDateRange(DateTime.MinValue, DataTime.Today);

                
                txtCalendar2.Text = Calendar2.SelectedDate.ToShortDateString();
                Calendar2.Visible = false;
            //}
        }

        protected void DayRender(Object sender, DayRenderEventArgs e)
        {

            // Change the background color of the days in the month
            // to yellow.
            if (!e.Day.IsOtherMonth && !e.Day.IsWeekend)
            {
                e.Cell.BackColor = System.Drawing.Color.Yellow;
            }

            // Add custom text to cell in the Calendar control.
            if (e.Day.Date.Day == 18)
            {
                e.Cell.Controls.Add(new LiteralControl("<br />Holiday"));
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
                txtReceiverName1.Text=txtCustomerName.Text;
                txtRecipientAddress1.Text=txtCustomerAddress.Text;
                txtRecipientSuburb1.Text=txtCustomerAddress1.Text;
                txtRecipientPostCode1.Text=txtCustomerPostCode.Text;
                txtEmailID11.Text=txtCustomerEmailID.Text;

                txtReceiverPhoneNo1.Text=txtCustomerPhoneNo.Text;
        }

        protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime dte = DateTime.Today;
            if(e.Day.Date <dte)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Red;
            }
        }

        
    }
}