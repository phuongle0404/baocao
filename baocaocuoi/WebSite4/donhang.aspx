<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="donhang.aspx.cs" Inherits="donhang" %>
<%@ Import Namespace="System.Data.SqlClient"%>
<%@ Import Namespace="System.Configuration"%>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <% 
    
    string result = "";
    if (Session["giohang"] == null || Session["giohang"].ToString().Equals("0") || Session["hople"]==null)
        Response.Redirect("giohang.aspx");
    else
    {
        result += "<table width='100%' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>";
        result += "<tr><td>&nbsp;</td><td>&nbsp;</td><td align='center'><img src='images/cart_move.gif'></td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>";
        result += "<tr style='font-size:13px;text-align:center'><td><a href='giohang.aspx' class='thoat'>Giỏ hàng</a></td><td valign='bottom'><img src='images/cart_arrow.gif'></td><td><b>Đơn hàng</b></td><td valign='bottom'><img src='images/cart_arrow.gif'></td><td>Hoàn tất</td></tr>";
        result += "<tr><td colspan='7'>&nbsp;</td></tr>";
        //Response.Write(result);
        
            string user = Session["user"].ToString();
            string sql = "select * from THANHVIEN where TaiKhoan='"+user+"'" ;
            string connectString = ConfigurationManager.ConnectionStrings["dotnet1"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectString);
            conn.Open();
            try
            {
                SqlCommand comm = new SqlCommand(sql, conn);
                SqlDataReader reader = comm.ExecuteReader();
                reader.Read();
                Session["diachi"] = reader["DiaChi"].ToString();
                result += "<tr style='font-size:13px'><td colspan='7'><font color='red'>Thông tin khách hàng</font>&nbsp;<a href='thongtincanhan.aspx?type=1' class='thoat'>[Hiệu chỉnh]</td></tr>";
                result += "<tr><td colspan='7'>&nbsp;</td></tr>";
                result += "<tr><td colspan='7' align='center'>";
                result += "<table width='98%' border='1' class='Table_sp' cellspacing='0' cellpadding='0'>";
                result += "<tr><td><table width='100%' border='0' cellspacing='2' cellpadding='0'>";

                result += "<tr><td width='15'>&nbsp;</td><td style='font-size:13px' width='150' align='right'>Tên khách hàng</td><td width='15'>&nbsp;</td><td align='left'>" + reader["TenKH"].ToString() + "</td></tr>";

                result += "<tr><td width='15'>&nbsp;</td><td style='font-size:13px' width='150' align='right'>Địa chỉ</td><td width='15'>&nbsp;</td><td align='left'>" + reader["DiaChi"].ToString() + "</td></tr>";

                result += "<tr><td width='15'>&nbsp;</td><td style='font-size:13px' width='150' align='right'>Điện thoại</td><td width='15'>&nbsp;</td><td align='left'>" + reader["SDT"].ToString() + "</td></tr>";


                result += "</table></td></tr></table></td></tr>";
                result += "</td></tr></form><table><tr><td align='right'><form action='hoantat.aspx' method='post'>";
                result += "<input type='submit' value='Thanh Toán' name='cmdTiep'>";
                result += "</form></td></tr></table>";
                
                Response.Write(result);
            }
            catch (Exception e)
            {
                Response.Write(e.ToString());
            }
            conn.Close();
        
    }
%>
</asp:Content>

