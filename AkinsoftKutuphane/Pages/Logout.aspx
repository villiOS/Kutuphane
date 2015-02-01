<%@ Page Title="" Language="C#" MasterPageFile="~/Master/masterPage.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="AkinsoftKutuphane.Pages.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <ext:ResourceManager runat="server" ID="ResourceManager1"></ext:ResourceManager>


    <ext:Window
        ID="logoutModal"
        runat="server"
        Title="Çıkış Yapmak İstiyor Musunuz ?"
        Icon="Connect"
        Height="90"
        Width="222"
        BodyStyle="background-color: #fff;"
        BodyPadding="5"
        Modal="true"
        Draggable="false"
        Region="Center"
        Resizable="false">

        <Items>
            <ext:Button 
                runat="server" 
                ID="btnLogout" 
                OnDirectClick="btnLogout_DirectClick" 
                Text="ÇIKIŞ" 
                Icon="StopRed" 
                TextAlign="Center" 
                IconAlign="Top"
                Width="100"
                Height="50"
                RowSpan="1">

            </ext:Button>

            <ext:Button 
                runat="server" 
                ID="btnIptal" 
                OnDirectClick="btnIptal_DirectClick"
                Text="İPTAL" 
                Icon="StopBlue" 
                TextAlign="Center" 
                IconAlign="Top"
                Width="100"
                Height="50"
                RowSpan="2">

            </ext:Button>
        </Items>

        </ext:Window>



</asp:Content>
