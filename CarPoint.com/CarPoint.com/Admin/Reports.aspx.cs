using CarPoint.com.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarPoint.com.Admin
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                IDBTest04Entities db = new IDBTest04Entities();
                

                CrystalReportProduct cr = new CrystalReportProduct();
                cr.SetDataSource(db.Product.Select(p => new
                {
                    ID = p.ID ,
                    Name = p.Name ?? "",
                    Price = p.Price ?? 0,
                    CategoryID = p.Category.ID ,
                    CategoryName = p.Category.Name ?? ""
                }).ToList());
                CrystalReportViewer1.ReportSource = cr;
            }
            
        }
    }
}