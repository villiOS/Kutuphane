<%@ Page Title="" Language="C#" MasterPageFile="~/Master/masterPage.Master" AutoEventWireup="true" CodeBehind="FakulteBolumKayit.aspx.cs" Inherits="AkinsoftKutuphane.Pages.FakulteBolumKayit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <ext:ResourceManager runat="server" ID="ResourceManager1"></ext:ResourceManager>



    <ext:Window
        ID="fakulteBolumKayitModal"
        runat="server"
        Title="Kitap Kayıt"
        Icon="BookAdd"
        Height="250"
        Width="475"
        BodyStyle="background-color: #fff;"
        BodyPadding="5"
        Modal="true"
        Draggable="false"
        Region="Center"
        Resizable="false">


        <Items>
            <ext:FieldSet runat="server" Title="Kayıt" Height="200">
                <Items>
                    <ext:FieldSet runat="server" Title="Fakülte Ekle" Y="10">
                        <Items>
                            <ext:TextField runat="server" ID="txtFakulte" FieldLabel="Fakülte Adı" Width="400">
                                <RightButtons>
                                    <ext:Button runat="server" ID="btnFakulteEkle" OnDirectClick="btnFakulteEkle_DirectClick" Text="Ekle" Icon="PageAdd"></ext:Button>
                                </RightButtons>
                            </ext:TextField>
                        </Items>
                        
                    </ext:FieldSet>

                    <ext:FieldSet runat="server" Title="Bölüm Ekle" Y="30">
                        <Items>
                            <ext:ComboBox 
                                IDMode="Static"
                                Name="fakulteId"
                                runat="server" 
                                FieldLabel="Fakülte Seç" 
                                ID="cboxFakulte"
                                ValueField="id"
                                DisplayField="fakulteAd" 
                                Width="400">
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
                                    <Change Handler="X.ComboFakulteGetir(App.cmbFakulte.value);"></Change>
                                </Listeners>



                            </ext:ComboBox>
                            <ext:TextField runat="server" ID="txtBolum" FieldLabel="Bölüm Adı" Width="400">
                                <RightButtons>
                                    <ext:Button runat="server" ID="btnBolumEkle" OnDirectClick="btnBolumEkle_DirectClick" Text="Ekle" Icon="PageAdd"></ext:Button>
                                </RightButtons>
                            </ext:TextField>

                        </Items>
                    </ext:FieldSet>

                </Items>

            </ext:FieldSet>

        </Items>




    </ext:Window>







</asp:Content>
