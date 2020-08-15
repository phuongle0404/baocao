<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="QLTK_admin.aspx.cs" Inherits="QLTK_admin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>
        QUẢN LÝ TÀI KHOẢN</p>
        <table style="border: 2px solid black;">
            <tr>
                <td class="auto-style21">Email</td>
                <td class="auto-style22">
                    <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="Sai cú pháp email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">(*)</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style21">Mật khẩu</td>
                <td class="auto-style22">
                    <asp:TextBox ID="txt_pass" runat="server" Width="129px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_pass" ErrorMessage="Mật khẩu không được để trống" ForeColor="Red">(*)</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_pass0" ControlToValidate="txt_pass" ErrorMessage="Mật khẩu không khớp" ForeColor="Red">(*)</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style21">Nhập lại mật khẩu</td>
                <td class="auto-style22">
                    <asp:TextBox ID="txt_pass0" runat="server" Width="129px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style22">
                    <asp:Button ID="btn_them" runat="server" Text="Thêm" OnClick="btn_them_Click" />
                </td>
            </tr>
        </table>
        <asp:Label ID="lbl_thongbao" runat="server"></asp:Label>

    <br />
        <br />
    <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="Gainsboro" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="user" HeaderText="Email" />
                <asp:BoundField DataField="password" HeaderText="Mật khẩu" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />

</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style21 {
            width: 192px;
        }
        .auto-style22 {
            width: 237px;
        }
    </style>
</asp:Content>


