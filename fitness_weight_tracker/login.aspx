<%@ Page Title="Solar Fitness | Login" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="fitness_weight_tracker.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Login</h1>
    <h5>All fields are required</h5>

    <div>
        <asp:Label ID="lblStatus" runat="server" CssClass="label label-danger"></asp:Label>
    </div>
    <div class="form-inline">
        <label for="txtUserName">Username: </label>
        <asp:TextBox ID="txtUserName" runat="server" required="true" MaxLength="50" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is required." ControlToValidate="txtUserName" CssClass="label label-danger" Display="Dynamic"></asp:RequiredFieldValidator>

    </div>
    <div class="form-inline">
        <label for="txtPassword">Password: </label>
        <asp:TextBox ID="txtPassword" runat="server" required="true" MaxLength="50" TextMode="Password" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required." ControlToValidate="txtPassword" CssClass="label label-danger" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    <div>
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-default col-sm-offset-2" OnClick="btnLogin_Click" />
    </div>
</asp:Content>
