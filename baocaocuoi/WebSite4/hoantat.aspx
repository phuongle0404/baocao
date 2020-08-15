<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="hoantat.aspx.cs" Inherits="hoantat" %>
<%@ Import Namespace="System.Data.SqlClient"%>
<%@ Import Namespace="System.Configuration"%>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <% 
         try{
        ArrayList mangsp = (ArrayList)Session["sanpham"];
        ArrayList mangsl = (ArrayList)Session["sl"];
        ArrayList manggia = (ArrayList)Session["gia"];
    int kqct = 0;
    string id = Session["id"].ToString();
    string connectString = ConfigurationManager.ConnectionStrings["dotnet1"].ConnectionString;
    SqlConnection conn = new SqlConnection(connectString);
    // DS.SelectParameters.Add("m", dk);
    conn.Open();
    SqlCommand comm;
    string themhoadon = "insert into HOADON(ID,DiaChi,TongMatHang,TongTien,NgayLap,NgayGiao) values('" + id + "',N'" + Session["diachi"].ToString() + "','" + Session["n"].ToString() + "','" + Session["tongtien"].ToString() + "',GETDATE(),NULL) ";
    comm = new SqlCommand(themhoadon, conn);
    int kq = (int)comm.ExecuteNonQuery();
    conn.Close();
    if (kq == 1)
    {
        String k = Session["n"].ToString();
        int len = int.Parse(k);

        conn.Open();
        SqlCommand comm1;
        string mahd = "select max(MaHD) from HOADON";
        comm1 = new SqlCommand(mahd, conn);
        int mahoadon = (int)comm1.ExecuteScalar();
        conn.Close();
        for (int i = 0; i < len; i++)
        {

            string gia = manggia[i].ToString();

            conn.Open();
            int n = int.Parse(mangsl[i].ToString());

            double giaban = n * double.Parse(gia);
            string sql2 = "insert into CHITIETHOADON(MaHD,MaSP,SoLuong,DonGia,ThanhTien)values('" + mahoadon + "','" + mangsp[i].ToString() + "','" + n + "','" + gia + "','" + giaban + "')";
            SqlCommand cmd = new SqlCommand(sql2, conn);
            int k1 = (int)cmd.ExecuteNonQuery();
            if (k1 == 1)
                kqct += 1;
            conn.Close();
        }
        string a = "Đặt hàng thành công";
        Response.Write(a);
        Session["n"] = null;
        Session["giohang"] = null;
        Session["sanpham"] = null;
        Session["sl"] = null;
         }
         }
             catch{
             }
    
%>
</asp:Content>

