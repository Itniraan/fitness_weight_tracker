<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="exercise.aspx.cs" Inherits="fitness_weight_tracker.admin.exercise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add Exercise</h1>
    <div class="container center_div">
    <label for="ddlExercise">Choose the type of exercise:</label>
        <asp:DropDownList runat="server" ID="ddlExercise" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlExercise_SelectedIndexChanged">
            <asp:ListItem Text="Select Activity"></asp:ListItem>
            <asp:ListItem Text="Cardio" Value="Cardio"></asp:ListItem>
            <asp:ListItem Text="Weights" Value="Weight Lifting"></asp:ListItem>
        </asp:DropDownList>
        <asp:Panel runat="server" ID="pnlName" Visible="false">
            <label for="txtName">Name of Exercise:</label>
            <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlCardio" Visible="false">
            <label for="txtDistance">Distance:</label>
            <asp:TextBox runat="server" ID="txtDistance" CssClass="form-control"></asp:TextBox>
            <label for="txtDuration">Duration:</label>
            <asp:TextBox runat="server" ID="txtDuration" CssClass="form-control"></asp:TextBox>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlMuscles" Visible="false">

            <label for="txtReps"># of Reps:</label>
            <asp:TextBox runat="server" ID="txtReps" CssClass="form-control"></asp:TextBox>
            <label for="txtWeight">Amount of Weight:</label>
            <asp:TextBox runat="server" ID="txtWeight" CssClass="form-control"></asp:TextBox>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlButton" Visible="false">
            <asp:Button runat="server" ID="btnExercise" Text="Add Exercise" OnClick="btnExercise_Click" />
        </asp:Panel>
    </div>
</asp:Content>