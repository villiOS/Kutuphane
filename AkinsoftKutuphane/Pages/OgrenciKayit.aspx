<%@ Page Title="" Language="C#" MasterPageFile="~/Master/masterPage.Master" AutoEventWireup="true" CodeBehind="OgrenciKayit.aspx.cs" Inherits="AkinsoftKutuphane.Pages.OgrenciKayit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ext:ResourceManager runat="server" ID="ResourceManager1"></ext:ResourceManager>



    <ext:Window
        ID="ogrenciKayitModal"
        runat="server"
        Title="Öğrenci Kayıt"
        Icon="UserAdd"
        Height="400"
        Width="330"
        BodyStyle="background-color: #fff;"
        BodyPadding="5"
        Modal="true"
        Draggable="false"
        Region="Center"
        Resizable="false">
        <Items>
            <ext:FormPanel runat="server">
                <Items>
                    <ext:TextField ID="txtOgrenciNo" runat="server" FieldLabel="Öğrenci No" Note="" Margins="5 5 5 5" />
                    <ext:TextField ID="txtOgrenciAd" runat="server" FieldLabel="Öğrenci Adı" Note="" />
                    <ext:TextField ID="txtOgrenciSoyad" runat="server" FieldLabel="Öğrenci Soyadı" Note="" />
                    
                    
                    <ext:ComboBox
                        IDMode="Static"
                        ID="cmbFakulte"
                        Name="fakulteId"
                        runat="server"
                        FieldLabel="Fakülte"
                        DisplayField="fakulteAd"
                        ValueField="id"
                        Width="300"
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

                    <ext:ComboBox 
                        ID="cmbBolum"
                        Name="bolumID"
                        runat="server"
                        FieldLabel="Bölüm"
                        DisplayField="bolumAd"
                        ValueField="id"
                        Width="300"
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
                    
                    
                    
                    
                    
                    
                    
                    <ext:TextField ID="txtAdres" runat="server" FieldLabel="Adres" Note="" />
                    <ext:TextField ID="txtMemleketAdres" runat="server" FieldLabel="Memleket Adres" Note="" />
                    <ext:DateField
                        ID="dpicKayitTarih"
                        runat="server"
                        Vtype="daterange"
                        FieldLabel="Kayıt Tarihi"
                        Selectable="false">
                    </ext:DateField>
                    <ext:TextField ID="txtCepTelefon" runat="server" FieldLabel="Cep Telefonu" Note="" />

                </Items>

                <Buttons>
                    <ext:Button ID="btnOgrenciKaydet" runat="server" Text="Kaydet" Icon="Add" OnDirectClick="btnOgrenciKaydet_DirectClick"></ext:Button>
                    <ext:Button ID="btnOgrenciKayitIptal" runat="server" Text="İptal" Icon="Cancel" OnDirectClick="btnOgrenciKayitIptal_DirectClick"></ext:Button>
                </Buttons>
            </ext:FormPanel>
        </Items>

        

    </ext:Window>






</asp:Content>
