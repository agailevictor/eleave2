﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using e_leave_C;

namespace e_leave_V.hr
{
    public partial class holidays_upload : System.Web.UI.Page
    {
        bus_eleave_ugc1 bus = new bus_eleave_ugc1();
        datamapper datamapper = new datamapper();
        WebClient client = new WebClient();
        int CHK_NULL, CHK_EF, r1, r2;
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
                    fill_region();
                }
            }
            else
            {
                Response.Redirect("~/Login");
            }
        }

        protected void fill_region()
        {
            DataTable dt1 = bus.fillregion();
            if (dt1.Rows.Count > 0)
            {
                ddlreg.DataSource = dt1;
                ddlreg.DataBind();
                ddlreg.Items.Insert(0, new ListItem("-----SELECT-----", ""));
            }
            else
            {

            }
        }


        protected void btnreq_hr_Click(object sender, EventArgs e)
        {
            if (ddlreg.SelectedIndex != 0 && txtholidays_hr.Text != "")
            {
                if (ddlreg.SelectedItem.Text == "Cochin")
                {

                    CHK_NULL = 0;
                    CHK_EF = 0;
                    DateTime dt;
                    DataTable a = datamapper.GetDataTable(txtholidays_hr.Text, true);
                    if (a.Rows.Count > 0)
                    {
                        for (int i = 0; i < a.Rows.Count; i++)
                        {
                            if (a.Rows[i][0].ToString().Trim() == "")
                            {
                                CHK_NULL = 1;
                                break;
                            }
                            else
                            {
                                bus.event_name = a.Rows[i][0].ToString();
                            }
                            if (a.Rows[i][1].ToString().Trim() == "")
                            {
                                CHK_NULL = 1;
                                break;
                            }
                            else
                            {
                                bool success = DateTime.TryParseExact(a.Rows[i][1].ToString(), "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dt);
                                if (success)
                                {
                                    bus.event_date = dt;
                                }
                                else
                                {
                                    CHK_EF = 1;
                                }

                            }


                        }
                        if (CHK_NULL == 0 && CHK_EF == 0)
                        {
                            int count = 0;
                            int countd = 0;
                            int counts = 0;

                            for (int i = 0; i < a.Rows.Count; i++)
                            {

                                bus.event_name = a.Rows[i][0].ToString();
                                bus.event_date = DateTime.Parse(a.Rows[i][1].ToString());
                                bus.event_color = "#ff3232";
                                int r = bus.upload_holidays();
                                if (r == 1)
                                {
                                    countd++;
                                }
                                else if (r == 2)
                                {
                                    counts++;
                                    count = counts - countd;
                                }
                                else
                                {

                                }
                            }
                            GetAllSatAndSuns_SS();
                            txtholidays_hr.Text = "";
                            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "success();", true);
                        }
                        else
                        {
                            txtholidays_hr.Text = "";
                            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "error();", true);
                        }
                    }
                }
                else
                {
                    CHK_NULL = 0;
                    CHK_EF = 0;
                    DateTime dt;
                    DataTable a = datamapper.GetDataTable(txtholidays_hr.Text, true);
                    if (a.Rows.Count > 0)
                    {
                        for (int i = 0; i < a.Rows.Count; i++)
                        {
                            if (a.Rows[i][0].ToString().Trim() == "")
                            {
                                CHK_NULL = 1;
                                break;
                            }
                            else
                            {
                                bus.event_name = a.Rows[i][0].ToString();
                            }
                            if (a.Rows[i][1].ToString().Trim() == "")
                            {
                                CHK_NULL = 1;
                                break;
                            }
                            else
                            {
                                bool success = DateTime.TryParseExact(a.Rows[i][1].ToString(), "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dt);
                                if (success)
                                {
                                    bus.event_date = dt;
                                }
                                else
                                {
                                    CHK_EF = 1;
                                }

                            }


                        }
                        if (CHK_NULL == 0 && CHK_EF == 0)
                        {
                            int count = 0;
                            int countd = 0;
                            int counts = 0;

                            for (int i = 0; i < a.Rows.Count; i++)
                            {

                                bus.event_name = a.Rows[i][0].ToString();
                                bus.event_date = DateTime.Parse(a.Rows[i][1].ToString());
                                bus.event_color = "#ff3232";
                                int r = bus.upload_holidays_malaysia();
                                if (r == 1)
                                {
                                    countd++;
                                }
                                else if (r == 2)
                                {
                                    counts++;
                                    count = counts - countd;
                                }
                                else
                                {

                                }
                            }
                            GetAllSatAndSuns_HS();
                            txtholidays_hr.Text = "";
                            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "success();", true);
                        }
                        else
                        {
                            txtholidays_hr.Text = "";
                            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "error();", true);
                        }
                    }

                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "errornoval();", true);
            }
        }

        public void GetAllSatAndSuns_HS()
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
                r2 = bus.upload_holidays_malaysia();
                Date = Date.AddDays(1);
            }
        }

        public void GetAllSatAndSuns_SS()
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
                r1 = bus.upload_holidays();
                Date = Date.AddDays(1);
            }
        }

        protected void lnkdownloadtemp_Click(object sender, EventArgs e)
        {
            string Path = "~/uploads/Holidays - Template_12-06-17_01;47;41.xlsx";
            string T_path = Server.MapPath(Path);
            Byte[] buffer = client.DownloadData(T_path);
            if (buffer != null)
            {
                Response.AddHeader("content-disposition", "attachment;filename=Holidays_Template.xlsx");
                Response.Charset = "";
                Response.ContentType = "application/vnd.xlsx";
                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }
        }
    }
}