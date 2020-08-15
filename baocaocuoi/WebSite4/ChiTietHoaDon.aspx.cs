using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string mahd = Request.QueryString["md"];
        ds_cthd.SelectParameters.Add("hd", mahd);
    }
    protected void GridView1_Load(object sender, EventArgs e)
    {

    }
    protected void btn_trove_Click(object sender, EventArgs e)
    {

    }
}