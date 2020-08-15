<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="doimatkhau.aspx.cs" Inherits="doimatkhau" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" bgcolor="white" cellpadding="0" cellspacing="3" class="Table_sp" width="350">
        <tr>
            <td class="chucam" colspan="2">Đổi mật khẩu </td>
        </tr>
        <tr>
            <td align="left" width="100">Password cũ: </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="113px" TextMode="Password"></asp:TextBox>
&nbsp;</td>
        </tr>
        <tr>
            <td align="left">Password mới: </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="113px" TextMode="Password"></asp:TextBox>
                (6-20 ký tự) </td>
        </tr>
        <tr>
            <td align="left">Nhập lại password: </td>
            <td>
                &nbsp;<asp:TextBox ID="TextBox3" runat="server" Width="113px" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="CompareValidator" ForeColor="Red">Mật khẩu không khớp</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Đổi mật khẩu" />
                <br/>
&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <% 
            if (Session["ketqua"] != null)
                if((int)Session["ketqua"]==0)
                    Response.Write("<tr><td colspan='2' align='center' class='sanpham'>Nhập sai password hiện hành</td></tr>");
                else
                {
                    Response.Write("<tr><td colspan='2' align='center' class='sanpham'>Thay đổi password thành công</td></tr>");
                }
            Session["ketqua"] = null;
        %>
    </table>
</asp:Content>

