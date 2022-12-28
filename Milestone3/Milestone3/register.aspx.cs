using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void method_register_sport_association_manager(object sender, EventArgs e)
        {
            Response.Redirect("SportManagerRegistration.aspx");
        }
        protected void method_register_clubRepresentative(object sender, EventArgs e)
        {
            Response.Redirect("clubRepresentativeRegistration.aspx");
        }
        protected void method_register_stadiumManager(object sender, EventArgs e)
        {
            Response.Redirect("StadiumManagerRegisteration.aspx");
        }
        protected void method_register_fan(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}