<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="QLSP.aspx.cs" Inherits="QLSP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            height: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
            <tr>
                <td class="auto-style13" style="background-color: #FFFFCC; text-align: center;">QUẢN LÝ SẢN PHẨM</td>
                <td class="auto-style12" style="background-color: #FFFFCC; text-align: center;" colspan="2">
                    <asp:HyperLink ID="hpl_danhmuc" runat="server" NavigateUrl="QLSP.aspx">Danh mục sản phẩm</asp:HyperLink>
                </td>
                <td class="auto-style12" style="background-color: #FFFFCC; text-align: center;">
                    <asp:HyperLink ID="hpl_themsp" runat="server" NavigateUrl="ThemSP.aspx">Thêm sản phẩm mới</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style15" style="background-color: #FFFFFF; text-align: center;" colspan="2">
                    <asp:TextBox ID="txt_timkiem" runat="server"></asp:TextBox>
                    <asp:Button ID="btn_timkiem_ad" runat="server" Text="Tìm kiếm" OnClick="btn_timkiem_ad_Click" />
                    </td>
                <td class="auto-style15" style="background-color: #FFFFFF; text-align: center;" colspan="2">
                    <asp:Panel ID="Panel2" runat="server" GroupingText="Lọc tự động">
                        <asp:DropDownList ID="droplist_nsx" runat="server" DataSourceID="dsnsx" DataTextField="TenNSX" DataValueField="MaNSX">
                        </asp:DropDownList>
                        <asp:DropDownList ID="droplist_loaisp" runat="server" DataSourceID="dsloai" DataTextField="TenLoai" DataValueField="MaLoai">
                        </asp:DropDownList>
                        <asp:Button ID="btn_Loc" runat="server" OnClick="btn_Loc_Click" Text="Lọc" Width="71px" />
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <br />
                    <asp:SqlDataSource ID="dsloai" runat="server"
                        ConnectionString="<%$ ConnectionStrings:dotnet1 %>"
                        SelectCommand="Select * from LOAI">

                    </asp:SqlDataSource>
                    
                    <asp:Panel ID="Panel1" runat="server" Width="301px">
                    </asp:Panel>
                    
                    <asp:SqlDataSource ID="dsnsx" runat="server"
                        ConnectionString="<%$ ConnectionStrings:dotnet1 %>"
                        SelectCommand="Select * from NHASANXUAT"
                       >

                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style14" colspan="4">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dssp" DataKeyNames="MaSP" AutoGenerateEditButton="True" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderStyle="Solid" BorderWidth="1px" CellPadding="2" ForeColor="Black" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="4" >
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" />
                            <asp:BoundField DataField="MaNSX" HeaderText="Mã nhà sản xuất" />
                            <asp:BoundField DataField="MaLoai" HeaderText="Mã loại" />
                            <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" />
                            <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                            <asp:BoundField DataField="Gia" HeaderText="Giá" />
                            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                            <asp:BoundField DataField="Size" HeaderText="Size" />
                            <asp:BoundField DataField="XuatXu" HeaderText="Xuất xứ" />
                            <asp:BoundField DataField="DacTinh" HeaderText="Đặc tính" />
                            <asp:ImageField HeaderText="Hình ảnh" DataImageUrlField="H">
                            </asp:ImageField>
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerSettings FirstPageText="Trang đầu" LastPageText="Trang cuối" Mode="NextPreviousFirstLast" NextPageText="Tiếp" PreviousPageText="Trước" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="dssp" runat="server"
                        ConnectionString="<%$ ConnectionStrings:dotnet1 %>"
                        SelectCommand="Select *, 'HinhAnh/'+Hinh as H from SANPHAM"
                        UpdateCommand=" Update SANPHAM set TenSP=@tensp,MoTa=@mota,Gia=@gia,SoLuong=@soluong,Size=@size,XuatXu=@xuatxu,DacTinh=@dactinh where
MaSP=@masp">
                        
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
</asp:Content>

