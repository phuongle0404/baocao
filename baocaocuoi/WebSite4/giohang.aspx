<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="giohang.aspx.cs" Inherits="giohang1" %>
<%@ Import Namespace="System.Data.SqlClient"%>
<%@ Import Namespace="System.Configuration"%>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           <script language="javascript">
               function sua(object) {
                   var name = object.name
                   var maso = name.substring(3);
                   //alert (maso);
                   var soluong = eval("document.getElementById('txt" + maso + "').value");
                   //alert (soluong);
                   var masp = document.getElementById('maspsua').value;
                   var sluong = document.getElementById('slsua').value;
                   if (masp == "" && sluong == "") {
                       document.getElementById('maspsua').value = maso + ";";
                       document.getElementById('slsua').value = soluong + ";";
                   }
                   else {
                       var tam_sp = masp.split(";");
                       var tam_sl = sluong.split(";");
                       var flag = false;//kiem tra san pham them vao da co trong danh sach chua
                       masp = "";//bien mang luu danh sach san pham sau khi da duoc them
                       sluong = "";//bien mang luu so luong tuong ung cua tung san pham
                       for (i = 0; i < tam_sp.length - 1; i++) {
                           if (maso == tam_sp[i]) {
                               tam_sl[i] = soluong;
                               flag = true;
                           }
                           masp += tam_sp[i] + ";";
                           //alert (masp);
                           sluong += tam_sl[i] + ";";
                           //alert (sluong);
                       }
                       if (!flag)//san pham them vao chua co trong danh sach->them vao danh sach san pham
                       {
                           masp += maso + ";";
                           sluong += soluong + ";";
                       }
                       document.getElementById('maspsua').value = masp;
                       document.getElementById('slsua').value = sluong;
                   }
                   //alert (document.getElementById('maspsua').value);
                   //alert (document.getElementById('slsua').value);
                   return true;
               }
               function xoa() {
                   var i;
                   var dem = 0;
                   sanpham.xoasp.value = "";
                   if (sanpham.chk.length) {
                       var total = sanpham.chk.length;
                       for (i = 0; i < total; i++)
                           if (sanpham.chk[i].checked == true) {
                               dem++;
                               if (sanpham.xoasp.value == "")
                                   sanpham.xoasp.value += sanpham.chk[i].value;
                               else
                                   sanpham.xoasp.value += ";" + sanpham.chk[i].value;
                           }
                   }
                   else
                       if (sanpham.chk.checked == true) {
                           sanpham.xoasp.value += sanpham.chk.value;
                       }
                   //alert (sanpham.xoasp.value);
               }
               function check(form) {
                   var kt = new kiemtra();
                   var flag;
                   if (form.chk.length) {
                       var total = form.chk.length;
                       for (i = 0; i < total; i++) {
                           var giatri = eval("document.getElementById('txt" + sanpham.chk[i].value + "').value");
                           flag = kt.kieu(form.name, "txt" + sanpham.chk[i].value, "Giá trị", giatri, 5, 5);
                           if (flag)
                               if (giatri <= 0) {
                                   alert("Giá trị nhập không được nhỏ hơn 0");
                                   eval("sanpham.txt" + sanpham.chk[i].value + ".focus()");
                                   flag = false;
                               }
                           if (!flag)
                               return flag;
                       }
                   }
                   else {
                       var giatri = eval("document.getElementById('txt" + sanpham.chk.value + "').value");
                       var flag = kt.kieu(form.name, "txt" + sanpham.chk.value, "Giá trị", giatri, 5, 5);
                       if (flag)
                           if (giatri <= 0) {
                               alert("Giá trị nhập không được nhỏ hơn 0");
                               eval("sanpham.txt" + sanpham.chk.value + ".focus()");
                               flag = false;
                           }
                       if (!flag)
                           return flag;
                   }
                   return true;
               }
