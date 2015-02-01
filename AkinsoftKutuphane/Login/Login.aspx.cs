using Entity.Facade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AkinsoftKutuphane
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load( object sender, EventArgs e )
        {
            //PageLoad eventleri
        }

        protected void txtGiris_Click( object sender, ImageClickEventArgs e )
        {
            bool successLogin = false;
            LoginFacade adminLogin = new LoginFacade();

            successLogin = adminLogin.Kontrol( txtAdminName.Text, txtAdminPassword.Text );

            if ( successLogin )
            {
                LoginMessage( successLogin );
                Session.Add( "yetkili", txtAdminName.Text );
                Response.Redirect( "..\\Pages\\index.aspx" );
            }

            else
            {

                global::System.Windows.Forms.MessageBox.Show( "Giriş Başarısız", "Bilgi", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Warning );

                txtAdminName.Text = txtAdminPassword.Text = "";
            }
        }

        private void LoginMessage( bool successLogin )
        {
            global::System.Windows.Forms.MessageBox.Show( "Giriş Başarılı", "Bilgi", System.Windows.Forms.MessageBoxButtons.OK, System.Windows.Forms.MessageBoxIcon.Information );
        }
    }
}