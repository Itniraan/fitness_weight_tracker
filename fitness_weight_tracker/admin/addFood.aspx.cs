using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using fitness_weight_tracker.Models;
using System.Web.ModelBinding;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace fitness_weight_tracker.users
{
    public partial class foodLog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ddlMeals_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMeals.SelectedValue == "breakfast")
            {
                pnlBreakfast.Visible = true;
                pnlDinner.Visible = false;
                pnlLunch.Visible = false;
                pnlSnack.Visible = false;
                pnlFoodForm.Visible = true;

            }
            else if (ddlMeals.SelectedValue == "lunch")
            {
                pnlBreakfast.Visible = false;
                pnlDinner.Visible = false;
                pnlLunch.Visible = true;
                pnlSnack.Visible = false;
                pnlFoodForm.Visible = true;

            }
            else if (ddlMeals.SelectedValue == "dinner")
            {
                pnlBreakfast.Visible = false;
                pnlDinner.Visible = true;
                pnlLunch.Visible = false;
                pnlSnack.Visible = false;
                pnlFoodForm.Visible = true;
            }
            else if (ddlMeals.SelectedValue == "snack")
            {
                pnlBreakfast.Visible = false;
                pnlDinner.Visible = false;
                pnlLunch.Visible = false;
                pnlSnack.Visible = true;
                pnlFoodForm.Visible = true;
            }
            else
            {
                pnlBreakfast.Visible = false;
                pnlDinner.Visible = false;
                pnlLunch.Visible = false;
                pnlSnack.Visible = false;
                pnlFoodForm.Visible = false;
            }
        }

        protected void btnAddFood_Click(object sender, EventArgs e)
        {
            try
            {
                using (fit_trackEntities db = new fit_trackEntities())
                {
                    FoodLog d = new FoodLog();

                    String userID = Convert.ToString(User.Identity.GetUserId());
                    d.UserID = userID;
                    d.Meal = ddlMeals.SelectedValue;
                    d.FoodName = txtFoodName.Text;
                    d.Calories = Convert.ToInt32(txtCalories.Text);
                    d.Carbs = Convert.ToInt32(txtCarbs.Text);
                    d.MealServingSize = Convert.ToInt32(txtServings.Text);
                    d.FoodGroup = ddlFoodGroup.SelectedValue;
                    d.Protein = Convert.ToInt32(txtProtein.Text);
                    d.TotalFat = Convert.ToInt32(txtFat.Text);
                    d.Sodium = Convert.ToInt32(txtSodium.Text);
                    d.FoodDate = DateTime.Now;
                    db.FoodLogs.Add(d);
                    db.SaveChanges();
                    Response.Redirect("/admin/main-menu.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }
        }
    }
}