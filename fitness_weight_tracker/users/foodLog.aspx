<%@ Page Title="Solar Fitness | Food Log" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="foodLog.aspx.cs" Inherits="fitness_weight_tracker.users.food" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Food Log for: </h1><asp:Label ID="lblName" runat="server" Font-Size="Large"></asp:Label>
    <asp:GridView ID="grdFoodLog" runat="server" AllowPaging="true" PageSize="5" AllowSorting="true" AutoGenerateColumns="false" 
        OnRowDeleting="grdFoodLog_RowDeleting" OnPageIndexChanging="grdFoodLog_PageIndexChanging" OnSorting="grdFoodLog_Sorting" 
        OnRowDataBound="grdFoodLog_RowDataBound" DataKeyNames="FoodLogID">
        <Columns>
            <asp:BoundField DataField="FoodLogID" HeaderText="Food Log ID" SortExpression="FoodLogID" />
            <asp:BoundField DataField="FoodName" HeaderText="Food Name" SortExpression="Food Name" />
            <asp:HyperLinkField HeaderText="Edit" Text="Edit" NavigateUrl="~/food.aspx" DataNavigateUrlFields="FoodID" DataNavigateUrlFormatString="food.aspx?FoodID={0}" />
            <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
</asp:Content>
