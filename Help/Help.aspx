<%@ Page Title="" Language="VB" MasterPageFile="~/Masterpage/MasterPage.master" AutoEventWireup="false" CodeFile="Help.aspx.vb" Inherits="Help_Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            var popUp;
            function PopUpShowing(sender, eventArgs) {
                popUp = eventArgs.get_popUp();
                var screenSize = $telerik.getViewPortSize();
                var gridtop = sender.get_element().offsetTop;
                var gridWidth = screenSize.width;
                var gridHeight = screenSize.height;
                var popUpWidth = popUp.style.width.substr(0, popUp.style.width.indexOf("px"));
                var popUpHeight = popUp.style.height.substr(0, popUp.style.height.indexOf("px"));
                popUp.style.left = Math.round(((gridWidth - popUpWidth) / 3 + sender.get_element().offsetLeft)).toString() + "px";
                popUp.style.top = (gridtop - 120).toString() + "px";
            }
        </script>
        <script type="text/javascript">
            function closeRadWindow() {
                var masterTable = $find("<%=rgVideoTutor.ClientID%>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadWindow runat="server" ID="rwVendCodeSAP" Modal="true" Width="700" Height="460" CenterIfModal="true"
        VisibleOnPageLoad="false" EnableViewState="false" OnClientClose="closeRadWindow">
    </telerik:RadWindow>
    <table style="width: 100%">
        <tr>
            <td>
                <div>
                    <h4 style="color: #368EE0; padding-top: 10px;">Manual Guide</h4>
                    <telerik:RadGrid ID="rgManualBook" runat="server" DataSourceID="DS_ManualBook" AutoGenerateColumns="false" AllowFilteringByColumn="False"
                        AllowMultiRowEdit="false" AllowMultiRowSelection="false" AllowPaging="False" Width="80%"
                        MasterTableView-CommandItemSettings-AddNewRecordText="Add">
                        <MasterTableView DataKeyNames="REF_ID" CommandItemDisplay="None">
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="REF_ORDER" HeaderText="No." UniqueName="REF_ORDER">
                                    <HeaderStyle HorizontalAlign="Center" Width="30" />
                                    <ItemStyle HorizontalAlign="Center" Width="30" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="REF_DESCR" HeaderText="Type" UniqueName="REF_DESCR" Display="false">
                                    <HeaderStyle HorizontalAlign="Center" Width="300" />
                                    <ItemStyle HorizontalAlign="Left" Width="300" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="REF_NAME" HeaderText="Title" UniqueName="REF_NAME">
                                    <HeaderStyle HorizontalAlign="Center" Width="800" />
                                    <ItemStyle HorizontalAlign="Left" Width="800" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="REF_CODE" HeaderText="Version" UniqueName="REF_CODE">
                                    <HeaderStyle HorizontalAlign="Center" Width="50" />
                                    <ItemStyle HorizontalAlign="Center" Width="50" />
                                </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn DataField="CREATEDE_DATE" HeaderText="Date" DataFormatString="{0 : dd MMMM yyyy}" UniqueName="REF_CODE">
                                    <HeaderStyle HorizontalAlign="Center" Width="300" />
                                    <ItemStyle HorizontalAlign="Center" Width="300" />
                                </telerik:GridDateTimeColumn>
                                <telerik:GridHyperLinkColumn DataNavigateUrlFields="REF_VALUE" AutoPostBackOnFilter="true"
                                    DataNavigateUrlFormatString="{0}" UniqueName="INQUIRY_NO" CurrentFilterFunction="Contains" Text="Download"
                                    ShowFilterIcon="false" FilterControlWidth="300px" Target="_blank">
                                    <HeaderStyle Width="70px" HorizontalAlign="Center" />
                                    <ItemStyle Width="70px" HorizontalAlign="Center" />
                                </telerik:GridHyperLinkColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <asp:EntityDataSource ID="DS_ManualBook" runat="server" ConnectionString="name=SIMAMAT_DEVEntities" DefaultContainerName="SIMAMAT_DEVEntities"
                        EnableFlattening="False" EntitySetName="DATAREFERENCEs" OrderBy="it.[REF_ORDER]"
                        Where="it.[REF_GROUP] = @REF_GROUP and it.[REF_MODULE] = @REF_MODULE and it.[REF_DESCR] = @REF_DESCR">
                        <WhereParameters>
                            <asp:Parameter Name="REF_GROUP" DefaultValue="HELP" Type="String" />
                            <asp:Parameter Name="REF_MODULE" DefaultValue="GENERAL" Type="String" />
                            <asp:Parameter Name="REF_DESCR" DefaultValue="ManualBook" Type="String" />
                        </WhereParameters>
                    </asp:EntityDataSource>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <h4 style="color: #368EE0; padding-top: 10px;">Video Tutorial</h4>
                    <telerik:RadGrid ID="rgVideoTutor" runat="server" DataSourceID="DS_VideoTutor" AutoGenerateColumns="false" AllowFilteringByColumn="False"
                        AllowMultiRowEdit="false" AllowMultiRowSelection="false" AllowPaging="False" Width="80%"
                        MasterTableView-CommandItemSettings-AddNewRecordText="Add">
                        <MasterTableView DataKeyNames="REF_ID" CommandItemDisplay="None">
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="REF_ORDER" HeaderText="No." UniqueName="REF_ORDER">
                                    <HeaderStyle HorizontalAlign="Center" Width="30" />
                                    <ItemStyle HorizontalAlign="Center" Width="30" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="REF_DESCR" HeaderText="Type" UniqueName="REF_DESCR" Display="false">
                                    <HeaderStyle HorizontalAlign="Center" Width="300" />
                                    <ItemStyle HorizontalAlign="Left" Width="300" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="REF_NAME" HeaderText="Title" UniqueName="REF_NAME">
                                    <HeaderStyle HorizontalAlign="Center" Width="800" />
                                    <ItemStyle HorizontalAlign="Left" Width="800" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="REF_CODE" HeaderText="Version" UniqueName="REF_CODE">
                                    <HeaderStyle HorizontalAlign="Center" Width="50" />
                                    <ItemStyle HorizontalAlign="Center" Width="50" />
                                </telerik:GridBoundColumn>
                                <telerik:GridDateTimeColumn DataField="CREATEDE_DATE" HeaderText="Date" DataFormatString="{0 : dd MMMM yyyy}" UniqueName="REF_CODE">
                                    <HeaderStyle HorizontalAlign="Center" Width="300" />
                                    <ItemStyle HorizontalAlign="Center" Width="300" />
                                </telerik:GridDateTimeColumn>
                                <telerik:GridButtonColumn CommandName="cmdView" Text="watch" UniqueName="View" ButtonType="PushButton"
                                    HeaderStyle-Font-Bold="true" ButtonCssClass="btn btn-primary btn-sm">
                                    <ItemStyle HorizontalAlign="Center" Width="70px" />
                                    <HeaderStyle HorizontalAlign="Center" Width="70" />
                                </telerik:GridButtonColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings>
                            <ClientEvents OnPopUpShowing="PopUpShowing" />
                        </ClientSettings>
                    </telerik:RadGrid>
                    <asp:EntityDataSource ID="DS_VideoTutor" runat="server" ConnectionString="name=SIMAMAT_DEVEntities" DefaultContainerName="SIMAMAT_DEVEntities"
                        EnableFlattening="False" EntitySetName="DATAREFERENCEs" OrderBy="it.[REF_ORDER]"
                        Where="it.[REF_GROUP] = @REF_GROUP and it.[REF_MODULE] = @REF_MODULE and it.[REF_DESCR] = @REF_DESCR">
                        <WhereParameters>
                            <asp:Parameter Name="REF_GROUP" DefaultValue="HELP" Type="String" />
                            <asp:Parameter Name="REF_MODULE" DefaultValue="GENERAL" Type="String" />
                            <asp:Parameter Name="REF_DESCR" DefaultValue="VideoTutorial" Type="String" />
                        </WhereParameters>
                    </asp:EntityDataSource>
                </div>
            </td>
        </tr>        
    </table>
</asp:Content>

