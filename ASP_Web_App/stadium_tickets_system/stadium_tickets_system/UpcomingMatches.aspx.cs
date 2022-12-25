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
    public partial class UpcomingMatches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String userid = "3";

            string connStr = WebConfigurationManager.ConnectionStrings["StadiumDatabaseConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand upcomingMatchesWithStadium = new SqlCommand("readUpcomingMatchesWithStadium", conn);
            upcomingMatchesWithStadium.CommandType = System.Data.CommandType.StoredProcedure;
            upcomingMatchesWithStadium.Parameters.Add(new SqlParameter("@rep_id", userid));

            conn.Open();
            SqlDataReader rdr = upcomingMatchesWithStadium.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            

            while (rdr.Read())
            {
                TableRow match = new TableRow();

                TableCell hostClub = new TableCell();
                match.Cells.Add(hostClub);
                hostClub.Text = rdr.GetString(rdr.GetOrdinal("Host"));

                TableCell guestClub = new TableCell();
                match.Cells.Add(guestClub);
                guestClub.Text = rdr.GetString(rdr.GetOrdinal("Guest"));

                TableCell startTime = new TableCell();
                match.Cells.Add(startTime);
                startTime.Text = rdr.GetDateTime(rdr.GetOrdinal("startTime")).ToString();

                TableCell endTime = new TableCell();
                match.Cells.Add(endTime);
                endTime.Text = rdr.GetDateTime(rdr.GetOrdinal("endTime")).ToString();


                TableCell StadiumName = new TableCell();
                match.Cells.Add(StadiumName);
                StadiumName.Text = rdr.GetString(rdr.GetOrdinal("StadiumName"));

                upcomingMatchesTableWithStadium.Rows.Add(match);

            }
            
            conn.Close();
            conn.Open();

            SqlCommand upcomingMatchesWithoutStadium = new SqlCommand("readUpcomingMatchesWithoutStadium", conn);
            upcomingMatchesWithoutStadium.CommandType = System.Data.CommandType.StoredProcedure;
            upcomingMatchesWithoutStadium.Parameters.Add(new SqlParameter("@rep_id", userid));

            rdr = upcomingMatchesWithoutStadium.ExecuteReader(System.Data.CommandBehavior.CloseConnection);


            while (rdr.Read())
            {
                TableRow match = new TableRow();

                TableCell hostClub = new TableCell();
                match.Cells.Add(hostClub);
                hostClub.Text = rdr.GetString(rdr.GetOrdinal("Host"));

                TableCell guestClub = new TableCell();
                match.Cells.Add(guestClub);
                guestClub.Text = rdr.GetString(rdr.GetOrdinal("Guest"));

                TableCell startTime = new TableCell();
                match.Cells.Add(startTime);
                startTime.Text = rdr.GetDateTime(rdr.GetOrdinal("startTime")).ToString();

                TableCell endTime = new TableCell();
                match.Cells.Add(endTime);
                endTime.Text = rdr.GetDateTime(rdr.GetOrdinal("endTime")).ToString();

                upcomingMatchesTableWithoutStadium.Rows.Add(match);

            }

            conn.Close();
        }
    }
}