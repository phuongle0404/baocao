using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class doimatkhau : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
            Response.Redirect("trangchu.aspx");
        else if (Request.Form["doi"] != null)
        {
            string passcu = TextBox1.Text;
            string passmoi = TextBox2.Text;
            Response.ContentType = "text/html;charset=utf-8";
            string connectString = ConfigurationManager.ConnectionStrings["dotnet1"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();
            string sql = "select pass from thanhvien where username like '" + Session["user"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            string pass = dr["pass"].ToString();
            if (passcu.Equals(pass))
            {
                sql = "update thanhvien set pass='" + passmoi + "' where username like '" + Session["user"].ToString() + "'";
                cmd.Dispose();
                dr.Dispose();
                cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                Session["ketqua"] = 1;
            }
            else
            {
                Session["ketqua"] = 0;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strcn = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
        SqlConnection cn = new SqlConnection(strcn);
        cn.Open();
        SqlCommand cmd;

        string x = "select MatKhau from THANHVIEN where TaiKhoan = '" + Session["user"].ToString() + "'";
        cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandText = x;
        string s = cmd.ExecuteScalar().ToString();
        if (TextBox1.Text != s)
        {
            Label1.Text = "Mật khẩu cũ không đúng";
            return;
        }
        else if (TextBox2.Text.Length < 6)
        {
            Label1.Text = "Mật khẩu quá ngắn";
            return;
        }
        else if (TextBox2.Text.Length > 20)
        {
            Label1.Text = "Mật khẩu quá dài";
            return;
        }
        else
        {
            string strcmd = "update THANHVIEN set MatKhau = '" + TextBox2.Text + "' where TaiKhoan = '" + Session["user"].ToString() + "'";
            cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = strcmd;

            int k = cmd.ExecuteNonQuery();
            if (k == 1)
                Label1.Text = "Đổi thành công";
            else
                Label1.Text = "Lỗi";
        }
        cn.Close();
    }
}