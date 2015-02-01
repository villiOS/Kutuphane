using Entity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class KitapFacade
    {
        public void Ekle( Kitaplar kitap )
        {
            using ( var db = new KutuphaneDBEntities() )
            {
                
                    db.Kitaplar.Add( kitap );
                    db.SaveChanges();
                   
            }

        }

        
    }
}
