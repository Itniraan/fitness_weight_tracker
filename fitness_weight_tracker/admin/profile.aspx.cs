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
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Grab username and userID from AspNet Authentication
            String userName = Convert.ToString(User.Identity.GetUserName());
            String userID = Convert.ToString(User.Identity.GetUserId());
            lblUsername.Text = userName;
            UserProfile userP = new UserProfile();
            using (fit_trackEntities db = new fit_trackEntities())
            {
                userP = (from up in db.UserProfiles
                         join u in db.AspNetUsers on up.UserID equals u.Id
                         where up.UserID == userID
                         select up).FirstOrDefault();

                // If user already has a profile, print the details to the screen
                if (userP != null)
                {
                    lblFirstName.Text = userP.FirstName;
                    lblLastName.Text = userP.LastName;
                    lblEmail.Text = userP.Email;
                    lblUserHeight.Text = Convert.ToString(userP.UserHeight);
                    lblUserWeight.Text = Convert.ToString(userP.UserWeight);
                    lblAge.Text = Convert.ToString(userP.Age);
                }
                    // If the user doesn't have a profile yet (New User), add a new entry to the UserProfile table with their UserID
                else
                {
                    userP = new UserProfile();
                    userP.UserID = userID;
                    db.UserProfiles.Add(userP);
                    db.SaveChanges();
                }

            }
        }



    }
}