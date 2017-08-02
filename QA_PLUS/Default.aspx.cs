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


    protected void gvMain_SelectedIndexChanged(object sender, System.EventArgs e)
    {
    }


protected void itemSelected(object sender, EventArgs e)
    {

  
    }

    protected void Save_Data()
    {
        var ok = 1;

        Error_Label.Visible = false;
        var Error_Text = "Please Enter:";
        if (Person_Search_Box.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + " Name,"; } else { ok = 0; }
 



        Error_Label.Text = Error_Text.TrimEnd(',');


        if (ok == 0)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["QA_Zak_TestConnectionString"].ConnectionString;
            cnn.Open();

            var sql = "";
            sql = sql + "SELECT person.person_code, person.person_name, person.d_o_b, person.ni_number, person.d_o_d, premise.postcode, premise.name, premise.street, premise.town, person.telephone,person_types.Person_type FROM premise LEFT JOIN person on premise.premcode = person.premcode left join person_types on person.person_type = person_types.Person_type;" + Person_Search_Box.Text;
            


            SqlCommand cmd2 = new SqlCommand(sql, cnn);
            cmd2.ExecuteNonQuery();
   
            Response.Redirect("Thankyou.aspx");

        }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {

        //  Save_Data();
    Persons.DataBind();
  
    }






    protected void Page_Load(object sender, EventArgs e)
    {
          this.gvMain.SelectedIndexChanged += new EventHandler(gvMain_SelectedIndexChanged);

    }
    public void Persons_SelectedIndexChanged(Object sender, EventArgs e)
    {
        // Get the currently selected row using the SelectedRow property.
        GridViewRow row = Persons.SelectedRow;

        var id = row.Cells[1].Text;

        Response.Redirect(string.Format("Addresses.aspx?id={0}", id), true);
        Response.Redirect(string.Format("Funding.aspx?id={0}", id), true);


        // Display the first name from the selected row.
        // In this example, the third column (index 2) contains
        // the first name.
        //    MessageLabel.Text = "You selected " + row.Cells[2].Text + ".";
    }

    protected void TextBox_EndsOn_TextChanged(object sender, EventArgs e)
    {

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

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void Funding_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void event_hide_Click(object sender, EventArgs e)
    {

    }
}
