using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;

using System.Data;
using ShoppingHeart.BusinessLayer;//We are refering to BusinessLayer class here


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
        protected void Page_Load1(object sender, EventArgs e)
        {
            //No Storing Cache
            /*Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now);
            Response.Cache.SetNoServerCaching();
            Response.Cache.SetNoStore();*/

            Response.ClearHeaders();
            Response.AppendHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
            Response.AppendHeader("Pragma", "no-cache");
            Response.AppendHeader("Expires", "0");

            if (!IsPostBack)
            {
                
                GetCategory2();

                GetProducts2(0);//Get ALL Products 
            }
           
        }

        /// <summary>
        /// This method will get all the product categories and show on default.aspx page
        /// It will bind all the data to datalist dlCategories
        /// Internally this method is calling GetCategories function of Business Layer
        /// ShoppingCart k = new ShoppingCart is an object of business layer
        /// </summary>
        private void GetCategory2()
        {
            ShoppingCart k = new ShoppingCart();
            //dlCategories.DataSource = null;
            //dlCategories.DataSource = k.GetCategories();
            ////dlCategories.RepeatColumns = 2;
            ////dlCategories.RepeatDirection = RepeatDirection.Horizontal;  ///
            //dlCategories.DataBind();


            //dlCategories1.DataSource = null;
            ////dlCategories1.DataSource = k.GetCategories();
            //dlCategories1.RepeatColumns = 10;
            //dlCategories1.RepeatDirection = RepeatDirection.Horizontal;  ///
            //dlCategories1.DataBind();
        }
       

       
        private void GetProducts2(int CategoryID)
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryID = CategoryID,
                SearchText = string.Empty
            };

            dlProducts.DataSource = null;
            
            dlProducts.DataSource = k.GetAllProducts();
            dlProducts.DataBind();
        }

       

        public DataTable GetData2(string query)
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

        //Redirecting when image click to Index page
        protected void imgBtnProductPhoto_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Index.aspx");
        }
    }
}