using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stadium_tickets_system
{
    public class Globals
    {
        public static List<string> logged_users = new List<string>();
        public static int id = 0;
    }
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            string connection_string = WebConfigurationManager.ConnectionStrings["myDB"].ToString();
            SqlConnection sql_connection = new SqlConnection(connection_string);
            string login_username = username.Text;
            string login_password = password.Text;
            SqlCommand login_procedure = new SqlCommand("valid_login", sql_connection);
            login_procedure.CommandType = CommandType.StoredProcedure;
            login_procedure.Parameters.Add(new SqlParameter("@username", login_username));
            login_procedure.Parameters.Add(new SqlParameter("@password", login_password));
            SqlParameter type_of_login = login_procedure.Parameters.Add("@type", SqlDbType.Int);
            type_of_login.Direction = ParameterDirection.Output;
            sql_connection.Open();
            login_procedure.ExecuteNonQuery();
            sql_connection.Close();
            string type = type_of_login.Value.ToString();
            Console.WriteLine(type);
            if (type == "0")
            {
                Session["userName"] = login_username;
                Response.Redirect("addanewmatch.aspx");
            }
            else if (type == "1")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand getClubRepid = new SqlCommand("getClubRepid", conn);
                getClubRepid.CommandType = System.Data.CommandType.StoredProcedure;
                getClubRepid.Parameters.Add(new SqlParameter("@username", login_username));

                conn.Open();
                SqlDataReader rdr = getClubRepid.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                while (rdr.Read())
                {

                    Session["userName"] = rdr.GetInt32(rdr.GetOrdinal("id")).ToString();

                }
                conn.Close();
                Response.Redirect("RepresentativeClubInfo.aspx");
            }
            else if (type == "2")
            {
                Session["userName"] = login_username;
                Response.Redirect("StadiumManager.aspx");
            }
            else if (type == "3")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand getFanid = new SqlCommand("getFanid", conn);
                getFanid.CommandType = System.Data.CommandType.StoredProcedure;
                getFanid.Parameters.Add(new SqlParameter("@username", login_username));

                conn.Open();
                SqlDataReader rdr = getFanid.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                while (rdr.Read())
                {

                    Session["userName"] = rdr.GetString(rdr.GetOrdinal("n_id")).ToString();

                }
                conn.Close();

                Response.Redirect("Fan.aspx");
            }
            else if (type == "4")
            {
                Session["userName"] = login_username;
                Response.Redirect("SystemAdmin.aspx");
            }
            else
            {
                string message = "Please Enter a correct username and password";
                string title = "Invalid Login";
              // MessageBox.Show(message, title);
                Response.Redirect("login.aspx");
            }
        }
        protected void method_register_redirect(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}