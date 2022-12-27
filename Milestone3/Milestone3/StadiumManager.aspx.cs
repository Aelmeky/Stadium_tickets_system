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
    public partial class StadiumManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand getStadium = new SqlCommand("getStadium", conn);
            getStadium.CommandType = System.Data.CommandType.StoredProcedure;
            getStadium.Parameters.Add(new SqlParameter("@managerUserName", "jujuju"));
                try
                {

                    conn.Open();
                    SqlDataReader rdr = getStadium.ExecuteReader();
                    rdr.Read();
                label1.Text = rdr["name"].ToString();
                label2.Text = rdr["location"].ToString();
                label3.Text = rdr["Capacity"].ToString();
                if (rdr["status"].ToString() == "True") Label5.Text = "Available";
                else Label5.Text = "Unavailable";
                conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            
        }

        protected void goStadiumInfo(object sender, EventArgs e)
        {
            Response.Redirect("stadiumManager.aspx");
        }

        protected void goHostRequests(object sender, EventArgs e)
        {
            Response.Redirect("HostRequests.aspx");
        }
    }
}