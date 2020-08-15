
<%@ Page Language="C#" %>

<% 
    if (Session["user"] != null)
    {
        Session["user"] = null;
        Session["loaitk"] = null;
        Session["giohang"] = null;
        Session["sanpham"] = null;
        Session["sl"] = null;
        Session["error"]=null;
        Session["hople"] = null;
        Session["thanhtoan"] = null;
        Session["vanchuyen"] = null;
        Session["n"] = null;
        Session["dadangnhap"] = false;
        Response.Redirect("trangchu.aspx");
    }
    else if(Session["Admin"]!=null)
    {
        Session["Admin"] = null;
        Response.Redirect("trangchu.aspx");
        
    }
%>
