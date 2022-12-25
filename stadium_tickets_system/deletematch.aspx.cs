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
            String connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            DataTable up = new DataTable();
            conn.Open();
            new SqlDataAdapter("select * from allCLubs", conn).Fill(up);
            foreach (DataRow row in up.Rows)
            {
                DropDownListhost1.Items.Add(new ListItem(row[0].ToString()));
                DropDownguest1.Items.Add(new ListItem(row[0].ToString()));
            }
            conn.Close();

        }


        protected void deletema_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String host = DropDownListhost1.SelectedValue;
            String guest = DropDownguest1.SelectedValue;
            DateTime end = DateTime.Parse(endtime1.Text);
            DateTime start = DateTime.Parse(starttime1.Text);


            SqlCommand addnewmatch_proc = new SqlCommand("deleteMatchForSportManager", conn);
            addnewmatch_proc.CommandType = CommandType.StoredProcedure;
            addnewmatch_proc.Parameters.Add(new SqlParameter("@host", host));
            addnewmatch_proc.Parameters.Add(new SqlParameter("@guest", guest));
            addnewmatch_proc.Parameters.Add(new SqlParameter("@start_time", start));
            addnewmatch_proc.Parameters.Add(new SqlParameter("@end_time", end));
            try
            {
                conn.Open();
                addnewmatch_proc.ExecuteNonQuery();
                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
            
        }
    }
}