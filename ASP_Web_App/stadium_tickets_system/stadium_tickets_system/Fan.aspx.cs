using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stadium_tickets_system
{
    public partial class Fan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["userName"] == null)
                Response.Redirect("login.aspx");
            String userid = Session["userName"].ToString();

            string connStr = WebConfigurationManager.ConnectionStrings["StadiumDatabaseConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand matchesWithAvailableTickets = new SqlCommand("matchesWithAvailableTickets", conn);
            matchesWithAvailableTickets.CommandType = System.Data.CommandType.StoredProcedure;


            conn.Open();
            SqlDataReader rdr = matchesWithAvailableTickets.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

            ddlmats.Items.Clear();


            int i = 0;
            while (rdr.Read())
            {
                TableRow match = new TableRow();


                TableCell hostClub = new TableCell();
                match.Cells.Add(hostClub);
                hostClub.Text = rdr.GetString(rdr.GetOrdinal("Host"));

                TableCell guestClub = new TableCell();
                match.Cells.Add(guestClub);
                guestClub.Text = rdr.GetString(rdr.GetOrdinal("Guest"));

                TableCell stdname = new TableCell();
                match.Cells.Add(stdname);
                stdname.Text = rdr.GetString(rdr.GetOrdinal("StadiumName"));

                TableCell stdloc = new TableCell();
                match.Cells.Add(stdloc);
                stdloc.Text = rdr.GetString(rdr.GetOrdinal("StadiumLocation"));

                TableCell startTime = new TableCell();
                match.Cells.Add(startTime);
                startTime.Text = rdr.GetDateTime(rdr.GetOrdinal("startTime")).ToString();

                i++;
                ddlmats.Items.Add(i.ToString() + " | " + hostClub.Text + " | " + guestClub.Text + " | " + startTime.Text +" | " + stdname.Text + " | " + stdloc.Text);

                availableMats.Rows.Add(match);

            }

            conn.Close();

            SqlCommand readFanTickets = new SqlCommand("readFanTickets", conn);
            readFanTickets.CommandType = System.Data.CommandType.StoredProcedure;
            readFanTickets.Parameters.Add(new SqlParameter("@fan_id", userid));

            conn.Open();
            rdr = readFanTickets.ExecuteReader(System.Data.CommandBehavior.CloseConnection);




            while (rdr.Read())
            {
                TableRow ticket = new TableRow();


                TableCell TicketID = new TableCell();
                ticket.Cells.Add(TicketID);
                TicketID.Text = rdr.GetInt32(rdr.GetOrdinal("TicketID")).ToString();

                TableCell hostClub = new TableCell();
                ticket.Cells.Add(hostClub);
                hostClub.Text = rdr.GetString(rdr.GetOrdinal("HostClub"));

                TableCell guestClub = new TableCell();
                ticket.Cells.Add(guestClub);
                guestClub.Text = rdr.GetString(rdr.GetOrdinal("GuestClub"));

                TableCell startTime = new TableCell();
                ticket.Cells.Add(startTime);
                startTime.Text = rdr.GetDateTime(rdr.GetOrdinal("startTime")).ToString();



                tickets.Rows.Add(ticket);

            }

            conn.Close();






        }
        protected void Purchase(object sender, EventArgs e)
        {
            try
            {
                String userid = Session["userName"].ToString();


                String[] matData = ddlmats.Text.Split('|');
                String HostClubSel = matData[1].Substring(1, matData[1].Length - 1);
                String GuestClubSel = matData[2].Substring(1, matData[2].Length - 1);
                String StratTimeSel = matData[3].Substring(1, matData[3].Length - 1);

                string connStr = WebConfigurationManager.ConnectionStrings["StadiumDatabaseConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand purchaseTicket = new SqlCommand("purchaseTicket", conn);
                purchaseTicket.CommandType = System.Data.CommandType.StoredProcedure;

                purchaseTicket.Parameters.Add(new SqlParameter("@natId", userid));
                purchaseTicket.Parameters.Add(new SqlParameter("@hclubName", HostClubSel));
                purchaseTicket.Parameters.Add(new SqlParameter("@gclubName", GuestClubSel));
                purchaseTicket.Parameters.Add(new SqlParameter("@startTime", StratTimeSel));

                conn.Open();
                purchaseTicket.ExecuteNonQuery();
                conn.Close();

            }
            finally {
                Response.Redirect("Fan.aspx");
            }


        }



    }
}