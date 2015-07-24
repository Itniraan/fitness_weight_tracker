<%@ Page Title="Solar Fitness | Edit Profile" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="editProfile.aspx.cs" Inherits="fitness_weight_tracker.users.editProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Edit User Details for: <asp:Label ID="lblUsername" runat="server" /></h1>

    <div>
        <label for="txtFirstName">First Name: </label>
        <asp:TextBox ID="txtFirstName" CssClass="form-control-static" runat="server" />
    </div>
    <div>
        <label for="txtLastName">Last Name: </label>
        <asp:TextBox ID="txtLastName" CssClass="form-control-static"  runat="server" />
    </div>
    <div>
        <label for="txtEmail">Email: </label>
        <asp:TextBox ID="txtEmail" CssClass="form-control-static" runat="server" />
    </div>
    <div>
        <label for="txtHeight">User Height: </label>
        <asp:TextBox ID="txtHeight" CssClass="form-control-static" runat="server" />
        <label class="text-left">centimeters</label>
    </div>
    <div>
        <label for="txtWeight">User Weight: </label>
        <asp:TextBox ID="txtWeight" CssClass="form-control-static" runat="server" />
        <label class="text-left">pounds</label>
    </div>
    <div>
        <label for="txtAge">Age: </label>
        <asp:TextBox ID="txtAge" CssClass="form-control-static" runat="server" />
    </div>
    <div>
        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-default col-sm-offset-2" Text="Save Profile" OnClick="btnSave_Click" />
    </div>
</asp:Content>
