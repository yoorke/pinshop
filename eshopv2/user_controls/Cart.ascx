<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cart.ascx.cs" Inherits="eshopv2.user_controls.Cart" %>
<%@ Register src="CustomStatus.ascx" tagname="CustomStatus" tagprefix="uc1" %>
<div class="row">
    <div class="col-lg-12">
        <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="status"></asp:Label>
        <asp:GridView ID="dgvCart" runat="server" CssClass="table table-bordered table-striped table-condensed"
            AutoGenerateColumns="false" OnRowDataBound="dgvCart_RowDataBound" OnRowCommand="dgvCart_RowCommand" DataKeyNames="productID"
            OnRowDeleting="dgvCart_RowDeleting">
                <Columns>
                    <asp:TemplateField HeaderText="Rb" ControlStyle-Width="20px">
                        <ItemTemplate>
                            <asp:Label ID="lblRowIndex" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
            
                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblProductID" runat="server" Text='<%#Eval("productID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkImage" runat="server" NavigateUrl='<%# "/proizvodi/" + eshopBE.Product.CreateFriendlyUrl(Eval("categoryName") + "/" + Eval("brandName") + " " + Eval("name") + "-" + Eval("productID")) %>'>
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%#"/images/" + Eval("imageUrl").ToString().Substring(0, Eval("imageUrl").ToString().IndexOf(".jpg")) + "-list.jpg" %>' />
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
            
                    <asp:TemplateField HeaderText="Naziv" ControlStyle-Width="390px">
                        <ItemTemplate>
                            <asp:HyperLink ID="lnkProduct" runat="server" NavigateUrl='<%# "/proizvodi/" + eshopBE.Product.CreateFriendlyUrl(Eval("categoryName") + "/" + Eval("brandName") + " " + Eval("name") + "-" + Eval("productID")) %>'>
                            <asp:Label ID="lblBrand" runat="server" Text='<%#Eval("brandName") + " " + Eval("name")%>'></asp:Label>
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
            
                    <%--<asp:TemplateField HeaderText="Naziv" ControlStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
            
                    <asp:TemplateField Visible="true" HeaderText="Web cena">
                        <ItemTemplate>
                            <asp:Label ID="lblProductPrice" runat="server" Text='<%#String.Format("{0:N2}", double.Parse(Eval("productPrice").ToString())) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
            
                    <asp:TemplateField HeaderText="Vaša cena" ControlStyle-Width="70px" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="lblUserPrice" runat="server" Text='<%#String.Format("{0:N2}", double.Parse(Eval("userPrice").ToString())) %>'></asp:Label>
                            <div class="coupon-wrapper" id="divCoupon" runat="server" style="display:none">
                                <span class="coupon">%</span>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
            
                    <asp:TemplateField HeaderText="Količina">
                        <ItemTemplate>
                            <asp:Panel ID="pnlQuantity" runat="server">
                                <asp:LinkButton ID="btnRemoveQuantity" runat="server" CommandName="RemoveQuantity" ToolTip="Smanji količinu za 1" CausesValidation="false"><span aria-hidden="true" class="glyphicon glyphicon-minus icon"></span></asp:LinkButton>
                                <asp:TextBox ID="txtQuantity" runat="server" Text='<%#Eval("quantity") %>' Width="50px" CssClass="text-center"></asp:TextBox>
                                <%--<asp:LinkButton ID="btnUpdateQuantity" runat="server" Text="Ažuriraj" CommandName="UpdateQuantity"></asp:LinkButton>--%>
                                <asp:LinkButton ID="btnAddQuantity" runat="server" CommandName="AddQuantity" ToolTip="Povećaj količinu za 1" CausesValidation="false"><span aria-hidden="true" class="glyphicon glyphicon-plus icon"></span></asp:LinkButton>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
            
                    <asp:TemplateField HeaderText="Iznos" ControlStyle-Width="70px" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="lblSum" runat="server" Text='<%#String.Format("{0:N2}", double.Parse(Eval("total").ToString())) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblCouponID" runat="server" Text='<%#Eval("couponID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
            
                    <asp:CommandField ShowDeleteButton="true" ControlStyle-Width="16px" ButtonType="Image" DeleteImageUrl="/images/close.png" />
                </Columns>    
            </asp:GridView>
    </div><!--col-->
</div><!--row-->
<div class="row margin-top-1">
    <div class="col-lg-12">
        <div class="pull-right totalDiv">
            <p>
                
                <span class="totalSpan">Osnovica:</span>
                <asp:Label ID="lblOsnovica" runat="server" CssClass="priceValue"></asp:Label>
                
            </p>
            <p>
                
                <span class="totalSpan">PDV:</span>
                <asp:Label ID="lblTax" runat="server" CssClass="priceValue"></asp:Label>
                
            </p>
            <p>
            <span class="totalSpan">Ukupno: </span>
            <asp:Label ID="lblTotal" runat="server" CssClass="totalValue"></asp:Label>
            
                </p>
        </div>
    </div><!--col-->
</div><!--row-->
<div class="row">
    <%--<div class="col-lg-6">
        <label>Kupon za popust: </label>
        <asp:TextBox ID="txtCoupon" runat="server"></asp:TextBox>
        <asp:LinkButton ID="btnAddCoupon" runat="server" Text="Unesi" OnClick="btnAddCoupon_Click" CssClass="standardButton"></asp:LinkButton>
        <asp:LinkButton ID="btnDeleteCoupon" runat="server" Text="Obriši kupon" OnClick="btnDeleteCoupon_Click" Visible="false"></asp:LinkButton>        
    </div><!--col-->--%>
    
</div><!--row-->


















<div id="cart">
    <!--<uc1:CustomStatus ID="CustomStatus1" runat="server" Visible="false" />-->
    
    
    
    
    <div class="total">
        
    </div>
    
    <div class="buttons">
        
    </div>
    
    <div class="coupons">
        <p class="row">
            
        </p>
    </div>
</div>

