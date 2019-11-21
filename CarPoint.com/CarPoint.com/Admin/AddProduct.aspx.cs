using CarPoint.com.DAL;
using CarPoint.com.DAL.Repository;
using CarPoint.com.DAL.VM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace CarPoint.com.Admin
{
    public partial class Add_Product : System.Web.UI.Page
    {
        ProductRepository ProductDB = new ProductRepository();
        ProductMGRepository ImageDB = new ProductMGRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDdlCategory();
            }
            
        }

        private void BindDdlCategory()
        {
            CatRepository catdb = new CatRepository();
            ddlCategory.DataSource = catdb.GetAll().ToList();
            ddlCategory.DataBind();
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            VMProductInfo product = new VMProductInfo();
            product.CategoryID = Convert.ToInt64(ddlCategory.SelectedValue);
            product.Brand = txtBrand.Text;
            product.Name = txtName.Text;
            product.Details = txtDetails.Text;
            product.Price = (txtPrice.Text == "") ? 0 : double.Parse(txtPrice.Text);
            product.StockQuantity = (txtStockQuantity.Text == "") ? 0 : double.Parse(txtStockQuantity.Text);
            product.IsFavorite = cbIsFavorite.Checked;
            product.IsActive = cbIsActive.Checked;
                        
            if (product.Name == "")
            {
                RequiredFieldValidator3.ErrorMessage = "(*)Mark Filde are Required";
            }
            else
            {
                var p = ProductDB.Add(product);
                
                
                VMProductMG productMG = new VMProductMG();
                productMG.ProductID = p.ID;
                var ImageFileName = FileDisplayImage.FileName.ToString();
                productMG.ImgPath = "~/Images/Image/" + ImageFileName ;
                //save the uploaded image in the Rote derectory Images/Image folder
                FileDisplayImage.SaveAs(MapPath("~/Images/Image/" + ImageFileName));

                var ThumnailFileName = FileThumnailImage.FileName.ToString();
                productMG.ThumbnailPath = "~/Images/Thumnail/" + ThumnailFileName;
                //save the uploaded image in the Rote derectory Images/Image folder
                FileThumnailImage.SaveAs(MapPath("~/Images/Thumnail/" + ThumnailFileName));
                var Img = ImageDB.Add(productMG);

                Session["Message"] = "New Product Added ID:" + p.ID + " Name :" + p.Name ;
                ClearData();
                Response.Redirect("~/Admin/Product.aspx");
            }
        }
        private void ClearData()
        {
            ddlCategory.SelectedIndex = 0;
            txtBrand.Text = "";
            txtName.Text = "";
            txtDetails.Text = "";
            txtPrice.Text = "";
            txtStockQuantity.Text = "";
            cbIsFavorite.Checked = false;
            cbIsActive.Checked = false;
        }
    }
}