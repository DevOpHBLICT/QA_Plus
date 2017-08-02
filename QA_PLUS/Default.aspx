
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Site.css" rel="stylesheet" />
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
   
<script>
function OnClick()
{
  if( divCalendar.style.display == "none")
      divCalendar.style.display = "";
  else
    divCalendar.style.display = "none";
}


function CheckTextLength(text, long) {
    var maxlength = new Number(long); // xyz Change number to your max length.
    if (text.value.length > maxlength) {
        text.value = text.value.substring(0, maxlength);
        alert(" Only " + long + " characters allowed");
    }
}

</script>
 
    
      <asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        
    <div id="Entry_Label">
                          <strong>   
                          <br />
                          <br />
                          <br />
                          <br />
                          <br />
&nbsp;&nbsp;   Enter Patients Name or Person Code </strong>
        </div>
        <div id="SearchBox">
            
                        <br />
            
                        <asp:TextBox ID="Person_Search_Box"  Visible="True" Height="35px"  Width="500px"  runat="server"></asp:TextBox>
                  
                </div>                    
       <div id="SearchButton"> 
           <br />
           <br />
           <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:imagebutton ID="Button2" runat="server" ImageUrl="~/images/button.png"  OnClick="Button1_Click"  Text="Search" />
      </div>
           <div id="GridView">       
                   
                   
                              <asp:GridView  ID="gvMain" runat="server"  
                   GridLines="Both" Width="1416px" Font-Size="small"  
                    BorderWidth="1px" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None"  AllowSorting="true" >
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                 <HeaderStyle BackColor= "#0066CC" ForeColor="White"  HorizontalAlign="Center" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" BorderStyle="None" Wrap="False" 
                    ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
               
            </asp:GridView>
                            <asp:GridView ID="Persons"  onselectedindexchanged="Persons_SelectedIndexChanged"  Width="1416px" RowStyle-Height="50px"  runat="server" AutoGenerateColumns="False" DataSourceID="Person" CellPadding="4" ForeColor="#333333" GridLines="Both" AllowSorting="True">
                                <AlternatingRowStyle BackColor="White"   />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True"   />
                                <asp:BoundField DataField="person_code" HeaderText="Person Code" SortExpression="person_code"  />
                                <asp:BoundField DataField="person_name" HeaderText="Person Name" SortExpression="person_name" />
                                <asp:BoundField DataField="d_o_b" HeaderText="Date of Birth" SortExpression="d_o_b"  DataFormatString="{0:d}"/>
                                <asp:BoundField DataField="ni_number" HeaderText="NI Number" SortExpression="ni_number" />
                                <asp:BoundField DataField="d_o_d" HeaderText="Date of Death" SortExpression="d_o_d"  DataFormatString="{0:d}"/>
                                <asp:BoundField DataField="postcode" HeaderText="Postcode" SortExpression="postcode" />
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                <asp:BoundField DataField="street" HeaderText="Street" SortExpression="street" />
                                <asp:BoundField DataField="town" HeaderText="Town" SortExpression="town" />
                                <asp:BoundField DataField="telephone" HeaderText="Tele" SortExpression="telephone" />
                                <asp:BoundField DataField="Person_type" HeaderText="Person Type" SortExpression="Person_type" />
                                <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
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

               </div>
                        <asp:SqlDataSource ID="Person" runat="server" ConnectionString="<%$ ConnectionStrings:QA_Zak_TestConnectionString %>" SelectCommand="SELECT person.person_code, person.person_name, CONVERT(date,person.d_o_b,110) as d_o_b, person.ni_number,CONVERT(date,person.d_o_d,110) as d_o_d, premise.postcode, premise.name, premise.street, premise.town, person.telephone, person_types.Person_type, person.gender FROM person LEFT OUTER JOIN premise ON person.premcode = premise.premcode LEFT OUTER JOIN person_types ON person.person_type = person_types.Person_type WHERE (person.person_code = @person_code) OR (person.person_name LIKE '%' + @person_name + '%')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Person_Search_Box" Name="person_code" PropertyName="Text" />
                                <asp:ControlParameter ControlID="Person_Search_Box" Name="person_name" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
             

        
        
      
   


</asp:Content>
