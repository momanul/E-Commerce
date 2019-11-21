using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace CarPoint.com
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Message"] != null)
            {
                lblReg.Text = Session["Message"].ToString();
                Session.Remove("Message");
            }
            else
            {
                lblReg.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //bool Ischecked = bool.Parse(cbSaveUser.Text);
            bool isAuthenticated = WebSecurity.Login(txtUserName.Text, txtPassword.Text, true);
            ClearData();
            if (isAuthenticated)
            {
                string returnUrl = Request.QueryString["ReturnUrl"];
                if (returnUrl == null) returnUrl = "~/ProductDetails";
                Response.Redirect(returnUrl);
            }
            else
            {
                lblMessage.Text = "Username or Password are invalid!.";                
            }
        }
        private void ClearData()
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration");
        }
    }
}