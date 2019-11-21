<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarPoint.com._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <script src="Scripts/bootstrap.js"></script>
    <style>
        body {
            background: #F4F4F4;
        }

        .price-field-style {
            position: absolute;
            right: 25px;
            background: #808080;
            padding: 5px;
        }
    </style>
    <br />
    <br />
    <br />
    <br />
    <br />
   <div class="container">
        <div class="thumbnail">
            <h3>Popular Luxury vehicles Collection</h3>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                     <div class="col-md-3">
                            <div class="thumbnail">
                                <h5 class="price-field-style">TK:<asp:Label CssClass="lbl" Text='<%#Eval("Price")%>' runat="server"></asp:Label>
                                </h5>
                                <asp:Image class="img" Height="80px" Width="100px" Style="align-self: center;" ImageUrl='<%#Eval("ImgPath")%>' runat="server" />
                                <div class="caption">
                                    <h4>
                                        <asp:Label CssClass="lbl" Text='<%#Eval("Name")%>' runat="server"></asp:Label>
                                    </h4>
                                    <a href="#">
                                        <asp:Label Style="text-align: center;" CssClass="lbl" Text='<%#Eval("Details")%>' runat="server"></asp:Label>
                                    </a>
                                </div>
                            </div>
                         </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
   </div>
   <%-- <div class="container">
       <div class="thumbnail">
            <h3>Popular Sports Car Collection</h3>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                     <div class="col-md-3">
                            <div class="thumbnail">
                                <h5 class="price-field-style">TK:<asp:Label CssClass="lbl" Text='<%#Eval("Price")%>' runat="server"></asp:Label>
                                </h5>
                                <asp:Image class="img" Height="90px" Width="120px" Style="align-self: center;" ImageUrl='<%#Eval("ImgPath")%>' runat="server" />
                                <div class="caption">
                                    <h4>
                                        <asp:Label CssClass="lbl" Text='<%#Eval("Name")%>' runat="server"></asp:Label>
                                    </h4>
                                    <a href="#">
                                        <asp:Label Style="text-align: center;" CssClass="lbl" Text='<%#Eval("Details")%>' runat="server"></asp:Label>
                                    </a>
                                </div>
                            </div>
                         </div>
                </ItemTemplate>
            </asp:Repeater>      
        </div>
     </div>--%>
    <div class="container">
       <div class="thumbnail">
            <h3> Pony Car Collection</h3>
            <div class="row">
                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                    <ItemTemplate>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <h5 class="price-field-style">TK:<asp:Label CssClass="lbl" Text='<%#Eval("Price")%>' runat="server"></asp:Label>
                                </h5>
                                <asp:Image class="img" Height="90px" Width="120px" Style="align-self: center;" ImageUrl='<%#Eval("ImgPath")%>' runat="server" />
                                <div class="caption">
                                    <h4>
                                        <asp:Label CssClass="lbl" Text='<%#Eval("Name")%>' runat="server"></asp:Label>
                                    </h4>
                                    <a href="#">
                                        <asp:Label Style="text-align: center;" CssClass="lbl" Text='<%#Eval("Details")%>' runat="server"></asp:Label>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
  </div> 
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IDBTest04ConnectionString3 %>" SelectCommand="SELECT TOP (4) Product.Name, Product.Details, Product.Price, ProductMG.ImgPath, Product.CategoryID FROM Product INNER JOIN ProductMG ON Product.ID = ProductMG.ProductID WHERE (Product.CategoryID = 10)"></asp:SqlDataSource> 
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:IDBTest04ConnectionString3 %>" SelectCommand="SELECT TOP (4) Product.Name, Product.Details, Product.Price, ProductMG.ImgPath, Product.CategoryID FROM Product INNER JOIN ProductMG ON Product.ID = ProductMG.ProductID WHERE (Product.CategoryID = 4)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IDBTest04ConnectionString3 %>" SelectCommand="SELECT TOP (4) Product.Name, Product.Details, Product.Price, ProductMG.ImgPath, Product.CategoryID FROM Product INNER JOIN ProductMG ON Product.ID = ProductMG.ProductID WHERE (Product.CategoryID = 2)"></asp:SqlDataSource>
<div>
    <p class="float-right"><a href="/">Back to top</a></p>
</div>
</asp:Content>
