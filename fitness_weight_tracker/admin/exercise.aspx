<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="exercise.aspx.cs" Inherits="fitness_weight_tracker.admin.exercise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--
    Page Name: exercise.aspx
    Authors: Emily and Blake
    Description: Page to add exercises to Activity Log. Can be used to add new exercises, or edit existing exercises in the activity log.
     -->
    <h1>Add/Edit Exercise</h1>
       
            <label for="ddlExercise">Type of exercise:</label>
            <asp:DropDownList runat="server" ID="ddlExercise" AutoPostBack="true" CssClass="form-control-static" OnSelectedIndexChanged="ddlExercise_SelectedIndexChanged" required>
                <asp:ListItem Text="Select Activity"></asp:ListItem>
                <asp:ListItem Text="Cardio" Value="Cardio"></asp:ListItem>
                <asp:ListItem Text="Weights" Value="Weight Lifting"></asp:ListItem>
            </asp:DropDownList>
            <asp:Panel runat="server" ID="pnlName" Visible="false">
                <label for="txtName">Name of Exercise:</label>
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control-static" required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="actNameRequiredValidator" runat="server" ErrorMessage="Exercise Name is Required!" CssClass="label label-danger" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlCardio" Visible="false">
                <div>
                    <label for="txtDistance">Distance:</label>
                    <asp:TextBox runat="server" ID="txtDistance" CssClass="form-control-static"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="actDistanceRequiredValidator" runat="server" ErrorMessage="Distance is Required!" CssClass="label label-danger" ControlToValidate="txtDistance" Display="Dynamic"></asp:RequiredFieldValidator>
                    <label class="text-left">kilometers</label>
                                        <asp:RangeValidator ID="actDistanceRangeValidator" runat="server" ErrorMessage="Distance Must be Between 0 and 10,000" MinimumValue="0" MaximumValue="10000" CssClass="label label-danger" ControlToValidate="txtDistance" Type="Double" Display="Dynamic"></asp:RangeValidator>

                </div>
                <div>
                    <label for="txtDuration">Duration:</label>
                    <asp:TextBox runat="server" ID="txtDuration" CssClass="form-control-static"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="actDurationRequiredValidator" runat="server" ErrorMessage="Duration is Required!" CssClass="label label-danger" ControlToValidate="txtDuration" Display="Dynamic"></asp:RequiredFieldValidator>
                    <label class="text-left">minutes</label>
                                        <asp:RangeValidator ID="actDurationRangeValidator" runat="server" ErrorMessage="Duration Must be Between 0 and 1000" MinimumValue="0" MaximumValue="1000" CssClass="label label-danger" ControlToValidate="txtDuration" Type="Double" Display="Dynamic"></asp:RangeValidator>

                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlMuscles" Visible="false">
                <div>
                    <label for="txtReps"># of Reps:</label>
                    <asp:TextBox runat="server" ID="txtReps" CssClass="form-control-static"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="actRepsRequiredValidator" runat="server" ErrorMessage="# of Reps is Required!" CssClass="label label-danger" ControlToValidate="txtReps" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="actRepsRangeValidator" runat="server" ErrorMessage="# of Reps Must be Between 0 and 1000" CssClass="label label-danger" ControlToValidate="txtReps" MinimumValue="0" MaximumValue="1000" Type="Integer" Display="Dynamic"></asp:RangeValidator>
                </div>
                <div>
                    <label for="txtWeight">Amount of Weight:</label>
                    <asp:TextBox runat="server" ID="txtWeight" CssClass="form-control-static"></asp:TextBox>
                    <label class="text-left">pounds</label>
                    <asp:RequiredFieldValidator ID="actWeightRequiredValidator" runat="server" ErrorMessage="Amount of Weight is Required!" CssClass="label label-danger" ControlToValidate="txtWeight" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="actWeightRangeValidator" runat="server" ErrorMessage="Amount of Weight Must be Between 0 and 1000" CssClass="label label-danger" ControlToValidate="txtWeight" MinimumValue="0" MaximumValue="1000" Type="Integer" Display="Dynamic"></asp:RangeValidator>
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlButton" Visible="false">
                <asp:Button runat="server" CssClass="btn btn-default col-sm-offset-2" ID="btnExercise" Text="Add Exercise" OnClick="btnExercise_Click" />
            </asp:Panel>

    
</asp:Content>