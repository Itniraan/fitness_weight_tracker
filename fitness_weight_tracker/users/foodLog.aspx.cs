using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

using fitness_weight_tracker.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;

namespace fitness_weight_tracker.users
{
    public partial class food : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblName.Text = User.Identity.GetUserName();
            if (!IsPostBack)
            {
                Session["SortColumn"] = "CourseID";
                Session["SortDirection"] = "ASC";
                // If loading the page for the first time, populate the FoodLog grid
                GetFoodLog();
            }
        }
        protected void GetFoodLog()
        {
            try
            {

                // Connect to EF
                using (fit_trackEntities db = new fit_trackEntities())
                {

                    String sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
                    // Query the Courses table, using the Enity Framework
                    var FoodLog = from fl in db.FoodLogs
                                  join f in db.Foods on fl.FoodID equals f.FoodID
                                  join u in db.AspNetUsers on fl.UserID equals u.Id
                                  where fl.UserID == User.Identity.GetUserId()
                                  select new { fl.FoodLogID, f.FoodName };


                    grdFoodLog.DataSource = FoodLog.AsQueryable().OrderBy(sortString).ToList();
                    grdFoodLog.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }
        }

        protected void grdFoodLog_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdFoodLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void grdFoodLog_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void grdFoodLog_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}