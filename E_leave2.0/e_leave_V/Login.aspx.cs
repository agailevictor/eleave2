using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using e_leave_C;
using System.Text;
using System.Security.Cryptography;

namespace e_leave_V
{
    public partial class Login : System.Web.UI.Page
    {
        bus_eleave_ugc1 bus = new bus_eleave_ugc1();
        string hashed;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                invalid.Visible = false;
                username.Focus();
            }
        }

        protected void logi_Click(object sender, EventArgs e)
        {
            if (username.Text != "" && password.Text != "")
            {
                hashed = MD5Hash(password.Text.Trim());
                if (hashed != "")
                {
                    bus.user_name = username.Text;
                    bus.password = hashed;
                    int res = bus.check_login();
                    if (res == 1)
                    {
                        invalid.Visible = false;
                        set_sessions();

                    }
                    else
                    {
                        username.Text = "";
                        password.Text = "";
                        invalid.Visible = true;
                    }
                }
                else
                {
                    username.Text = "";
                    password.Text = "";
                    invalid.Visible = true;
                }
            }
            else
            {
            }
        }
        public void set_sessions()
        {
            bus.user_name = username.Text;
            DataTable dt = bus.fetch_userdetails();
            if (dt.Rows.Count > 0)
            {
                Session["user_id"] = dt.Rows[0][0].ToString();
                Session["name"] = dt.Rows[0][1].ToString();
                Session["gender"] = dt.Rows[0][2].ToString();
                Session["doj"] = dt.Rows[0][3].ToString();
                Session["dep"] = dt.Rows[0][4].ToString();
                Session["des"] = dt.Rows[0][5].ToString();
                Session["role"] = dt.Rows[0][6].ToString();
                Session["region"] = dt.Rows[0][7].ToString();
                Session["is_login"] = "t";
                if (Session["role"].ToString() == "User")
                {
                    Response.Redirect("~/user/Dash");
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
            }
        }

        public static string MD5Hash(string text)
        {
            MD5 md5 = new MD5CryptoServiceProvider();

            //compute hash from the bytes of text
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

            //get hash result after compute it
            byte[] result = md5.Hash;

            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                //change it into 2 hexadecimal digits
                //for each byte
                strBuilder.Append(result[i].ToString("x2"));
            }

            return strBuilder.ToString();
        }
    }
}