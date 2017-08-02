using System;
using System.Collections.Generic;
using System.Linq;
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
using System.Text.RegularExpressions;

public partial class _Default : Page
{

protected void itemSelected(object sender, EventArgs e)
    {

  
    }

    protected void Save_Data()
    {
        var ok = 1;

        Error_Label.Visible = false;
        var Error_Text = "Please Enter:";
        


        Error_Label.Text = Error_Text.TrimEnd(',');


        if (ok == 0)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["QA_Zak_TestConnectionString"].ConnectionString;
            cnn.Open();

            var sql = "";
            sql = sql + "SELECT * FROM premise;";



            SqlCommand cmd2 = new SqlCommand(sql, cnn);
            cmd2.ExecuteNonQuery();

            Response.Redirect("Thankyou.aspx");

        }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {

        //  Save_Data();
    //    GridView1.DataBind();//


    }




    public void HomeRedirect(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx?id=" + Request.QueryString["id"]);
    }
    public void FundingRedirect(object sender,EventArgs e)
    {
        Response.Redirect("Funding.aspx?id=" + Request.QueryString["id"]);
     }

    public void InvoiceRedirect(object sender, EventArgs e)
    {
         Response.Redirect("Invoice.aspx?id=" + Request.QueryString["id"]);
    }
    public void AddressesRedirect(object sender, EventArgs e)
    {
        Response.Redirect("Addresses.aspx?id=" + Request.QueryString["id"]);
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        Param.Text= Request.QueryString["id"];
    }

    protected void Prefer_To_Have_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Name_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Course_TextChanged(object sender, EventArgs e)
    {

    }
}



    

