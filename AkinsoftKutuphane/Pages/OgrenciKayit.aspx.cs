using Entity;
using Entity.Facade;
using Entity.Model;
using Ext.Net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AkinsoftKutuphane.Pages
{
    public partial class OgrenciKayit : System.Web.UI.Page
    {
        KutuphaneDBEntities DB = new KutuphaneDBEntities();
        protected void Page_Load( object sender, EventArgs e )
        {
            if ( Session["yetkili"] != null )
            {

            }
            else
            {
                Response.Redirect( @"../Login/Login.aspx" );
            }
            
            
            ogrenciKayitModal.Show();

            dpicKayitTarih.SelectedValue = System.DateTime.Now;

            ComboFakulteGetir();
        }

        private void ComboFakulteGetir( )
        {
            strFakulte.DataSource = DB.Fakulte.ToList();
            strFakulte.DataBind();
        }

        [DirectMethod( Namespace = "X" )]
        public void ComboBolumGetir( int fakulteId )
        {
            strBolum.DataSource = DB.Bolum.Where( x => x.fakulteId == fakulteId ).ToList();
            strBolum.DataBind();
        }


        protected void btnOgrenciKaydet_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            Ogrenciler ogrenci = new Ogrenciler();
            try
            {

           
            ogrenci.ogrenciNo = txtOgrenciNo.Text;
            ogrenci.ogrenciAd = txtOgrenciAd.Text;
            ogrenci.ogrenciSoyad = txtOgrenciSoyad.Text;
            ogrenci.bolumID = Convert.ToInt32( cmbBolum.SelectedItem.Value );
            ogrenci.adres = txtAdres.Text;
            ogrenci.memleketAdres = txtMemleketAdres.Text;
            ogrenci.kayitTarih = dpicKayitTarih.SelectedDate;
            ogrenci.cepTelefon = txtCepTelefon.Text;

            OgrenciFacade ogrencilerDB = new OgrenciFacade();

            
            ogrencilerDB.Ekle( ogrenci );

            basariliKayitMesajiVer();
            }
            
            catch ( Exception ex )
            {
                System.Windows.Forms.MessageBox.Show( ex.Message );
                X.Msg.Notify( new NotificationConfig
                {
                    Icon = Icon.UserAlert,
                    Title = "Kayıt Yapılamadı !"
                } ).Show();
            }
        }

        private void basariliKayitMesajiVer( )
        {
            X.Msg.Notify( new NotificationConfig
            {
                Icon = Icon.Accept,
                Title = "Kayıt Başarılı"
            } ).Show();
        }

        protected void btnOgrenciKayitIptal_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            ogrenciKayitModal.Close();
        }
    }
}