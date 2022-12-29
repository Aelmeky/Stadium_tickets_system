using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace stadium_tickets_system
{
    public partial class Registration : System.Web.UI.Page
    {
        public ArrayList getAllAssocManagers(SqlConnection conn) {
            SqlCommand allAssocManagers = new SqlCommand("SELECT * FROM dbo.allAssocManagers", conn);
            ArrayList allUsernames= new ArrayList();
            conn.Open();
            SqlDataReader rdrAssocManagers = allAssocManagers.ExecuteReader();
            while (rdrAssocManagers.Read())
            {
                allUsernames.Add(rdrAssocManagers.GetString(rdrAssocManagers.GetOrdinal("username")));
            }
            conn.Close();
            return allUsernames;
        }
        public ArrayList getAllClubRepresentatives(SqlConnection conn) {
            SqlCommand allClubRepresentatives = new SqlCommand("SELECT * FROM dbo.allClubRepresentatives", conn);
            ArrayList allUsernames = new ArrayList();
            conn.Open();
            SqlDataReader rdrRepresentatives = allClubRepresentatives.ExecuteReader();
            while (rdrRepresentatives.Read())
            {
                allUsernames.Add(rdrRepresentatives.GetString(rdrRepresentatives.GetOrdinal("username")));
            }
            conn.Close();
            return allUsernames;
        }
        public ArrayList getAllStadiumManagers(SqlConnection conn) {
            SqlCommand allStadiumManagers = new SqlCommand("SELECT * FROM dbo.allStadiumManagers", conn);
            ArrayList allUsernames = new ArrayList();
            conn.Open();
            SqlDataReader rdrStadiumManagers = allStadiumManagers.ExecuteReader();
            while (rdrStadiumManagers.Read())
            {
                allUsernames.Add(rdrStadiumManagers.GetString(rdrStadiumManagers.GetOrdinal("username")));
            }
            conn.Close();
            return allUsernames;
        }
        public ArrayList getAllFans(SqlConnection conn)
        {
            SqlCommand allFans = new SqlCommand("SELECT * FROM dbo.allFans", conn);
           
       
          
            ArrayList allUsernames = new ArrayList();
            try
            {
                conn.Open();
                SqlDataReader rdrFans = allFans.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
         
                while (rdrFans.Read())
                {
                    allUsernames.Add(rdrFans.GetString(rdrFans.GetOrdinal("userName")));
                }
                conn.Close();
              
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            return allUsernames;
        }
        protected ArrayList getAllNationalIDs(SqlConnection conn)
        {
            SqlCommand allStadiums = new SqlCommand("SELECT * FROM dbo.allFans", conn);
            ArrayList nationaIDs = new ArrayList();
            try
            {
                conn.Open();
                SqlDataReader rdr = allStadiums.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    nationaIDs.Add(rdr.GetString(rdr.GetOrdinal("national_id")));
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            return nationaIDs;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {
          
            string connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String name = fanName.Text;
            String username = fanUsername.Text;
            String password = passValidate.Text;
            String nationalID = nationalValidator.Text;
            String birthDate = dateFan.Text;
            String address = addressValidator.Text;
            bool found = false;
            bool uniqueUser = true;
            int phoneNumber = Int32.Parse(fanPhone.Text);
            SqlCommand addFan = new SqlCommand("addFan", conn);
            addFan.CommandType = System.Data.CommandType.StoredProcedure;
            addFan.Parameters.Add(new SqlParameter("@name", name));
            addFan.Parameters.Add(new SqlParameter("@userName", username));
            addFan.Parameters.Add(new SqlParameter("@password", password));
            addFan.Parameters.Add(new SqlParameter("@nationalID", nationalID));
            addFan.Parameters.Add(new SqlParameter("@birthDate", birthDate));
            addFan.Parameters.Add(new SqlParameter("@address", address));
            addFan.Parameters.Add(new SqlParameter("@phoneNumber", phoneNumber));
            ArrayList nationalIDs = getAllNationalIDs(conn);
            for (int i = 0; i < nationalIDs.Count; i++)
            {
                if (nationalIDs[i].ToString() == nationalID)
                {
                    found = true;
                }
            }
            ArrayList allFans = getAllFans(conn);
            for (int i = 0; i < allFans.Count; i++)
            {
                if (allFans[i].ToString() == username)
                {
                    uniqueUser = false;
                }
            }
            ArrayList allSportMan = getAllAssocManagers(conn);
            for (int i = 0; i < allSportMan.Count; i++)
            {
                if (allSportMan[i].ToString() == username)
                {
                    uniqueUser = false;
                }
            }
            ArrayList allStadMan = getAllStadiumManagers(conn);
            for (int i = 0; i < allStadMan.Count; i++)
            {
                if (allStadMan[i].ToString() == username)
                {
                    uniqueUser = false;
                }
            }
            ArrayList allClubRep = getAllClubRepresentatives(conn);
            for (int i = 0; i < allClubRep.Count; i++)
            {
                if (allClubRep[i].ToString() == username)
                {
                    uniqueUser = false;
                }
            }
            if (!found)
            {
                if (uniqueUser)
                {
                    try
                    {
                        conn.Close();
                        conn.Open();
                        addFan.ExecuteNonQuery();
                        conn.Close();
                        labelResult.Text = "";
                        Response.Redirect("login.aspx");
                    }
                    catch (SqlException ex)
                    {
                        labelResult.Text = "Date is not in the form mm/dd/yyyy";
                    }
                }
                else
                {
                    labelResult.Text = "Username is already taken";
                }
                }
            else
            {
                labelResult.Text = "This National ID already exists !";
            }
        }
    }
}