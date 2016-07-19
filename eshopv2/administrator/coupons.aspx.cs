using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eshopBE;
using eshopBL;

namespace eshopv2.administrator
{
    public partial class coupons : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                if(!Page.IsPostBack)
                {
                    loadCoupons();
                }
            }
            else
                Response.Redirect("/administrator/login.aspx?returnUrl=" + Request.RawUrl);
        }

        protected void btnAddCoupon_Click(object sender, EventArgs e)
        {
            Response.Redirect("/administrator/coupon.aspx");
        }

        protected void dgvCoupons_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            new CouponBL().DeleteCoupon(int.Parse(dgvCoupons.DataKeys[e.RowIndex].Values[0].ToString()));
            loadCoupons();
        }

        private void loadCoupons()
        {
            dgvCoupons.DataSource = new CouponBL().GetCoupons();
            dgvCoupons.DataBind();
        }
    }
}