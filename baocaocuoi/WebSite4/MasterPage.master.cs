using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Form["cmdDangnhap"] != null)
        {
            Response.ContentType = "text/html;charset=utf-8";

            if (Request.Form["cmdDangnhap"] != null)
            {
                Response.ContentType = "text/html;charset=utf-8";
                String user = Request.Form["txtuser"];
                //user = user.ToLower();
                String pass = Request.Form["txtpass"];

                String strConn = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
                SqlConnection conn = new SqlConnection(strConn);
                conn.Open();
                string sql = "select ID from THANHVIEN where TaiKhoan='" + user + "' and  MatKhau='" + pass + "'";
                try
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    string kq = cmd.ExecuteScalar().ToString();
                    if (kq != null)
                    {

                        Session["user"] = user;
                        Session["id"] = kq;
                        Session["error"] = null;
                        Session["n"] = 0;
                    }
                    else
                        Session["error"] = "Nhập sai user hoặc pass";
                }
                catch
                {
                    Session["error"] = "Nhập sai user hoặc pass";
                }
            }
            //string url = Session["url"].ToString();
            // if (Request.Form["url_donhang"] != null)
            // url = Request.Form["url_donhang"].ToString();

            //Response.Write(Session["url"].ToString());
            // Response.Redirect(url);
        }
    }
}

    


