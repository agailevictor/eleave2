using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_leave_V
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                check_multiple_login();
            }
        }
        public void check_multiple_login()
        {
            if (Session["is_login"] == null)
            {
                Response.Redirect("~/Login");
            }
            else
            {
                if (Session["is_login"].ToString() == "t")
                {
                    if (Session["role"].ToString() == "User")
                    {
                        Response.Redirect("~/user/dash");
                    }
                    else if (Session["role"].ToString() == "HR")
                    {
                        Response.Redirect("~/hr/hrdash");
                    }
                    else if (Session["role"].ToString() == "Management")
                    {
                        Response.Redirect("~/md/dash");
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
        }
    }
}