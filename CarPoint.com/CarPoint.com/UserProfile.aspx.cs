using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace CarPoint.com
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebSecurity.IsAuthenticated)
            {
                Response.Redirect("~/LoginPage");
            }
            lblName.Text = WebSecurity.CurrentUserName; 
            lblUserID.Text = (WebSecurity.CurrentUserId).ToString() ;
            if (User.IsInRole("Admin"))
            {
                lblRole.Text = "Admin User";
            }
            else
            {
                lblRole.Text = "General User";
            }

        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ChangePassword");
        }
    }
}