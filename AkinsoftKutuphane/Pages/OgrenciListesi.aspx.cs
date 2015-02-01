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
    public partial class OgrenciListesi : System.Web.UI.Page
    {

        KutuphaneDBEntities DB = new KutuphaneDBEntities();

        Ogrenciler ogrenci = new Ogrenciler();
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
            
            
            ogrenciListesiModal.Show();


            var ogrenciler = ( DB.Ogrenciler.Select( x => new
            {
                x.ogrenciNo,
                x.ogrenciAd,
                x.ogrenciSoyad,
                x.Bolum.Fakulte.fakulteAd,
                x.Bolum.bolumAd,
                x.kayitTarih,
                x.memleketAdres,
                x.adres,
                x.cepTelefon
            } ) ).ToList();


            ComboFakulteGetir();
            
            
            dgridOgrenciListesi.DataSource = ogrenciler;
            dgridOgrenciListesi.DataBind();


        }////

        [DirectMethod(Namespace="X")]
        public void ComboBolumGetir(int fakulteId )
        {
            //var fakulteId=Convert.ToInt32(cmbBolum.SelectedItem.Value);
            strBolum.DataSource = DB.Bolum.Where( x => x.fakulteId ==fakulteId ).ToList();
            strBolum.DataBind();
        }

        private void ComboFakulteGetir( )
        {
            strFakulte.DataSource = DB.Fakulte.ToList();
            strFakulte.DataBind();
        }//
        protected void Store1_Refresh( object sender, StoreReadDataEventArgs e )
        {
            this.dgridOgrenciListesi.DataBind();
        }//

        protected void RowSelect( object sender, DirectEventArgs e )
        {
            var json = e.ExtraParams["data"];

            var data = Ext.Net.JSON.Deserialize<Ogrenciler>( json );

            

            ogrenci = Ogrenciler.GetOgrenciler( data.ogrenciNo );
            
            this.FormPanel1.SetValues( new
            {
                ogrenci.ogrenciNo,
                ogrenci.ogrenciAd,
                ogrenci.ogrenciSoyad,
                ogrenci.Bolum.bolumAd,
                fakulteId= ogrenci.Bolum.Fakulte.id,
                ogrenci.Bolum.Fakulte.fakulteAd,
                ogrenci.adres,
                ogrenci.memleketAdres,
                ogrenci.kayitTarih,
                ogrenci.cepTelefon
               
            } );

            //List<Fakulte> list = DB.Fakulte.ToList();
            //cboxDeneme.FieldLabel = "Fakülte";
            //cboxDeneme.ValueField = "id";
            //cboxDeneme.DisplayField = "fakulteAd";
            
            //strOgrenci.DataSource = list;
            //strOgrenci.DataBind();
            /////////////////////////////////////////////////////////////////////////////////////////
            

            //List<Fakulte> list = DB.Fakulte.ToList();
            //cboxF.DisplayField = "fakulteAd";
            //cboxF.ValueField = "id";


            //if ( X.IsAjaxRequest )
            //{
            //    foreach ( var item in list )
            //    {
            //        cboxF.Items.Add( new System.Web.UI.WebControls.ListItem( item.fakulteAd, "asd" ) );
            //    }
            //}
            


            //foreach ( var item in list )
            //{
            //    cboxF.AddItem( item.fakulteAd, item.id );
            //}


            // cboxF.GetStore().DataSource = list;
            //cboxF.DataBind();

           



            var id = from a in DB.Ogrenciler
                     where a.ogrenciNo == data.ogrenciNo
                     select a.id;

            foreach ( var item in id )
            {
                ogrenci.id = Convert.ToInt32( item );
                idDegeri = ogrenci.id;
                break;
            }
            
          

        }//

        protected void btnOgrenciGuncelle_DirectClick( object sender, DirectEventArgs e )
        {
            ogrenci.id = idDegeri;
            ogrenci.ogrenciNo = txtOgrenciNo.Text;
            ogrenci.ogrenciAd = txtOgrenciAd.Text;
            ogrenci.ogrenciSoyad = txtOgrenciSoyad.Text;
            ogrenci.bolumID = Convert.ToInt32( cmbBolum.SelectedItem.Value );
            //ogrenci.fak= Convert.ToInt32( cmbFakulte.SelectedItem.Value );
            ogrenci.adres = txtAdres.Text;
            ogrenci.memleketAdres = txtMemleketAdres.Text;
            ogrenci.kayitTarih = DateTime.Now;
            ogrenci.cepTelefon = txtCepTelefon.Text;
          
            //////////////////////////////////////////////////
            //Güncel Bilgilerin DB'ye Kayıt Edilmesi
            OgrenciGuncelleFacade ogrenciGuncelle = new OgrenciGuncelleFacade();
            ogrenciGuncelle.Guncelle( ogrenci );
            //////////////////////////////////////////////////

            ogrenciListesiModal.Close();
        }

        protected void btnOgrenciKayitIptal_DirectClick( object sender, DirectEventArgs e )
        {
            ogrenciListesiModal.Close();
        }

        protected void btnOgrenciAra_DirectClick( object sender, DirectEventArgs e )
        {
            

            var bulunanKayitlar_ = (
                DB.Ogrenciler.Where(
                    x => x.ogrenciNo.Contains( txtOgrenciNoAra.Text ) &&
                         x.ogrenciAd.Contains( txtOgrenciAdAra.Text ) &&
                         x.ogrenciSoyad.Contains( txtOgrenciSoyadAra.Text ) &&
                         x.Bolum.bolumAd.Contains(txtBolumAra.Text) &&
                         x.Bolum.Fakulte.fakulteAd.Contains(txtFakulteAra.Text) &&
                         x.cepTelefon.Contains( txtCepTelefonuAra.Text ) ) ).ToList();

            var bulunanKayitlar = ( bulunanKayitlar_.Select( x => new
            {
                x.ogrenciNo,
                x.ogrenciAd,
                x.ogrenciSoyad,
                x.Bolum.bolumAd,
                x.kayitTarih,
                x.cepTelefon
            } ) ).ToList();

            dgridOgrenciListesi.DataSource = bulunanKayitlar;
            dgridOgrenciListesi.LoadData( bulunanKayitlar );
            dgridOgrenciListesi.DataBind();




        }
    }
}