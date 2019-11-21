<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CarPoint.com.Admin.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
     <br />
    <h2>Please Provide the following Information for Registration</h2>
    <br />
   <div style="float:left;">
     <table style="width: 471px; margin-left: 29px">
          <tr>
              <th>User Name</th>
              <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="UserNameValidation" runat="server" ErrorMessage="User Name is Required!" ControlToValidate="txtUserName" Display="Dynamic"></asp:RequiredFieldValidator>
              </td>
          </tr>
         <tr>
              <th>Password</th>
              <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
              </td>
          </tr>
         <tr>
              <th>
                  Role
              </th>
              <td>
                  <asp:RadioButtonList ID="rbUserRole" runat="server">
                      <asp:ListItem>
                          General
                      </asp:ListItem>
                      <asp:ListItem>
                          Admin
                      </asp:ListItem>
                  </asp:RadioButtonList>
              </td>
          </tr>
         <tr>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit"  Height="35px" Width="95px" OnClick="btnSubmit_Click" />
           </td>
         </tr>
 </table>
       <asp:Label ID="lblMessage" runat="server" ForeColor="#CC0000"></asp:Label>
   </div>
</asp:Content>
