using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stadium_tickets_system
{
    public partial class addanewmatch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addingmatch_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String host = hostclub1.Text;
            String guest = guestclub1.Text;
            DateTime end = DateTime.Parse(endtime.Text);
            DateTime start = DateTime.Parse(starttime.Text);

            Response.Write(start);

            SqlCommand addnewmatch_proc = new SqlCommand("addNewMatch", conn);
            addnewmatch_proc.CommandType = CommandType.StoredProcedure;
            addnewmatch_proc.Parameters.Add(new SqlParameter("@host_club_name", host));
            addnewmatch_proc.Parameters.Add(new SqlParameter("@guest_club_name", guest));
            addnewmatch_proc.Parameters.Add(new SqlParameter("@start_time", start.Date));
            addnewmatch_proc.Parameters.Add(new SqlParameter("@end_time", end.Date));

            conn.Open();
            addnewmatch_proc.ExecuteNonQuery();
            conn.Close();

        }

    }
}