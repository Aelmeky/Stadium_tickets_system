﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class HostRequests : System.Web.UI.Page
    {

        protected void handleRequest(String command, SqlConnection conn, String hostName, String guestName, DateTime startTime, String status)
        {
            if (status == "unhandled")
            {
                SqlCommand acceptReq = new SqlCommand(command, conn);
                acceptReq.CommandType = System.Data.CommandType.StoredProcedure;
                acceptReq.Parameters.Add(new SqlParameter("@userName", Session["userName"]));
                acceptReq.Parameters.Add(new SqlParameter("@hostName", hostName));
                acceptReq.Parameters.Add(new SqlParameter("@guestName", guestName));
                acceptReq.Parameters.Add(new SqlParameter("@startTime", startTime));
                conn.Open();
                acceptReq.ExecuteNonQuery();
                conn.Close();

                if (command == "acceptRequest")
                {
                    SqlCommand getStadium = new SqlCommand("getStadium", conn);
                    getStadium.CommandType = System.Data.CommandType.StoredProcedure;
                    getStadium.Parameters.Add(new SqlParameter("@managerUserName", Session["userName"]));
                    conn.Open();
                    SqlDataReader rdr = getStadium.ExecuteReader();
                    
                    rdr.Read();
                    int cap =  rdr.GetInt32(rdr.GetOrdinal("Capacity"));

                    conn.Close();
                    for (int i = 0; i < cap; i++) {
                        SqlCommand addTicket = new SqlCommand("addTicket", conn);
                        addTicket.CommandType = System.Data.CommandType.StoredProcedure;
                        addTicket.Parameters.Add(new SqlParameter("@host_club", hostName));
                        addTicket.Parameters.Add(new SqlParameter("@guest_club", guestName));
                        addTicket.Parameters.Add(new SqlParameter("@start", startTime));

                        conn.Open();
                        addTicket.ExecuteNonQuery();
                        conn.Close();
                    }
                    

                }

            }
            else
            {
                message.Text = "You already handled this request";
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
        protected List<ArrayList> getAllHostRequests(SqlConnection conn)
        {

            List<ArrayList> hostRequests = new List<ArrayList>();
            SqlCommand command = new SqlCommand("SELECT * FROM dbo.allRequests", conn);
            conn.Open();
            SqlDataReader rdrHostRequests = command.ExecuteReader();
            while (rdrHostRequests.Read())
            {
                String clubRep = rdrHostRequests.GetString(rdrHostRequests.GetOrdinal("club_representative_username"));
                String host = rdrHostRequests.GetString(rdrHostRequests.GetOrdinal("host"));
                String guest = rdrHostRequests.GetString(rdrHostRequests.GetOrdinal("guest"));
                String startTime = rdrHostRequests.GetDateTime(rdrHostRequests.GetOrdinal("startTim")).ToString();
                String endTime = rdrHostRequests.GetDateTime(rdrHostRequests.GetOrdinal("endTime")).ToString();
                String status = rdrHostRequests.GetString(rdrHostRequests.GetOrdinal("status"));
                String stadiumManager = rdrHostRequests.GetString(rdrHostRequests.GetOrdinal("stadium_manager_username"));
                ArrayList hostReq = new ArrayList();

                if (stadiumManager == Session["userName"].ToString())
                {
                    hostReq.Add(clubRep); hostReq.Add(host); hostReq.Add(guest); hostReq.Add(status); hostReq.Add(startTime); hostReq.Add(endTime);
                    hostRequests.Add(hostReq);
                }
            }
            conn.Close();
            return hostRequests;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session == null || Session["userName"] == null)
            { 
                Response.Redirect("login.aspx");
            }
            else
            {
                string connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                List<ArrayList> allHostRequests = getAllHostRequests(conn);

                for (int i = 0; i < allHostRequests.Count; i++)
                {

                    var item = allHostRequests.ElementAt(i);
                    String request = "From:" + item[0] + " Host:" + item[1] + " Guest:" + item[2] + " Status:" + item[3] + " StartTime:" + item[4] + " EndTime:" + item[5];
                    myRequests.Items.Add(request);

                }
                if(myRequests.Items.Count==0) myRequests.Visible=false;
                else myRequests.Visible=true;

                foreach (ListItem item in myRequests.Items)
                {
                    item.Attributes.CssStyle.Add("padding", "20px");
                }
            }
        }
        protected void Accept_btn(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int idx = myRequests.SelectedIndex;
            if (idx != -1)
            {
                List<ArrayList> requests = getAllHostRequests(conn);
                String host = requests.ElementAt(idx)[1].ToString();
                String guest = requests.ElementAt(idx)[2].ToString();
                DateTime startTime = Convert.ToDateTime((requests.ElementAt(idx)[4]).ToString());
                String status = requests.ElementAt(idx)[3].ToString();
                handleRequest("acceptRequest", conn, host, guest, startTime, status);
            }

            Response.Redirect("HostRequests.aspx");

        }
        protected void Reject_btn(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int idx = myRequests.SelectedIndex;
            if (idx != -1)
            {
                List<ArrayList> requests = getAllHostRequests(conn);
                String host = requests.ElementAt(idx)[1].ToString();
                String guest = requests.ElementAt(idx)[2].ToString();
                DateTime startTime = Convert.ToDateTime((requests.ElementAt(idx)[4]).ToString());
                String status = requests.ElementAt(idx)[3].ToString();
                handleRequest("rejectRequest", conn, host, guest, startTime, status);
            }

            
            Response.Redirect("HostRequests.aspx");
        }
    }
}