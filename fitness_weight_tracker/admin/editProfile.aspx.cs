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

namespace fitness_weight_tracker.users
{
    public partial class editProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsername.Text = Convert.ToString(User.Identity.GetUserName());
            // If save wasn't clicked AND we have a StudentID in the URL
            if ((!IsPostBack))
            {
                GetProfile();
            }
        }

        protected void GetProfile()
        {
            // Populate form with existing student record
            String UserID = Convert.ToString(User.Identity.GetUserId());

            try
            {
                using (fit_trackEntities db = new fit_trackEntities())
                {
                    UserProfile up = (from objS in db.UserProfiles
                                 where objS.UserID == UserID
                                 select objS).FirstOrDefault();


                        txtFirstName.Text = up.FirstName;
                        txtLastName.Text = up.LastName;
                        txtEmail.Text = up.Email;
                        txtHeight.Text = Convert.ToString(up.UserHeight);
                        txtWeight.Text = Convert.ToString(up.UserWeight);
                        txtAge.Text = Convert.ToString(up.Age);

                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/error.aspx");
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            //try
            //{
                // Use EF to connect to SQL Server
                using (fit_trackEntities db = new fit_trackEntities())
                {
                    // Use the Student Model to save the new record
                    UserProfile up = new UserProfile();
                    String UserID = Convert.ToString(User.Identity.GetUserId());

                    // Get the current student from the Enity Framework
                    up = (from objS in db.UserProfiles
                          where objS.UserID == UserID
                          select objS).FirstOrDefault();

                    up.FirstName = txtFirstName.Text;
                    up.LastName = txtLastName.Text;
                    up.Email = txtEmail.Text;
                    up.UserHeight = Convert.ToDecimal(txtHeight.Text);
                    up.UserWeight = Convert.ToDecimal(txtWeight.Text);
                    up.Age = Convert.ToInt32(txtAge.Text);

                    db.SaveChanges();

                    // Redirect to the updated Profile page
                    Response.Redirect("/admin/profile.aspx");
                }
            //}
            //catch (Exception ex)
           // {
           //     Response.Redirect("/error.aspx");
           // }

        }
    }
}