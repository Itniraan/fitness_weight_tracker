<%@ Page Title="Solar Fitness | View Progress" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="progress.aspx.cs" Inherits="fitness_weight_tracker.users.food" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Progress</h1>
    <div class="container center_div">
    <asp:Panel ID="pnlChoice" runat="server" Visible="true">
        <label for="ddlChoiceText">Select Type of Log to View:</label>
        <asp:DropDownList ID="ddlChoice" CssClass="form-control" runat="server" AutoPostBack="true">
            <asp:ListItem Value="default" Text="Select Log"></asp:ListItem>
            <asp:ListItem Value="FoodLog" Text="Food Log"></asp:ListItem>
            <asp:ListItem Value="ActLog" Text="Activity Log"></asp:ListItem>
        </asp:DropDownList>
    </asp:Panel>
    </div>
    <asp:Panel ID="pnlFoodLog" runat="server" Visible="false">
        <h1>Food Log for: <asp:Label ID="lblFoodName" runat="server"></asp:Label></h1>
        <div>
            <strong>Records Per Page: </strong>
            <asp:DropDownList ID="ddlFoodPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFoodPageSize_SelectedIndexChanged">
                <asp:ListItem Value="3" Text="3" />
                <asp:ListItem Value="5" Text="5" />
                <asp:ListItem Value="10" Text="10" />
            </asp:DropDownList>
        </div>
        <asp:GridView ID="grdFoodLog" runat="server" AllowPaging="true" PageSize="5" AllowSorting="true" AutoGenerateColumns="false" 
            OnRowDeleting="grdFoodLog_RowDeleting" OnPageIndexChanging="grdFoodLog_PageIndexChanging" OnSorting="grdFoodLog_Sorting" 
            OnRowDataBound="grdFoodLog_RowDataBound" DataKeyNames="FoodLogID" CssClass="table table-striped table-hover">
            <Columns>
                <asp:BoundField DataField="FoodName" HeaderText="Food Name" SortExpression="FoodName" />
                <asp:BoundField DataField="Meal" HeaderText="Meal" SortExpression="Meal" />
                <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                <asp:BoundField DataField="FoodGroup" HeaderText="Food Group" SortExpression="FoodGroup" />
                <asp:BoundField DataField="MealServingSize" HeaderText="Meal Serving Size" SortExpression="MealServingSize" />
                <asp:BoundField DataField="Carbs" HeaderText="Carbohydrates" SortExpression="Carbs" />
                <asp:BoundField DataField="TotalFat" HeaderText="Total Fat" SortExpression="TotalFat" />
                <asp:BoundField DataField="Protein" HeaderText="Protein" SortExpression="Protein" />
                <asp:BoundField DataField="Sodium" HeaderText="Sodium" SortExpression="Sodium" />
                <asp:BoundField DataField="FoodDate" HeaderText="Date Entered" SortExpression="FoodDate" />
                <asp:HyperLinkField HeaderText="Edit" Text="Edit" NavigateUrl="~/food.aspx" DataNavigateUrlFields="FoodLogID" DataNavigateUrlFormatString="food.aspx?FoodLogID={0}" />
                <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="pnlActLog" runat="server" Visible="false">
        <h1>Activity Log for: <asp:Label ID="lblActName" runat="server"></asp:Label></h1>
        <div>
            <strong>Records Per Page: </strong>
            <asp:DropDownList  ID="ddlActPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlActPageSize_SelectedIndexChanged">
                <asp:ListItem Value="3" Text="3" />
                <asp:ListItem Value="5" Text="5" />
                <asp:ListItem Value="10" Text="10" />
            </asp:DropDownList>
        </div>
         
        <asp:GridView ID="grdActLog" runat="server" AllowPaging="true" PageSize="5" AllowSorting="true" AutoGenerateColumns="false" 
            OnRowDeleting="grdActLog_RowDeleting" OnPageIndexChanging="grdActLog_PageIndexChanging" OnSorting="grdActLog_Sorting" 
            OnRowDataBound="grdActLog_RowDataBound" DataKeyNames="ActLogID" CssClass="table table-striped table-hover">
            <Columns>
                <asp:BoundField DataField="ActLogID" HeaderText="Activity Log ID" SortExpression="ActLogID" />
                <asp:BoundField DataField="ActName" HeaderText="Activity Name" SortExpression="ActName" />
                <asp:BoundField DataField="ActType" HeaderText="Activity Type" SortExpression="ActType" />
                <asp:BoundField DataField="ActDuration" HeaderText="Activity Duration" SortExpression="ActDuration" />
                <asp:BoundField DataField="ActWeight" HeaderText="Activity Weight" SortExpression="ActWeight" />
                <asp:BoundField DataField="ActReps" HeaderText="Activity Repetitions" SortExpression="ActReps" />
                <asp:BoundField DataField="ActDate" HeaderText="Date Entered" SortExpression="ActDate" />
                <asp:HyperLinkField HeaderText="Edit" Text="Edit" NavigateUrl="~/food.aspx" DataNavigateUrlFields="ActLogID" DataNavigateUrlFormatString="exercise.aspx?ActLogID={0}" />
                <asp:CommandField HeaderText="Delete" DeleteText="Delete" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
      

</asp:Content>