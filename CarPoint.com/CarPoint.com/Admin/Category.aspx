<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminLayout.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="CarPoint.com.Admin.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
        width: 612px;
    }
        .auto-style2 {
        width: 842px;
        margin-left: 221px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/>
    <h1 style="color:cornflowerblue">Category Management</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" DynamicLayout="false"
        AssociatedUpdatePanelID="upGvCategory" runat="server">
        <ProgressTemplate>
            <b>Looding...</b>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="upGvCategory" runat="server">
        <ContentTemplate>
    <asp:GridView ID="gvCategory" runat="server" 
        AllowPaging="True" DataKeyNames="ID" 
        
        OnPageIndexChanging="gvCategory_PageIndexChanging" 
        OnRowCancelingEdit="gvCategory_RowCancelingEdit" 
        OnRowDeleting="gvCategory_RowDeleting" 
        OnRowEditing="gvCategory_RowEditing" 
        OnRowUpdating="gvCategory_RowUpdating" PageSize="5" AutoGenerateColumns="False" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Height="167px" Width="1267px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="ParentCatID" HeaderText="Parent Category ID"  />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="DisplayOrder" HeaderText="Display Order" />
                <asp:BoundField DataField="IsActive" HeaderText="Is Active" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                     ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>

      </ContentTemplate>
    </asp:UpdatePanel>
    <br />
   
    <div>
    <table class="auto-style2">       
            <tr>
                <th>
                    <asp:Label ID="Label1" runat="server" Text="ParentCategory ID"></asp:Label>
                </th>
                <td class="auto-style1">
                    <asp:TextBox ID="txtParentCatID" runat="server" Width="457px"></asp:TextBox>
                </td>
           </tr>
           <tr>
               <th>
                    <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
               </th>
                <td class="auto-style1">
                    <asp:TextBox ID="txtName" runat="server" Width="458px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="AddCategory" Display="None" ErrorMessage="Please Enter The Name First! " ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </td>
           </tr>
           <tr>
                <th>
                    <asp:Label ID="Label3" runat="server" Text="Display Order"></asp:Label>
                </th>
                <td class="auto-style1">
                    <asp:TextBox ID="txtDisplayOrder" runat="server" Width="461px"></asp:TextBox>
                </td>
          </tr>
          <tr>
                <th>
                    <asp:Label ID="Label4" runat="server" Text="Is Active"></asp:Label>
                </th>
                <td class="auto-style1">
                    <asp:CheckBox ID="cbIsActive" runat="server" />
                </td>
           </tr>
        <tr>
            <td></td>
            <td class="auto-style1">
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="AddCategory" runat="server" ForeColor="#990000" />
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAddCategory" runat="server" BackColor="Yellow" Text="Add New Category" 
                  ValidationGroup="AddCategory"  OnClick="btnAddCategory_Click" />
            </td>
        </tr>
   </table>
 </div>
    
    
    </asp:Content>
