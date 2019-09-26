Imports Telerik.Web.UI
Imports System.Data.SqlClient

Partial Class Login
    Inherits System.Web.UI.Page
    Private db As SIMAMAT_DEVEntities
    Public ReadOnly Property DbContext() As SIMAMAT_DEVEntities
        Get
            If db Is Nothing Then
                db = New SIMAMAT_DEVEntities
            End If
            Return db
        End Get
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SetFocus("rtbUserName")
        If Not Page.IsPostBack Then
            Session.Abandon()
        End If
    End Sub
    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim sUser = (From u In DbContext.vEMPLOYEEs Where u.EmplId = Trim(rtbUserName.Text) And u.PASS = Trim(rtbPassword.Text))
        If sUser.Count > 0 Then
            '-- SESSION STATE --
            Session(CData.sesUSERID) = sUser.FirstOrDefault.EmplId
            Session(CData.sesUSERNAME) = sUser.FirstOrDefault.Name
            Session(CData.sesUSEREMAIL) = sUser.FirstOrDefault.Email
            Session(CData.sesFULLNAME) = sUser.FirstOrDefault.Name
            Session(CData.sesPROJECTID) = "999999"
            Response.Redirect("Home.aspx")
        Else
            MsgBox1.alert("- wrong username and password combination -")
        End If
    End Sub
    Function getIPAddress() As String
        Dim IPAddress As String = String.Empty
        Dim strIPAddress As String
        'Return strIPAddress
        strIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
        If strIPAddress = "" Or strIPAddress Is Nothing Then
            strIPAddress = Request.ServerVariables("REMOTE_ADDR")
        End If
        Return strIPAddress
    End Function
    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Response.Redirect("Page/Registration.aspx")
    End Sub
End Class
