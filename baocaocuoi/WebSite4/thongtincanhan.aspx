<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="thongtincanhan.aspx.cs" Inherits="thongtincanhan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td colspan="2" style="height: 20px; font-size: medium; font-weight: bold; text-align: center;">Cập Nhật Thông tin</td>
        </tr>
        <tr>
            <td style="width: 129px">Họ và Tên:</td>
            <td>
                <asp:TextBox ID="txt_hoten" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_hoten" ErrorMessage="Chưa nhập họ tên" ForeColor="Red">(*)</asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td style="width: 129px">Địa chỉ:</td>
            <td>
                <asp:TextBox ID="txt_diachi" runat="server" Height="43px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_diachi" ErrorMessage="Chưa nhập địa chỉ" ForeColor="Red">(*)</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 129px">Giới tính:</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatColumns="2" style="margin-left: 0px" Width="187px">
                    <asp:ListItem Selected="True">Nam</asp:ListItem>
                    <asp:ListItem>Nữ</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="width: 129px">Số điện thoại:</td>
            <td>
                <asp:TextBox ID="txt_sdt" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_sdt" ErrorMessage="Số điện thoại không hợp lệ" ForeColor="Red" ValidationExpression="\d\d\d\d\d\d\d\d\d\d">(*)</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 129px">Ngày sinh:</td>
            <td>
                <asp:TextBox ID="txt_ngaysinh" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 129px">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Cập nhật" OnClick="Button1_Click" Font-Bold="True" />
            </td>
        </tr>
        <tr>
            <td style="width: 129px">&nbsp;</td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lbl_thongbao" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

