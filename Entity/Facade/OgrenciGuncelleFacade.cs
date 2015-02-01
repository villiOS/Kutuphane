using Entity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Facade
{
    public class OgrenciGuncelleFacade
    {
        public void Guncelle( Ogrenciler ogrenci )
        {
            using ( var db = new KutuphaneDBEntities() )
            {

                try
                {
                    var ogrenciGuncelle = db.Ogrenciler.Where( x => x.id == ogrenci.id ).First();

                    ogrenciGuncelle.ogrenciNo = ogrenci.ogrenciNo;
                    ogrenciGuncelle.ogrenciAd = ogrenci.ogrenciAd;
                    ogrenciGuncelle.ogrenciSoyad = ogrenci.ogrenciSoyad;
                    ogrenciGuncelle.bolumID = ogrenci.bolumID;
                    ogrenciGuncelle.adres = ogrenci.adres;
                    ogrenciGuncelle.memleketAdres = ogrenci.memleketAdres;
                    ogrenciGuncelle.kayitTarih = ogrenci.kayitTarih;
                    ogrenciGuncelle.cepTelefon = ogrenci.cepTelefon;

                    db.SaveChanges();

                    kayitMesaj();
                }
                catch ( Exception ex )
                {
                    System.Windows.Forms.MessageBox.Show( ex.Message );
                }

            }
         

        }

        private void kayitMesaj( )
        {
            global::System.Windows.Forms.MessageBox.Show( "Kayıt Eklendi", "Kayıt", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Information );
        }
    }
}
