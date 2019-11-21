<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CarPoint.com.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
     <br />
    <h3>Please Login First!</h3>
    <br />
     <b>Demo </b> <p>UserName : Momanul</p>
                 <p>Password : 1247650</p>
    <br />
    <br />
   <div style="float:left; width: 435px; margin-right: 0px;">
     <table>
          <tr>
              <th>User Name</th>
              <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUserName" runat="server" ErrorMessage="User Name is Required!" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>
              </td>
          </tr>
         <tr>
              <th>Password</th>
              <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" runat="server" ErrorMessage="Password is Required!" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>
              </td>
          </tr>
        <%-- <tr>
              <th>Save User</th>
              <td>
                  <asp:CheckBoxList ID="cbSaveUser" runat="server"></asp:CheckBoxList>
              </td>
          </tr>--%>
         <tr>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Height="35px" Width="95px" />
           </td>
         </tr>
 </table>
       <br />
       <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
   </div>
    <div style="align-self:stretch;" class="auto-style1">
        <h5>If You Not Register Please Complete the Registration </h5>

        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="auto-style2" Height="46px" Width="274px" OnClick="btnRegister_Click" style="margin-left: 192" CausesValidation="False" />
        <br />
        <asp:Label ID="lblReg" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
