<%@ Page Title="" Language="C#" MasterPageFile="~/Master/masterPage.Master" AutoEventWireup="true" CodeBehind="OduncRaporu.aspx.cs" Inherits="AkinsoftKutuphane.Pages.OduncRaporu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <ext:ResourceManager runat="server" ID="ResourceManager1"></ext:ResourceManager>



    <ext:Window
        ID="oduncRaporModal"
        runat="server"
        Title="Raporlama"
        Icon="ApplicationViewList"
        Height="550"
        Width="875"
        BodyStyle="background-color: #fff;"
        BodyPadding="5"
        Modal="true"
        Draggable="false"
        Region="Center"
        Resizable="false"
        AutoScroll="true">

        <Items>
            <ext:GridPanel
                runat="server"
                IDMode="Static"
                Title="Rapor"
                Margins="0 0 5 5"
                Icon="UserSuit"
                Region="Center"
                Frame="true">
                <Store>
                    <ext:Store
                        ID="dgridRaporListesi"
                        runat="server"
                        OnReadData="Store1_Refresh">
                        <Model>
                            <ext:Model runat="server">
                                <Fields>
                                    <ext:ModelField Name="id" />
                                    <ext:ModelField Name="ogrenciNo" />
                                    <ext:ModelField Name="ogrenciAd" />
                                    <ext:ModelField Name="ogrenciSoyad" />
                                    <ext:ModelField Name="kitapKodu" />
                                    <ext:ModelField Name="kitapAdi" />
                                    <ext:ModelField Name="yazari" />
                                    <ext:ModelField Name="oduncTarih" />
                                    <ext:ModelField Name="teslimTarih" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel runat="server">
                    <Columns>
                        <ext:Column runat="server" DataIndex="ogrenciNo" Text="Öğrenci No" />
                        <ext:Column runat="server" DataIndex="ogrenciAd" Text="Öğrenci Adı" />
                        <ext:Column runat="server" DataIndex="ogrenciSoyad" Text="Öğrenci Soyadı" />
                        <ext:Column runat="server" DataIndex="kitapKodu" Text="Kitap Kodu" />
                        <ext:Column runat="server" DataIndex="kitapAdi" Text="Kitap Adı" />
                        <ext:Column runat="server" DataIndex="yazari" Text="Yazarı" />
                        <ext:Column runat="server" DataIndex="oduncTarih" Text="Ödünç Tarihi" />
                        <ext:Column runat="server" DataIndex="teslimTarih" Text="Teslim Tarihi" />
                    </Columns>
                </ColumnModel>
                <SelectionModel>
                    <ext:RowSelectionModel runat="server" Mode="Single" ID="rsmRaporListesi">
                        <DirectEvents>
                            <Select OnEvent="RowSelect">
                                <EventMask ShowMask="true" Target="CustomTarget" CustomTarget="#{FormPanel1}" />
                                <ExtraParams>
                                    <%--or can use params[2].id as value--%>
                                    <ext:Parameter Name="data" Value="App.rsmRaporListesi.getSelection()[0].data" Mode="Raw" />
                                </ExtraParams>
                            </Select>
                        </DirectEvents>
                    </ext:RowSelectionModel>
                </SelectionModel>
                <BottomBar>
                    <ext:PagingToolbar runat="server" />
                </BottomBar>
            </ext:GridPanel>

         
            
            
            <ext:FormPanel
                ID="FormPanel1"
                runat="server"
                Margins="0 5 5 5"
                BodyPadding="2"
                Frame="true"
                Title="Öğrenciye Göre Arama"
                Width="280"
                Height="350"
                Icon="User"
                DefaultAnchor="100%"
                AutoScroll="false"
                RowSpan="1"
                Region="West">


                <Items>
                    <ext:TextField ID="txtOgrenciNoAra" runat="server" FieldLabel="Öğrenci No" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtOgrenciAdAra" runat="server" FieldLabel="Adı" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtOgrenciSoyadAra" runat="server" FieldLabel="Soyadı" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtBolumAra" runat="server" FieldLabel="Bölümü" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtFakulteAra" runat="server" FieldLabel="Fakültesi" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtCepTelefonuAra" runat="server" FieldLabel="Cep Telefonu" RowSpan="1"></ext:TextField>

                    <ext:Button ID="btnOgrenciyeGoreAra" OnDirectClick="btnOgrenciyeGoreAra_DirectClick" runat="server" Text="Ara" Icon="Find" RowSpan="2"></ext:Button>
                </Items>

            </ext:FormPanel>

            <ext:FormPanel
                ID="FormPanel2"
                runat="server"
                Margins="0 5 5 5"
                BodyPadding="2"
                Frame="true"
                Title="Kitaba Göre"
                Width="280"
                Height="350"
                Icon="Book"
                DefaultAnchor="100%"
                AutoScroll="false"
                RowSpan="2"
                X="300"
                Y="-350"
                Region="West">


                <Items>
                    <ext:TextField ID="txtKitapKoduAra" runat="server" FieldLabel="Kitap Kodu" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtKitapAdiAra" runat="server" FieldLabel="Kitap Adı" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtYazarAra" runat="server" FieldLabel="Yazarı" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtKategoriAra" runat="server" FieldLabel="Kategori" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtISBNAra" runat="server" FieldLabel="ISBN No" RowSpan="1"></ext:TextField>

                    <ext:Button ID="btnKitabaGoreAra" OnDirectClick="btnKitabaGoreAra_DirectClick" runat="server" Text="Ara" Icon="Find" RowSpan="2"></ext:Button>
                </Items>

            </ext:FormPanel>
        </Items>

    </ext:Window>








</asp:Content>
