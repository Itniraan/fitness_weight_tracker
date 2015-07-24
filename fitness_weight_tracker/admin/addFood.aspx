<%@ Page Title="Solar Fitness | Add Food to Food Log" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="addFood.aspx.cs" Inherits="fitness_weight_tracker.users.foodLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add Food</h1>
        <div>
        <label for="ddlMeals">Type of meal:</label>
        <asp:DropDownList runat="server" ID="ddlMeals" CssClass="form-control-static" AutoPostBack="true" OnSelectedIndexChanged="ddlMeals_SelectedIndexChanged">
            <asp:ListItem Text="Select Meal"></asp:ListItem>
            <asp:ListItem Text="Breakfast" Value="breakfast"></asp:ListItem>
            <asp:ListItem Text="Lunch" Value="lunch"></asp:ListItem>
            <asp:ListItem Text="Dinner" Value="dinner"></asp:ListItem>
            <asp:ListItem Text="Snack" Value="snack"></asp:ListItem>
        </asp:DropDownList>

        </div>
        <asp:Panel runat="server" ID="pnlBreakfast" Visible="false">
            <h3>Breakfast</h3>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlLunch" Visible="false">
            <h3>Lunch</h3>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlDinner" Visible="false">
            <h3>Dinner</h3>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlSnack" Visible="false">
            <h3>Snack</h3>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlFoodForm" Visible="false">
            <fieldset>
                <label for="txtFoodName">Food Name:</label>
                <asp:TextBox ID="txtFoodName" CssClass="form-control-static" runat="server" required></asp:TextBox>
            </fieldset>
            <fieldset>
                <label for="txtCalories">Calories:</label>
                <asp:TextBox ID="txtCalories" runat="server" CssClass="form-control-static" TextMode="Number"></asp:TextBox>
            </fieldset>
            <fieldset>
                <label for="ddlFoodGroup">Select Food Group:</label>
                <asp:DropDownList ID="ddlFoodGroup" CssClass="form-control-static" runat="server" required>
                    <asp:ListItem Text="Select Group"></asp:ListItem>
                    <asp:ListItem Text="Meat" Value="meat"></asp:ListItem>
                    <asp:ListItem Text="Fruit/Vegetable" Value="fruit/vege"></asp:ListItem>
                    <asp:ListItem Text="Dairy" Value="dairy"></asp:ListItem>
                    <asp:ListItem Text="Grain" Value="grain"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="other"></asp:ListItem>
                </asp:DropDownList>
            </fieldset>
            <fieldset>
                <label for="txtServings">Servings:</label>
                <asp:TextBox ID="txtServings" runat="server" CssClass="form-control-static"></asp:TextBox>
            </fieldset>
            <fieldset>
                <label for="txtCarbs">Carbohydrates:</label>
                <asp:TextBox ID="txtCarbs" runat="server" CssClass="form-control-static" TextMode="Number"></asp:TextBox>
                <label class="text-left">grams</label>
            </fieldset>
            <fieldset>
                <label for="txtProtein">Protein:</label>
                <asp:TextBox ID="txtProtein" runat="server" CssClass="form-control-static" TextMode="Number"></asp:TextBox>
                <label class="text-left">grams</label>
             </fieldset>
            <fieldset>
                <label for="txtSodium">Sodium:</label>
                <asp:TextBox ID="txtSodium" runat="server" CssClass="form-control-static" TextMode="Number"></asp:TextBox>
                <label class="text-left">milligrams</label>
            </fieldset>
            <fieldset>
                <label for="txtFat">Total Fat:</label>
                <asp:TextBox ID="txtFat" runat="server" CssClass="form-control-static" TextMode="Number"></asp:TextBox>
            <label class="text-left">grams</label>
            </fieldset>
            <asp:Button ID="btnAddFood" runat="server" CssClass="btn btn-default col-sm-offset-2" OnClick="btnAddFood_Click" Text="Add Food" />

        </asp:Panel>

</asp:Content>
