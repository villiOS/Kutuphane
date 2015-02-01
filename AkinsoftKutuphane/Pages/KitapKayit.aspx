<%@ Page Title="" Language="C#" MasterPageFile="~/Master/masterPage.Master" AutoEventWireup="true" CodeBehind="KitapKayit.aspx.cs" Inherits="AkinsoftKutuphane.Pages.KitapKayit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ext:ResourceManager runat="server" ID="ResourceManager1"></ext:ResourceManager>



    <ext:Window
        ID="kitapKayitModal"
        runat="server"
        Title="Kitap Kayıt"
        Icon="BookAdd"
        Height="400"
        Width="300"
        BodyStyle="background-color: #fff;"
        BodyPadding="5"
        Modal="true"
        Draggable="false"
        Region="Center"
        Resizable="false">
        <Items>
            <ext:FormPanel runat="server">
                <Items>
                    <ext:TextField ID="txtKitapKodu" runat="server" FieldLabel="Kitap Kodu" Note="Kitabın Arka Kapağındaki Kod" Margins="5 5 5 5" />
                    <ext:TextField ID="txtKitapAdi" runat="server" FieldLabel="Kitap Adı" Note="" />
                    <ext:TextField ID="txtKategori" runat="server" FieldLabel="Kategori" Note="Roman, Şiir, Teknik vs." />
                    <ext:DateField
                        ID="dpicYayinYili"
                        runat="server"
                        Vtype="daterange"
                        FieldLabel="Yayın Yılı"
                        EnableKeyEvents="true">
                    </ext:DateField>
                    <ext:TextField ID="txtYazari" runat="server" FieldLabel="Yazarı" Note="" />
                    <ext:TextField ID="txtISBN" runat="server" FieldLabel="ISBN Numarası" Note="13 Haneli" />
                    <ext:TextField ID="txtSayfaSayisi" runat="server" FieldLabel="Sayfa Sayısı" Note="" />
                    <ext:TextField ID="txtAnahtarKelimeler" runat="server" FieldLabel="Anahtar Kelimeler" Note="Ders, Cahit Sıtkı, Dram vs." />


                </Items>

                <Buttons>
                    <ext:Button ID="btnKitapKaydet" runat="server" Text="Kaydet" Icon="Add" OnDirectClick="btnKitapKaydet_Click"></ext:Button>
                    <ext:Button ID="btnKitapKayitIptal" runat="server" Text="İptal" Icon="Cancel" OnDirectClick="btnKitapKayitIptal_Click"></ext:Button>
                </Buttons>
            </ext:FormPanel>
        </Items>

        

    </ext:Window>






    <%--   <asp:Panel ID="frmKitapKayit" runat="server">
        <table class="auto-style2" border="1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Kitap Kodu:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server" Width="192px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Kitap Adı:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox2" runat="server" Width="192px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Kategori:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox3" runat="server" Width="192px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Yayın Yılı:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="10px" NextPrevFormat="ShortMonth" ShowDayHeader="False" ShowGridLines="True" Width="200px">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" Wrap="True" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Yazarı:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox4" runat="server" Width="192px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="ISBN Numarası:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox5" runat="server" Width="192px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Sayfa Sayısı:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox6" runat="server" Width="192px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Anahtar Kelimeler:"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox7" runat="server" Width="192px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnKitapKaydet" runat="server" Text="Kaydet" Width="100px" OnClick="btnKitapKaydet_Click" />
                </td>
                <td>
                    <asp:Button ID="btnKitapKayitIptal" runat="server" Text="İptal" Width="100px" OnClick="btnKitapKayitIptal_Click" />
                </td>
            </tr>
        </table>


    </asp:Panel>--%>
</asp:Content>
