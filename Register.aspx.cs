using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingHeart.BusinessLayer;
using System.Data;

namespace ShoppingHeart
{
    public partial class ConatctUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        /// <summary>
        /// On Register button click we are saving all the customer information into our database
        /// If the customer is registered successfully then we are creating sessions of customerID and CustomerName and redirecting the user to Default page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                // validate the Captcha to check we're not dealing with a bot
                bool isHuman = ExampleCaptcha.Validate(CaptchaCodeTextBox.Text);

                CaptchaCodeTextBox.Text = null; // clear previous user input

                if (!isHuman)
                {
                    // Captcha failed - need to inform user

                }
                else
                {
                    // Captcha passed - regiser user and redirect
                    ShoppingCart k = new ShoppingCart()
                    {
                        CustomerName = txtName.Text,
                        CustomerEmailID = txtEmailID.Text,
                        CustomerAddress = txtAddress.Text,
                        CustomerAddress1 = txtAddress1.Text,
                        CustomerPostCode = txtPostcode.Text,
                        CustomerPhoneNo = txtPhoneNo.Text,
                        CustomerPassword = txtPassword.Text
                    };

                    DataTable dtResult = k.Register();

                    if (Convert.ToInt32(dtResult.Rows[0]["CustomerID"]) > 0)
                    {
                        Session["CustomerID"] = dtResult.Rows[0]["CustomerID"];
                        Session["CustomerName"] = txtName.Text;
                        Response.Redirect("~/Index.aspx");
                    }
                }
            }
        }

        protected void imgShoppingBag_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Index.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Index.aspx");
        }
    }
}