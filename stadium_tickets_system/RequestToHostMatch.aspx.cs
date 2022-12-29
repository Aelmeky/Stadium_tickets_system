using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Lifetime;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stadium_tickets_system
{
    public partial class RequestToHostMatch : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["userName"] == null)
                Response.Redirect("login.aspx");
            if (!IsPostBack) {
                String userid = Session["userName"].ToString();

                string connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand upcomingMatchesToMakeHostReq = new SqlCommand("readUpcomingMatchesToMakeHostReq", conn);
                upcomingMatchesToMakeHostReq.CommandType = System.Data.CommandType.StoredProcedure;
                upcomingMatchesToMakeHostReq.Parameters.Add(new SqlParameter("@rep_id", userid));

                conn.Open();
                SqlDataReader rdr = upcomingMatchesToMakeHostReq.ExecuteReader(System.Data.CommandBehavior.CloseConnection);



                ddlstd.Items.Clear();
                ddlmat.Items.Clear();

                int i = 0;
                while (rdr.Read())
                {



                    String hostClub = rdr.GetString(rdr.GetOrdinal("Host"));


                    String guestClub = rdr.GetString(rdr.GetOrdinal("Guest"));

                    String startTime = rdr.GetDateTime(rdr.GetOrdinal("startTime")).ToString();


                    String endTime = rdr.GetDateTime(rdr.GetOrdinal("endTime")).ToString();

                    i++;
                    ddlmat.Items.Add(i.ToString() + " | " + hostClub + " | " + guestClub + " | " + startTime + " | " + endTime);
                }
                conn.Close();

            }
            msg.Text = "Please select a match and a stadium to make a host request.";


        }

        protected void selMatchChange(object sender, EventArgs e) {
            ddlstd.Items.Clear();
        }
        protected void ViewStds(object sender, EventArgs e)
        {
            try
            {
                String[] matData = ddlmat.Text.Split('|');
                String HostClubSel = matData[1].Substring(1, matData[1].Length - 1);
                String StratTimeSel = matData[3].Substring(1, matData[3].Length - 1);

                string connStr = WebConfigurationManager.ConnectionStrings["StadiumDatabaseConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand viewStad = new SqlCommand("SELECT * FROM dbo.viewAvailableStadiumsOn('" + StratTimeSel + "');", conn);
                viewStad.CommandType = System.Data.CommandType.Text;

                conn.Open();
                SqlDataReader rdr = viewStad.ExecuteReader(System.Data.CommandBehavior.CloseConnection);


                ddlstd.Items.Clear();
                int i = 0;
                while (rdr.Read())
                {


                    String stdname = rdr.GetString(rdr.GetOrdinal("name"));

                    String stdloc = rdr.GetString(rdr.GetOrdinal("location"));


                    String stdcap = rdr.GetInt32(rdr.GetOrdinal("capacity")).ToString();

                    i++;
                    ddlstd.Items.Add(i.ToString() + " | " + stdname + " | " + stdloc + " | " + stdcap);


                }


                conn.Close();
            }
            catch {
                Response.Redirect("RequestToHostMatch.aspx");
            }


        }

        protected void MakeReq(object sender, EventArgs e)
        {
            try
            {
                String[] matData = ddlmat.Text.Split('|');
                String HostClubSel = matData[1].Substring(1, matData[1].Length - 1);
                String StratTimeSel = matData[3].Substring(1, matData[3].Length - 1);

                String[] stdData = ddlstd.Text.Split('|');
                String stdname = stdData[1].Substring(1, stdData[1].Length - 1);


                string connStr = WebConfigurationManager.ConnectionStrings["StadiumDatabaseConn"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand addHostRequest = new SqlCommand("addHostRequest", conn);
                addHostRequest.CommandType = System.Data.CommandType.StoredProcedure;
                addHostRequest.Parameters.Add(new SqlParameter("@clubName", HostClubSel));
                addHostRequest.Parameters.Add(new SqlParameter("@stadiumName", stdname));
                addHostRequest.Parameters.Add(new SqlParameter("@startTime", StratTimeSel));

                conn.Open();
                addHostRequest.ExecuteNonQuery();
                conn.Close();
            }
            finally {

                Response.Redirect("RequestToHostMatch.aspx");
            }



        }

        protected void goClubInfo(object sender, EventArgs e)
        {
            Response.Redirect("RepresentativeClubInfo.aspx");
        }
        protected void goUpcomingMatches(object sender, EventArgs e)
        {
            Response.Redirect("UpcomingMatches.aspx");
        }
        protected void goAvailableStadiums(object sender, EventArgs e)
        {
            Response.Redirect("AvailableStadiums.aspx");
        }
        protected void goHostReq(object sender, EventArgs e)
        {
            Response.Redirect("RequestToHostMatch.aspx");
        }

    }
}