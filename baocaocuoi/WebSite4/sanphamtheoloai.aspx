<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sanphamtheoloai.aspx.cs" Inherits="sanphamtheoloai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:DataList ID="DataList1" runat="server" DataSourceID="DS" RepeatColumns="3">
        <ItemTemplate>
            <div class="khung">
            <asp:Image ID="Image1" runat="server" Height="135px" ImageUrl='<%# Eval("H") %>'  />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("TenSP") %>' NavigateUrl='<%# Eval("lk") %>' style="color:black " Font-Bold="True" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ></asp:HyperLink>
            <br />
            <asp:Button ID="btn_addcart" runat="server" Text="Thêm giỏ hàng" />
                </div>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:sqldatasource runat="server" ConnectionString="<%$ ConnectionStrings:dotnet1 %>"  ID="DS"
            SelectCommand="Select *,'HinhAnh/'+Hinh as H ,'chitietsanpham.aspx?ma='+cast(MaSP as char) as lk from SANPHAM where MaLoai = @m"
        >

    </asp:sqldatasource>
    
</asp:Content>

