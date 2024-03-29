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

namespace fitness_weight_tracker.admin
{
    public partial class exercise : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If save wasn't clicked AND we have a ActLogID in the URL
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                GetAct();
            }
        }

        protected void GetAct()
        {
            // Populate form with existing ActLog record
            Int32 ActID = Convert.ToInt32(Request.QueryString["ActLogID"]);

            try
            {
                using (fit_trackEntities db = new fit_trackEntities())
                {
                    ActivityLog al = (from objS in db.ActivityLogs
                                 where objS.ActLogID == ActID
                                 select objS).FirstOrDefault();

                    // If there is an existing Activity Log, populate the form with the valus from the DB
                    if (al != null)
                    {
                        txtName.Text = al.ActName;
                        txtDuration.Text = Convert.ToString(al.ActDuration);
                        txtDistance.Text = Convert.ToString(al.ActDistance);
                        txtReps.Text = Convert.ToString(al.ActReps);
                        txtWeight.Text = Convert.ToString(al.ActWeight);
                        ddlExercise.SelectedValue = al.ActType;
                        // If the type of exercise is Cardio, show cardio fields
                        if (ddlExercise.SelectedValue == "Cardio")
                        {
                            pnlCardio.Visible = true;
                            pnlMuscles.Visible = false;
                            pnlName.Visible = true;
                            pnlButton.Visible = true;
                        }
                            // If the type of exercise is weight lifting, show weight lifting fields
                        else if (ddlExercise.SelectedValue == "Weight Lifting")
                        {
                            pnlCardio.Visible = false;
                            pnlMuscles.Visible = true;
                            pnlName.Visible = true;
                            pnlButton.Visible = true;

                        }
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }
        }

        protected void ddlExercise_SelectedIndexChanged(object sender, EventArgs e)
        {
            // If the type of exercise is Cardio, show cardio fields
            if (ddlExercise.SelectedValue == "Cardio")
            {
                pnlCardio.Visible = true;
                pnlMuscles.Visible = false;
                pnlName.Visible = true;
                pnlButton.Visible = true;
            }
            // If the type of exercise is weight lifting, show weight lifting fields
            else if (ddlExercise.SelectedValue == "Weight Lifting")
            {
                pnlCardio.Visible = false;
                pnlMuscles.Visible = true;
                pnlName.Visible = true;
                pnlButton.Visible = true;

            }
                // Otherwise, show neither one
            else
            {
                pnlCardio.Visible = false;
                pnlMuscles.Visible = false;
                pnlName.Visible = false;
                pnlButton.Visible = false;

            }
        }

        protected void btnExercise_Click(object sender, EventArgs e)
        {
            try
            {
                using (fit_trackEntities db = new fit_trackEntities())
                {
                    ActivityLog d = new ActivityLog();
                    Int32 ActLogID = 0;

                    // Grab the userID from the Authentication table
                    String userID = Convert.ToString(User.Identity.GetUserId());

                    // If an Activity Log already exists (Edit), load the values for that ActLogID from the ActLog table
                    if (Request.QueryString["ActLogID"] != null)
                    {
                        // Get the ID from the URL
                        ActLogID = Convert.ToInt32(Request.QueryString["ActLogID"]);

                        // Get the current ActLog from the Enity Framework
                        d = (from objS in db.ActivityLogs
                             where objS.ActLogID == ActLogID
                             select objS).FirstOrDefault();

                    }

                    d.UserID = userID;
                    d.ActName = txtName.Text;
                    d.ActType = ddlExercise.SelectedValue;

                    if (ddlExercise.SelectedValue == "Cardio")
                    {
                        d.ActDistance = Convert.ToDecimal(txtDistance.Text);
                        d.ActDuration = Convert.ToDecimal(txtDuration.Text);
                        d.ActDate = DateTime.Now;

                    }
                    else if (ddlExercise.SelectedValue == "Weight Lifting")
                    {
                        d.ActReps = Convert.ToInt32(txtReps.Text);
                        d.ActWeight = Convert.ToInt32(txtWeight.Text);
                        d.ActDate = DateTime.Now;
                    }

                    // If there is no ActLog, add a new one to the DB now
                    if (ActLogID == 0)
                    {
                        db.ActivityLogs.Add(d);
                    }
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