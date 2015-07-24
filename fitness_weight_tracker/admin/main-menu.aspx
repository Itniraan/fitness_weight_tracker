<%@ Page Title="Solar Fitness | Main Menu" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="main-menu.aspx.cs" Inherits="fitness_weight_tracker.admin.main_menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Menu</h1>
    <div class="center_div">
    <div class="container-fluid">
        <h3>Food</h3>
        <ul class="list-group">
            <li class="list-group-item"><a href="addFood.aspx">Add Food</a></li>
        </ul>
    </div> 
    <div class="container-fluid">
        <h3>Exercise</h3>
        <ul class="list-group">
            <li class="list-group-item"><a href="exercise.aspx">Add Excercise</a></li>
        </ul>
    </div>
    <div class="container-fluid">
        <h3>Progress</h3>
        <ul class="list-group">
            <li class="list-group-item"><a href="progress.aspx">View Logs</a></li>
        </ul>
    </div>
    <div class="container-fluid">
        <h3>Profile</h3>
        <ul class="list-group">
            <li class="list-group-item"><a href="profile.aspx">View Profile</a></li>
            <li class="list-group-item"><a href="editprofile.aspx">Edit Profile</a></li>


        </ul>
    </div>
    </div>
</asp:Content>
