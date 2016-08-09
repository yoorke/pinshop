using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using eshopBE;
using eshopBL;

namespace eshopv2
{
    public class CustomRoutes
    {
        public void RegisterRoutes(RouteCollection routes)
        {
            routes.Clear();
            foreach (CustomPage customPage in new CustomPageBL().GetCustomPages())
                routes.MapPageRoute(customPage.Url, customPage.Url, "~/customPage.aspx", false, new RouteValueDictionary { { "url", customPage.Url } });

            //foreach (Promotion promotion in new PromotionBL().GetPromotions(false, null))
            //routes.MapPageRoute(promotion.Url, "akcija/" + promotion.Url, "~/promotion.aspx", false, new RouteValueDictionary { { "url", promotion.Url } });

            routes.MapPageRoute("promotion", "akcija/{promotion}", "~/promotion.aspx");
            //routes.MapPageRoute("o-nama", "o-nama", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "o-nama"} });
            routes.MapPageRoute("category", "proizvodi/{category}", "~/products.aspx");
            routes.MapPageRoute("product", "proizvodi/{category}/{product}", "~/product.aspx");
            //routes.MapPageRoute("gde-kupiti", "gde-kupiti", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "gde-kupiti" } });
            //routes.MapPageRoute("uputstvo-za-kupovinu", "uputstvo-za-kupovinu", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "uputstvo-za-kupovinu" } });
            //routes.MapPageRoute("najcesca-pitanja", "najcesca-pitanja", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "najcesca-pitanja" } });
            //routes.MapPageRoute("nacini-placanja", "nacini-placanja", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "nacini-placanja" } });
            //routes.MapPageRoute("povracaj-robe", "povracaj-robe", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "povracaj-robe" } });
            //routes.MapPageRoute("rokovi-isporuke", "rokovi-isporuke", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "rokovi-isporuke" } });
            //routes.MapPageRoute("pravni-subjekti", "pravni-subjekti", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "pravni-subjekti" } });
            //routes.MapPageRoute("garancije-reklamacije-servis", "garancije-reklamacije-servis", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "garancije-reklamacije-servis" } });
            //routes.MapPageRoute("kontakti-ovlascenih-servisera", "kontakti-ovlascenih-servisera", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "kontakti-ovlascenih-servisera" } });
            routes.MapPageRoute("lista-zelja", "lista-zelja", "~/wishList.aspx");
            routes.MapPageRoute("korpa", "korpa", "~/cart.aspx");
            //routes.MapPageRoute("zaposlenje", "zaposlenje", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "zaposlenje" } });
            //routes.MapPageRoute("kako-kupiti", "kako-kupiti", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "kako-kupiti" } });
            routes.MapPageRoute("porucivanje", "porucivanje", "~/checkout.aspx");
            routes.MapPageRoute("registracija", "registracija", "~/registration.aspx");
            routes.MapPageRoute("prijava", "prijava", "~/login.aspx");
            routes.MapPageRoute("resetovanje-sifre", "resetovanje-sifre", "~/passwordResetRequest.aspx");
            routes.MapPageRoute("kreiranje-korisnicke-sifre", "kreiranje-korisnicke-sifre", "~/passwordReset.aspx");
            routes.MapPageRoute("kontakt", "kontakt", "~/kontakt.aspx");
            routes.MapPageRoute("moj-nalog", "moj-nalog", "~/account.aspx");
            routes.MapPageRoute("izmena-sifre", "izmena-sifre", "~/passwordChange.aspx");
            routes.MapPageRoute("pretraga", "pretraga", "~/search.aspx");
            //routes.MapPageRoute("uslovi-koriscenja", "uslovi-koriscenja", "~/customPage.aspx", false, new RouteValueDictionary { { "url", "uslovi-koriscenja" } });
            routes.MapPageRoute("porudzbinaUspesna", "porudzbina-uspesna", "~/orderSuccessful.aspx");
        }
    }
}