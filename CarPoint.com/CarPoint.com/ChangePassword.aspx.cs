using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace CarPoint.com
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebSecurity.IsAuthenticated)
            {
                Response.Redirect("~/LoginPage");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            bool isPasswordChanged = WebSecurity.ChangePassword(WebSecurity.CurrentUserName,
               txtOldePass.Text, txtNewPass.Text);
            if (isPasswordChanged)
            {
                lblMessage.Text = "Password Change successfull";
                Response.Redirect("~/ChangePassword");
                
            }
            else
            {
               lblMessage.Text = "Old Password is not correct!";
            }
        }
    }
}