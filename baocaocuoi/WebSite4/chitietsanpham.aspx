<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="chitietsanpham.aspx.cs" Inherits="chitietsanpham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 274px;">
        <tr>
            <td style="height: 32px" colspan="3">Tên sản phẩm:
                <asp:Label ID="lbl_ten" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td rowspan="4" style="width: 124px">
                <asp:Image ID="Image1" runat="server" Height="250px" Width="250px" ImageAlign="Middle" />
            </td>
            <td style="width: 67px">Giá tiền:</td>
            <td>
                <asp:Label ID="lbl_gia" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 20px; width: 67px">Xuất xứ:</td>
            <td style="height: 20px">
                            <asp:Label ID="lbl_xuatxu" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 67px">Hãng:</td>
            <td>
                            <asp:Label ID="lbl_nsx" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 67px">Size:</td>
            <td>
                            <asp:Label ID="lbl_size" runat="server" Text="Label"></asp:Label>
                        </td>
        </tr>
        </table>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Mô tả:" Height="81px">
        <asp:Label ID="lbl_mota" runat="server" Text="Label"></asp:Label>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server" GroupingText="Đặc tính:">
    <asp:Label ID="lbl_dactinh" runat="server" Text="Label"></asp:Label>
</asp:Panel>
    <br />
    </table>
<div id="fb-root"></div>
<script async defer src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6"></script>

<!-- Your embedded comments code -->
<!--Comments Facebook-->                
<div style="height:30px" class="fb-comments" data-href="<%:Request.Url.AbsoluteUri %>" data-num-posts="5" data-width="700"></div>
</asp:Content>

