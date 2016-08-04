<%@ Page Language="C#" MasterPageFile="~/eshop2.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="eshopv2.cart" Title="Korpa | PinShop" %>
<%@Register Src="user_controls/Cart.ascx" TagName="Cart" TagPrefix="Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%=ResolveUrl("~/css/mainMenuVertical.css") %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="col-lg-12 page-content">
                <h1>Korpa</h1>
            </div>
            <div class="col-lg-12">
                <div class="row margin-top-2" id="cart">
                    <div class="col-lg-12">
                        <Cart:Cart ID="cart1" runat="server" />
                    </div><!--col-->
                </div><!--row-->
                <div class="row margin-bottom-2 margin-top-2">
                    <div class="col-lg-12">
                        <div class="pull-right">
                            <asp:LinkButton ID="btnContinueShopping" runat="server" Text="Nastavi kupovinu" OnClick="btnContinueShopping_Click" CssClass="btn btn-default" CausesValidation="false"></asp:LinkButton>    
                            <asp:LinkButton ID="btnCheckout" runat="server" Text="Naruči" OnClick="btnCheckout_Click" CssClass="btn btn-primary" CausesValidation="false"></asp:LinkButton>
            
                        </div>
                    </div><!--col-->
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderFooter" runat="server">
    
</asp:Content>
