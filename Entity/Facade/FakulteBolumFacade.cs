using Entity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Facade
{
    public class FakulteBolumFacade
    {
        public void Ekle( Fakulte fakulte )
        {
            using ( var db = new KutuphaneDBEntities() )
            {
                try
                {
                    db.Fakulte.Add( fakulte );
                    db.SaveChanges();

                    KayitMesaj();
                }
                catch ( Exception ex )
                {
                    System.Windows.Forms.MessageBox.Show( ex.Message );
                }

            }
            
        }

        private void KayitMesaj( )
        {
            global::System.Windows.Forms.MessageBox.Show( "Kayıt Eklendi", "Kayıt", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Information );
        }

        public void Ekle( Bolum bolum )
        {
            using ( var db = new KutuphaneDBEntities() )
            {

                try
                {
                    db.Bolum.Add( bolum );
                    db.SaveChanges();

                    KayitMesaj();
                }
                catch ( Exception ex )
                {
                    System.Windows.Forms.MessageBox.Show( ex.Message );
                }




            }
        }
    }
}
