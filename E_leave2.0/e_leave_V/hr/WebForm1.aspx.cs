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
    public partial class WebForm1 : System.Web.UI.Page
    {
        bus_eleave_ugc1 bus = new bus_eleave_ugc1();
        int r;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAllSatAndSuns();
            }
        }
        public void GetAllSatAndSuns()
        {
            int year = DateTime.Now.Year;
            DateTime Date = new DateTime(year, 1, 1);
            while (Date.Year == year)
            {
                if ((Date.DayOfWeek == DayOfWeek.Saturday))
                {
                    bus.event_name = "Saturday";
                    bus.event_date = Date;
                    bus.event_color = "#35aa47";
                }
                else if ((Date.DayOfWeek == DayOfWeek.Sunday))
                {
                    bus.event_name = "Sunday";
                    bus.event_date = Date;
                    bus.event_color = "#35aa47";
                }
                r = bus.upload_holidays_malaysia();
                Date = Date.AddDays(1);
            }
        }
    }
}