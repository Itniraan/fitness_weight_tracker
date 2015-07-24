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
            lblFoodName.Text = User.Identity.GetUserName();
            lblActName.Text = User.Identity.GetUserName();
            if (!IsPostBack)
            {
                //Session["SortColumn"] = "FoodLogID";
                Session["SortDirection"] = "ASC";
                // If loading the page for the first time, populate the FoodLog an ActLog grids


            }
            if (ddlChoice.SelectedValue == "FoodLog")
            {
                Session["SortColumn"] = "FoodLogID";
                GetFoodLog();
                pnlFoodLog.Visible = true;
                pnlActLog.Visible = false;
            }
            else if (ddlChoice.SelectedValue == "ActLog")
            {
                Session["SortColumn"] = "ActLogID";
                GetActLog();
                pnlFoodLog.Visible = false;
                pnlActLog.Visible = true;
            }
            else
            {
                pnlFoodLog.Visible = false;
                pnlActLog.Visible = false;
            }
        }
        protected void GetFoodLog()
        {
            try
            {

                // Connect to EF
                using (fit_trackEntities db = new fit_trackEntities())
                {
                    String userID = Convert.ToString(User.Identity.GetUserId());
                    String sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
                    // Query the FoodLog table, using the Enity Framework
                    var FoodLog = (from fl in db.FoodLogs
                                   join u in db.AspNetUsers on fl.UserID equals u.Id
                                   where fl.UserID == userID
                                   select new
                                   {
                                       fl.FoodLogID,
                                       fl.FoodName,
                                       fl.Meal,
                                       fl.Calories,
                                       fl.FoodGroup,
                                       fl.MealServingSize,
                                       fl.Carbs,
                                       fl.TotalFat,
                                       fl.Protein,
                                       fl.Sodium,
                                       fl.FoodDate
                                   });


                    grdFoodLog.DataSource = FoodLog.AsQueryable().OrderBy(sortString).ToList();
                    grdFoodLog.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }
        }

        protected void GetActLog()
        {
            try
            {

                // Connect to EF
                using (fit_trackEntities db = new fit_trackEntities())
                {
                    String userID = Convert.ToString(User.Identity.GetUserId());
                    String sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();
                    // Query the ActivityLog table, using the Enity Framework
                    var ActLog = from al in db.ActivityLogs
                                 join u in db.AspNetUsers on al.UserID equals u.Id
                                 where al.UserID == userID
                                 select new { al.ActLogID, al.ActName, al.ActType, al.ActDuration, al.ActWeight, al.ActReps, al.ActDate };


                    grdActLog.DataSource = ActLog.AsQueryable().OrderBy(sortString).ToList();
                    grdActLog.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }
        }

        protected void grdFoodLog_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Store which row was clicked
            Int32 selectedRow = e.RowIndex;

            // Get the selected FoodLogID using the grid's Data Key collection
            Int32 FoodID = Convert.ToInt32(grdFoodLog.DataKeys[selectedRow].Values["FoodLogID"]);

            try
            {
                // Use Entity Framework to remove the selected Food Log from the DB
                using (fit_trackEntities db = new fit_trackEntities())
                {
                    FoodLog fl = (from objF in db.FoodLogs
                                  where objF.FoodLogID == FoodID
                                  select objF).FirstOrDefault(); // Using First would get an error if no data comes back, FirstOrDefault won't throw an error

                    // Do the delete
                    db.FoodLogs.Remove(fl);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }

            // Refresh the grid
            GetFoodLog();
        }

        protected void grdFoodLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Set the new page number
            grdFoodLog.PageIndex = e.NewPageIndex;
            GetFoodLog();
        }

        protected void grdFoodLog_Sorting(object sender, GridViewSortEventArgs e)
        {
            // Get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            // Reload the Grid
            GetFoodLog();

            // Toggle Direction
            if (Session["SortDirection"].ToString() == "ASC")
            {
                Session["SortDirection"] = "DESC";
            }
            else
            {
                Session["SortDirection"] = "ASC";
            }
        }

        protected void grdFoodLog_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    Image SortImage = new Image();

                    for (int i = 0; i <= grdFoodLog.Columns.Count - 1; i++)
                    {
                        if (grdFoodLog.Columns[i].SortExpression == Session["SortColumn"].ToString())
                        {
                            if (Session["SortDirection"].ToString() == "DESC")
                            {
                                SortImage.ImageUrl = "/images/desc.jpg";
                                SortImage.AlternateText = "Sort Descending";
                            }
                            else
                            {
                                SortImage.ImageUrl = "/images/asc.jpg";
                                SortImage.AlternateText = "Sort Ascending";
                            }

                            e.Row.Cells[i].Controls.Add(SortImage);

                        }
                    }
                }
            }
        }

        protected void grdActLog_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Store which row was clicked
            Int32 selectedRow = e.RowIndex;

            // Get the selected ActLogID using the grid's Data Key collection
            Int32 ActID = Convert.ToInt32(grdFoodLog.DataKeys[selectedRow].Values["ActLogID"]);

            try
            {
                // Use Entity Framework to remove the selected Activity Log from the DB
                using (fit_trackEntities db = new fit_trackEntities())
                {
                    ActivityLog al = (from objA in db.ActivityLogs
                                      where objA.ActLogID == ActID
                                      select objA).FirstOrDefault(); // Using First would get an error if no data comes back, FirstOrDefault won't throw an error

                    // Do the delete
                    db.ActivityLogs.Remove(al);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }

            // Refresh the grid
            GetActLog();
        }

        protected void grdActLog_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Set the new page number
            grdActLog.PageIndex = e.NewPageIndex;
            GetActLog();
        }

        protected void grdActLog_Sorting(object sender, GridViewSortEventArgs e)
        {
            // Get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            // Reload the Grid
            GetActLog();

            // Toggle Direction
            if (Session["SortDirection"].ToString() == "ASC")
            {
                Session["SortDirection"] = "DESC";
            }
            else
            {
                Session["SortDirection"] = "ASC";
            }
        }

        protected void grdActLog_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    Image SortImage = new Image();

                    for (int i = 0; i <= grdActLog.Columns.Count - 1; i++)
                    {
                        if (grdActLog.Columns[i].SortExpression == Session["SortColumn"].ToString())
                        {
                            if (Session["SortDirection"].ToString() == "DESC")
                            {
                                SortImage.ImageUrl = "/images/desc.jpg";
                                SortImage.AlternateText = "Sort Descending";
                            }
                            else
                            {
                                SortImage.ImageUrl = "/images/asc.jpg";
                                SortImage.AlternateText = "Sort Ascending";
                            }

                            e.Row.Cells[i].Controls.Add(SortImage);

                        }
                    }
                }
            }
        }

        protected void ddlFoodPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Set new page size
            grdFoodLog.PageSize = Convert.ToInt32(ddlFoodPageSize.SelectedValue);
            GetFoodLog();
        }

        protected void ddlActPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Set new page size
            grdActLog.PageSize = Convert.ToInt32(ddlActPageSize.SelectedValue);
            GetActLog();
        }
    }
}