<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="CarPoint.com.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
        .auto-style2 {
            margin-left: 313px;
            margin-top: 0;
        }
        .auto-style3 {
            margin-top: 20px;
        }
    </style>
    <br />
    <div style="align-content:center; width:100%;">
    <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID"  Height="30px" Width="305px" AutoPostBack="True" ></asp:DropDownList>
    </div>
    <br /><br />
    <div style="background-color:darkgrey; width:100%; text-align:center"><B style="font-size:x-large">Available </B><asp:Label ID="lblCategory" runat="server" Font-Size="X-Large" ForeColor="#009900"  CssClass="auto-style3"></asp:Label></div>
    <br />
    <asp:ListView ID="lvProduct" DataKeyNames="ID" runat="server">
     <LayoutTemplate>
         <div id="itemPlaceholder" runat="server"></div>
     </LayoutTemplate>        
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
    </asp:ListView>
    
        
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IDBTest04ConnectionString7 %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
</asp:Content>
