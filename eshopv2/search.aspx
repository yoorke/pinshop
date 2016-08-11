<%@ Page Title="" Language="C#" MasterPageFile="~/eshop2.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="eshopv2.search" %>
<%@ Register Src="user_controls/product_fp.ascx" TagName="product_fp" TagPrefix="product_fp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%=ResolveUrl("~/css/mainMenuVertical.css") %>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-12 page-content">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="heading"><asp:Literal ID="lblHeading" runat="server"></asp:Literal></h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:Repeater ID="rptProducts" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 padding-left-0 padding-right-0 margin-top-05">
                            <product_fp:product_fp ID="product_fp" runat="server" ProductItem='<%#Container.DataItem %>' />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderFooter" runat="server">
    <script>
        
        $(document).ready(function () {
            $.expr[':'].Contains = $.expr.createPseudo(function (arg) {
                return function (elem) {
                    return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
                }
            })

            var searchedText = decodeURIComponent(getQueryString()['a']).split(' ');
            $(searchedText).each(function(p, text){
                $('.product_fp h3 span:Contains(' + text + '), .product_fp h4 a:Contains(' + text + ')').each(function (i, element) {
                    var content = $(element).text();
                    //content = content.replace(text, '<span class="search_found">' + text + '</span>');
                    var regex = new RegExp('(' + text + ')', 'gi');
                    content = content.replace(regex, '<span class="search_found">$1</span>');
                    element.innerHTML = content;
                })
            })
        })

        function getQueryString() {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }
    </script>
</asp:Content>
