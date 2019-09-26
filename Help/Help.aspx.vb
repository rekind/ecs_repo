
Partial Class Help_Help
    Inherits System.Web.UI.Page
    Protected Sub rgVideoTutor_ItemCommand(sender As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles rgVideoTutor.ItemCommand
        Select Case e.CommandName
            Case "cmdView"
                Dim datakey As String = e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("REF_ID").ToString
                rwVendCodeSAP.NavigateUrl = "~/Help/VideoPlay.aspx?refid=" & datakey
                rwVendCodeSAP.VisibleOnPageLoad = True
        End Select
    End Sub
End Class
