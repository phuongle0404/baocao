<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Classic Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->

<!-- css files -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/font-awesome.css" />  <!-- Font-Awesome-Icons-CSS -->
<!-- //css files -->

<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->

<!-- online-fonts -->
<link href="//fonts.googleapis.com/css?family=Oleo+Script:400,700&amp;subset=latin-ext" rel="stylesheet"/>
<!-- //online-fonts -->
</head>
<body>
    <% 
        
    string s;
    if(Session["Admin"]==null){
    s=" <script src='js/jquery.vide.min.js'></script>";
	
	s+="<div data-vide-bg='video/Ipad'>";
	s+="<div class='center-container'>";
	s+="<div class='header-w3l'>";
	s+="<h1>Admin Login</h1>";
	s+="</div>";
	s+="<div class='main-content-agile'>";
	s+="<div class='sub-main-w3'>	";
	s+="<div class='wthree-pro'>";
	s+="<h2>Login Here</h2>";
	s+="</div>";
	s+="<form  method='post' action='checklogin.aspx'>";
	s+="<input placeholder='Username ' name='Name' class='user' type='email' required=''>";
	s+="<span class='icon1'><i class='fa fa-user' aria-hidden='true'></i></span><br><br>";
	s+="<input  placeholder='Password' name='Password' class='pass' type='password' required=''>";
	s+="<span class='icon2'><i class='fa fa-unlock' aria-hidden='true'></i></span><br>";
	s+="<div class='sub-w3l'>";
	s+="<div class='right-w3l'>";
	s+="<input type='submit' value='Login' name='cmdDangnhap' >";
	s+="</div>";
	s+="</div>";
	s+="</form>";
	s+="</div>";
	s+="</div>";
    s+="<div class='footer'>";
	s+="<p>&copy; All rights reserved | Design by 07DHTH</a></p>";
	s+="</div>";
    s+="</div>";
	s+="</div>";

    s += "</form>";
    Response.Write(s);
    }
    else
         Response.Redirect("QL_KhachHang.aspx");
        %>
</body>
</html>
