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
    public partial class deletematch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void deletema_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String host = hostclub2.Text;
            String guest = guestclub2.Text;
            DateTime end = DateTime.Parse(endtime1.Text);
            DateTime start = DateTime.Parse(starttime1.Text);


            SqlCommand addnewmatch_proc = new SqlCommand("deleteMatchForSportManager", conn);
            addnewmatch_proc.CommandType = CommandType.StoredProcedure;
            addnewmatch_proc.Parameters.Add(new SqlParameter("@host", host));
            addnewmatch_proc.Parameters.Add(new SqlParameter("@guest", guest));
            addnewmatch_proc.Parameters.Add(new SqlParameter("@start_time", start));
            addnewmatch_proc.Parameters.Add(new SqlParameter("@end_time", end));

            conn.Open();
            addnewmatch_proc.ExecuteNonQuery();
            conn.Close();
        }
    }
}