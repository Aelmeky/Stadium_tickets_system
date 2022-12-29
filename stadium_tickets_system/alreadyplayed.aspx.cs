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
    public partial class alreadyplayed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["userName"] == null)
                Response.Redirect("login.aspx");

            String connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            DataTable up = new DataTable();
            conn.Open();
            new SqlDataAdapter("select * from alreadyPalyedMatches", conn).Fill(up);
            foreach(DataRow row in up.Rows)
            {
                TableRow trow = new TableRow();
                for(int i = 0; i < 4; i++)
                {
                    TableCell c = new TableCell();
                    c.Controls.Add(new LiteralControl(row[i].ToString()));
                    trow.Cells.Add(c);
                }
                playedmactes.Controls.Add(trow);
            }
         
            conn.Close();

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
            Response.Redirect("upcomingmatches1.aspx");
        }


        protected void nevermatched(object sender, EventArgs e)
        {
            Response.Redirect("nevermatched.aspx");
        }
    }
}