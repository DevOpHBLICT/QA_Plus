<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Addresses.aspx.cs" Inherits="_Default" %>

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
    var maxlength = new Number(long); // asdfasdf Change number to your max length.
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
                        <asp:TextBox ID="Addresses_Search_Box" Visible="false" runat="server"></asp:TextBox> 
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
                      <asp:ImageButton runat="server" ImageUrl="~/images/Event_Notes_button.png" Text="Event_Notes" id="EventButton" OnClick="Event_NotesRedirect" />
                    <asp:ImageButton runat="server" ImageUrl="~/images/Review_Button.png" Text="Review" id="ReviewButton" OnClick="ReviewRedirect" />
                    <img src="images/Line.png" />
  
                    <p class="MsoNormal">










                        &nbsp;</p>
                    <p class="MsoNormal">










                       <strong>Events</strong>
                         <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="1600px" RowStyle-Height="50px"  AllowSorting="True">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                         
                                <asp:BoundField DataField="person_code" HeaderText="Person code" SortExpression="person_code" />
                                <asp:BoundField DataField="event_code" HeaderText="Event Code" SortExpression="event_code" />
                                <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                                <asp:BoundField DataField="event_date"  HeaderText="Event Date" SortExpression="event_date"  DataFormatString="{0:d}"/>
                                <asp:BoundField DataField="comment" HeaderText="Comment" SortExpression="comment" />
                                <asp:BoundField DataField="adate" HeaderText="adate" SortExpression="adate" DataFormatString="{0:d}" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <EmptyDataTemplate>
                            Enter Person Code
                            </EmptyDataTemplate>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QA_Zak_TestConnectionString %>" SelectCommand="SELECT person.person_code, person_events.event_code, event_codes.description, CONVERT(date, person_events.event_date, 110) as event_date , person_events.comment, CONVERT(date,person_events.adate,110) as adate FROM person LEFT OUTER JOIN person_events ON person.person_code = person_events.person_code LEFT OUTER JOIN event_codes ON person_events.event_code = event_codes.event_code WHERE (person.person_code = @person_code) OR (person.person_name LIKE '%' + @person_name + '%')" DeleteCommand="DELETE FROM [person_events] WHERE [person_code] = @person_code AND [event_code] = @event_code AND [event_date] = @event_date AND [sequen] = @sequen" InsertCommand="INSERT INTO [person_events] ([person_code], [event_code], [event_date], [sequen], [comment], [analysis1], [analysis2], [analysis3], [analysis4], [analysis5], [complaint_no], [event_value], [adate], [user_id], [planref], [event_expiry_date], [doc_group], [attachments_editable]) VALUES (@person_code, @event_code, @event_date, @sequen, @comment, @analysis1, @analysis2, @analysis3, @analysis4, @analysis5, @complaint_no, @event_value, @adate, @user_id, @planref, @event_expiry_date, @doc_group, @attachments_editable)" UpdateCommand="UPDATE [person_events] SET [comment] = @comment, [analysis1] = @analysis1, [analysis2] = @analysis2, [analysis3] = @analysis3, [analysis4] = @analysis4, [analysis5] = @analysis5, [complaint_no] = @complaint_no, [event_value] = @event_value, [adate] = @adate, [user_id] = @user_id, [planref] = @planref, [event_expiry_date] = @event_expiry_date, [doc_group] = @doc_group, [attachments_editable] = @attachments_editable WHERE [person_code] = @person_code AND [event_code] = @event_code AND [event_date] = @event_date AND [sequen] = @sequen">
                            <DeleteParameters>
                                <asp:Parameter Name="person_code" Type="String" />
                                <asp:Parameter Name="event_code" Type="String" />
                                <asp:Parameter Name="event_date" Type="String" />
                                <asp:Parameter Name="sequen" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="person_code" Type="String" />
                                <asp:Parameter Name="event_code" Type="String" />
                                <asp:Parameter Name="event_date" Type="String" />
                                <asp:Parameter Name="sequen" Type="Int32" />
                                <asp:Parameter Name="comment" Type="String" />
                                <asp:Parameter Name="analysis1" Type="String" />
                                <asp:Parameter Name="analysis2" Type="String" />
                                <asp:Parameter Name="analysis3" Type="String" />
                                <asp:Parameter Name="analysis4" Type="String" />
                                <asp:Parameter Name="analysis5" Type="String" />
                                <asp:Parameter Name="complaint_no" Type="String" />
                                <asp:Parameter Name="event_value" Type="Single" />
                                <asp:Parameter Name="adate" Type="String" />
                                <asp:Parameter Name="user_id" Type="String" />
                                <asp:Parameter Name="planref" Type="String" />
                                <asp:Parameter Name="event_expiry_date" Type="String" />
                                <asp:Parameter Name="doc_group" Type="String" />
                                <asp:Parameter Name="attachments_editable" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Param" Name="person_code" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="Param" Name="person_name" PropertyName="Text" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="comment" Type="String" />
                                <asp:Parameter Name="analysis1" Type="String" />
                                <asp:Parameter Name="analysis2" Type="String" />
                                <asp:Parameter Name="analysis3" Type="String" />
                                <asp:Parameter Name="analysis4" Type="String" />
                                <asp:Parameter Name="analysis5" Type="String" />
                                <asp:Parameter Name="complaint_no" Type="String" />
                                <asp:Parameter Name="event_value" Type="Single" />
                                <asp:Parameter Name="adate" Type="String" />
                                <asp:Parameter Name="user_id" Type="String" />
                                <asp:Parameter Name="planref" Type="String" />
                                <asp:Parameter Name="event_expiry_date" Type="String" />
                                <asp:Parameter Name="doc_group" Type="String" />
                                <asp:Parameter Name="attachments_editable" Type="String" />
                                <asp:Parameter Name="person_code" Type="String" />
                                <asp:Parameter Name="event_code" Type="String" />
                                <asp:Parameter Name="event_date" Type="String" />
                                <asp:Parameter Name="sequen" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </p>
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
    <div style="margin-top:50px; background-color:Silver; padding:10px 5px 10px 5px;">
   
    </div>


    </table>


    </table>
</asp:Content>
