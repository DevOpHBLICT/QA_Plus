<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
    <label><strong>Abbreviations</strong></label><strong><br />
    </strong>
    <Label><strong>SN:</strong> Subject Knowledge of Trainer</Label><br />
    <Label><strong>DS:</strong> Trainer Delivery Skills</Label><br />
    <label><strong>TS:</strong> Time spent on training</label><br />
    <label><strong>IT:</strong> Instructional Techniques</label><br />
    <label><strong>R:</strong> Rating Standard of training</label><br />
    <br />
      <table align="center">
          <tr>
              <td colspan="3">
                  &nbsp;</td>
              </tr>
          <tr>
<td colspan="3">&nbsp;</td>
          </tr>
          <tr>
<td colspan="3">
                <asp:GridView CssClass="vert1" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="3" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" DataKeyNames="ID">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                        <asp:BoundField DataField="Trainer" HeaderText="Trainer" SortExpression="Trainer" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Other_Trainer" HeaderText="Other_Trainer" SortExpression="Other_Trainer" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Training_Date" HeaderText="Training_Date" SortExpression="Training_Date" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Practice" HeaderText="Practice" SortExpression="Practice" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Subject_Knowledge_Of_Trainer" HeaderText="SN" SortExpression="Subject_Knowledge_Of_Trainer" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Trainer_Delivery_Skills" HeaderText="DS" SortExpression="Trainer_Delivery_Skills" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Time_Spent_On_Training" HeaderText="TS" SortExpression="Time_Spent_On_Training" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Trainers_Instructional_Techniques" HeaderText="IT" SortExpression="Trainers_Instructional_Techniques" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Rating_Standard_Training" HeaderText="R" SortExpression="Rating_Standard_Training" >
                        </asp:BoundField>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
              </td>
          </tr>
          <tr>
