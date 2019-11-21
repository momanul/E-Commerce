<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CarPoint.com.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Your Login Information</h1>
    <br />
    <div style="height:150px;">
    <div style="width:40%;float:left">
    <table style="width:100%; height:130px;" >
          <tr>
              <th>Name</th>
              <td>
                  <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
              </td>
          </tr>
         <tr>
              <th>User ID</th>
              <td>
                  <asp:Label ID="lblUserID" runat="server" Text=""></asp:Label>
              </td>
          </tr>
         <tr>
              <th>Role</th>
              <td>
                  <asp:Label ID="lblRole" runat="server" Text=""></asp:Label>
              </td>
          </tr>
   </table>
    </div>
    <div style="width:50%;float:right;">
        <h3>You want To change your Password Than Click Here</h3>
        <br />
        <asp:Button ID="btnChangePass" runat="server" Text="Change Password" Height="30px" OnClick="btnChangePass_Click" style="margin-left: 106px; margin-top: 0" Width="303px" />
    </div>
    </div>
</asp:Content>
