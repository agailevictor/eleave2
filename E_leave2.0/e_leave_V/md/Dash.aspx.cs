﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using e_leave_C;
using System.Web.Services;

namespace e_leave_V.md
{
    public partial class Dash : System.Web.UI.Page
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
                if (Session["is_login"].ToString() == "f")
                {
                    Response.Redirect("~/404");
                }
            }
            else
            {
                Response.Redirect("~/Login");
            }
        }
        [WebMethod]
        public static List<Event> GetEvents_calendar(int rid)
        {
            List<Event> events = new List<Event>();
            bus_eleave_ugc1 bus = new bus_eleave_ugc1();
            bus.id = rid;
            DataTable dt = bus.fetch_holidays_cal();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Event _Event = new Event();
                _Event.EventID = int.Parse(dt.Rows[i]["event_id"].ToString());
                _Event.EventName = dt.Rows[i]["event_name"].ToString();
                _Event.EventDate = dt.Rows[i]["event_date"].ToString();
                _Event.color = dt.Rows[i]["event_color"].ToString();
                events.Add(_Event);
            }
            return events;
        }

        [WebMethod]
        public static List<leaveall> highcharts()
        {
            List<leaveall> ls = new List<leaveall>();
            bus_eleave_ugc1 bus = new bus_eleave_ugc1();
            DataTable dt = bus.fill_leaves_all_highcharts();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                leaveall _ls = new leaveall();
                _ls.Name = dt.Rows[i]["name"].ToString();
                _ls.aleave = float.Parse(dt.Rows[i]["aleave"].ToString());
                _ls.sleave = float.Parse(dt.Rows[i]["sleave"].ToString());
                _ls.mleave = float.Parse(dt.Rows[i]["mleave"].ToString());
                _ls.m2leave = float.Parse(dt.Rows[i]["m2leave"].ToString());
                _ls.pleave = float.Parse(dt.Rows[i]["pleave"].ToString());
                _ls.hleave = float.Parse(dt.Rows[i]["hleave"].ToString());
                ls.Add(_ls);
            }
            return ls;
        }
    }
}