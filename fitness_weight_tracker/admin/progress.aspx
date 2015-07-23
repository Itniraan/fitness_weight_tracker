<%@ Page Title="Solar Fitness | Food Log" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="progress.aspx.cs" Inherits="fitness_weight_tracker.users.food" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlFoodLog" runat="server">
        <h1>Food Log for: <asp:Label ID="lblName" runat="server"></asp:Label></h1>
        <asp:GridView ID="grdFoodLog" runat="server" AllowPaging="true" PageSize="5" AllowSorting="true" AutoGenerateColumns="false" 
            OnRowDeleting="grdFoodLog_RowDeleting" OnPageIndexChanging="grdFoodLog_PageIndexChanging" OnSorting="grdFoodLog_Sorting" 
            OnRowDataBound="grdFoodLog_RowDataBound" DataKeyNames="FoodLogID" CssClass="table table-striped table-hover">
            <Columns>
                <asp:BoundField DataField="FoodLogID" HeaderText="Food Log ID" SortExpression="FoodLogID" />
                <asp:BoundField DataField="FoodName" HeaderText="Food Name" SortExpression="FoodName" />
                <asp:BoundField DataField="Meal" HeaderText="Meal" SortExpression="Meal" />
                <asp:BoundField DataField="FoodDate" HeaderText="Date Entered" SortExpression="FoodDate" />
                <asp:HyperLinkField HeaderText="Edit" Text="Edit" NavigateUrl="~/food.aspx" DataNavigateUrlFields="FoodID" DataNavigateUrlFormatString="food.aspx?FoodID={0}" />
                <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="pnlActLog" runat="server">
        <h1>Activity Log for: <asp:Label ID="Label1" runat="server"></asp:Label></h1>
        <asp:GridView ID="grdActLog" runat="server" AllowPaging="true" PageSize="5" AllowSorting="true" AutoGenerateColumns="false" 
            OnRowDeleting="grdActLog_RowDeleting" OnPageIndexChanging="grdActLog_PageIndexChanging" OnSorting="grdActLog_Sorting" 
            OnRowDataBound="grdActLog_RowDataBound" DataKeyNames="ActLogID" CssClass="table table-striped table-hover">
            <Columns>
                <asp:BoundField DataField="ActLogID" HeaderText="Activity Log ID" SortExpression="ActLogID" />
                <asp:BoundField DataField="ActName" HeaderText="Activity Name" SortExpression="FoodName" />
                <asp:BoundField DataField="ActType" HeaderText="Activity Type" SortExpression="ActType" />
                <asp:BoundField DataField="ActDuration" HeaderText="Activity Duration" SortExpression="ActDuration" />
                <asp:BoundField DataField="ActWeight" HeaderText="Activity Weight" SortExpression="ActWeight" />
                <asp:BoundField DataField="ActReps" HeaderText="Activity Repetitions" SortExpression="ActReps" />
                <asp:BoundField DataField="ActDate" HeaderText="Date Entered" SortExpression="ActDate" />
                <asp:HyperLinkField HeaderText="Edit" Text="Edit" NavigateUrl="~/food.aspx" DataNavigateUrlFields="ActLogID" DataNavigateUrlFormatString="food.aspx?FoodID={0}" />
                <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
    </asp:Panel>

</asp:Content>
