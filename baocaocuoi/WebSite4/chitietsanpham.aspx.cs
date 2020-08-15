using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class chitietsanpham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string masp;
        masp = Request.QueryString["ma"];
        string str = "Select *,'HinhAnh/'+Hinh as HA from NHASANXUAT nt,SANPHAM sp where nt.MaNSX=sp.MaNSX and MaSP='" + masp + "' ";
        string connectString = ConfigurationManager.ConnectionStrings["dotnet1"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectString);
        conn.Open();
        try
        {
            SqlCommand comm = new SqlCommand(str, conn);
            SqlDataReader reader = comm.ExecuteReader();
            while (reader.Read())
            {
                Image1.ImageUrl = reader["HA"].ToString();
                lbl_ten.Text = reader["TenSP"].ToString();
                lbl_nsx.Text = reader["TenNSX"].ToString();
                lbl_size.Text = reader["Size"].ToString();
                lbl_dactinh.Text = reader["DacTinh"].ToString();
                lbl_gia.Text = reader["Gia"].ToString();
                lbl_mota.Text = reader["MoTa"].ToString();
                lbl_xuatxu.Text = reader["XuatXu"].ToString();
            }

        }
        catch{
            lbl_ten.Text = "Loi";
        }
        conn.Close();
    }
}