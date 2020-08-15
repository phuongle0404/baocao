using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
public partial class DangKy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string ngayHeThong = DateTime.Now.ToString("yyyy/MM/dd");
        DateTime ngayHienTai = Convert.ToDateTime(ngayHeThong);
        if (txt_matkhau.Text.Length < 6)
        {
            lbl_thongbao.Text = "Mật khẩu quá ngắn. Phải có ít nhất 6 kí tự";
            return;
        }
        else if (txt_matkhau.Text.Length > 30)
        {
            lbl_thongbao.Text = "Mật khẩu quá dài. Chỉ có tối đa 30 kí tự";
            return;
        }
        else if (DateTime.Compare(Calendar1.SelectedDate, ngayHienTai) > 0)
        {
            lbl_thongbao.Text = "Ngày sinh không hợp lệ";
        }
        else
        {
            string sql = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
            SqlConnection cn = new SqlConnection(sql);
            cn.Open();
            string kt = "select count(*) from THANHVIEN where TaiKhoan='" + txt_taikhoan.Text + "'";
            string strcmd = "insert into THANHVIEN(TaiKhoan, MatKhau, TenKH, DiaChi, GioiTinh, SDT, NgaySinh) values ('" + txt_taikhoan.Text + "','" + txt_matkhau.Text + "',N'" + txt_hoten.Text + "',N'" + txt_diachi.Text + "',N'" + RadioButtonList1.SelectedValue.ToString() + "','" + txt_sdt.Text + "','" + Calendar1.SelectedDate.ToString("MM/dd/yyyy") + "')";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = kt;
            int d = (int)cmd.ExecuteScalar();
            if (d == 0)
            {
                cmd.CommandText = strcmd;
                int rs = cmd.ExecuteNonQuery();
                cn.Close();
                if (rs == 1)
                    lbl_thongbao.Text = "Thêm thành công";
            }
            else
                lbl_thongbao.Text = "Mã thành viên đã tồn tại!";
        }
    }
}