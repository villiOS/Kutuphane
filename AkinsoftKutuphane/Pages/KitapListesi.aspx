<%@ Page Title="" Language="C#" MasterPageFile="~/Master/masterPage.Master" AutoEventWireup="true" CodeBehind="KitapListesi.aspx.cs" Inherits="AkinsoftKutuphane.Pages.KitapListesi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ext:ResourceManager runat="server" ID="ResourceManager1"></ext:ResourceManager>





    <ext:Window
        ID="kitapListesiModal"
        runat="server"
        Title="Kitap Listesi"
        Icon="ApplicationViewList"
        Height="550"
        Width="602"
        BodyStyle="background-color: #fff;"
        BodyPadding="5"
        Modal="true"
        Draggable="false"
        Region="Center"
        Resizable="false"
        AutoScroll="false">
        <Items>
            <ext:GridPanel
                runat="server"
                IDMode="Static"
                Title="Kitap Listesi"
                Margins="0 0 5 5"
                Icon="UserSuit"
                Region="Center"
                Frame="true">
                <Store>
                    <ext:Store
                        ID="dgridKitapListesi"
                        runat="server"
                        OnReadData="dgridKitapListesi_ReadData">
                        <Model>
                            <ext:Model runat="server">
                                <Fields>
                                    <ext:ModelField Name="id" />
                                    <ext:ModelField Name="kitapKodu" />
                                    <ext:ModelField Name="kitapAdi" />
                                    <ext:ModelField Name="kategori" />
                                    <ext:ModelField Name="yayinYili" />
                                    <ext:ModelField Name="yazari" />
                                    <ext:ModelField Name="ISBN" />
                                    <ext:ModelField Name="sayfaSayisi" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel runat="server">
                    <Columns>
                        <ext:Column runat="server" DataIndex="kitapKodu" Text="Kitap Kodu" />
                        <ext:Column runat="server" DataIndex="kitapAdi" Text="Kitap Adı" />
                        <ext:Column runat="server" DataIndex="kategori" Text="Kategori" />
                        <ext:Column runat="server" DataIndex="yayinYili" Text="Yayın Yılı" />
                        <ext:Column runat="server" DataIndex="ISBN" Text="ISBN" />
                        <ext:Column runat="server" DataIndex="sayfaSayisi" Text="Sayfa Sayısı" />
                    </Columns>
                </ColumnModel>
                <SelectionModel>
                    <ext:RowSelectionModel runat="server" Mode="Single" ID="rsmKitapListesi">
                        <DirectEvents>
                            <Select OnEvent="RowSelect">
                                <EventMask ShowMask="true" Target="CustomTarget" CustomTarget="#{FormPanel1}" />
                                <ExtraParams>
                                    <%--or can use params[2].id as value--%>
                                    <ext:Parameter Name="data" Value="App.rsmKitapListesi.getSelection()[0].data" Mode="Raw" />
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
                Split="true"
                Margins="0 5 5 5"
                BodyPadding="2"
                Frame="true"
                Title="Kitap Düzenleme"
                Width="280"
                Height="350"
                Icon="BookEdit"
                DefaultAnchor="100%"
                AutoScroll="false"
                RowSpan="1"
                Region="East">
                <Items>
                    <ext:TextField runat="server" FieldLabel="Kitap Kodu" Name="kitapKodu" ID="txtKitapKodu" />
                    <ext:TextField runat="server" FieldLabel="Kitap Adı" Name="kitapAdi" ID="txtKitapAdi" />
                    <ext:TextField runat="server" FieldLabel="Kategori" Name="kategori" ID="txtKategori" />
                    <ext:DateField runat="server" FieldLabel="Yayın Yılı" Name="yayinYili" Format="dd-MM-yyyy" ID="dpicYayinYili" />
                    <ext:TextField runat="server" FieldLabel="Yazarı" Name="yazari" ID="txtyazari" />
                    <ext:TextField runat="server" FieldLabel="ISBN" Name="ISBN" ID="txtISBN" />
                    <ext:TextField runat="server" FieldLabel="Sayfa Sayısı" Name="sayfaSayisi" ID="txtSayfaSayisi" />

                </Items>

                <Items>
                    <ext:Button runat="server"
                        ID="btnKitapGuncelle"
                        OnDirectClick="btnKitapGuncelle_DirectClick"
                        Text="Güncelle" Icon="DatabaseSave" RowSpan="1">
                    </ext:Button>

                    <ext:Button runat="server"
                        ID="btnKitapKayitIptal"
                        OnDirectClick="btnKitapKayitIptal_DirectClick"
                        Text="İptal" Icon="Cancel" RowSpan="2">
                    </ext:Button>
                </Items>
            </ext:FormPanel>

             <ext:FormPanel
                ID="FormPanel2"
                runat="server"
                Margins="0 5 5 5"
                BodyPadding="2"
                Frame="true"
                Title="Arama"
                Width="280"
                Height="350"
                Icon="Find"
                DefaultAnchor="100%"
                AutoScroll="false"
                RowSpan="2"
                X="300"
                Y="-350"
                Region="West">


                <Items>
                    <ext:TextField ID="txtKitapKoduAra" runat="server" FieldLabel="Kitap Kodu" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtKitapAdıAra" runat="server" FieldLabel="Kitap Adı" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtKategoriAra" runat="server" FieldLabel="Kategori" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtYazarAra" runat="server" FieldLabel="Yazar" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtISBNAra" runat="server" FieldLabel="ISBN" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtSayfaSayısıAra" runat="server" FieldLabel="Sayfa Sayısı" RowSpan="1"></ext:TextField>

                    <ext:Button ID="btnKitapAra" OnDirectClick="btnKitapAra_DirectClick" runat="server" Text="Ara" Icon="Find" RowSpan="2"></ext:Button>
                </Items>

            </ext:FormPanel>

        </Items>

    </ext:Window>



</asp:Content>
