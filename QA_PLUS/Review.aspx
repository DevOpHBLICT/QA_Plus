<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Review.aspx.cs" Inherits="_Default" %>

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
                        <asp:TextBox ID="Review_Search_Box" Visible="false" runat="server"></asp:TextBox> 
                          <asp:Button ID="Button2" runat="server" Visible="false"  OnClick="Button1_Click" CssClass="btn btn-default" Text="Search" />
                    
                    
                    </p>
                    <p class="MsoNormal">
                        &nbsp;</p>
                    <p class="MsoNormal">
                        &nbsp;</p>
                    <p class="MsoNormal">
                        </p>
                    <p class="MsoNormal">
                       

                      &nbsp;<asp:ImageButton runat="server" ImageUrl="~/images/Home.png" Text="Home" id="HomeButton" OnClick="HomeRedirect" />
                    ​    <asp:ImageButton runat="server"  ImageUrl="~/images/Funding_Button.png" Text="Funding" id="Funding_Button" OnClick="FundingRedirect" />
                        <asp:ImageButton runat="server" ImageUrl="~/images/Invoice_button.png" Text="Invoice" id="Invoice_Button" OnClick="InvoiceRedirect" /> 
                       <asp:ImageButton runat="server" ImageUrl="~/images/Events_button.png" Text="Events" id="Event_Button" OnClick="AddressesRedirect" />
<img src="images/Line.png" />
  
                    <p class="MsoNormal">










                        &nbsp;</p>
                    <p class="MsoNormal">
  
                         <strong>Review</strong></p>
                    <asp:GridView ID="Review" runat="server"  AutoGenerateColumns="False" CellPadding="4" DataSourceID="Revieww" ForeColor="#333333" Style="margin-top: 20px;" Width="1600px" RowStyle-Height="50px"  AllowSorting="True"   >
                       
                       

                        <AlternatingRowStyle BackColor="White" />
                        <Columns> 
                            <asp:BoundField DataField="visit_type" HeaderText="Visit Type" SortExpression="visit_type" />
                                        
                            <asp:BoundField DataField="visit_type_desc" HeaderText="Type" SortExpression="visit_type_desc" />
                            <asp:BoundField DataField="ename" HeaderText="Placement" SortExpression="ename" />
                            <asp:BoundField DataField="visit_date" HeaderText="Visit Due Date" ReadOnly="True" SortExpression="visit_date" />
                            <asp:BoundField DataField="inspector_name" HeaderText="Assessor" SortExpression="inspector_name" />
                            <asp:BoundField DataField="scheduled_date" HeaderText="Visit Scheduled Date" ReadOnly="True" SortExpression="scheduled_date" />
                            <asp:BoundField DataField="outcome" HeaderText="Outcome" ReadOnly="True" SortExpression="outcome" />
                            <asp:BoundField DataField="visit_notes" HeaderText="Visit Notes" ReadOnly="True" SortExpression="visit_notes" />
                            <asp:BoundField DataField="event_notes" HeaderText="Event Notes" ReadOnly="True" SortExpression="event_notes" />
                            <asp:BoundField DataField="sched_time" HeaderText="Scheduled Time" SortExpression="sched_time" />
                            <asp:BoundField DataField="arrival_time" HeaderText="Arrival Time" SortExpression="arrival_time" />

             
                        </Columns>
                        <EditRowStyle BackColor="#2461BF"/>
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
                    <asp:SqlDataSource ID="Revieww" runat="server" ConnectionString="<%$ ConnectionStrings:QA_Zak_TestConnectionString %>" SelectCommand="SELECT v.visit_number, v.visit_type, vt.description AS visit_type_desc, v.placement_estcode AS estcode, e.name AS ename, CONVERT (varchar(10), CONVERT (datetime, v.visit_date, 103), 3) AS visit_date, v.inspector_code, pi.person_name AS inspector_name, (CASE WHEN vo.description IS NULL THEN '' ELSE vo.description END) AS outcome, v.afocus, v.acategory, (CASE WHEN completion_date IS NULL THEN 0 ELSE - 1 END) AS comp, s.survey_desc AS NOK, s.survey_id, (CASE WHEN v.paplan = '' OR v.paplan IS NULL THEN 'No' ELSE 'Yes' END) AS attach, v.paplan AS planref, (CASE WHEN vn.text IS NULL THEN 'No' ELSE 'Yes' END) AS visit_notes, '' AS event_notes, (CASE WHEN v.sched_date = '' THEN '' ELSE CONVERT (varchar(10) , CONVERT (datetime , v.sched_date , 103) , 3) END) AS scheduled_date, v.visit_date AS svd, v.sched_time, v.arrival_time, v.record_key FROM visit_header AS v LEFT OUTER JOIN visit_type AS vt ON vt.visit_type = v.visit_type LEFT OUTER JOIN surveys AS s ON s.survey_id = v.questionnaire_code LEFT OUTER JOIN visit_notes AS vn ON vn.visit_number = v.visit_number LEFT OUTER JOIN visit_outcomes AS vo ON vo.outcome_code = v.outcome_code AND vo.delete_flag &lt;&gt; 'Y' LEFT OUTER JOIN client_groups AS cg ON v.afocus = cg.client_group LEFT OUTER JOIN client_subgroups AS csg ON v.afocus = csg.client_group AND v.acategory = csg.sub_group LEFT OUTER JOIN establishment AS e ON v.placement_estcode = e.estcode LEFT OUTER JOIN person AS pi ON v.inspector_code = pi.person_code AND pi.person_type IN ('I', '') LEFT OUTER JOIN person AS p ON v.record_key = p.person_code AND p.delete_flag = 'N' WHERE (p.person_code = @person_code) OR (p.person_name LIKE '%' + @person_name + '%')">
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
                    <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
                    <br />
                    <br />

      </td>  </tr>
                 </table>
        
        
      
    </div>
    <div style="margin-top:50px; background-color:Silver; padding:10px 5px 10px 5px;">
   
    </div>


    </table>


    









                        &nbsp;</p>
                    <p class="MsoNormal">
                       
                        
                        
                        
                         &nbsp;</p>
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
