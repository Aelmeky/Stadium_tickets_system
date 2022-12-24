using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stadium_tickets_system
{
    public partial class ClubRepresentativeRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RegisterClubRepresentative(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["StadiumDatabaseConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string name = Name.Text;
            string password = Password.Text;
            string username = Username.Text;
            string clubname = Clubname.Text;

            SqlCommand Regproc = new SqlCommand("addRepresentative",conn);
            Regproc.CommandType = System.Data.CommandType.StoredProcedure;
            Regproc.Parameters.Add(new SqlParameter("@name",name));
            Regproc.Parameters.Add(new SqlParameter("@clubName", clubname));
            Regproc.Parameters.Add(new SqlParameter("@userName", username));
            Regproc.Parameters.Add(new SqlParameter("@password", password));





            conn.Open();
            Regproc.ExecuteNonQuery();
            conn.Close();


        }
    }
}