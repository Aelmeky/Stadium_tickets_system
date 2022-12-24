using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace stadium_tickets_system
{
    public partial class RepresentativeClubInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String userid = "3";

            string connStr = WebConfigurationManager.ConnectionStrings["StadiumDatabaseConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand readClubInfoProc = new SqlCommand("readRepresentativeClubInfo", conn);
            readClubInfoProc.CommandType = System.Data.CommandType.StoredProcedure;
            readClubInfoProc.Parameters.Add(new SqlParameter("@rep_id", userid));

            conn.Open();
            SqlDataReader rdr = readClubInfoProc.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

            while (rdr.Read()) {
                String clubid = rdr.GetInt32(rdr.GetOrdinal("id")).ToString();
                String clubname = rdr.GetString(rdr.GetOrdinal("name"));
                String clubloc = rdr.GetString(rdr.GetOrdinal("location"));
                Label idlabel = new Label();
                idlabel.Text = "Club Id: "+clubid+"<br>";

                
                Label namelabel = new Label();
                namelabel.Text = "Club Name: " + clubname+"<br>";
                Label loclabel = new Label();
                loclabel.Text = "Location: " + clubloc;

                form1.Controls.Add(idlabel);
                form1.Controls.Add(namelabel);
                form1.Controls.Add(loclabel);


            }
            conn.Close();
        }
    }
}