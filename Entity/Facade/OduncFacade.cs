using Entity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Facade
{
    public class OduncFacade
    {
        public void Ekle( Odunc odunc )
        {
            using ( var db = new KutuphaneDBEntities() )
            {

                try
                {
                    db.Odunc.Add( odunc );
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
    }
}
