using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_leave_V
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            logout();
        }
        protected void logout()
        {
            Session.Clear();
            Session["is_login"] = "f";
            Response.Redirect("~/Mainpage");
        }
    }
}