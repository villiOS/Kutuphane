<%@ Page Title="" Language="C#" MasterPageFile="~/Master/masterPage.Master" AutoEventWireup="true" CodeBehind="KitapOduncTeslim.aspx.cs" Inherits="AkinsoftKutuphane.Pages.KitapOduncTeslim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ext:ResourceManager runat="server" ID="ResourceManager1"></ext:ResourceManager>

    <ext:Window
        ID="kitapOduncTeslimModal"
        runat="server"
        Title="Kitap Ödünç-Teslim"
        Icon="BookAdd"
        Height="600"
        Width="750"
        BodyStyle="background-color: #fff;"
        BodyPadding="5"
        Modal="true"
        Draggable="false"
        Region="Center"
        Resizable="false">
        <Items>

            <ext:TabPanel
                runat="server"
                Width="727"
                Height="555"
                Margins="0 0 0 0">
                <Items>
                    <ext:Panel
                        runat="server"
                        Title="Ödünç"
                        AutoDataBind="true">
                        <Items>
                            <ext:FieldSet runat="server" Title="Arama" Height="150px">
                                <Items>
                                    <ext:TextField
                                        ID="txtOgrenciNumaraAra"
                                        runat="server"
                                        FieldLabel="Öğrenci Ara"
                                        Note="öğrenci no (örn: 2010639061)"
                                        Margins="20 20 20 20"
                                        Width="500">
                                        <RightButtons>
                                            <ext:Button ID="btnOgrenciAra" runat="server" Text="Ara" Icon="Find" OnDirectClick="btnOgrenciAra_DirectClick"></ext:Button>
                                        </RightButtons>
                                    </ext:TextField>

                                    <ext:TextField
                                        ID="txtKitapAra"
                                        runat="server"
                                        FieldLabel="Kitap Ara"
                                        Note="kitap adı (örn: Da Vinci'nin Şifresi)"
                                        Margins="20 20 20 20"
                                        Width="500">
                                        <RightButtons>
                                            <ext:Button ID="btnKitapAra" runat="server" Text="Ara" Icon="Find" OnDirectClick="btnKitapAra_DirectClick"></ext:Button>
                                        </RightButtons>
                                    </ext:TextField>

                                    <ext:Button
                                        ID="btnOduncBilgiSorgula"
                                        OnDirectClick="btnOduncBilgiSorgula_DirectClick"
                                        runat="server"
                                        Text="Ödünç Bilgisi Sorgula"
                                        Icon="CartMagnify"
                                        IconAlign="Right"
                                        Width="500"
                                        Height="30"
                                        Margin="0"
                                        Selectable="false">
                                    </ext:Button>
                                </Items>

                            </ext:FieldSet>

                            <ext:FieldSet runat="server" Title="Ödünç Bilgisi" Height="300">
                                <Items>
                                    <ext:GridPanel
                                        ID="gridPanelOdunc"
                                        runat="server"
                                        Title="Ödünç Bilgi Ekranı">

                                        <Store>
                                            <ext:Store ID="dgridOduncBilgisi" runat="server">
                                                <Model>
                                                    <ext:Model runat="server">
                                                        <Fields>
                                                            <ext:ModelField Name="kitapAdi"></ext:ModelField>
                                                            <ext:ModelField Name="ogrenciNo"></ext:ModelField>
                                                            <ext:ModelField Name="ogrenciAd"></ext:ModelField>
                                                            <ext:ModelField Name="ogrenciSoyad"></ext:ModelField>
                                                            <ext:ModelField Name="oduncTarih"></ext:ModelField>
                                                            <ext:ModelField Name="teslimTarih"></ext:ModelField>
                                                        </Fields>
                                                    </ext:Model>
                                                </Model>
                                            </ext:Store>
                                        </Store>

                                        <ColumnModel runat="server">
                                            <Columns>
                                                <ext:Column runat="server" Text="Kitap Adı" DataIndex="kitapAdi" />
                                                <ext:Column runat="server" Text="Öğrenci No" DataIndex="ogrenciNo" />
                                                <ext:Column runat="server" Text="Adı" DataIndex="ogrenciAd" />
                                                <ext:Column runat="server" Text="Soyadı" DataIndex="ogrenciSoyad" />
                                                <ext:Column runat="server" Text="Ödünç Tarihi" DataIndex="oduncTarih" />
                                                <ext:Column runat="server" Text="Teslim Tarihi" DataIndex="teslimTarih" />
                                            </Columns>
                                        </ColumnModel>



                                    </ext:GridPanel>

                                </Items>
                            </ext:FieldSet>

                            <ext:FieldSet runat="server" Title="Onay" Height="100">
                                <Items>
                                    <ext:Label ID="txtOduncBilgiAd" runat="server" Text="Ödünç Alan Öğrenci --> " RowSpan="1"></ext:Label>
                                    <ext:Label ID="txtOduncBilgiKitap" runat="server" Text=" Ödünç Alınan Kitap " RowSpan="2"></ext:Label>
                                    <ext:Label ID="txtOduncBilgiTarih" runat="server" Text=" Tarih" RowSpan="3"></ext:Label>
                                    <ext:Button ID="btnOduncOnay" OnDirectClick="btnOduncOnay_DirectClick" runat="server" Text="Onay" Icon="DiskBlack" IconAlign="Left" RowSpan="4"></ext:Button>
                                    <ext:Button ID="btnOduncIptal" OnDirectClick="btnOduncIptal_DirectClick" runat="server" Text="İptal" Icon="Cancel" IconAlign="Left" RowSpan="5"></ext:Button>
                                </Items>
                            </ext:FieldSet>

                        </Items>
                    </ext:Panel>

                    <ext:Panel
                        runat="server"
                        Title="Teslim"
                        AutoDataBind="true">
                        <Items>
                            <ext:FieldSet runat="server" Title="Kayıt Arama" Height="80">
                                <Items>
                                    <ext:TextField
                                        ID="txtOgrenciAdi"
                                        runat="server"
                                        FieldLabel="Öğrenci Ara"
                                        Note="öğrenci no (örn: 2010639061)"
                                        Margins="20 20 20 20"
                                        Width="500">
                                        <RightButtons>
                                            <ext:Button ID="btnOgrenciAraTeslim" runat="server" Text="Ara" Icon="Find" OnDirectClick="btnOgrenciAraTeslim_DirectClick"></ext:Button>
                                        </RightButtons>

                                    </ext:TextField>

                                </Items>
                            </ext:FieldSet>

                            <ext:FieldSet runat="server" Title="Kitap Teslim" Height="350">
                                <Items>
                                    <ext:GridPanel
                                        ID="gridPanelTeslim" IDMode="Static"
                                        runat="server"
                                        Title="Ödünç Bilgi Ekranı">

                                        <Store>
                                            <ext:Store ID="dgridKitapTeslim" runat="server">
                                                <Model>
                                                    <ext:Model runat="server">
                                                        <Fields>
                                                             <ext:ModelField Name="id"></ext:ModelField>
                                                            <ext:ModelField Name="kitapAdi"></ext:ModelField>
                                                            <ext:ModelField Name="ogrenciNo"></ext:ModelField>
                                                            <ext:ModelField Name="ogrenciAd"></ext:ModelField>
                                                            <ext:ModelField Name="ogrenciSoyad"></ext:ModelField>
                                                            <ext:ModelField Name="oduncTarih"></ext:ModelField>
                                                        </Fields>
                                                    </ext:Model>
                                                </Model>
                                            </ext:Store>
                                        </Store>

                                        <ColumnModel runat="server">
                                            <Columns>
                                                <ext:Column runat="server" Text="Kitap Adı" DataIndex="kitapAdi" />
                                                <ext:Column runat="server" Text="Öğrenci No" DataIndex="ogrenciNo" />
                                                <ext:Column runat="server" Text="Adı" DataIndex="ogrenciAd" />
                                                <ext:Column runat="server" Text="Soyadı" DataIndex="ogrenciSoyad" />
                                                <ext:Column runat="server" Text="Ödünç Tarihi" DataIndex="oduncTarih" />
                                            </Columns>
                                        </ColumnModel>

                                        <SelectionModel>
                                            <ext:RowSelectionModel runat="server" Mode="Single" ID="rsmKitapTeslim">                                              
                                            </ext:RowSelectionModel>
                                        </SelectionModel>

                                    </ext:GridPanel>
                                </Items>
                            </ext:FieldSet>

                            <ext:FieldSet runat="server" Title="Teslim Onay" Height="80">
                                <Items>
                                    <ext:Button ID="btnKitapTeslimOnay" runat="server" Text="Teslim Al"
                                         Icon="CartPut" IconAlign="Right" RowSpan="1" Width="150" Height="30">
                                        <DirectEvents>

                                            <Click OnEvent="btnKitapTeslimOnay_DirectClick">
                                                <ExtraParams>
                                                    <ext:Parameter Name="data" Value="App.rsmKitapTeslim.getSelection()[0].data" Mode="Raw"></ext:Parameter>
                                                </ExtraParams>
                                                  <EventMask ShowMask="true" Msg="Processing..."></EventMask>
                                            </Click>
                                        </DirectEvents>
                                    </ext:Button>
                                    <ext:Button ID="btnTeslimIptal" OnDirectClick="btnTeslimIptal_DirectClick"
                                         runat="server" Text="İptal" Icon="Cancel" IconAlign="Right" RowSpan="2" Width="150" Height="30"></ext:Button>
                                </Items>
                            </ext:FieldSet>
                        </Items>
                    </ext:Panel>

                </Items>
            </ext:TabPanel>
        </Items>







    </ext:Window>





</asp:Content>
