using CarPoint.com.DAL;
using CarPoint.com.DAL.Repository;
using CarPoint.com.DAL.VM;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace CarPoint.com.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        ProductRepository productDB = new ProductRepository();
        ProductMGRepository imgDB = new ProductMGRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (Session["Message"] != null)
            {
                lblMessage.Text = Session["Message"].ToString();
                Session.Remove("Message");
            }
            else { lblMessage.Text = ""; }

            if (!IsPostBack)
            {
                BindGVProdcut();
            }
            
        }

        private void BindGVProdcut()
        {
            gvProduct.DataSource = productDB.ProductDetails().ToList();
            gvProduct.DataBind();
        }
        
        protected void gvProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProduct.PageIndex = e.NewPageIndex;
            BindGVProdcut();
        }

        protected void gvProduct_RowEditing(object sender, GridViewEditEventArgs e)
        {
           
            gvProduct.EditIndex = e.NewEditIndex;
            BindGVProdcut();
        }

        protected void gvProduct_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            VMProductInfo p = new VMProductInfo();
            
            p.ID = Convert.ToInt32(gvProduct.DataKeys[e.RowIndex].Value);
            p.Brand = e.NewValues["Brand"].ToString();
            p.CategoryID = Int32.Parse(e.NewValues["CategoryID"].ToString());
            p.Name = e.NewValues["Name"].ToString();
            p.Details = e.NewValues["Details"].ToString();
            p.Price = double.Parse(e.NewValues["Price"].ToString());
            p.StockQuantity = double.Parse(e.NewValues["StockQuantity"].ToString());
            p.IsFavorite = Boolean.Parse(e.NewValues["IsFavorite"].ToString());
            p.IsActive = Boolean.Parse(e.NewValues["IsActive"].ToString());


            //FileUpload EditedImage = (FileUpload)gvProduct.Rows[e.RowIndex].FindControl("FileEditImgae");
            //FileUpload EditedThumnailImage = (FileUpload)gvProduct.Rows[e.RowIndex].FindControl("FileEditThumnailImage");

           

            //Image img = (Image)gvProduct.Rows[e.RowIndex].FindControl("UserImage");
            //    string Imagepath = img.ImageUrl;
            

           
            //    Image imgThumnail = (Image)gvProduct.Rows[e.RowIndex].FindControl("UserThumnailImage");
            //    string Thumnailpath = imgThumnail.ImageUrl;
            
            //VMProductMG Img = new VMProductMG();
            //var data = imgDB.GetEditItem(Convert.ToInt64(p.ID));
            //Img.ID = data.ID;
            //Img.ProductID = data.ProductID;
            //Img.ImgPath = Imagepath;
            //Img.ThumbnailPath = Thumnailpath;
            //Img.DisplayOrder = data.DisplayOrder;
            //Img.IsDefaultImg = data.IsDefaultImg;
            //imgDB.Update(Img);

            productDB.Update(p);
            gvProduct.EditIndex = -1;
            BindGVProdcut();
        }

        protected void gvProduct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProduct.EditIndex = -1;
            BindGVProdcut();
        }

        protected void gvProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var p = Convert.ToInt32(gvProduct.DataKeys[e.RowIndex].Value);
            // p = productID of the selected Item
            var i = gvProduct.Rows[e.RowIndex].FindControl("Image");
            Image imgDelete = (Image)i;
            Image imgThumnailDelete = (Image)gvProduct.Rows[e.RowIndex].FindControl("ThumnailImage");

            var data = imgDB.GetEditItem(Convert.ToInt64(p));
            ImageDeleteFromFolder(imgDelete.ImageUrl, imgThumnailDelete.ImageUrl);
            imgDB.Remove(data);

            productDB.Remove(p);

            
            // data = ProductMG table ID of selected ProductID;
            

            BindGVProdcut();
        }
        protected void ImageDeleteFromFolder(string ImageName, string ThumnailName)
        {
            
            string ImgPath = Server.MapPath(ImageName);

            FileInfo Imagefile = new FileInfo(ImgPath);
            if (Imagefile.Exists) //check file exsit or not  
            {
                Imagefile.Delete();

            }

            string ThumnailPath = Server.MapPath(ThumnailName);

            FileInfo Thumnailfile = new FileInfo(ThumnailPath);
            if (Thumnailfile.Exists) //check file exsit or not  
            {
                Thumnailfile.Delete();

            }
        }


        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("~/Admin/AddProduct.aspx");
        }
    }
}