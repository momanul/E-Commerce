<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="CarPoint.com.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div><h2>If You Sure you want to Change your Password than Provide Following Information</h2></div>
    <br />
    <table>
          <tr>
              <th>Olde Password</th>
              <td>
                <asp:TextBox ID="txtOldePass" runat="server"></asp:TextBox>
              </td>
          </tr>
         <tr>
              <th>New Password</th>
              <td>
                <asp:TextBox ID="txtNewPass" runat="server" ></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvNewPass" runat="server" ErrorMessage="New Password input is Required" Display="Dynamic" ControlToValidate="txtNewPass" ForeColor="#CC0000"></asp:RequiredFieldValidator>
              </td>
          </tr>
         <tr>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Height="35px" Width="95px" />
           </td>
         </tr>
 </table>
    <br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>
