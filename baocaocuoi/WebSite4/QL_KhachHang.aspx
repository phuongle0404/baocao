<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="QL_KhachHang.aspx.cs" Inherits="QL_KhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .giancach {
            height: 636px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="giancach">
       <p style="font-size: x-large; font-weight: bold; color: #003366"> QUẢN LÝ KHÁCH HÀNG THÀNH VIÊN</p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="ds_KH" CellPadding="4" ForeColor="#333333" GridLines="None" Height="267px" Width="799px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="TaiKhoan" HeaderText="Tài khoản" />
                <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng" />
                <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" />
                <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" />
                <asp:BoundField DataField="ns" HeaderText="Ngày sinh" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="ds_KH" runat="server"
            ConnectionString="<%$ ConnectionStrings:dotnet1 %>"
            SelectCommand="select ID, TaiKhoan, TenKH,DiaChi,GioiTinh,SDT,convert(varchar(10),NgaySinh,111) as ns from THANHVIEN">

        </asp:SqlDataSource>
        </div>
</asp:Content>

