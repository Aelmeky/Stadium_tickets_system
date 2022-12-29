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
            if (Session == null || Session["userName"] == null)
                Response.Redirect("login.aspx");

            String userid = Session["userName"].ToString();

            string connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand readClubInfoProc = new SqlCommand("readRepresentativeClubInfo", conn);
            readClubInfoProc.CommandType = System.Data.CommandType.StoredProcedure;
            readClubInfoProc.Parameters.Add(new SqlParameter("@rep_id", userid));

            conn.Open();
            SqlDataReader rdr = readClubInfoProc.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

            while (rdr.Read()) {

                TableRow info = new TableRow();

                TableCell clubid = new TableCell();
                info.Cells.Add(clubid);
                clubid.Text = rdr.GetInt32(rdr.GetOrdinal("id")).ToString();

                TableCell clubname = new TableCell();
                info.Cells.Add(clubname);
                clubname.Text = rdr.GetString(rdr.GetOrdinal("name"));



                TableCell clubloc = new TableCell();
                info.Cells.Add(clubloc);
                clubloc.Text = rdr.GetString(rdr.GetOrdinal("location"));



                infoTable.Rows.Add(info);


            }
            conn.Close();
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