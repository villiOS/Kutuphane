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
    public partial class OduncRaporu : System.Web.UI.Page
    {
        KutuphaneDBEntities DB = new KutuphaneDBEntities();
        Odunc odunc = new Odunc();
        protected void Page_Load( object sender, EventArgs e )
        {
            if ( Session["yetkili"] != null )
            {

            }
            else
            {
                Response.Redirect( @"../Login/Login.aspx" );
            }
            
            
            
            oduncRaporModal.Show();

            var oduncListesi = ( DB.Odunc.Select( x => new
            {
                x.Ogrenciler.ogrenciNo,  
                x.Ogrenciler.ogrenciAd,  
                x.Ogrenciler.ogrenciSoyad,
                x.Kitaplar.kitapKodu,
                x.Kitaplar.kitapAdi,
                x.Kitaplar.yazari,
                x.oduncTarih,
                x.teslimTarih
            } ) ).ToList();

            dgridRaporListesi.DataSource = oduncListesi;
            dgridRaporListesi.LoadData( oduncListesi );
            dgridRaporListesi.DataBind();
        }

        protected void Store1_Refresh( object sender, StoreReadDataEventArgs e )
        {
            this.dgridRaporListesi.DataBind();
        }


        protected void RowSelect( object sender, DirectEventArgs e )
        {
            
        }

       

        protected void btnOgrenciyeGoreAra_DirectClick( object sender, DirectEventArgs e )
        {
            var ogrenciyeGoreOduncler_ = (
               DB.Odunc.Where(
                   x => x.Ogrenciler.ogrenciNo.Contains( txtOgrenciNoAra.Text ) &&
                        x.Ogrenciler.ogrenciAd.Contains( txtOgrenciAdAra.Text ) &&
                        x.Ogrenciler.ogrenciSoyad.Contains( txtOgrenciSoyadAra.Text ) &&
                        x.Ogrenciler.Bolum.bolumAd.Contains( txtBolumAra.Text ) &&
                        x.Ogrenciler.Bolum.Fakulte.fakulteAd.Contains( txtFakulteAra.Text ) &&
                        x.Ogrenciler.cepTelefon.Contains( txtCepTelefonuAra.Text ) 
               ) ).ToList();

            var ogrenciyeGoreOduncler = ( ogrenciyeGoreOduncler_.Select( x => new
            {

                x.Ogrenciler.ogrenciNo,
                x.Ogrenciler.ogrenciAd,
                x.Ogrenciler.ogrenciSoyad,
                x.Kitaplar.kitapKodu,
                x.Kitaplar.kitapAdi,
                x.Kitaplar.yazari,
                x.oduncTarih,
                x.teslimTarih

            } ) ).ToList();

            dgridRaporListesi.DataSource = ogrenciyeGoreOduncler;
            dgridRaporListesi.LoadData( ogrenciyeGoreOduncler );
            dgridRaporListesi.DataBind();
        }

        protected void btnKitabaGoreAra_DirectClick( object sender, DirectEventArgs e )
        {
            var kitabaGoreOduncler_ = (
                DB.Odunc.Where(
                    x => x.Kitaplar.kitapKodu.Contains( txtKitapKoduAra.Text ) &&
                         x.Kitaplar.kitapAdi.Contains( txtKitapAdiAra.Text ) &&
                         x.Kitaplar.yazari.Contains( txtYazarAra.Text ) &&
                         x.Kitaplar.kategori.Contains(txtKategoriAra.Text) &&
                         x.Kitaplar.ISBN.Contains( txtISBNAra.Text )
                ) ).ToList();

            var kitabaGoreOduncler = ( kitabaGoreOduncler_.Select( x => new
            {

                x.Ogrenciler.ogrenciNo,
                x.Ogrenciler.ogrenciAd,
                x.Ogrenciler.ogrenciSoyad,
                x.Kitaplar.kitapKodu,
                x.Kitaplar.kitapAdi,
                x.Kitaplar.yazari,
                x.oduncTarih,
                x.teslimTarih


            } ) ).ToList();

            dgridRaporListesi.DataSource = kitabaGoreOduncler;
            dgridRaporListesi.LoadData( kitabaGoreOduncler );
            dgridRaporListesi.DataBind();
        }


    }
}