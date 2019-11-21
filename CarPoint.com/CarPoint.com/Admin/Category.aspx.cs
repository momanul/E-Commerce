using CarPoint.com.DAL;
using CarPoint.com.DAL.VM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace CarPoint.com.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        CatRepository db = new CatRepository(); 
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (Session["Message"] != null)
            {
                Session.Remove("Message");
            }
            else
            {
                lblMessage.Text = "";
            }
            if (!IsPostBack)
            {
                BindGVData();
            }
        }

        private void BindGVData()
        {
            var data = db.GetAll().ToList();
            if (data.Count > 0)
            {
                gvCategory.DataSource = data;
                gvCategory.DataBind();
            }
            else
            {
                gvCategory.DataSource = null;
                gvCategory.DataBind();
            }
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            VMCategoryInfo newCat = new VMCategoryInfo();
            newCat.ParentCatID = (txtParentCatID.Text == "")? 0:long.Parse(txtParentCatID.Text?.Trim());
            newCat.Name = txtName.Text.Trim();
            newCat.DisplayOrder = (txtDisplayOrder.Text == "")? 0:int.Parse(txtDisplayOrder.Text?.Trim());
            newCat.IsActive = cbIsActive.Checked;
            if (newCat.Name == "")
            {
                RequiredFieldValidator1.ErrorMessage = "Please Enter the Category First!";
            }
            else
            {
                var data = db.Add(newCat);
                Session["Message"] = "New Category Added ID: " + data.ID + " Name: " + data.Name;
                lblMessage.Text = Session["Message"].ToString();
                clearData();
                BindGVData();
            }
          
        }

        private void clearData()
        {
            txtParentCatID.Text = "";
            txtName.Text = "";
            txtDisplayOrder.Text = "";
            cbIsActive.Checked = false;
        }

        protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ID = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Value);
            db.Remove(ID);
            BindGVData();
        }

     
        protected void gvCategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategory.EditIndex = -1;
            BindGVData();
        }

        protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategory.EditIndex = e.NewEditIndex;
            BindGVData();

        }

        protected void gvCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            VMCategoryInfo upCat = new VMCategoryInfo();
            upCat.ID = Convert.ToInt32(gvCategory.DataKeys[e.RowIndex].Value);
            upCat.ParentCatID = Convert.ToInt32(e.NewValues["ParentCatID"].ToString());
            upCat.Name = e.NewValues["Name"].ToString();
            upCat.DisplayOrder = Convert.ToInt32(e.NewValues["DisplayOrder"].ToString());
            upCat.IsActive = Convert.ToBoolean(e.NewValues["IsActive"]);

            db.Update(upCat);
            gvCategory.EditIndex = -1;
            BindGVData();
        }

        protected void gvCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Thread.Sleep(3000);
            gvCategory.PageIndex = e.NewPageIndex;
            BindGVData();
        }
    }
}