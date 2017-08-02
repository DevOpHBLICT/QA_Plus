<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Administrator.aspx.cs" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
      <table align="center">
          <tr>
              <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Trainer" HeaderText="Trainer" SortExpression="Trainer" />
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
                  </td>
              </tr>
          <tr>
<td colspan="3">&nbsp;</td>
          </tr>
          <tr>
<td colspan="3">Do not delete trainer &#39;other&#39;</td>
          </tr>
          <tr>
<td colspan="3">&nbsp;</td>
          </tr>
          <tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><asp:LinkButton ID="lbtnAdd" runat="server" onclick="lbtnAdd_Click" style="background-color: #003366; text-align: center;">AddNew</asp:LinkButton> </td>
          </tr>
            </table> 

    <div>
      

    </div>

    <div class="row">
        <div class="col-md-12">
          
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Trainer]" DeleteCommand="DELETE FROM [Trainer] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Trainer] ([Trainer]) VALUES (@Trainer)" UpdateCommand="UPDATE [Trainer] SET [Trainer] = @Trainer WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Trainer" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Trainer" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            

            

        </div>
    </div>

 <table align="center">
     <tr>
         <td>
<asp:Panel ID="pnlAdd" runat="server" Visible="False"> 
    Add New Trainer: 
    <asp:TextBox ID="Trainer" runat="server"></asp:TextBox> 
     <br />
     <br />
    <asp:LinkButton ID="lbtnSubmit" runat="server" onclick="lbtnSubmit_Click" style="background-color: #336699">Submit</asp:LinkButton> 
        
    <br />
        <br />
</asp:Panel> 
             </td>
         </tr>
     </table>



</asp:Content>
