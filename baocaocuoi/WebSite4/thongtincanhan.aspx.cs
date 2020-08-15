using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class thongtincanhan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String s = Session["user"].ToString();
        String strConn = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
        SqlConnection conn = new SqlConnection(strConn);
        conn.Open();
        string sql = "select * from THANHVIEN where TaiKhoan='" + s + "' ";
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read()) {
            txt_hoten.Text = reader["TenKH"].ToString();
            txt_diachi.Text = reader["DiaChi"].ToString();
            txt_ngaysinh.Text = reader["NgaySinh"].ToString();
            txt_sdt.Text  = reader["SDT"].ToString();
            
        }
        conn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String s = Session["user"].ToString();
        String strConn = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
        SqlConnection conn = new SqlConnection(strConn);
        conn.Open();
        string sql = "update THANHVIEN set TenKH=N'" + txt_hoten.Text + "',DiaChi=N'" + txt_diachi.Text + "',NgaySinh='" + txt_ngaysinh.Text + "',SDT=" + txt_sdt.Text + ",GioiTinh=N'" + RadioButtonList1.SelectedValue.ToString() + "' where TaiKhoan='" + s + "' ";
        SqlCommand cmd = new SqlCommand(sql, conn);
        int k = cmd.ExecuteNonQuery();
        if (k == 1)
            lbl_thongbao.Text = "Thành công";
        else
            lbl_thongbao.Text = "Thất bại";

        conn.Close();
    }
}