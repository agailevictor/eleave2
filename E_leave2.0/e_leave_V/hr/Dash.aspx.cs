using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using e_leave_C;
using System.Web.Services;

namespace e_leave_V.hr
{
    public partial class Dash : System.Web.UI.Page
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
                if (Session["is_login"].ToString() == "f")
                {
                    Response.Redirect("~/404");
                }
                else
                {
                    checkcf();
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
            DataTable dt = bus.fetch_holidays();
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
        public static List<Leaves> fetchleave(int userid)
        {
            List<Leaves> leaves = new List<Leaves>();
            bus_eleave_ugc1 bus = new bus_eleave_ugc1();
            bus.userid = userid;
            DataTable dt = bus.fetch_leaves();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Leaves _Leaves = new Leaves();
                _Leaves.LeaveType = dt.Rows[i]["ltype"].ToString();
                _Leaves.LeaveCount = float.Parse(dt.Rows[i]["num"].ToString());
                _Leaves.LeavePerc = float.Parse(dt.Rows[i]["perc"].ToString());
                _Leaves.LeaveTot = float.Parse(dt.Rows[i]["tot"].ToString());
                leaves.Add(_Leaves);
            }
            return leaves;
        }
        [WebMethod]
        public static int updatealerts()
        {
            bus_eleave_ugc1 bus = new bus_eleave_ugc1();
            int r = bus.fetchalerts();
            return r;
        }

        [WebMethod]
        public static int updatealerts1(int userid)
        {
            bus_eleave_ugc1 bus = new bus_eleave_ugc1();
            bus.userid = userid;
            int r1 = bus.fetchalerts_user();
            return r1;
        }

        [WebMethod]
        public static int updatealerts2()
        {
            bus_eleave_ugc1 bus = new bus_eleave_ugc1();
            int r2 = bus.fetchalerts_cancel();
            return r2;
        }

        protected void checkcf()
        {
            int chk = bus.checkcf();
            if (chk == 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "cfnot();", true);
            }
            else
            {
            }
        }
    }
}