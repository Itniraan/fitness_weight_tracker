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
                
                Session["SortDirection"] = "ASC";
                // If loading the page for the first time, populate the FoodLog grid
                GetFoodLog();
                //GetActLog();
            }
        }
        protected void GetFoodLog()
        {
            try
            {
                Session["SortColumn"] = "FoodLogID";
                // Connect to EF
                using (fit_trackEntities db = new fit_trackEntities())
                {
                    String userID = Convert.ToString(User.Identity.GetUserId());
                    String sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
                    // Query the Courses table, using the Enity Framework
                    var FoodLog = (from fl in db.FoodLogs
                                  join u in db.AspNetUsers on fl.UserID equals u.Id
                                  where fl.UserID == userID
                                  select new { fl.FoodLogID,  fl.FoodName, fl.Meal, fl.FoodDate });


                    grdFoodLog.DataSource = FoodLog.AsQueryable().OrderBy(sortString).ToList();
                    grdFoodLog.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }
        }

        /**protected void GetActLog()
        {
            try
            {
                Session["SortColumn"] = "ActLogID";
                // Connect to EF
                using (fit_trackEntities db = new fit_trackEntities())
                {
                    String userID = Convert.ToString(User.Identity.GetUserId());
                    String sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
                    // Query the Courses table, using the Enity Framework
                    var ActLog = from al in db.ActivityLogs
                                  join ac in db.Activities on al.ActID equals ac.ActID
                                  join u in db.AspNetUsers on al.UserID equals u.Id
                                  where al.UserID == userID
                                  select new { al.ActLogID, ac.ActID, ac.ActName, ac.ActType, ac.ActDuration, ac.ActWeight, ac.ActReps, al.ActDate };


                    grdFoodLog.DataSource = ActLog.AsQueryable().OrderBy(sortString).ToList();
                    grdFoodLog.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }
        }**/

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

        protected void grdActLog_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdActLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void grdActLog_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void grdActLog_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}