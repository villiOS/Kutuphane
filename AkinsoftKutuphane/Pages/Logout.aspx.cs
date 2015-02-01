using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AkinsoftKutuphane.Pages
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load( object sender, EventArgs e )
        {

            if ( Session["yetkili"] != null )
            {

            }
            else
            {
                Response.Redirect( @"../Login/Login.aspx" );
            }
            
            logoutModal.Show();
        }

        protected void btnLogout_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            Session["yetkili"] = null;
            Response.Redirect( @"..\Login\Login.aspx" );
        }

        protected void btnIptal_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            logoutModal.Close();
        }
    }
}