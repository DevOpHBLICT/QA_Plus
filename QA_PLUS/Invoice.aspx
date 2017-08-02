<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="_Default" %>

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
                        
                        <asp:ImageButton runat="server" ImageUrl="~/images/Home.png" Text="Home" id="HomeButton" OnClick="HomeRedirect" />
                         <asp:ImageButton runat="server" ImageUrl="~/images/Events_button.png" Text="Events" id="Event_Button" OnClick="EventRedirect" />
                         <asp:ImageButton runat="server" ImageUrl="~/images/Funding_Button.png" Text="Funding" id="Funding_Button" OnClick="FundingRedirect" />
                        <asp:ImageButton runat="server" ImageUrl="~/images/Review_Button.png" Text="Review" id="ReviewButton" OnClick="ReviewRedirect" />
                   <img src="images/Line.png" />


                    <p class="MsoNormal">
                        &nbsp;</p>
                    <p class="MsoNormal">
                       
                        
                        
                        
                        
                    <br />
                    <strong>Invoice</strong><br />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333"  Width="1600px" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="person_code" HeaderText="Person Code" SortExpression="person_code" />
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                            <asp:BoundField DataField="estcode" HeaderText="EstCode" SortExpression="estcode" />
                            <asp:BoundField DataField="inumber" HeaderText="iNumber" SortExpression="inumber" />
                            <asp:BoundField DataField="amountc" HeaderText="Amount" SortExpression="amountc" />
                            <asp:BoundField DataField="app_by" HeaderText="App By" SortExpression="app_by" />
                            <asp:BoundField DataField="with_error" HeaderText="With Error" SortExpression="with_error" />
                            <asp:BoundField DataField="period_from" HeaderText="Period From"  SortExpression="period_from" ReadOnly="True" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="period_to" HeaderText="Period To" SortExpression="period_to" ReadOnly="True"  DataFormatString="{0:d}" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QA_Zak_TestConnectionString %>" SelectCommand="SELECT person.person_code, df_invoice_patients.estcode, df_invoice_patients.inumber, df_invoice_patients.amountc, df_invoice_patients.app_by, df_invoice_patients.with_error, CONVERT (date, df_invoice_patients.period_from, 110) AS period_from, CONVERT (date, df_invoice_patients.period_to, 110) AS period_to, establishment.name FROM df_invoice_patients LEFT OUTER JOIN person ON df_invoice_patients.person_code = person.person_code LEFT OUTER JOIN establishment ON df_invoice_patients.estcode = establishment.estcode WHERE (person.person_code = @person_code) OR (person.person_name LIKE '%' + @person_name + '%')">
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
