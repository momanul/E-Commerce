using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace CarPoint.com.Admin
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            string UserRole = rbUserRole.Text.ToString();
            bool isUserExists = WebSecurity.UserExists(txtUserName.Text);
            if (isUserExists)
            {  
                lblMessage.Text = "User Name already exists";
            }
            else
            {
                //string fullName = (txtFName.Text + txtLName.Text).ToString();
                WebSecurity.CreateUserAndAccount(txtUserName.Text, txtPassword.Text);
                Roles.AddUserToRole(txtUserName.Text, rbUserRole.Text.ToString());
                Session["Message"] = /*fullName +*/ " You have Register successfully";
                ClearData();
                Response.Redirect("~/LoginPage");

            }
            
        }
        public void ClearData()
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
            rbUserRole.Text = "";
        }
    }
}