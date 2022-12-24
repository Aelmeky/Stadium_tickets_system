using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stadium_tickets_system
{
    public partial class SportManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void addanewmatch(object sender, EventArgs e)
        {
            Response.Redirect("addanewmatch.aspx");
        }
        protected void deleteaMatch(object sender, EventArgs e)
        {
            Response.Redirect("deletematch.aspx");
        }

        protected void allupcomingmatches(object sender, EventArgs e)
        {
            Response.Redirect("upcomingmatches.aspx");
        }

        protected void alreadyplayedmatches(object sender, EventArgs e)
        {
            Response.Redirect("alreadyplayed.aspx");
        }

        protected void nevermatched(object sender, EventArgs e)
        {
            Response.Redirect("nevermatched.aspx");
        }
    }
}