<td colspan="3">&nbsp;</td>
          </tr>
          <tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
          </tr>
            </table> 

    <div>
      

    </div>

    <div class="row">
        <div class="col-md-12">
          
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Course], [Trainer], [Other_Trainer], [Training_Date], [Practice], [Subject_Knowledge_Of_Trainer], [Trainer_Delivery_Skills], [Time_Spent_On_Training], [Trainers_Instructional_Techniques], [Rating_Standard_Training], [ID] FROM [Evaluations]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Evaluations] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [Evaluations] ([Course], [Trainer], [Other_Trainer], [Training_Date], [Practice], [Subject_Knowledge_Of_Trainer], [Trainer_Delivery_Skills], [Time_Spent_On_Training], [Trainers_Instructional_Techniques], [Rating_Standard_Training]) VALUES (@Course, @Trainer, @Other_Trainer, @Training_Date, @Practice, @Subject_Knowledge_Of_Trainer, @Trainer_Delivery_Skills, @Time_Spent_On_Training, @Trainers_Instructional_Techniques, @Rating_Standard_Training)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Evaluations] SET [Course] = @Course, [Trainer] = @Trainer, [Other_Trainer] = @Other_Trainer, [Training_Date] = @Training_Date, [Practice] = @Practice, [Subject_Knowledge_Of_Trainer] = @Subject_Knowledge_Of_Trainer, [Trainer_Delivery_Skills] = @Trainer_Delivery_Skills, [Time_Spent_On_Training] = @Time_Spent_On_Training, [Trainers_Instructional_Techniques] = @Trainers_Instructional_Techniques, [Rating_Standard_Training] = @Rating_Standard_Training WHERE [ID] = @original_ID AND (([Course] = @original_Course) OR ([Course] IS NULL AND @original_Course IS NULL)) AND (([Trainer] = @original_Trainer) OR ([Trainer] IS NULL AND @original_Trainer IS NULL)) AND (([Other_Trainer] = @original_Other_Trainer) OR ([Other_Trainer] IS NULL AND @original_Other_Trainer IS NULL)) AND (([Training_Date] = @original_Training_Date) OR ([Training_Date] IS NULL AND @original_Training_Date IS NULL)) AND (([Practice] = @original_Practice) OR ([Practice] IS NULL AND @original_Practice IS NULL)) AND (([Subject_Knowledge_Of_Trainer] = @original_Subject_Knowledge_Of_Trainer) OR ([Subject_Knowledge_Of_Trainer] IS NULL AND @original_Subject_Knowledge_Of_Trainer IS NULL)) AND (([Trainer_Delivery_Skills] = @original_Trainer_Delivery_Skills) OR ([Trainer_Delivery_Skills] IS NULL AND @original_Trainer_Delivery_Skills IS NULL)) AND (([Time_Spent_On_Training] = @original_Time_Spent_On_Training) OR ([Time_Spent_On_Training] IS NULL AND @original_Time_Spent_On_Training IS NULL)) AND (([Trainers_Instructional_Techniques] = @original_Trainers_Instructional_Techniques) OR ([Trainers_Instructional_Techniques] IS NULL AND @original_Trainers_Instructional_Techniques IS NULL)) AND (([Rating_Standard_Training] = @original_Rating_Standard_Training) OR ([Rating_Standard_Training] IS NULL AND @original_Rating_Standard_Training IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_Course" Type="String" />
                        <asp:Parameter Name="original_Trainer" Type="String" />
                        <asp:Parameter Name="original_Other_Trainer" Type="String" />
                        <asp:Parameter Name="original_Training_Date" Type="String" />
                        <asp:Parameter Name="original_Practice" Type="String" />
                        <asp:Parameter Name="original_Subject_Knowledge_Of_Trainer" Type="String" />
                        <asp:Parameter Name="original_Trainer_Delivery_Skills" Type="String" />
                        <asp:Parameter Name="original_Time_Spent_On_Training" Type="String" />
                        <asp:Parameter Name="original_Trainers_Instructional_Techniques" Type="String" />
                        <asp:Parameter Name="original_Rating_Standard_Training" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Course" Type="String" />
                        <asp:Parameter Name="Trainer" Type="String" />
                        <asp:Parameter Name="Other_Trainer" Type="String" />
                        <asp:Parameter Name="Training_Date" Type="String" />
                        <asp:Parameter Name="Practice" Type="String" />
                        <asp:Parameter Name="Subject_Knowledge_Of_Trainer" Type="String" />
                        <asp:Parameter Name="Trainer_Delivery_Skills" Type="String" />
                        <asp:Parameter Name="Time_Spent_On_Training" Type="String" />
                        <asp:Parameter Name="Trainers_Instructional_Techniques" Type="String" />
                        <asp:Parameter Name="Rating_Standard_Training" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Course" Type="String" />
                        <asp:Parameter Name="Trainer" Type="String" />
                        <asp:Parameter Name="Other_Trainer" Type="String" />
                        <asp:Parameter Name="Training_Date" Type="String" />
                        <asp:Parameter Name="Practice" Type="String" />
                        <asp:Parameter Name="Subject_Knowledge_Of_Trainer" Type="String" />
                        <asp:Parameter Name="Trainer_Delivery_Skills" Type="String" />
                        <asp:Parameter Name="Time_Spent_On_Training" Type="String" />
                        <asp:Parameter Name="Trainers_Instructional_Techniques" Type="String" />
                        <asp:Parameter Name="Rating_Standard_Training" Type="String" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_Course" Type="String" />
                        <asp:Parameter Name="original_Trainer" Type="String" />
                        <asp:Parameter Name="original_Other_Trainer" Type="String" />
                        <asp:Parameter Name="original_Training_Date" Type="String" />
                        <asp:Parameter Name="original_Practice" Type="String" />
                        <asp:Parameter Name="original_Subject_Knowledge_Of_Trainer" Type="String" />
                        <asp:Parameter Name="original_Trainer_Delivery_Skills" Type="String" />
                        <asp:Parameter Name="original_Time_Spent_On_Training" Type="String" />
                        <asp:Parameter Name="original_Trainers_Instructional_Techniques" Type="String" />
                        <asp:Parameter Name="original_Rating_Standard_Training" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            

            

        </div>
    </div>

 <table align="center">
     <tr>
         <td>
             &nbsp;</td>
         </tr>
     </table>



</asp:Content>
