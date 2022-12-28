using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace stadium_tickets_system
{
    public partial class SystemAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["userName"] == null)
                Response.Redirect("login.aspx");

        }

         protected void goFan(object sender, EventArgs e)
        {
            Response.Redirect("SystemAdmin.aspx");
        }
        protected void goClub(object sender, EventArgs e)
        {
            Response.Redirect("ControlClubs.aspx");
        }
        protected void goStadium(object sender, EventArgs e)
        {
            Response.Redirect("ControlStadiums.aspx");
        }
        private int check_fan_status_and_existence(DataTable table, string fan_national_id)
        {
            foreach (DataRow row in table.Rows)
            {
                if (row[0].Equals(fan_national_id))
                {
                    if (row[4].Equals(true))
                    {
                        return 2; // exists and unblocked
                    }
                    else return 1; // exists and blocked
                }
            }
            return 0; // does not exist
        }
        protected void method_block_fan(object sender, EventArgs e)
        {
            string connection_string = WebConfigurationManager.ConnectionStrings["myDB"].ToString();
            SqlConnection sql_connection = new SqlConnection(connection_string);
            string fan_national_id = text_fan_id.Text;
            DataTable fans_table = new DataTable();
            sql_connection.Open();
            new SqlDataAdapter("Select * From Fan", sql_connection).Fill(fans_table);
            sql_connection.Close();
            int fan_status = check_fan_status_and_existence(fans_table, fan_national_id);
            if (fan_status == 0)
            {
                string message = "this fan doesn't exist";
                string title = "Invalid Action";
                MessageBox.Show(message, title);
            }
            else
            {
                if (fan_status == 1)
                {
                    string message = "this fan is already blocked";
                    string title = "Invalid Action";
                    MessageBox.Show(message, title);
                }
                else
                {
                    SqlCommand block_fan = new SqlCommand("blockFan", sql_connection);
                    block_fan.CommandType = CommandType.StoredProcedure;
                    block_fan.Parameters.Add(new SqlParameter("@n_id", fan_national_id));
                    sql_connection.Open();
                    block_fan.ExecuteNonQuery();
                    sql_connection.Close();
                }
            }
        }

        protected void method_unblock_fan(object sender, EventArgs e)
        {

            string connection_string = WebConfigurationManager.ConnectionStrings["myDB"].ToString();
            SqlConnection sql_connection = new SqlConnection(connection_string);
            string fan_national_id = text_fan_id.Text;
            DataTable fans_table = new DataTable();
            sql_connection.Open();
            new SqlDataAdapter("Select * From Fan", sql_connection).Fill(fans_table);
            sql_connection.Close();
            int fan_status = check_fan_status_and_existence(fans_table, fan_national_id);
            if (fan_status == 0)
            {
                string message = "this fan doesn't exist";
                string title = "Invalid Action";
                MessageBox.Show(message, title);
            }
            else
            {
                if (fan_status == 2)
                {
                    string message = "this fan is already unblocked";
                    string title = "Invalid Action";
                    MessageBox.Show(message, title);
                }
                else
                {
                    SqlCommand unblock_fan = new SqlCommand("unblockFan", sql_connection);
                    unblock_fan.CommandType = CommandType.StoredProcedure;
                    unblock_fan.Parameters.Add(new SqlParameter("@n_id", fan_national_id));
                    sql_connection.Open();
                    unblock_fan.ExecuteNonQuery();
                    sql_connection.Close();
                }
            }

        }
    }
}