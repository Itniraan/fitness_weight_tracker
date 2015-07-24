<%@ Page Title="Solar Fitness | Profile" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="fitness_weight_tracker.users.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>User Details for: <asp:Label ID="lblUsername" runat="server" /></h1>
    <asp:Label runat="server" ID="lblError" CssClass="label label-info"></asp:Label>
     <div>
        <label>First Name:</label> <asp:Label ID="lblFirstName" runat="server" />
    </div>
    <div>
        <label>Last Name:</label> <asp:Label ID="lblLastName" runat="server" />
    </div>
    <div>
        <label>Email:</label> <asp:Label ID="lblEmail" runat="server" />
    </div>
    <div>
        <label>Height:</label> <asp:Label ID="lblUserHeight" runat="server" /><label class="text-left small">cm</label>
    </div>
    <div>
        <label>Weight:</label> <asp:Label ID="lblUserWeight" runat="server" /><label class="text-left small">lbs</label>
    </div>
    <div>
        <label>Age:</label> <asp:Label ID="lblAge" runat="server" /><label class="text-left small">yrs</label>
    </div>
    <div>
       <a href="editProfile.aspx" class="btn btn-default col-sm-offset-1">Edit Profile</a>
    </div>
</asp:Content>
