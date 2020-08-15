using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class ThemSP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //protected void btn_huy_Click(object sender, EventArgs e)
    //{
    //    txt_dactinh.Text = "";
    //    txt_gia.Text = "";
    //    txt_mota.Text = "";
    //    txt_size.Text = "";
    //    txt_soluong.Text = "";
    //    txt_tensp.Text = "";
    //    rdolist_xuatxu.SelectedIndex = 1;
    //    droplist_loaisp.SelectedIndex = 0;
    //    droplist_nsx.SelectedIndex = 0;
    //}
    protected void btn_them_Click(object sender, EventArgs e)
    {
        string sql=ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
        SqlConnection cn = new SqlConnection(sql);
        cn.Open();

        string strcmd = "insert into SANPHAM(MaNSX,MaLoai,TenSP,MoTa,Gia,SoLuong,Size,XuatXu,DacTinh,Hinh) values (N'" + droplist_nsx.SelectedValue + "',N'" + droplist_loaisp.SelectedValue + "',N'" + txt_tensp.Text + "',N'" + txt_mota.Text + "',N'" + txt_gia.Text + "',N'" + txt_soluong.Text + "',N'" + txt_size.Text + "',N'" + rdolist_xuatxu.SelectedValue + "',N'" + txt_dactinh.Text + "','" + fileupload_hinhanh.FileName + "')";
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandText = strcmd;
        int rs = cmd.ExecuteNonQuery();
        fileupload_hinhanh.SaveAs(Server.MapPath("~/HinhAnh/") + fileupload_hinhanh.FileName);
        cn.Close();
        if (rs == 1)
            lbl_thongbao.Text = "Thêm thành công";
        
        
    }
    protected void btn_trolai_Click(object sender, EventArgs e)
    {

    }
}