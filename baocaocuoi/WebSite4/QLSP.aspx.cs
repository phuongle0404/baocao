using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QLSP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender,
GridViewUpdateEventArgs e)
    {
        string tp;
        string mt;
        string g;
        string sl;
        string sz;
        string xx;
        string dt;
        
       // ns = e.NewValues["MaNSX"].ToString();
       // ml = e.NewValues["MaLoai"].ToString();
        tp = e.NewValues["TenSP"].ToString();
        mt = e.NewValues["MoTa"].ToString();
        g = e.NewValues["Gia"].ToString();
        sl = e.NewValues["SoLuong"].ToString();
        sz = e.NewValues["Size"].ToString();
        xx = e.NewValues["XuatXu"].ToString();
        dt = e.NewValues["DacTinh"].ToString();
 
        //dssp.UpdateParameters.Add("nsx", ns);
       // dssp.UpdateParameters.Add("ml", ml);
        dssp.UpdateParameters.Add("tensp", tp);
        dssp.UpdateParameters.Add("mota", mt);
        dssp.UpdateParameters.Add("gia", g);
        dssp.UpdateParameters.Add("soluong", sl);
        dssp.UpdateParameters.Add("size", sz);
        dssp.UpdateParameters.Add("xuatxu", xx);
        dssp.UpdateParameters.Add("dactinh", dt);

        dssp.Update();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
    }
    protected void btn_Loc_Click(object sender, EventArgs e)
    {
        dssp.SelectCommand = "Select *, 'HinhAnh/'+Hinh as H from SANPHAM where MaNSX='"+droplist_nsx.SelectedValue+"' and MaLoai = '"+droplist_loaisp.SelectedValue+"'";
    }
    protected void btn_timkiem_ad_Click(object sender, EventArgs e)
    {
        dssp.SelectCommand = "Select *, 'HinhAnh/'+Hinh as H from SANPHAM where TenSP like N'"+txt_timkiem.Text+"%'";
    }
}