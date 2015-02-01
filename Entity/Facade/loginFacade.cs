using Entity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity.Facade
{
    public class LoginFacade
    {
        public bool Kontrol(string adminName, string adminPass)
        {
            var db = new KutuphaneDBEntities();

            var admin = from x in db.Admin
                        where x.adminName == adminName && x.adminPassword == adminPass
                        select x;

            foreach ( var admins in admin )
            {
                if ( admins.adminName == adminName && admins.adminPassword == adminPass )
                    return true;
                else
                    return false;
            }
            
            return false;
        }
    }
}
