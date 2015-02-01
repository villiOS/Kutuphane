using Entity;
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
    public partial class KitapKayit : System.Web.UI.Page
    {
        protected void Page_Load( object sender, EventArgs e )
        {

            if ( Session["yetkili"] != null )
            {
                
            }
            else
            {
                Response.Redirect( @"../Login/Login.aspx" );
            }
            
            
            
            kitapKayitModal.Show();
        }

        protected void btnKitapKaydet_Click( object sender, EventArgs e )
        {
            
            try
            {
            
            Kitaplar kitap = new Kitaplar();

            kitap.kitapKodu = txtKitapKodu.Text;
            kitap.kitapAdi = txtKitapAdi.Text;
            kitap.kategori = txtKategori.Text;
            kitap.yayinYili = dpicYayinYili.SelectedDate;
            kitap.yazari = txtYazari.Text;
            kitap.ISBN = txtISBN.Text;
            kitap.sayfaSayisi = Convert.ToInt16( txtSayfaSayisi.Text );

            KitapFacade kitaplarDB = new KitapFacade();
            
            kitaplarDB.Ekle( kitap );

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

        protected void btnKitapKayitIptal_Click( object sender, EventArgs e )
        {
            kitapKayitModal.Close();
        }
    }
}