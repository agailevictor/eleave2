using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using e_leave_C;

namespace e_leave_V.hr
{
    public partial class leave_logs : System.Web.UI.Page
    {
        bus_eleave_ugc1 bus = new bus_eleave_ugc1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                checklogin();
            }
        }
        protected void checklogin()
        {
            if (Session["is_login"] != null)
            {

                if (Session["is_login"].ToString() == "t")
                {
                    fill_grid();

                }
                else
                {
                    Response.Redirect("~/404");
                }
            }
            else
            {
                Response.Redirect("~/Login");
            }
        }

        protected void fill_grid()
        {
            bus.userid = int.Parse(Session["user_id"].ToString());
            DataTable dt = bus.fill_logs();
            grd_log.DataSource = dt;
            grd_log.DataBind();
        }

        protected void grd_log_PreRender(object sender, EventArgs e)
        {
            if (grd_log.Rows.Count > 0)
            {
                grd_log.UseAccessibleHeader = true;
                grd_log.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}