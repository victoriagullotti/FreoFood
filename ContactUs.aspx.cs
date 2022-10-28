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
    public partial class ContactUs : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{

        //}

        /// <summary>
        /// On Register button click we are saving all the customer information into our database
        /// If the customer is registered successfully then we are creating sessions of customerID and CustomerName and redirecting the user to Default page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //Database
            ShoppingCart k = new ShoppingCart()
            {
                CustomerName5 = txtContactName.Text,
                CustomerEmailID5 = txtContactEmail.Text,
                CustomerPhoneNo5 = txtContactPhone.Text,
                ReadMe = TextBox1.Text,
                WhenSent= DateTime.Now
                
            };

            DataTable dtResult = k.ContactUs();

       
                Response.Redirect("~/Default.aspx");
        
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}