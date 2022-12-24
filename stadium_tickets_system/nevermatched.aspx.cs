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
    public partial class nevermatched : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            DataTable up = new DataTable();
            conn.Open();
            new SqlDataAdapter("select * from clubsNeverScheduled", conn).Fill(up);
            foreach (DataRow row in up.Rows)
            {
                TableRow trow = new TableRow();
                for (int i = 0; i < 2; i++)
                {
                    TableCell c = new TableCell();
                    c.Controls.Add(new LiteralControl(row[i].ToString()));
                    trow.Cells.Add(c);
                }
                never.Controls.Add(trow);
            }
            conn.Close();

        }
    }
}