using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class ControlStadiums : System.Web.UI.Page
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
        protected void method_add_stadium(object sender, EventArgs e)
        {
            string connection_string = WebConfigurationManager.ConnectionStrings["myDB"].ToString();
            SqlConnection sql_connection = new SqlConnection(connection_string);
            string stadium_name = text_newstadium_name.Text;
            string location = text_newstadium_location.Text;
            string cap = text_new_stadium_cap.Text;
            SqlCommand check_stadium_exist = new SqlCommand("checkStadium", sql_connection);
            check_stadium_exist.CommandType = CommandType.StoredProcedure;
            check_stadium_exist.Parameters.Add(new SqlParameter("@std_name", stadium_name));
            SqlParameter exist = check_stadium_exist.Parameters.Add(new SqlParameter("@found", SqlDbType.Int));
            exist.Direction = ParameterDirection.Output;
            sql_connection.Open();
            check_stadium_exist.ExecuteNonQuery();
            sql_connection.Close();
            if (exist.Value.ToString() == "0")
            {
                if (cap.Length == 0 || location.Length == 0 || stadium_name.Length == 0)
                {
                    string message = "Please fill the stadium Info";
                    string title = "Invalid Action";
                    //  MessageBox.Show(message, title);

                }
                else
                {
                    SqlCommand add_std = new SqlCommand("AddStadium", sql_connection);
                    add_std.CommandType = CommandType.StoredProcedure;
                    add_std.Parameters.Add(new SqlParameter("@std_name", stadium_name));
                    add_std.Parameters.Add(new SqlParameter("@std_loc", location));
                    add_std.Parameters.Add(new SqlParameter("@cap", Int16.Parse(cap)));
                    sql_connection.Open();
                    add_std.ExecuteNonQuery();
                    sql_connection.Close();
                }
            }
            else
            {
                string message = "this stadium name is already added";
                string title = "Invalid Action";
                //  MessageBox.Show(message, title);
            }
        }

        protected void method_delete_stadium(object sender, EventArgs e)
        {
            string connection_string = WebConfigurationManager.ConnectionStrings["myDB"].ToString();
            SqlConnection sql_connection = new SqlConnection(connection_string);
            string stadium_name = text_delete_stadium.Text;
            SqlCommand check_stadium_exist = new SqlCommand("checkStadium", sql_connection);
            check_stadium_exist.Parameters.Add(new SqlParameter("@std_name", stadium_name));
            check_stadium_exist.CommandType = CommandType.StoredProcedure;
            SqlParameter exist = check_stadium_exist.Parameters.Add(new SqlParameter("@found", SqlDbType.Int));
            exist.Direction = ParameterDirection.Output;
            sql_connection.Open();
            check_stadium_exist.ExecuteNonQuery();
            sql_connection.Close();
            if (exist.Value.ToString() == "1")
            {
                SqlCommand delete_std = new SqlCommand("deleteStadium", sql_connection);
                delete_std.CommandType = CommandType.StoredProcedure;
                delete_std.Parameters.Add(new SqlParameter("@std_name", stadium_name));
                sql_connection.Open();
                delete_std.ExecuteNonQuery();
                sql_connection.Close();
            }
            else
            {
                string message = "this stadium name doesn't exist";
                string title = "Invalid Action";
                //    MessageBox.Show(message, title);
            }
        }
    }
}