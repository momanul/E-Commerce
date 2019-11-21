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
    public partial class AdminLayout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebSecurity.IsAuthenticated)
            {
                Response.Redirect("~/LoginPage");
            }
            if (!Roles.IsUserInRole(WebSecurity.CurrentUserName, "Admin"))
            {
                Response.Redirect("~/Default");
            }
        }

        protected void btnLog_Click(object sender, EventArgs e)
        {
            if (btnLog.Text == "Login")
            {
                Response.Redirect("~/LoginPage");
            }
            else
            {
                btnLog.Text = "Login";
                WebSecurity.Logout();
                Response.Redirect("~/LoginPage");
            }
        }
    }
}