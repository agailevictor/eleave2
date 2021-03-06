﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_leave_V.user
{
    public partial class UserMaster : System.Web.UI.MasterPage
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
                    //hide_show_menu();
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
                case "ListLeaves":
                    leaves.Attributes["class"] = "active subdrop";
                    leaves3.Attributes["class"] = "active open";
                    break;
                case "leaveapply":
                    leaves.Attributes["class"] = "active subdrop";
                    leaves3.Attributes["class"] = "active open";
                    break;
                case "cancel":
                    leaves.Attributes["class"] = "active subdrop";
                    leaves2.Attributes["class"] = "active open";
                    break;
            }
        }
        private string GetPageName()
        {
            return Request.Url.ToString().Split('/').Last();
        }

        //private void hide_show_menu()
        //{
        //    if (Session["is_lead"].ToString() == "N")
        //    {
        //        leaves4.Attributes["class"] = "hidden";
        //    }
        //    else
        //    {

        //    }
        //}
    }
}