</script>
    <%
        String s;
        if (Session["giohang"] == null || Session["giohang"].ToString().Equals("0"))
        {

            s = "<h3>Không có sản phẩm nào trong giỏ hàng</h3>";
            Response.Write(s);
        }
        else
        {
            String k = Session["n"].ToString();
            int len = int.Parse(k);
            ArrayList mangsp = (ArrayList)Session["sanpham"];
            ArrayList dsgia = new ArrayList();
            ArrayList mangsl = (ArrayList)Session["sl"];
            string dk = "";
            string[] sluong = new string[1000];
            for (int i = 0; i < len; i++)
            {
                int tam = int.Parse(mangsp[i].ToString());
                if (dk == "")
                    dk = "(" + tam + "";
                else
                    dk += "," + tam + "";
            }
            dk += ")";

            string connectString = ConfigurationManager.ConnectionStrings["dotnet1"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectString);
            // DS.SelectParameters.Add("m", dk);
            conn.Open();
            string st = "Select * from SANPHAM where MaSP in " + dk + "";
            SqlCommand comm;

            SqlDataReader reader;
            comm = new SqlCommand(st, conn);
            reader = comm.ExecuteReader();


            s = "<form name='sanpham' action='capnhatgiohang.aspx' method='post' onsubmit='return check(this)'>";
            s += "<table width='100%' bgcolor='#CCCCCC' cellspacing='0' cellpadding='0' border='1' class='Table_sp'>";
            s += "<tr bgcolor='#f9af3f' class='chucam'><th>Tên sản phẩm</th><th>Mô tả</th><th>Số lượng</th><th>Giá tiền</th><th>Xoá</th></tr>";
            double tongtien = 0;
            string chitiet = "";
            while (reader.Read())
            {
                string tam = reader["MaSP"].ToString();
                int index = int.Parse(tam.ToString());
                int n = 0;
                for (int i = 0; i < len; i++)
                {
                    int tam1 = int.Parse(mangsp[i].ToString());
                    if (index == tam1)
                    {
                        n = int.Parse(mangsl[i].ToString());
                        dsgia.Add(reader["Gia"].ToString());
                        double giaban = n * double.Parse(reader["Gia"].ToString());
                        tongtien += giaban;
                        s += "<tr>";
                        s += "<td class='cell'>" + reader["TenSP"].ToString() + "</td>";
                        s += "<td width='450px' class='cell'>" + reader["MoTa"].ToString() + "</td>";
                        s += "<td align='center'><h6 size='1' class='cell' name='txt" + reader["MaSP"].ToString() + "' onblur='return sua(this)' value='" + n + "' style='text-align:center'>" + n +" </h6></td>";
                        s += "<td width='100px' align='right' style='text-align: center' class='cell'>" + tien.tiente.chuyendoi(giaban.ToString()) + "</td>";
                        s += "<td align='center'class='cell'><input type='checkbox' name='chk' value='" + reader["MaSP"].ToString() + "' onclick='xoa()'></td>";
                        s += "</tr>";
                        
                    }
                }

            }
            Session["gia"] = dsgia;
            Session["tongtien"] = tongtien.ToString();
            Session["chitiet"] = chitiet;
            Session["tongsanpham"] = len.ToString();
            Session["hople"] = true;
            s += "<tr><td colspan='5' align='center' id='cell-tongtien'>Tổng cộng:&nbsp;<font color='#ff3333'>" + tien.tiente.chuyendoi(tongtien.ToString()) + " VND</td></tr>";
            s += "</table>";
            s += "<table width='100%' bgcolor='#FFFFFF' cellspacing='3' cellpadding='0' border='0'>";
            s += "<tr><td><a href='trangchu.aspx ' class='btn'>Quay lại</a>&nbsp;&nbsp;";
            
            s += "</td></form><td align='right'><form action='donhang.aspx' method='post'>";
            s += "<input class='btn' type='submit' value='Đặt hàng' name='cmdTiep'>";
            s += "</form></td></tr></table>";
            Response.Write(s);

            conn.Close();


        }    
         %>
</asp:Content>

