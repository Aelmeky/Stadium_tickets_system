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
    public partial class ControlClubs : System.Web.UI.Page
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
        protected void method_add_club(object sender, EventArgs e)
        {
            string connection_string = WebConfigurationManager.ConnectionStrings["myDB"].ToString();
            SqlConnection sql_connection = new SqlConnection(connection_string);
            string club_name = text_new_club_name.Text;
            string club_loc = text_new_club_location.Text;
            SqlCommand check_club_exist = new SqlCommand("checkClub", sql_connection);
            check_club_exist.Parameters.Add(new SqlParameter("@club_name", club_name));
            check_club_exist.CommandType = CommandType.StoredProcedure;
            SqlParameter exist = check_club_exist.Parameters.Add(new SqlParameter("@found", SqlDbType.Int));
            exist.Direction = ParameterDirection.Output;
            sql_connection.Open();
            check_club_exist.ExecuteNonQuery();
            sql_connection.Close();
            if (exist.Value.ToString() == "0")
            {
                if (club_name.Length == 0 || club_loc.Length == 0) {
                    string message = "Please Insert all info about the club";
                    string title = "Invalid Action";
                       MessageBox.Show(message, title);
                }
                else
                {
                    SqlCommand add_club = new SqlCommand("addClub", sql_connection);
                    add_club.CommandType = CommandType.StoredProcedure;
                    add_club.Parameters.Add(new SqlParameter("@club_name", club_name));
                    add_club.Parameters.Add(new SqlParameter("@club_loc", club_loc));
                    sql_connection.Open();
                    add_club.ExecuteNonQuery();
                    sql_connection.Close();
                }
            }
            else
            {
                string message = "this club name is already added";
                string title = "Invalid Action";
                   MessageBox.Show(message, title);
            }
        }
        protected void method_delete_club(object sender, EventArgs e)
        {
            string connection_string = WebConfigurationManager.ConnectionStrings["myDB"].ToString();
            SqlConnection sql_connection = new SqlConnection(connection_string);
            string club_name = text_deleted_club_name.Text;
            SqlCommand check_club_exist = new SqlCommand("checkClub", sql_connection);
            check_club_exist.Parameters.Add(new SqlParameter("@club_name", club_name));
            check_club_exist.CommandType = CommandType.StoredProcedure;
            SqlParameter exist = check_club_exist.Parameters.Add(new SqlParameter("@found", SqlDbType.Int));
            exist.Direction = ParameterDirection.Output;
            sql_connection.Open();
            check_club_exist.ExecuteNonQuery();
            sql_connection.Close();
            if (exist.Value.ToString() == "1")
            {
                SqlCommand delete_club = new SqlCommand("deleteClub", sql_connection);
                delete_club.CommandType = CommandType.StoredProcedure;
                delete_club.Parameters.Add(new SqlParameter("@club_name", club_name));
                sql_connection.Open();
                delete_club.ExecuteNonQuery();
                sql_connection.Close();
            }
            else
            {
                string message = "this club name doesn't exist";
                string title = "Invalid Action";
                  MessageBox.Show(message, title);

            }
        }
    }
}