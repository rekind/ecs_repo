Imports System.Data.SqlClient
Imports System.Data

Partial Class Masterpage_MasterPage
    Inherits System.Web.UI.MasterPage
    Dim myconn As New SqlConnection(ConfigurationManager.ConnectionStrings("CS").ConnectionString)
    Dim db As New SIMAMAT_DEVEntities
    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Session(CData.sesUSERID) = "" Then
            Response.Redirect("~/Login.aspx")
        End If
    End Sub

End Class

