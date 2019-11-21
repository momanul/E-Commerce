using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace CarPoint.com
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebSecurity.IsAuthenticated)
            {
                btnLog.Text = "Login";
            }
            else
            {
                btnLog.Text = "Logout";
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