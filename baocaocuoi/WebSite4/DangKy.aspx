<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DangKy.aspx.cs" Inherits="DangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td colspan="2" style="height: 20px; font-size: medium; font-weight: bold; text-align: center;">ĐĂNG KÝ THÀNH VIÊN</td>
        </tr>
        <tr>
            <td style="width: 129px">Họ và Tên:</td>
            <td>
                <asp:TextBox ID="txt_hoten" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_hoten" ErrorMessage="Chưa nhập họ tên" ForeColor="Red">(*)</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 129px">Tài khoản:</td>
            <td>
                <asp:TextBox ID="txt_taikhoan" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_taikhoan" ErrorMessage="Chưa nhập tài khoản" ForeColor="Red">(*)</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 129px; height: 26px">Mật khẩu:</td>
            <td style="height: 26px">
                <asp:TextBox ID="txt_matkhau" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_matkhau" ErrorMessage="Chưa nhập mật khẩu" ForeColor="Red">(*)</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 129px">Nhập lại mật khẩu:</td>
            <td>
                <asp:TextBox ID="txt_rematkhau" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_matkhau" ControlToValidate="txt_rematkhau" ErrorMessage="CompareValidator" ForeColor="Red">Mật khẩu không trùng khớp</asp:CompareValidator>
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
                <asp:Calendar ID="Calendar1" runat="server" SelectedDate="1998-02-14"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td style="width: 129px">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Đăng ký" OnClick="Button1_Click" Font-Bold="True" />
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

