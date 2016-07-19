﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using eshopBE;
using eshopBL;

namespace eshopv2
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (new CartBL().GetProductsCount(Session["cartID"].ToString()) > 0)
            {
                if (!Page.IsPostBack)
                {
                    loadCheckout();
                    
                }
            }
            else
                Response.Redirect("/korpa");
            cart1.QuantityChanged += Cart1_QuantityChanged;
            checkout1.CouponApplied += Checkout1_CouponApplied;
            /*eshopBE.User user=null;
            if (User.Identity.IsAuthenticated)
            {
                user = UserBL.GetUser(-1, User.Identity.Name);
                
            }*/
            //checkout1.User = user;

        }

        private void Checkout1_CouponApplied(object sender, EventArgs e)
        {
            cart1.LoadCart();
        }

        private void Cart1_QuantityChanged(object sender, EventArgs e)
        {
            checkout1.LoadCart();
        }

        private void loadCheckout()
        {
            CartBL cartBL = new CartBL();
            //checkoutInfo1.CartItems = cartBL.GetProducts(Session["cartID"].ToString());
        }

        private void loadCart()
        {
            cart1.LoadCart();
        }
    }
}
