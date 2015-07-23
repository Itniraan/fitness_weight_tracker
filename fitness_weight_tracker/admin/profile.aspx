<%@ Page Title="Solar Fitness | Profile" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="fitness_weight_tracker.users.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>User Details for: <asp:Label ID="lblUsername" runat="server" /></h1>
    <div>
        First Name: <asp:Label ID="lblFirstName" runat="server" />
    </div>
    <div>
        Last Name: <asp:Label ID="lblLastName" runat="server" />
    </div>
    <div>
        Email: <asp:Label ID="lblEmail" runat="server" />
    </div>
    <div>
        Height: <asp:Label ID="lblUserHeight" runat="server" />
    </div>
    <div>
        Weight: <asp:Label ID="lblUserWeight" runat="server" />
    </div>
    <div>
        Age: <asp:Label ID="lblAge" runat="server" />
    </div>
    <div>
        <a href="editProfile.aspx">Edit Profile</a>
    </div>
</asp:Content>
