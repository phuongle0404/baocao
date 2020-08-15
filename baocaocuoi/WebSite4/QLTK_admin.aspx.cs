using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class QLTK_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        load_view();
    }
    void load_view()
    {
        string sql = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
        SqlConnection cn = new SqlConnection(sql);

        string str = "select * from Admin";
        SqlDataAdapter da = new SqlDataAdapter(str, cn);
        DataSet ds = new DataSet();
        da.Fill(ds, "ad");
        GridView1.DataSource = ds.Tables["ad"];
        GridView1.DataBind();

    }
    protected void btn_them_Click(object sender, EventArgs e)
    {
        string sql = ConfigurationManager.ConnectionStrings["dotnet1"].ToString();
        SqlConnection cn = new SqlConnection(sql);
        cn.Open();
        string strcmd = "insert into Admin([user],password) values('" + txt_email.Text + "','" + txt_pass.Text + "')";
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandText = strcmd;
        int rs = cmd.ExecuteNonQuery();
        cn.Close();
        if (rs == 1)
            lbl_thongbao.Text = "Thêm thành công";
        else
            lbl_thongbao.Text = "Thêm thất bại";
        txt_email.Text = "";
        txt_pass.Text = "";
        txt_pass0.Text = "";
        load_view();

            
    }
}