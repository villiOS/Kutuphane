//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Entity.Model
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Linq.Expressions;
    
    public partial class Kitaplar
    {
        public Kitaplar()
        {
            this.Odunc = new HashSet<Odunc>();
        }
    
        public int id { get; set; }
        public string kitapKodu { get; set; }
        public string kitapAdi { get; set; }
        public string kategori { get; set; }
        public System.DateTime yayinYili { get; set; }
        public string yazari { get; set; }
        public string ISBN { get; set; }
        public short sayfaSayisi { get; set; }
    
        public virtual ICollection<Odunc> Odunc { get; set; }

        public static Kitaplar GetKitaplar( string kitapKodu )
        {
            KutuphaneDBEntities DB = new KutuphaneDBEntities();
            return GetKitaplar( kitapKodu, DB );
        }

        public static Kitaplar GetKitaplar( string kitapKodu, KutuphaneDBEntities DB )
        {
            return DB.Kitaplar.Single( e => e.kitapKodu == kitapKodu );
        }
    }
}