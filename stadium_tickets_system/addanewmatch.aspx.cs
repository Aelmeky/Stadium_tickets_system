﻿using System;
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
    public partial class addanewmatch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["userName"] == null)
                Response.Redirect("login.aspx");

            String connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            //DropDownListhost.Items.Clear();
            //DropDownListguest.Items.Clear();
            DataTable up = new DataTable();
            conn.Open();
            new SqlDataAdapter("select * from allCLubs", conn).Fill(up);
            foreach (DataRow row in up.Rows)
            {
                DropDownListhost.Items.Add(new ListItem(row[0].ToString()));
                DropDownListguest.Items.Add(new ListItem(row[0].ToString()));
            }
            conn.Close();
           
        }

        protected void addingmatch_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String host = DropDownListhost.SelectedValue;
            String guest = DropDownListguest.SelectedValue;
           DateTime end = DateTime.Parse(endtime.Value.Replace('T',' '));
           DateTime start = DateTime.Parse(starttime.Value.Replace('T',' '));


            if (start < DateTime.Now || host.Equals(guest))
            {
                Response.Write("cannot add this match please check the data and try again later ");
                if(host.ToString().Equals(guest.ToString()))
                {
                    Response.Write("host club and guest clubs cannot be the same try again!");
                }
                else
                {
                    Response.Write("date entered is incorrect add any date greater than the current date!");
                }
            }
            else {
                SqlCommand addnewmatch_proc = new SqlCommand("addNewMatch", conn);
                addnewmatch_proc.CommandType = CommandType.StoredProcedure;
                addnewmatch_proc.Parameters.Add(new SqlParameter("@host_club_name", host));
                addnewmatch_proc.Parameters.Add(new SqlParameter("@guest_club_name", guest));
                addnewmatch_proc.Parameters.Add(new SqlParameter("@start_time", start));
                addnewmatch_proc.Parameters.Add(new SqlParameter("@end_time", end));
                try
                {
                    conn.Open();
                    addnewmatch_proc.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("addanewmatch.aspx");
                }
                catch(Exception ex)
                {
                    Response.Write(ex.Message);
                }
               
            }
            
        }

        protected void deleteaMatch(object sender, EventArgs e)
        {
            Response.Redirect("deletematch.aspx");
        }

        protected void allupcomingmatches(object sender, EventArgs e)
        {
            Response.Redirect("upcomingmatches.aspx");
        }

        protected void alreadyplayedmatches(object sender, EventArgs e)
        {
            Response.Redirect("alreadyplayed.aspx");
        }

        protected void nevermatched(object sender, EventArgs e)
        {
            Response.Redirect("nevermatched.aspx");
        }
    }
}