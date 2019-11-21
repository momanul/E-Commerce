<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminLayout.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="CarPoint.com.Admin.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
   
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/>
    <h1 style="color:darkgreen">Car Stock Management</h1>
    <br />
    <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="ID" 
        OnPageIndexChanging="gvProduct_PageIndexChanging" 
        OnRowCancelingEdit="gvProduct_RowCancelingEdit" 
        OnRowDeleting="gvProduct_RowDeleting" 
        OnRowEditing="gvProduct_RowEditing" 
        OnRowUpdating="gvProduct_RowUpdating" PageSize="5" BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" CssClass="auto-style1" Width="1304px" BorderStyle="None">
        <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                <asp:TemplateField HeaderText="Category ID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlCategory2" runat="server" DataTextField="Name"
                             DataValueField="ID" DataSourceID="SqlDataSource1" 
                             selectedValue='<%# Bind("CategoryID") %>'></asp:DropDownList>   
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IDBTest04ConnectionString2 %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCategory" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Name"/>
                <asp:BoundField DataField="Name" HeaderText="Product Name" />
                <asp:BoundField DataField="Details" HeaderText="Details" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="StockQuantity" HeaderText="Stock Quantity" />
                <%--<asp:BoundField DataField="ImgPath" HeaderText="Image Path" />--%>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Image" runat="server" ImageUrl='<%# Eval("ImgPath") %>'  Height="80px" Width="100px"  />
                    </ItemTemplate>
                    <%--<EditItemTemplate>
                        <asp:Image ID="UserImage" ImageUrl='<%# Eval("ImgPath") %>' runat="server"  Height="80px" Width="100px"/>
                        <asp:FileUpload ID="FileEditImage" runat="server" />
                    </EditItemTemplate>--%>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Thumnail Image">
                    <ItemTemplate>
                        <asp:Image ID="ThumnailImage" runat="server" ImageUrl='<%# Eval("ThumbnailPath") %>'   Height="80px" Width="100px"/>
                    </ItemTemplate>
                    <%--<EditItemTemplate>
                        <asp:Image ID="UserThumnailImage" ImageUrl='<%# Eval("ThumbnailPath") %>' runat="server"  Height="80px" Width="100px" />
                        <asp:FileUpload ID="FileEditThumnailImage" runat="server" />
                    </EditItemTemplate>--%>
                </asp:TemplateField>
                <asp:BoundField DataField="IsFavorite" HeaderText="Is Favorite" />
                <asp:BoundField DataField="IsActive" HeaderText="Is Active" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" ForeColor="#663399" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <br />
    <asp:Button ID="btnAddProduct" runat="server" BackColor="Yellow" Text="Add New Car" OnClick="btnAddProduct_Click" CssClass="auto-style2" Width="379px" Height="33px" style="margin-left: 533px" />
    <br />
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
</asp:Content>
