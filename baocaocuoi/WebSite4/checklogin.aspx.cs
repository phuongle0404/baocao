using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
public partial class checklogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["cmdDangnhap"] != null)
        {
            String user = Request.Form["Name"];
            String pass = Request.Form["Password"];

            String strConn = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();
            string sql = "select count(*) from Admin where [user]=@taikhoan and  password=@matkhau";
            SqlCommand cmd = new SqlCommand(sql, conn);

            SqlParameter par = cmd.CreateParameter();
            par.ParameterName = "@taikhoan";
            par.Value = user;
            cmd.Parameters.Add(par);

            SqlParameter par1 = cmd.CreateParameter();
            par1.ParameterName = "@matkhau";
            par1.Value = pass;
            cmd.Parameters.Add(par1);

            int kq = (int)cmd.ExecuteScalar();
            conn.Close();
            if (kq == 1)
            {
                Session["Admin"] = user;
                Response.Redirect("admin_home.aspx");
            }
            else
                Response.Redirect("login.aspx");
        }
    }
}