<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminLayout.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="CarPoint.com.Admin.Add_Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/>
    <h1>Add New Car</h1>
<br />
<table>       
            <tr>
                <th>
                    <asp:Label ID="lblCategoryID" runat="server" Text="Category"></asp:Label>
                </th>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" DataTextField="Name" DataValueField="ID" ></asp:DropDownList>
                </td>
           </tr>
           <tr>
               <th>
                    <asp:Label ID="lblBrand" runat="server" Text="Brand*"></asp:Label>
               </th>
                <td>
                    <asp:TextBox ID="txtBrand" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="AddProduct" Display="None" ErrorMessage="Please Enter The Brand Name! " ControlToValidate="txtBrand"></asp:RequiredFieldValidator>
                </td>
           </tr>
           <tr>
                <th>
                    <asp:Label ID="lblName" runat="server" Text="Product Name*"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="AddProduct" Display="None" ErrorMessage="Please Enter The Product Name First! " ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </td>
          </tr>
          <tr>
                <th>
                    <asp:Label ID="lblDetails" runat="server" Text="Details*"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtDetails" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="AddProduct" Display="None" ErrorMessage="Please Enter Product Detail! " ControlToValidate="txtDetails"></asp:RequiredFieldValidator>
                </td>
           </tr>
        <tr>
                <th>
                    <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </td>
           </tr>
        <tr>
                <th>
                    <asp:Label ID="lblStockQuantity" runat="server" Text="Stock Quantity"></asp:Label>
                </th>
                <td>
                    <asp:TextBox ID="txtStockQuantity" runat="server"></asp:TextBox>
                </td>
           </tr>
       <tr>
                <th>
                    <asp:Label ID="lblDisplayImage" runat="server" Text="Display Image*"></asp:Label> 
                </th>
                <td>
                    <asp:FileUpload ID="FileDisplayImage" runat="server" />
                </td>
           </tr>
        <tr>
                <th>
                    <asp:Label ID="lblThumnailImage" runat="server" Text="Thumnail Image*"></asp:Label> 
                </th>
                <td>
                    <asp:FileUpload ID="FileThumnailImage" runat="server" />
                </td>
           </tr>
        <tr>
                <th>
                    <asp:Label ID="lblIsFavorite" runat="server" Text="Is Favorite"></asp:Label>
                </th>
                <td>
                    <asp:CheckBox ID="cbIsFavorite" runat="server" />
                </td>
           </tr>
        <tr>
                <th>
                    <asp:Label ID="lblIsActive" runat="server" Text="Is Active"></asp:Label>
                </th>
                <td>
                    <asp:CheckBox ID="cbIsActive" runat="server" />
                </td>
           </tr>
        <tr>
            <td></td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="AddProduct" runat="server" ForeColor="#990000" />
                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAddProduct" runat="server" Text="Add New Car"
                    ValidationGroup="AddProduct" OnClick="btnAddProduct_Click" />
            </td>
        </tr>
   </table>
</asp:Content>
