<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminLayout.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="CarPoint.com.Admin.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .navHover{background-color: #DAF7A6; font-size:medium;}
        .navHover:hover{
            background-color:darkgoldenrod;
            color:aliceblue;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <header>
        <asp:Image ID="bgAdminIma" ImageUrl="~/Images/Photo/adminpanel.png"  runat="server" Height="157px" Width="1400" /></header>
<h1>
    WellCome To Admin Home Page!
</h1>
    
    <br />
    <div class="container" id="myNavbar">
        <ul class="nav">
            <li class="navHover"><a href="Category.aspx"><b>Work With Category Management Table</b></a></li>
            <li class="navHover"><a href="Product.aspx"><b>Work With Product Management Table</b></a></li>           
        </ul>
    </div>
    <br />
    <br />
    <br />
</asp:Content>
