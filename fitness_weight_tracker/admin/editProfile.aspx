<%@ Page Title="Solar Fitness | Edit Profile" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="editProfile.aspx.cs" Inherits="fitness_weight_tracker.users.editProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Edit User Details for: <asp:Label ID="lblUsername" runat="server" /></h1>
    <div>
        <label for="txtFirstName">First Name: </label>
        <asp:TextBox ID="txtFirstName" runat="server" />
    </div>
    <div>
        <label for="txtLastName">Last Name: </label>
        <asp:TextBox ID="txtLastName" runat="server" />
    </div>
    <div>
        <label for="txtEmail">Email: </label>
        <asp:TextBox ID="txtEmail" runat="server" />
    </div>
    <div>
        <label for="txtHeight">User Height: </label>
        <asp:TextBox ID="txtHeight" runat="server" />
    </div>
    <div>
        <label for="txtWeight">User Weight: </label>
        <asp:TextBox ID="txtWeight" runat="server" />
    </div>
    <div>
        <label for="txtAge">Age: </label>
        <asp:TextBox ID="txtAge" runat="server" />
    </div>
    <div>
        <asp:Button ID="btnSave" runat="server" Text="Save Profile" OnClick="btnSave_Click" />
    </div>
</asp:Content>
