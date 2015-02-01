<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AkinsoftKutuphane.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Akınsoft Kütüphane Otomasyonu </title>
    <link href="login-box.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding: 100px 0 0 250px;">
    <div id="login-box">

<h2>Yetkili Girişi</h2>

<br />
<br />

        <div id="login-box-name" style="margin-top:20px;">Kullanıcı Adı:</div>
        
        <div id="login-box-field" style="margin-top:20px;">
            <asp:TextBox ID="txtAdminName" runat="server" CssClass="form-login"></asp:TextBox>
        </div>
        
        <div id="login-box-name">Kullanıcı Şifre:</div>

        <div id="login-box-field">
             <asp:TextBox ID="txtAdminPassword" runat="server" CssClass="form-login" TextMode="Password"></asp:TextBox>
        </div>
<br />

<br />


        <asp:ImageButton ID="txtGiris" runat="server" Height="40px" Width="120px" ImageUrl="../Login/image/login-btn.png" CssClass="login-box-options" OnClick="txtGiris_Click" />





</div>
    </div>
    </form>
</body>
</html>
