using Entity.Model;
using Entity;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Windows.Forms;
using Entity.Facade;


namespace AkinsoftKutuphane.Pages
{
    public partial class KitapOduncTeslim : System.Web.UI.Page
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
            
            
            kitapOduncTeslimModal.Show();
            txtOduncBilgiTarih.Text = " --> " + DateTime.Now.ToString() + " Tarihinde Ödünç Verilsin mi? ";
        }

        protected void btnOduncBilgiSorgula_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            
            var odunc = ( DB.Odunc.Select( x => new
            {
                x.Kitaplar.kitapAdi,
                x.Ogrenciler.ogrenciNo,
                x.Ogrenciler.ogrenciAd,
                x.Ogrenciler.ogrenciSoyad,
                x.oduncTarih,
                x.teslimTarih
            } ) ).ToList();

            foreach ( var item in odunc )
            {
                if ( item.ogrenciNo == txtOgrenciNumaraAra.Text )
                {
                    dgridOduncBilgisi.DataSource = odunc;
                    dgridOduncBilgisi.DataBind();
                }
                else
                {
                    dgridOduncBilgisi.DataSource = null;
                    dgridOduncBilgisi.DataBind();
                }
            }
        }

        protected void btnOgrenciAra_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            bool findSuccess = false;

            var ogrenciNumaralar = from no in DB.Ogrenciler
                                   where no.ogrenciNo == txtOgrenciNumaraAra.Text
                                   select no;



            foreach ( var bulunan in ogrenciNumaralar )
            {
                //MessageBox.Show( item.ogrenciNo );
                findSuccess = true;
                txtOduncBilgiAd.Text = bulunan.ogrenciAd + " " + bulunan.ogrenciSoyad + " --> ";
                txtKitapAra.Selectable = true;
                btnOduncBilgiSorgula.Selectable = true;
            }

            if ( findSuccess == false )
            {
                txtKitapAra.Selectable = false;
                btnOduncBilgiSorgula.Selectable = false;
                MessageBox.Show( "Aradığınız Kayıt Bulunamadı ! \n Öğrenci numarasını doğru girdiğinizden emin olunuz !", "Arama Sonucu Hatası", MessageBoxButtons.OK, MessageBoxIcon.Warning );

                txtKitapAra.Text = "";
                txtOduncBilgiAd.Text = "";
                txtOgrenciNumaraAra.Text = "";
            }
        }

        protected void btnKitapAra_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            bool findSuccess = false;

            var kitapAdlar = from ad in DB.Kitaplar
                             where ad.kitapAdi == txtKitapAra.Text
                             select ad;

            foreach ( var bulunan in kitapAdlar )
            {
                findSuccess = true;
                txtOduncBilgiKitap.Text = bulunan.kitapAdi + " ( " + bulunan.yazari + " )";
                //btnOduncOnay.Enabled = true;
            }

            if ( findSuccess == false )
            {
                MessageBox.Show( "Aradığınız Kayıt Bulunamadı ! \n Kitap adını doğru girdiğinizden emin olunuz !", "Arama Sonucu Hatası", MessageBoxButtons.OK, MessageBoxIcon.Warning );

            }
        }

        protected void btnOduncOnay_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            btnOduncOnay.Enabled = false;
            Odunc odunc = new Odunc();
            //////////////////////////////////////////////////
            var kitapId = from id in DB.Kitaplar
                          where id.kitapAdi == txtKitapAra.Text
                          select id;

            foreach ( var id in kitapId )
            {
                odunc.kitapId = id.id;
                break;
            }
            //////////////////////////////////////////////////
            var ogrenciId = from id in DB.Ogrenciler
                            where id.ogrenciNo == txtOgrenciNumaraAra.Text
                            select id;

            foreach ( var id in ogrenciId )
            {
                odunc.ogrenciId = id.id;
                break;
            }
            //////////////////////////////////////////////////
            odunc.oduncTarih = DateTime.Now;
            odunc.oduncDurum = true;
            odunc.teslimTarih = DateTime.Now;



            //Ödünç Verilecek Kitabın Durum Kontrolü
            bool kayitSuccess = OduncKitapKontrol( odunc );
            ///////////////////////////////////////////////////

            if ( kayitSuccess )
            {
                //Ödünç Kitap Verilerinin DB'ye kayıt edilmesi
                OduncFacade oduncAlmaBilgisi = new OduncFacade();
                oduncAlmaBilgisi.Ekle( odunc );
                ///////////////////////////////////////////////////
            }
            else
            {
                MessageBox.Show( "Ödünç Onayı Başarısız ! \n Bu kitap bir başkası tarafından ödünç alınmıştır !", "Ödünç Durumu", MessageBoxButtons.OK, MessageBoxIcon.Warning );
            }
        }

        private bool OduncKitapKontrol( Odunc odunc )
        {
            bool bayrak = true;
            
            var kontrolListe = from kontrol in DB.Odunc
                               where odunc.kitapId == kontrol.kitapId
                               select kontrol;

            foreach ( var item in kontrolListe )
            {
                if ( item.oduncDurum == false )
                {
                    bayrak = true;
                }
                else
                {
                    bayrak = false;
                }
                
            }

            if ( bayrak )
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void btnOduncIptal_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            kitapOduncTeslimModal.Close();
        }

        protected void btnOgrenciAraTeslim_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            bool findSuccess = false;

            //var ogrenciNumaralar = from no in DB.Ogrenciler
            //                       where no.ogrenciNo == txtOgrenciAdi.Text
            //                       select no;

            var ogrenciNumaralar = from no in DB.Odunc
                                   where no.oduncDurum == true && no.Ogrenciler.ogrenciNo == txtOgrenciAdi.Text
                                   select no;


            foreach ( var bulunan in ogrenciNumaralar )
            {
                findSuccess = true;

                var odunc = ( DB.Odunc.Select( x => new
                {
                    x.Kitaplar.kitapAdi,
                    x.Ogrenciler.ogrenciNo,
                    x.Ogrenciler.ogrenciAd,
                    x.Ogrenciler.ogrenciSoyad,
                    x.oduncTarih,
                } ) ).ToList(); //odunc durumu false olanları alma



                dgridKitapTeslim.DataSource = odunc;
                dgridKitapTeslim.DataBind();
                //break;
            }
                
            
            if ( findSuccess == false )
            {
                
                MessageBox.Show( "Aradığınız Kayıt Bulunamadı ! \n Öğrenci numarasını doğru girdiğinizden emin olunuz !", "Arama Sonucu Hatası", MessageBoxButtons.OK, MessageBoxIcon.Warning );

                
            }
        } ///!!!!!

        protected void btnKitapTeslimOnay_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            //string kitapAdi = dgridKitapTeslim.CurrentRow.Cells["kitapAdi"].Value.ToString();
            var json = e.ExtraParams["data"];
            var data = Ext.Net.JSON.Deserialize<Kitaplar>( json );
            
            var a = ( from b in DB.Odunc
                      where b.Kitaplar.kitapAdi == data.kitapAdi
                      select b ).ToList();

            foreach ( var item in a )
            {
                item.oduncDurum = false;
                TeslimFacade kitapTeslim = new TeslimFacade();
                kitapTeslim.TeslimAl( item.Kitaplar.kitapAdi, item.oduncDurum, DateTime.Now );
                //break;
            }



            

        }

        protected void btnTeslimIptal_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            kitapOduncTeslimModal.Close();
        }
        
    }
}