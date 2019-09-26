<%@ Page Language="VB" MasterPageFile="~/Masterpage/MasterPage.master" AutoEventWireup="false" CodeFile="Upload_Kontrak.aspx.vb" Inherits="Mako_Upload_Kontrak" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width:100%">
        <h3 style="color: #368EE0;">Document Management</h3>
        <telerik:RadGrid runat="server" ID="rgFILE" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="edsFile" CellSpacing="-1" PageSize="50" GroupPanelPosition="Top">
            <MasterTableView DataKeyNames="DOC_ID,PROJECT_ID,DOC_NO,RELATED_DOC,FILE_NAME" DataSourceID="edsFile" ShowHeadersWhenNoRecords="true"
                NoMasterRecordsText="No files" AllowFilteringByColumn="true"
                CommandItemDisplay="Top" EditMode="EditForms" CommandItemSettings-AddNewRecordText="Add New Document">
                <CommandItemSettings AddNewRecordText="Add New Document"></CommandItemSettings>
                <Columns>
                    <telerik:GridBoundColumn DataField="No" FilterControlAltText="Filter No column" HeaderText="No" ReadOnly="True" SortExpression="No" UniqueName="No" AllowFiltering="false"
                        HeaderStyle-Width="3%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DOC_ID" Display="false" FilterControlAltText="Filter DOC_ID column"
                        HeaderText="DOC_ID" ReadOnly="True" SortExpression="DOC_ID" UniqueName="DOC_ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PROJECT_ID" Display="false" FilterControlAltText="Filter PROJECT_ID column"
                        HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" UniqueName="PROJECT_ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FILE_NAME" Display="false" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                        FilterControlAltText="Filter FILE_NAME column" HeaderText="FILE NAME" SortExpression="FILE_NAME" UniqueName="FILE_NAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DOC_NO" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                        FilterControlAltText="Filter DOC_NO column" HeaderText="Document No" SortExpression="DOC_NO"
                        UniqueName="DOC_NO" FilterControlWidth="100%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DOC_NAME" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                        FilterControlAltText="Filter DOC_NAME column" HeaderText="Document Name" SortExpression="DOC_NAME"
                        UniqueName="DOC_NAME" FilterControlWidth="100%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CATEGORY" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                        FilterControlAltText="Filter CATEGORY column" HeaderText="Category" SortExpression="DOC_NAME"
                        UniqueName="CATEGORY" FilterControlWidth="100%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="REVISION" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                        FilterControlAltText="Filter REVISION column" HeaderText="Revision" SortExpression="REVISION" UniqueName="REVISION"
                        FilterControlWidth="100%" HeaderStyle-Width="5%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RELATED_DOC" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                        FilterControlAltText="Filter RELATED_DOC column" HeaderText="Related Document" SortExpression="RELATED_DOC"
                        UniqueName="RELATED_DOC" FilterControlWidth="100%">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PROJECT_SYMBOL" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                        FilterControlAltText="Filter PROJECT_SYMBOL column" HeaderText="Project Symbol" SortExpression="PROJECT_SYMBOL"
                        UniqueName="PROJECT_SYMBOL" HeaderStyle-Width="8%">
                    </telerik:GridBoundColumn>
                    <telerik:GridDateTimeColumn DataField="MODIFIED_DATE" HeaderText="Modified Date" ReadOnly="true" FilterControlWidth="95px" DataFormatString="{0:dd MMMM yyyy }"
                        SortExpression="MODIFIED_DATE" UniqueName="MODIFIED_DATE" PickerType="DatePicker" EnableTimeIndependentFiltering="true"
                        EditDataFormatString="dd MMMM yyyy " HeaderStyle-Width="8%">
                        <ColumnValidationSettings EnableRequiredFieldValidation="true" EnableModelErrorMessageValidation="true">
                            <RequiredFieldValidator ForeColor="Red" ErrorMessage="This field is required"></RequiredFieldValidator>
                            <ModelErrorMessage BackColor="Red" />
                        </ColumnValidationSettings>
                    </telerik:GridDateTimeColumn>
                    <telerik:GridBoundColumn DataField="MODIFIED_BYNAME" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                        FilterControlAltText="Filter MODIFIED_BYNAME column" HeaderText="Modified By" SortExpression="MODIFIED_BYNAME" UniqueName="MODIFIED_BYNAME"
                        HeaderStyle-Width="12%" FilterControlWidth="100%">
                    </telerik:GridBoundColumn>
                    <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="cmdRevise" Text="Revise" HeaderText=""
                        ImageUrl="~/images/revision.png" UniqueName="Revise">
                        <ItemStyle HorizontalAlign="Center" Width="10" />
                        <HeaderStyle HorizontalAlign="Center" Width="10" Font-Bold="true" />
                    </telerik:GridButtonColumn>
                    <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="cmdDownload" Text="Download" HeaderText=""
                        ImageUrl="~/images/download(1).png" UniqueName="Download">
                        <ItemStyle HorizontalAlign="Center" Width="10" />
                        <HeaderStyle HorizontalAlign="Center" Width="10" Font-Bold="true" />
                    </telerik:GridButtonColumn>
                    <telerik:GridEditCommandColumn HeaderStyle-Width="30px" ButtonType="ImageButton" UniqueName="EDIT" HeaderText="">
                        <ItemStyle HorizontalAlign="Center" Width="10" />
                        <HeaderStyle HorizontalAlign="Center" Width="10" Font-Bold="true" />
                    </telerik:GridEditCommandColumn>
                    <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="cmdDelete" Text="Delete" HeaderText="" ConfirmText="Are you sure want to delete this file?"
                        ImageUrl="~/images/delete.png" UniqueName="Delete">
                        <ItemStyle HorizontalAlign="Center" Width="10" />
                        <HeaderStyle HorizontalAlign="Center" Width="10" Font-Bold="true" />
                    </telerik:GridButtonColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <PopUpSettings Modal="true" Width="600px" />
                    <FormTemplate>
                        <table style="width: 100%; border-spacing: 9px;">
                            <tr>
                                <td>Project</td>
                                <td>: </td>
                                <td>
                                    <telerik:RadComboBox ID="rcbproject" runat="server" Filter="Contains" Width="230px" Height="150px"
                                        DataSourceID="DS_Project" DataTextField="PROJECT_NAME" DataValueField="PROJECT_CODE"
                                        SelectedValue='<%#IIf(Session(CData.sesPROJECTID).ToString = "999999", Eval("PROJECT_ID"), Session(CData.sesPROJECTID).ToString)%>'
                                        Enabled='<%# IIf(Session(CData.sesPROJECTID).ToString = "999999", "True", "False")%>'>
                                    </telerik:RadComboBox>
                                    <asp:Label ID="Label2" runat="server" Text="*" ForeColor="#368EE0" Font-Size="Larger"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ForeColor="Red"
                                        ControlToValidate="rcbproject" ValidationGroup="input"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 125px" valign="top">Document Number
                                </td>
                                <td style="width: 1px" valign="top">:
                                </td>
                                <td>
                                    <telerik:RadTextBox ID="rtbdocno" runat="server" Text='<%#Bind("DOC_NO")%> ' Width="230px"
                                        Enabled='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "True", "False")%>'>
                                    </telerik:RadTextBox>
                                    <asp:Label ID="Label1" runat="server" Text="*" ForeColor="#368EE0" Font-Size="Larger"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ForeColor="Red"
                                        ControlToValidate="rtbdocno" ValidationGroup="input"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 125px" valign="top">Document Name
                                </td>
                                <td style="width: 1px" valign="top">:
                                </td>
                                <td>
                                    <telerik:RadTextBox ID="rtbdocname" runat="server" Text='<%#Bind("DOC_NAME")%>' Width="230px">
                                    </telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Document Category</td>
                                <td>: </td>
                                <td>
                                    <telerik:RadComboBox ID="rcbcategory" runat="server" Filter="Contains" Width="230px" Height="80px"
                                        DataSourceID="DS_Category" DataTextField="CATEGORY" DataValueField="ID"
                                        SelectedValue='<%#Bind("DOC_CATEGORY")%>'>
                                        <DefaultItem Text="select" Value="NULL" />
                                    </telerik:RadComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Revision
                                </td>
                                <td>:
                                </td>
                                <td>
                                    <telerik:RadTextBox ID="rtbrev" runat="server" Width="30px" Enabled="false"
                                        Text='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "A", Eval("REVISION"))%>'>
                                    </telerik:RadTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ForeColor="Red"
                                        ControlToValidate="rtbrev" ValidationGroup="input" />
                                </td>
                            </tr>
                            <tr>
                                <td>Related Document</td>
                                <td>: </td>
                                <td>
                                    <telerik:RadComboBox ID="rcbrelated" runat="server" Filter="Contains" Width="230px" Height="150px"
                                        DataSourceID="edsFile" DataTextField="RELATED" DataValueField="DOC_ID"
                                        SelectedValue='<%#Bind("DOC_PARENT_ID")%>'>
                                        <DefaultItem Text="select" Value="NULL" />
                                    </telerik:RadComboBox>

                                </td>
                            </tr>
                            <tr id="tr1" runat="server" visible='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "False", "True")%>'>
                                <td style="width: 125px" valign="top"></td>
                                <td style="width: 1px" valign="top"></td>
                                <td>
                                    <asp:Label ID="lbldocid" runat="server" Text='<%# Bind("DOC_ID")%>' Visible="false" />
                                    <telerik:RadGrid ID="rgAttach" runat="server" Visible="True" AllowMultiRowSelection="True"
                                        OnDeleteCommand="rgAttach_DeleteCommand" AutoGenerateEditColumn="false" AutoGenerateDeleteColumn="true"
                                        DataSourceID="dsAttach" CellSpacing="-1" Width="200px" GroupPanelPosition="Top" Skin="Metro">
                                        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                        <MasterTableView AutoGenerateColumns="False" DataSourceID="dsAttach" DataKeyNames="DOC_ID,PROJECT_ID,FILE_NAME" EditMode="PopUp">
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="DOC_ID" FilterControlAltText="Filter DOC_ID column"
                                                    ItemStyle-Wrap="false" HeaderText="DOC_ID NAME" Display="false"
                                                    SortExpression="DOC_ID" UniqueName="DOC_ID">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PROJECT_ID" FilterControlAltText="Filter PROJECT_ID column"
                                                    ItemStyle-Wrap="false" HeaderText="PROJECT_ID NAME" Display="false"
                                                    SortExpression="PROJECT_ID" UniqueName="PROJECT_ID">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="FILE_NAME" FilterControlAltText="Filter FILE_NAME column"
                                                    ItemStyle-Wrap="false" HeaderText="FILE NAME"
                                                    SortExpression="FILE_NAME" UniqueName="FILE_NAME">
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                            <EditFormSettings EditFormType="Template">
                                                <FormTemplate>
                                                </FormTemplate>
                                            </EditFormSettings>
                                        </MasterTableView>
                                    </telerik:RadGrid>

                                </td>
                            </tr>
                            <tr>
                                <td style="width: 125px" valign="top">Select File
                                </td>
                                <td style="width: 1px" valign="top">:
                                </td>
                                <td>
                                    <telerik:RadAsyncUpload runat="server" ID="fuDocument" MultipleFileSelection="Disabled" MaxFileSize="100000000" Width="100%"
                                        AllowedFileExtensions=".jpeg,.jpg,.png,.doc,.docx,.xls,.xlsx,.pdf,.rar" InitialFileInputsCount="1" MaxFileInputsCount="1">
                                    </telerik:RadAsyncUpload>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <telerik:RadButton ID="btnSave" runat="server" ValidationGroup="input" Text="Save"
                                        CommandName='<%# IIf(DataBinder.Eval(Container, "OwnerTableView.IsItemInserted"), "cmdUpload", "Update")%>'>
                                    </telerik:RadButton>
                                    <telerik:RadButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel">
                                    </telerik:RadButton>
                                </td>
                            </tr>
                        </table>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
            <GroupingSettings CaseSensitive="false" />
        </telerik:RadGrid>
        <asp:SqlDataSource ID="edsFile" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>"
            SelectCommandType="StoredProcedure" SelectCommand="SP_SELECTCONTRACTLIST">
            
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRelated" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>"
            SelectCommandType="StoredProcedure" SelectCommand="SP_SELECTCONTRACTLIST">
            <SelectParameters>
                <asp:SessionParameter Name="PROJECT_ID" SessionField="projid" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsAttach" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>"
            SelectCommand="SELECT [DOC_ID],[PROJECT_ID],[FILE_NAME] FROM [CONTRACTDOCUMENT] WHERE (([DOC_ID] = @DOC_ID) AND ([FILE_NAME] &lt;&gt; @FILE_NAME) AND ([FILE_NAME] IS NOT NULL))">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="DOC_ID" Type="String" />
                <asp:Parameter DefaultValue="NULL" Name="FILE_NAME" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DS_Project" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>"
            SelectCommand="SELECT * FROM [PROJECT]" ProviderName="System.Data.SqlClient">
            <SelectParameters>
                <asp:Parameter DefaultValue="999999" Name="PROJECT_CODE2" Type="String" />
                  
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DS_Category" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>"
            SelectCommand="SELECT * FROM [CONTRACTDOCUMENT_CATEGORY]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
        <cc1:msgBox ID="MsgBox1" runat="server" />
    </div>
</asp:Content>
