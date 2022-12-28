using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class StadiumManagerRegisteration : System.Web.UI.Page
    {
        public ArrayList getAllAssocManagers(SqlConnection conn)
        {
            SqlCommand allAssocManagers = new SqlCommand("SELECT * FROM dbo.allAssocManagers", conn);
            ArrayList allUsernames = new ArrayList();
            conn.Open();
            SqlDataReader rdrAssocManagers = allAssocManagers.ExecuteReader();
            while (rdrAssocManagers.Read())
            {
                allUsernames.Add(rdrAssocManagers.GetString(rdrAssocManagers.GetOrdinal("username")));
            }
            conn.Close();
            return allUsernames;
        }
        public ArrayList getAllClubRepresentatives(SqlConnection conn)
        {
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
        public ArrayList getAllStadiumManagers(SqlConnection conn)
        {
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
        protected ArrayList getAllStadiums(SqlConnection conn)
        {
            SqlCommand allStadiums = new SqlCommand("SELECT * FROM dbo.allStadiums", conn);
            ArrayList clubs = new ArrayList();
            try
            {
                conn.Open();
                SqlDataReader rdr = allStadiums.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    clubs.Add(rdr.GetString(rdr.GetOrdinal("name")));
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            return clubs;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String name = ManagerName.Text;
            String stadiumName = StadiumName.Text;
            String username = ManagerUserName.Text;
            String password = passValidate.Text;
            bool found = false;
            SqlCommand addManager = new SqlCommand("addStadiumManager", conn);
            addManager.CommandType = System.Data.CommandType.StoredProcedure;
            addManager.Parameters.Add(new SqlParameter("@name", name));
            addManager.Parameters.Add(new SqlParameter("@stadiumName", stadiumName));
            addManager.Parameters.Add(new SqlParameter("@userName", username));
            addManager.Parameters.Add(new SqlParameter("@password", password));
            ArrayList stadiums = getAllStadiums(conn);
            for (int i = 0; i < stadiums.Count; i++)
            {
                if (stadiums[i].ToString() == stadiumName)
                {
                    found = true;
                }
            }
            bool uniqueUser = true;
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

            if (found)
            {
                if (uniqueUser)
                {
                    try
                    {
                        conn.Open();
                        addManager.ExecuteNonQuery();
                        conn.Close();
                        labelResult.Text = "";
                        Response.Redirect("login.aspx"); 
                    }
                    catch (Exception ex)
                    {
                        labelResult.Text = "Error occured, Please try again later";
                    }
                }
                else
                {
                    labelResult.Text = "Username already registered, Please select another username";
                }
            }
            else
            {
                labelResult.Text = "This Stadium Does not exist !";
            }
        }
    }
}