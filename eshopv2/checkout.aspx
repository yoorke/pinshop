<%@ Page Language="C#" MasterPageFile="~/eshop2.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="eshopv2.checkout" Title="Podaci o narudžbini | Webshop" %>
<%--@ Register src="user_controls/checkout.ascx" TagName="Checkout" TagPrefix="uc1"--%>
<%@ Register Src="user_controls/CheckoutV2.ascx" TagName="CheckoutV2" TagPrefix="uc2" %>
<%@ Register Src="user_controls/CheckoutInfo.ascx" TagName="CheckoutInfo" TagPrefix="uc3" %>
<%@ Register Src="user_controls/Cart.ascx" TagName="Cart" TagPrefix="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="bannerColumn">
        <div class="banner"></div>
    </div>--%>
    <div class="col-lg-12">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row margin-top-2">
                    <div class="col-lg-12">
                        <div id="cart">
                            <cart:Cart ID="cart1" runat="server" />
                        </div>
                        <%--<uc3:CheckoutInfo ID="checkoutInfo1" runat="server" />--%>
                        <div>
                            <uc2:CheckoutV2 ID="checkout1" runat="server" />
                        </div>
                        <%--<uc1:Checkout ID="checkout1" runat="server" />--%>
                    </div>
                </div><!--row-->
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    
    <%--<div class="bannerColumn">
        <div class="banner"></div>
    </div>--%>
    
    <script type="text/javascript">
        function scrollToAccount() {
            var a = document.getElementById("account");
            a.scrollIntoView();
            var txtLastname = document.getElementById("ctl00_ContentPlaceHolder1_checkout1_txtLastname");
            txtLastname.focus();
        }
    </script>
</asp:Content>
<asp:Content ID="contentPlac3" runat="server" ContentPlaceHolderID="ContentPlaceHolderFooter">
    <script>
        $(document).ready(function () {
            $('#ctl00_ContentPlaceHolder1_checkout1_rdbDelivery_0').change(function () {
                if (this.value == '1') {
                    $('#showShop').show();
                    $('#showDeliveryInfo').hide();
                }
                else{
                    $('#showShop').hide();
                    $('#showDeliveryInfo').show();
                }
            })
            $('#ctl00_ContentPlaceHolder1_checkout1_rdbDelivery_1').change(function () {
                if (this.value == '2'){
                    $('#showShop').hide();
                    $('#showDeliveryInfo').show();
                }
            })
        })
    </script>
</asp:Content>
