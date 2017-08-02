using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using WebSite6;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Collections;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Text;
using System.Net.Mime;



public partial class Account_Manage : System.Web.UI.Page
{
    protected void lbtnAdd_Click(object sender, EventArgs e)
    {
        // Hide the Add button and showing Add panel. 
        lbtnAdd.Visible = false;
        pnlAdd.Visible = true;
    }


    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalityConn"].ToString()))
        {
            // Create a command object. 
            SqlCommand cmd = new SqlCommand();


            // Assign the connection to the command. 
            cmd.Connection = conn;


            // Set the command text 
            // SQL statement or the name of the stored procedure  
            cmd.CommandText = "INSERT INTO Trainer ( Trainer ) VALUES ( @Trainer )";


            // Set the command type 
            // CommandType.Text for ordinary SQL statements;  
            // CommandType.StoredProcedure for stored procedures. 
            cmd.CommandType = CommandType.Text;


            // Append the parameters. 
            cmd.Parameters.Add("@Trainer", SqlDbType.NVarChar, 50).Value = Trainer.Text;
      


            // Open the connection. 
            conn.Open();


            // Execute the command. 
            cmd.ExecuteNonQuery();
        }


        // Rebind the GridView control to show inserted data. 
        BindGridView();


        // Empty the TextBox controls. 
        Trainer.Text = "";
      


        // Show the Add button and hiding the Add panel. 
        lbtnAdd.Visible = true;
        pnlAdd.Visible = false;
    }
    private void BindGridView()
    {
        GridView1.DataBind();
    } 


    protected void lbtnCancel_Click(object sender, EventArgs e)
    {
        // Empty the TextBox controls. 
        Trainer.Text = "";
 


        // Show the Add button and hiding the Add panel. 
        lbtnAdd.Visible = true;
        pnlAdd.Visible = false;
    } 
 

   

    

    protected void Page_Load()
    {
        
    }








    protected void Page_Load(object sender, EventArgs e)
    {
            }
}