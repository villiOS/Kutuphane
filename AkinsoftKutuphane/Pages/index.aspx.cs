using Ext.Net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AkinsoftKutuphane.Pages
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load( object sender, EventArgs e )
        {
            if ( Session["yetkili"] != null )
            {
                //var message = "Hoşgeldiniz " + Session["yetkili"] + "";
                
                //X.Msg.Notify( new NotificationConfig
                //{
                //    Icon = Icon.Accept,
                //    Title = "Giriş Başarılı",
                //    Html = "Hoşgeldiniz" + message

                //} ).Show();
            }
            else
            {
                Response.Redirect( @"../Login/Login.aspx" );
            }
        }
    }
}