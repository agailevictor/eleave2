using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_leave_V.md
{
    public partial class MdMaster : System.Web.UI.MasterPage
    {
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
                    lbluser.Text = Session["name"].ToString();
                    SetCurrentPage();
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
        private void SetCurrentPage()
        {
            var pageName = GetPageName();

            switch (pageName)
            {
                case "Dash":
                    dash.Attributes["class"] = "active";
                    break;
                case "app_rej":
                    leaves.Attributes["class"] = "active subdrop";
                    leaves1.Attributes["class"] = "active open";
                    break;
                case "cancelappr":
                    leaves.Attributes["class"] = "active subdrop";
                    leaves2.Attributes["class"] = "active open";
                    break;
                case "listuser":
                    sett.Attributes["class"] = "active subdrop";
                    sett1.Attributes["class"] = "active open";
                    break;
                case "leave_logs":
                    sett.Attributes["class"] = "active subdrop";
                    sett2.Attributes["class"] = "active open";
                    break;
                case "leavetaken":
                    rep.Attributes["class"] = "active subdrop";
                    rep1.Attributes["class"] = "active open";
                    break;
                case "balleave":
                    rep.Attributes["class"] = "active subdrop";
                    rep2.Attributes["class"] = "active open";
                    break;
                case "cfleave":
                    rep.Attributes["class"] = "active subdrop";
                    rep3.Attributes["class"] = "active open";
                    break;
            }
        }
        private string GetPageName()
        {
            return Request.Url.ToString().Split('/').Last();
        }
    }
}