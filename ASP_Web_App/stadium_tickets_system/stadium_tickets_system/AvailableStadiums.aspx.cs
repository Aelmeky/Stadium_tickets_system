using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stadium_tickets_system
{
    public partial class AvailableStadiums : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void View(object sender, EventArgs e) {
            DateTime st = DateTime.Parse(startTimeInput.Text);


            
            string startTime = st.ToString("yyyy-MM-dd HH:mm");

            string connStr = WebConfigurationManager.ConnectionStrings["StadiumDatabaseConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand viewStad = new SqlCommand("SELECT * FROM dbo.viewAvailableStadiumsOn('" + startTime+"');", conn);
            viewStad.CommandType = System.Data.CommandType.Text;

            conn.Open();
            SqlDataReader rdr = viewStad.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

            
                while (rdr.Read())
                {
                    TableRow std = new TableRow();

                    TableCell stdname = new TableCell();
                    std.Cells.Add(stdname);
                    stdname.Text = rdr.GetString(rdr.GetOrdinal("name"));

                    TableCell stdloc = new TableCell();
                    std.Cells.Add(stdloc);
                    stdloc.Text = rdr.GetString(rdr.GetOrdinal("location"));


                    TableCell stdcap = new TableCell();
                    std.Cells.Add(stdcap);
                    stdcap.Text = rdr.GetInt32(rdr.GetOrdinal("capacity")).ToString();


                    availableStadiumsTable.Rows.Add(std);
                       
                }


                conn.Close();




        }
    }
}