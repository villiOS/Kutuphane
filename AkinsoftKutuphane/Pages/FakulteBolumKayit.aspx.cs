using Entity.Facade;
using Entity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AkinsoftKutuphane.Pages
{
    public partial class FakulteBolumKayit : System.Web.UI.Page
    {
        KutuphaneDBEntities DB = new KutuphaneDBEntities();
        protected void Page_Load( object sender, EventArgs e )
        {


            if ( Session["yetkili"] != null )
            {

            }
            else
            {
                Response.Redirect( @"../Login/Login.aspx" );
            }
            
            
            fakulteBolumKayitModal.Show();

            ComboFakulteGetir();



        }

        private void ComboFakulteGetir( )
        {
            strFakulte.DataSource = DB.Fakulte.ToList();
            strFakulte.LoadData( DB.Fakulte.ToList() );
            strFakulte.DataBind();
        }

        protected void btnBolumEkle_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            Bolum bolum = new Bolum();
            bolum.bolumAd = txtBolum.Text;
            bolum.fakulteId = Convert.ToInt32( cboxFakulte.SelectedItem.Value );

            FakulteBolumFacade bolumEkle = new FakulteBolumFacade();
            bolumEkle.Ekle( bolum );

            Page_Load( null, null );
        }

        protected void btnFakulteEkle_DirectClick( object sender, Ext.Net.DirectEventArgs e )
        {
            Fakulte fakulte = new Fakulte();
            fakulte.fakulteAd = txtFakulte.Text;

            FakulteBolumFacade fakulteEkle = new FakulteBolumFacade();
            fakulteEkle.Ekle( fakulte );

            Page_Load( null, null );
        }
    }
}