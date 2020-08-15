using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class QLDH : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (txt_ngaybd.Text == "" && txt_ngaykt.Text == "")
        {
            MultiView1.ActiveViewIndex = 0;
        }
        else
            MultiView1.ActiveViewIndex = 1;
    }
    //protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    string sql = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
    //    SqlConnection cn = new SqlConnection(sql);
    //    cn.Open();
    //    try
    //    {
    //        int id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
    //        string str = "delete from HOADON where MaHD='" + id + "'";
    //        string delCTHD = "delete from CHITIETHOADON where MaHD='" + id + "'";
    //        //Xoa CTHD
    //        SqlCommand cmdCT = new SqlCommand();
    //        cmdCT.Connection = cn;
    //        cmdCT.CommandText = delCTHD;
    //        cmdCT.ExecuteNonQuery();
    //        //Xoa HD
    //        SqlCommand cmd = new SqlCommand();
    //        cmd.Connection = cn;
    //        cmd.CommandText = str;
    //        cmd.ExecuteNonQuery();
    //        cn.Close();
    //    }
    //    catch
    //    {
    //        Response.Write("Xóa thất bại");
    //    }
    //}
    void load_loc()
    {
        string sql = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
        SqlConnection cn = new SqlConnection(sql);

        string str = "select * from HOADON";
        SqlDataAdapter da = new SqlDataAdapter(str, cn);
        DataSet ds = new DataSet();
        da.Fill(ds, "HOADON");
        GridView1.DataSource = ds.Tables["HOADON"];
        GridView1.DataBind();

    }
    void load_chitiet()
    {
        string sql = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
        SqlConnection cn = new SqlConnection(sql);
        int id = int.Parse(GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Value.ToString());
        string strcmd = "select * from CHITIETHOADON where MaHD='" + id + "'";
        SqlDataAdapter da = new SqlDataAdapter(strcmd, cn);
        DataSet ds = new DataSet();
        da.Fill(ds, "CHITIETHOADON");
        GridView2.DataSource = ds.Tables["CHITIETHOADON"];
        GridView2.DataBind();
    }

    protected void btn_Xoa_Click(object sender, EventArgs e)
    {
        string sql = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
        SqlConnection cn = new SqlConnection(sql);
        cn.Open();
        try
        {
            int id = int.Parse(GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Value.ToString());
            string str = "delete from HOADON where MaHD='" + id + "'";
            string delCTHD = "delete from CHITIETHOADON where MaHD='" + id + "'";
            //Xoa CTHD
            SqlCommand cmdCT = new SqlCommand();
            cmdCT.Connection = cn;
            cmdCT.CommandText = delCTHD;
            cmdCT.ExecuteNonQuery();
            //Xoa HD
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = str;
            cmd.ExecuteNonQuery();
            cn.Close();
            load_loc();
            GridView2.Visible = false;
        }
        catch
        {
            Response.Write("Xóa thất bại");
        }
    }
    protected void btn_chitiet_Click(object sender, EventArgs e)
    {
        //GridView2.Visible = true;
        string sql = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
        SqlConnection cn = new SqlConnection(sql);
        cn.Open();
        try
        {
            load_chitiet();
        }
        catch { }
        cn.Close();
    }
    protected void btn_loc_Click(object sender, EventArgs e)
    {
      
            string sql = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
            SqlConnection cn = new SqlConnection(sql);
            cn.Open();

            string str = "Select * From HOADON WHERE NgayLap between '" + txt_ngaybd.Text + "' AND '" + txt_ngaykt.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter(str, cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "LOCHOADON");
            GridView1.DataSource = ds.Tables["LOCHOADON"];
            GridView1.DataBind();

            cn.Close();
            MultiView1.ActiveViewIndex = 1;
            //txt_ngaybd.Text = txt_ngaykt.Text = "";
            
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       // string id = GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Value.ToString();
        
    }
}