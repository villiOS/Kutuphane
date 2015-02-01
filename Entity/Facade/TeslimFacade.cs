using Entity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Facade
{
    public class TeslimFacade
    {
        public void TeslimAl( string kitapAdi, bool durum, DateTime date )
        {
            using ( var db = new KutuphaneDBEntities() )
            {

                try
                {
                    Odunc odunc = ( from o in db.Odunc
                                    where o.Kitaplar.kitapAdi == kitapAdi
                                    select o ).FirstOrDefault();
                    odunc.oduncDurum = durum;
                    odunc.teslimTarih = date;
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
