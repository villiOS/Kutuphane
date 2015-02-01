<%@ Page Title="" Language="C#" MasterPageFile="~/Master/masterPage.Master" AutoEventWireup="true" CodeBehind="OgrenciListesi.aspx.cs" Inherits="AkinsoftKutuphane.Pages.OgrenciListesi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <ext:ResourceManager runat="server" ID="ResourceManager1"></ext:ResourceManager>





    <ext:Window
        ID="ogrenciListesiModal"
        runat="server"
        Title="Öğrenci Listesi"
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
                Title="Öğrenci Listesi"
                Margins="0 0 5 5"
                Icon="UserSuit"
                Region="Center"
                Frame="true">
                <Store>
                    <ext:Store
                        ID="dgridOgrenciListesi"
                        runat="server"
                        OnReadData="Store1_Refresh">
                        <Model>
                            <ext:Model runat="server">
                                <Fields>
                                    <ext:ModelField Name="id" />
                                    <ext:ModelField Name="ogrenciNo" />
                                    <ext:ModelField Name="ogrenciAd" />
                                    <ext:ModelField Name="ogrenciSoyad" />
                                    <ext:ModelField Name="bolumAd" />
                                    <ext:ModelField Name="kayitTarih" />
                                    <ext:ModelField Name="cepTelefon" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel runat="server">
                    <Columns>
                        <ext:Column runat="server" DataIndex="ogrenciNo" Text="Öğrenci No" />
                        <ext:Column runat="server" DataIndex="ogrenciAd" Text="Öğrenci Adı" />
                        <ext:Column runat="server" DataIndex="ogrenciSoyad" Text="Öğrenci Soyad" />
                        <ext:Column runat="server" DataIndex="bolumAd" Text="Bölüm" />
                        <ext:Column runat="server" DataIndex="kayitTarih" Text="Kayıt Tarihi" />
                        <ext:Column runat="server" DataIndex="cepTelefon" Text="Cep Telefonu" />
                    </Columns>
                </ColumnModel>
                <SelectionModel>
                    <ext:RowSelectionModel runat="server" Mode="Single" ID="rsmOgrenciListesi">
                        <DirectEvents>
                            <Select OnEvent="RowSelect">
                                <EventMask ShowMask="true" Target="CustomTarget" CustomTarget="#{FormPanel1}" />
                                <ExtraParams>
                                    <%--or can use params[2].id as value--%>
                                    <ext:Parameter Name="data" Value="App.rsmOgrenciListesi.getSelection()[0].data" Mode="Raw" />
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
                Title="Öğrenci Düzenleme"
                Width="280"
                Height="350"
                Icon="User"
                DefaultAnchor="100%"
                AutoScroll="false"
                RowSpan="1"
                Region="East">
                <Items>
                    <ext:TextField runat="server" FieldLabel="Öğrenci No" Name="ogrenciNo" ID="txtOgrenciNo" />
                    <ext:TextField runat="server" FieldLabel="Öğrenci Adı" Name="ogrenciAd" ID="txtOgrenciAd" />
                    <ext:TextField runat="server" FieldLabel="Öğrenci Soyadı" Name="ogrenciSoyad" ID="txtOgrenciSoyad" />

                    <ext:ComboBox
                        IDMode="Static"
                        ID="cmbFakulte"
                        Name="fakulteId"
                        runat="server"
                        FieldLabel="Fakülte"
                        DisplayField="fakulteAd"
                        ValueField="id"
                        Width="320"
                        LabelWidth="130">
                        <Store>
                            <ext:Store runat="server" ID="strFakulte" IDMode="Static">
                                <Model>
                                    <ext:Model IDMode="Static" runat="server">
                                        <Fields>
                                            <ext:ModelField Name="id" />
                                            <ext:ModelField Name="fakulteAd" />

                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                        <Listeners>
                            <Change Handler="X.ComboBolumGetir(App.cmbFakulte.value);"></Change>
                        </Listeners>
                    </ext:ComboBox>

                    <ext:ComboBox ID="cmbBolum"
                        Name="bolumID"
                        runat="server"
                        FieldLabel="Bölüm"
                        DisplayField="bolumAd"
                        ValueField="id"
                        Width="320"
                        LabelWidth="130">
                        <Store>
                            <ext:Store runat="server" ID="strBolum" IDMode="Static">
                                <Model>
                                    <ext:Model IDMode="Static" runat="server">
                                        <Fields>
                                            <ext:ModelField Name="id" />
                                            <ext:ModelField Name="bolumAd" />

                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                    </ext:ComboBox>


                    <ext:DateField runat="server" FieldLabel="Kayıt Tarihi" Name="kayitTarih" Format="dd-MM-yyyy" AutoDataBind="true" />
                    <ext:TextField runat="server" FieldLabel="Adres" Name="adres" ID="txtAdres" />
                    <ext:TextField runat="server" FieldLabel="Ev Adresi" Name="memleketAdres" ID="txtMemleketAdres" />
                    <ext:TextField runat="server" FieldLabel="Cep Telefonu" Name="cepTelefon" ID="txtCepTelefon" />



                </Items>

                <Items>
                    <ext:Button runat="server"
                        ID="btnOgrenciGuncelle"
                        OnDirectClick="btnOgrenciGuncelle_DirectClick"
                        Text="Güncelle" Icon="DatabaseSave" RowSpan="1">
                    </ext:Button>

                    <ext:Button runat="server"
                        ID="btnOgrenciKayitIptal"
                        OnDirectClick="btnOgrenciKayitIptal_DirectClick"
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
                    <ext:TextField ID="txtOgrenciNoAra" runat="server" FieldLabel="Öğrenci No" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtOgrenciAdAra" runat="server" FieldLabel="Adı" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtOgrenciSoyadAra" runat="server" FieldLabel="Soyadı" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtBolumAra" runat="server" FieldLabel="Bölümü" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtFakulteAra" runat="server" FieldLabel="Fakültesi" RowSpan="1"></ext:TextField>
                    <ext:TextField ID="txtCepTelefonuAra" runat="server" FieldLabel="Cep Telefonu" RowSpan="1"></ext:TextField>

                    <ext:Button ID="btnOgrenciAra" OnDirectClick="btnOgrenciAra_DirectClick" runat="server" Text="Ara" Icon="Find" RowSpan="2"></ext:Button>
                </Items>

            </ext:FormPanel>



        </Items>
    </ext:Window>



</asp:Content>
