using Entity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Facade
{
    public class KitapGuncelleFacade
    {
        public void Guncelle( Kitaplar kitap )
        {
            using ( var db = new KutuphaneDBEntities() )
            {
                try
                {
                    var kitapGuncelle = db.Kitaplar.Where( x => x.id == kitap.id ).First();

                    kitapGuncelle.kitapKodu = kitap.kitapKodu;
                    kitapGuncelle.kitapAdi = kitap.kitapAdi;
                    kitapGuncelle.kategori = kitap.kategori;
                    kitapGuncelle.yayinYili = kitap.yayinYili;
                    kitapGuncelle.yazari = kitap.yazari;
                    kitapGuncelle.ISBN = kitap.ISBN;
                    kitapGuncelle.sayfaSayisi = kitap.sayfaSayisi;



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
