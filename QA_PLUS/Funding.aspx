<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Funding.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
    <link href="~/Content/themes/site.css" rel="stylesheet" />
     <link href="/Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="/Scripts/jquery.ui.all.css">
    <link rel="stylesheet" href="/Scripts/jquery.ui.all.css">
		<script src="/Scripts/jquery.ui.core.js"></script>
	<script src="/Scripts/jquery.ui.widget.js"></script>
	<script src="/Scripts/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="/Scripts/demos.css">

      <script src="datepicker.js" type="text/javascript"></script>

       <script src="datepicker.js" type="text/javascript"></script>
       <script src="datepicker.min.js" type="text/javascript"></script>
        <style>
           td.opt1 { text-align:center; vertical-align:middle; }

            .btn-default {}

            a:link
	{color:blue;
	text-decoration:underline;
	text-underline:single;
            }
            
            </style>
<script>
function OnClick()
{
  if( divCalendar.style.display == "none")
      divCalendar.style.display = "";
  else
    divCalendar.style.display = "none";
}


function CheckTextLength(text, long) {
    var maxlength = new Number(long); // Change number to your max length.
    if (text.value.length > maxlength) {
        text.value = text.value.substring(0, maxlength);
        alert(" Only " + long + " characters allowed");
    }
}

</script>




          <asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="False"></asp:Label>
<table align="center"  style="height: 55px;width:780px; " >
            <tr>
                <td style="height: 55px; color: #336699; text-align: left;" class="wrapper" >
                    <p class="MsoNormal">
                        <asp:TextBox ID="Funding_Search_Box" Visible="false" runat="server"></asp:TextBox> 
                          <asp:Button ID="Button2" runat="server" Visible="false"  OnClick="Button1_Click" CssClass="btn btn-default" Text="Search" />
                    </p>
                    <p class="MsoNormal">
                        &nbsp;</p>
                    <p class="MsoNormal">
                        &nbsp;</p>
                    <p class="MsoNormal">
                        


                        <asp:ImageButton runat="server" ImageUrl="~/images/Home.png" ImageAlign="Middle" Text="Home" id="HomeButton" OnClick="HomeRedirect" />
                         <asp:ImageButton runat="server" ImageUrl="~/images/Events_button.png" ImageAlign="Middle" Text="Events" id="Event_Button" OnClick="EventRedirect" />
                        <asp:ImageButton runat="server" ImageUrl="~/images/Invoice_button.png" ImageAlign="Middle" Text="Invoice" id="Invoice_Button" OnClick="InvoiceRedirect" />
                          <asp:ImageButton runat="server" ImageUrl="~/images/Review_Button.png" ImageAlign="Middle" Text="Review" id="ReviewButton" OnClick="ReviewRedirect" />
                        <img src="images/Line.png" />
  
                    ​

  
                    <p class="MsoNormal">
                        &nbsp;</p>
                    <p class="MsoNormal">
                       
                        
                        
                        
                         <strong>Funding</strong></p>
                    <asp:GridView ID="Funding" runat="server"  AutoGenerateColumns="False" CellPadding="4" DataSourceID="Fundings" ForeColor="#333333" Style="margin-top: 20px;" Width="1600px" RowStyle-Height="50px"  AllowSorting="True"   >
                       
                       

                        <AlternatingRowStyle BackColor="White" />
                        <Columns> 
                            <asp:BoundField DataField="person_code" HeaderText="Person Code" SortExpression="person_code" /> 

                            <asp:BoundField DataField="name" HeaderText="PAYEE" SortExpression="name" />

             
                            <asp:BoundField DataField="estcode" HeaderText="Est Code" SortExpression="estcode"></asp:BoundField>
                            <asp:BoundField DataField="service_code" HeaderText="Service Code" SortExpression="service_code"></asp:BoundField>

             
                            <asp:BoundField DataField="service_charge" HeaderText="Service Charge" SortExpression="service_charge" />

                            <asp:BoundField DataField="sdate" HeaderText="Start Date" SortExpression="sdate" ReadOnly="True" DataFormatString="{0:d}" />

                            <asp:BoundField DataField="edate" HeaderText="End Date" SortExpression="edate" ReadOnly="True" DataFormatString="{0:d}"  />

                            <asp:BoundField DataField="ddate" HeaderText="Death/Discharge Date" SortExpression="ddate"   HeaderStyle-Width="300px" DataFormatString="{0:d}">

<HeaderStyle Width="150px"></HeaderStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="self_bill" HeaderText="Self Bill" SortExpression="self_bill">
                            </asp:BoundField>

                            <asp:BoundField DataField="ctext" HeaderText="Comment" SortExpression="ctext"   HeaderStyle-Width="300px">

             
<HeaderStyle Width="300px"></HeaderStyle>
                            </asp:BoundField>

             
                        </Columns> 
                        <EditRowStyle BackColor="#2461BF"/>
                        <FooterStyle BackColor="#507CD1"  Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="Fundings" runat="server" ConnectionString="<%$ ConnectionStrings:QA_Zak_TestConnectionString %>" SelectCommand="SELECT person.person_code, df_services_provided.stage, df_services_provided.estcode, df_services_provided.service_code, df_services_provided.service_charge, CONVERT (date, df_services_provided.sdate, 110) AS sdate, CONVERT (date, df_services_provided.edate, 110) AS edate, df_services_provided.afocus, df_services_provided.acategory, df_services_provided.pcov, CONVERT (date, df_services_provided.rdate, 110) AS rdate, CONVERT (date, df_services_provided.adate, 110) AS adate, CONVERT (date, df_services_provided.ddate, 110) AS ddate, df_services_provided.ctext, df_services_provided.self_bill, establishment.name FROM df_services_provided LEFT OUTER JOIN person ON df_services_provided.person_code = person.person_code LEFT OUTER JOIN establishment ON df_services_provided.estcode = establishment.estcode WHERE (person.person_code = @person_code) OR (person.person_name LIKE '%' + @person_name + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Param" Name="person_code" PropertyName="Text" />
                            <asp:ControlParameter ControlID="Param" Name="person_name" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:TextBox ID="Param" runat="server" Visible="false"></asp:TextBox>
                    <br />
                    <br />

      </td>  </tr>
                 </table>
        
        
      
    </div>
    <div style="margin-top:50px; background-color:white; padding:10px 5px 10px 5px;">
   
    </div>


    </table>


    </table>
</asp:Content>
