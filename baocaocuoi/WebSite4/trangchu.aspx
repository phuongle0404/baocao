<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="trangchu.aspx.cs" Inherits="trangchu" %>
<%@ Import Namespace="System.Data.SqlClient"%>
<%@ Import Namespace="System.Configuration"%>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .btn-them {
                margin-top: 20px;
                border-radius: 2px;
                border: 1px solid #8d8882;
                color: #393939;
                display: inline-block;
                font-size: 12px;
                padding: 10px 10px;
                text-align: center;
                text-transform: uppercase;
                transition-property: color,border-color;
                min-width: 40px;
                text-decoration:none;
                background-color:white;
            }

            .btn-them:hover {
                border-color: #800040;
                color: #800040;
            }

    </style>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" OnItemCommand="DataList1_ItemCommand" CellPadding="4" ForeColor="#333333"   >
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#EFF3FB" />
        <ItemTemplate>
            <div class="khung">
            <asp:ImageButton ID="ImageButton1" runat="server" Height="140px" ImageUrl='<%# Eval("H") %>' Width="200px" />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("TenSP") %>' NavigateUrl='<%# Eval("lk") %>' style="color:black " Font-Bold="True" Font-Overline="False" Font-Underline="False" ></asp:HyperLink>
            <br />
            <br />
                <asp:Label ID="Label1" runat="server" Text="Giá:"></asp:Label>
            <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("Gia", "{0:0,00}") %>' NavigateUrl='<%# Eval("lk") %>' style="color:black " Font-Bold="True" Font-Overline="False" Font-Underline="False" ></asp:HyperLink>      
                <asp:Label ID="Label2" runat="server" Text="VNĐ"></asp:Label>
            <br />
            <asp:Button ID="btn_cart" runat="server" CssClass="btn-them" Text="Thêm giỏ hàng" CommandArgument='<%# Eval("MaSP") %>' />
            <br />
                </div>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
        
        <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:dotnet1 %>"
            SelectCommand="Select *,'HinhAnh/'+Hinh as H ,'chitietsanpham.aspx?ma='+cast(MaSP as char) as lk from SANPHAM">
    </asp:SqlDataSource>
</asp:Content>

