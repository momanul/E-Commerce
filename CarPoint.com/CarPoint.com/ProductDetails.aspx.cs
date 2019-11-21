using CarPoint.com.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace CarPoint.com
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        CatRepository catDB = new CatRepository();
        ProductRepository db = new ProductRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebSecurity.IsAuthenticated)
            {
                Response.Redirect("~/LoginPage");
            }
                BindData(2);
            lblCategory.Text = "Luxury Vehicles";
            if (IsPostBack)
            {
                int CategoryID = int.Parse(ddlCategory.SelectedValue);
                BindData(CategoryID);
                 
                lblCategory.Text = catDB.Get(CategoryID).Name;
            }
            
        }

        private void BindData(int id)
        {
            
            lvProduct.DataSource = db.ProductDetailWithCategory(id);
            lvProduct.DataBind();
        }
    }
}