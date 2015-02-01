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
    public partial class KitapListesi : System.Web.UI.Page
    {
        KutuphaneDBEntities DB = new KutuphaneDBEntities();
        Kitaplar kitap = new Kitaplar();
        static int idDegeri = 0;
        protected void Page_Load( object sender, EventArgs e )
        {
            if ( Session["yetkili"] != null )
            {

            }
            else
            {
                Response.Redirect( @"../Login/Login.aspx" );
            }
            
            
            kitapListesiModal.Show();

            var kitaplar = ( DB.Kitaplar.Select( x => new
            {
                x.kitapKodu,
                x.kitapAdi,
                x.kategori,
                x.yayinYili,
                x.yazari,
                x.ISBN,
                x.sayfaSayisi

            } ) ).ToList();

            dgridKitapListesi.DataSource = kitaplar;
            dgridKitapListesi.DataBind();
        }

        protected void dgridKitapListesi_ReadData( object sender, Ext.Net.StoreReadDataEventArgs e )
        {
            this.dgridKitapListesi.DataBind();
        }

        protected void RowSelect( object sender, DirectEventArgs e )
        {
            var json = e.ExtraParams["data"];

            var data = Ext.Net.JSON.Deserialize<Kitaplar>( json );

            kitap = Kitaplar.GetKitaplar( data.kitapKodu );
            
            this.FormPanel1.SetValues( new
                {
                    kitap.kitapKodu,
                    kitap.kitapAdi,
                    kitap.kategori,
                    kitap.yayinYili,
                    kitap.yazari,
                    kitap.ISBN,
                    kitap.sayfaSayisi
                } );

            var id = from a in DB.Kitaplar
                     where a.kitapKodu == data.kitapKodu
                     select a.id;

            foreach ( var item in id )
            {
                kitap.id = Convert.ToInt32( item );
                idDegeri = kitap.id;
                break;
            }
        }

        protected void btnKitapGuncelle_DirectClick( object sender, DirectEventArgs e )
        {
            kitap.id = idDegeri;
            kitap.kitapKodu = txtKitapKodu.Text;
            kitap.kitapAdi = txtKitapAdi.Text;
            kitap.kategori = txtKategori.Text;
            kitap.yayinYili = dpicYayinYili.SelectedDate;
            kitap.yazari = txtyazari.Text;
            kitap.ISBN = txtISBN.Text;
            kitap.sayfaSayisi = Convert.ToInt16( txtSayfaSayisi.Text );

            //////////////////////////////////////////////////
            //Güncel Bilgilerin DB'ye Kayıt Edilmesi
            KitapGuncelleFacade ogrenciGuncelle = new KitapGuncelleFacade();
            ogrenciGuncelle.Guncelle( kitap );
            //////////////////////////////////////////////////

            kitapListesiModal.Close();









        }

        protected void btnKitapKayitIptal_DirectClick( object sender, DirectEventArgs e )
        {
            kitapListesiModal.Close();
        }

        protected void btnKitapAra_DirectClick( object sender, DirectEventArgs e )
        {
            var bulunanKayitlar_ = (
                DB.Kitaplar.Where(
                    x => x.kitapKodu.Contains( txtKitapKoduAra.Text ) &&
                         x.kitapAdi.Contains( txtKitapAdıAra.Text ) &&
                         x.kategori.Contains( txtKategoriAra.Text ) &&
                         x.yazari.Contains( txtYazarAra.Text ) &&
                         x.ISBN.Contains( txtISBNAra.Text ) 
                         ) ).ToList();

            var bulunanKayitlar = ( bulunanKayitlar_.Select( x => new
            {
                x.kitapKodu,
                x.kitapAdi,
                x.kategori,
                x.yayinYili,
                x.yazari,
                x.ISBN,
                x.sayfaSayisi
            } ) ).ToList();

            dgridKitapListesi.DataSource = bulunanKayitlar;
            dgridKitapListesi.LoadData( bulunanKayitlar );
            dgridKitapListesi.DataBind();
        }
    }
}