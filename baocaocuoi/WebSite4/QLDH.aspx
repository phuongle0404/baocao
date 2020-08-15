<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="QLDH.aspx.cs" Inherits="QLDH" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            text-align: center;
        }
        .auto-style17 {
            margin-left: 152px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="auto-style15">
    <asp:Label ID="Label2" runat="server" Text="QUẢN LÝ ĐƠN HÀNG" Font-Bold="True" Font-Size="15pt"></asp:Label>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <div class="auto-style14">
                Ngày bắt đầu:
                <asp:TextBox ID="txt_ngaybd" runat="server" TextMode="Date"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_ngaybd" ControlToValidate="txt_ngaykt" ErrorMessage="Ngày bắt đầu phải trước ngày kết thúc" ForeColor="Red" Operator="GreaterThan" Type="Date">(*)</asp:CompareValidator>
                <br />
                <br />
                Ngày kết thúc:
                <asp:TextBox ID="txt_ngaykt" runat="server" TextMode="Date"></asp:TextBox>
                &nbsp;<br />
                <br /></div>
            <div class="auto-style14">
                <asp:Button ID="btn_loc" runat="server" Height="37px" OnClick="btn_loc_Click" Text="Lọc" UseSubmitBehavior="False" Width="112px" CssClass="auto-style17" Font-Bold="True" ForeColor="#CC3300" />
                <br />
                <br />
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
        </asp:Panel>
       
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <div class="auto-style15">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="MaHD" DataSourceID="ds_hd" GridLines="Vertical" Height="228px" Width="634px">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" />
                            <asp:BoundField DataField="ID" HeaderText="Mã khách hàng" />
                            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                            <asp:BoundField DataField="TongMatHang" HeaderText="Tổng mặt hàng" />
                            <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" Font-Size="Larger" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="ds_hd" runat="server"
                     ConnectionString="<%$ ConnectionStrings:dotnet1 %>"
                     SelectCommand="Select * from HOADON">

                </asp:SqlDataSource>
            </asp:View>
            
            <asp:View ID="View2" runat="server">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" GridLines="Vertical" DataKeyNames="MaHD" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowHeaderWhenEmpty="True" Height="241px" Width="671px" >
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" />
                        <asp:BoundField DataField="ID" HeaderText="Mã khách hàng" />
                        <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
                        <asp:BoundField DataField="TongMatHang" HeaderText="Tổng mặt hàng" />
                        <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" />
                        <%--<asp:HyperLinkField DataNavigateUrlFields="ct" Text="Chi tiết" />--%>
                        <asp:BoundField DataField="NgayLap" HeaderText="Ngày lập" />
                        <asp:BoundField DataField="NgayGiao" HeaderText="Ngày giao" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="1" LastPageText="Trang cuối" NextPageText="Tiếp" PreviousPageText="Trước" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Font-Size="Large" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </asp:View>
        </asp:MultiView>
       
        <br />
    <br />
    
    <br />
        <%-- <asp:SqlDataSource ID="ds_hoadon" runat="server"
        ConnectionString="<%$ ConnectionStrings:dotnet1 %>"
        SelectCommand="Select *,'~/ChiTietHoaDon.aspx?md='+cast(MaHD as char) as ct from HOADON">

    </asp:SqlDataSource>--%>
        <asp:Button ID="btn_Xoa" runat="server" OnClick="btn_Xoa_Click" Text="Xóa" UseSubmitBehavior="False" />
        <asp:Button ID="btn_chitiet" runat="server" OnClick="btn_chitiet_Click" Text="Chi tiết" UseSubmitBehavior="False" />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AllowPaging="True">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" />
                        <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" />
                        <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                        <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" />
                        <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="Trang đầu" LastPageText="Trang cuối" PageButtonCount="4" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Font-Size="Large" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
    </div>
</asp:Content>

