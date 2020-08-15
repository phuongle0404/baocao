<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="admin_home.aspx.cs" Inherits="admin_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:ImageButton ID="ImageButton1" runat="server" DescriptionUrl="~/QL_KhachHang.aspx" Height="200px" ImageUrl="~/icon/qlkh.png" PostBackUrl="~/QL_KhachHang.aspx" Width="200px" />
        </td>
        <td style="text-align: center">
            <asp:ImageButton ID="ImageButton3" runat="server" DescriptionUrl="~/QLDH.aspx" Height="200px" ImageUrl="~/icon/qldh.jpg" PostBackUrl="~/QLDH.aspx" Width="200px" />
        </td>
        <td style="text-align: center">
            <asp:ImageButton ID="ImageButton2" runat="server" DescriptionUrl="~/QLSP.aspx" ImageUrl="~/icon/qlsp.png" PostBackUrl="~/QLSP.aspx" Height="200px" Width="200px" />
        </td>
        <td style="text-align: center">
            <asp:ImageButton ID="ImageButton4" runat="server" DescriptionUrl="~/QLTK_admin.aspx" Height="200px" ImageUrl="~/icon/qltk.png" Width="200px" />
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

