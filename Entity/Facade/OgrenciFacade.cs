using Entity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Facade
{
    public class OgrenciFacade
    {
        public void Ekle( Ogrenciler ogrenci )
        {
            using ( var db = new KutuphaneDBEntities() )
            {
                try
                {
                    db.Ogrenciler.Add( ogrenci );
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
