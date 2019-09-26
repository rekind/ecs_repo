Imports System.Data.SqlClient
Imports System.IO
Imports Telerik.Web.UI

Partial Class Mako_Upload_Kontrak
    Inherits System.Web.UI.Page
    Private db As SIMAMAT_DEVEntities
    Dim trans As SqlTransaction = Nothing
    Dim filename As String = ""
    Dim Mako As New MakoCode
    Dim Info As String = ""
    Dim myConn As New SqlConnection(ConfigurationManager.ConnectionStrings("CS").ConnectionString)
    Public ReadOnly Property DbContext() As SIMAMAT_DEVEntities
        Get
            If db Is Nothing Then
                db = New SIMAMAT_DEVEntities
            End If
            Return db
        End Get
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub
    Private Sub rgFILE_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles rgFILE.ItemCommand
        Select Case e.CommandName
            Case "cmdDownload"
                Dim file As FileInfo = New FileInfo(MapPath("~/_doc/CONTRACT/" & e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("PROJECT_ID") & "/") & e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("FILE_NAME"))
                If file.Exists Then 'set appropriate headers  
                    Response.Clear()
                    Response.BufferOutput = False
                    Response.AddHeader("Content-Disposition", "attachment; filename=" & file.Name)
                    Response.AddHeader("Content-Length", file.Length.ToString())
                    Response.ContentType = "application/octet-stream"
                    Response.Flush()
                    Response.WriteFile(file.FullName)
                    Response.End() 'if file does not exist
                Else
                    MsgBox1.alert("File not exist in the server")
                End If
            Case "cmdUpload"
                Dim vItem As GridEditFormItem = CType(e.Item, GridEditFormItem)
                Dim x As Integer = 1
                If DirectCast(vItem.FindControl("fuDocument"), RadAsyncUpload).UploadedFiles.Count > 0 Then
                    For Each file As UploadedFile In DirectCast(vItem.FindControl("fuDocument"), RadAsyncUpload).UploadedFiles
                        myConn.Open()
                        trans = myConn.BeginTransaction
                        Try
                            System.Threading.Thread.Sleep(1000)
                            filename = DirectCast(vItem.FindControl("rtbdocno"), RadTextBox).Text & "_" & DirectCast(vItem.FindControl("rtbrev"), RadTextBox).Text & file.GetExtension
                            If Mako.upload_contract(DirectCast(vItem.FindControl("rcbproject"), RadComboBox), DirectCast(vItem.FindControl("rtbdocno"), RadTextBox),
                                                    DirectCast(vItem.FindControl("rtbdocname"), RadTextBox), DirectCast(vItem.FindControl("rcbcategory"), RadComboBox),
                                                        DirectCast(vItem.FindControl("rtbrev"), RadTextBox), DirectCast(vItem.FindControl("rcbrelated"), RadComboBox), filename,
                                                    Session(CData.sesUSERID).ToString, Session(CData.sesUSERNAME).ToString) Then
                                If Not (Directory.Exists(Server.MapPath("~/_doc/CONTRACT/" & DirectCast(vItem.FindControl("rcbproject"), RadComboBox).SelectedValue.ToString & "/"))) Then
                                    IO.Directory.CreateDirectory(Server.MapPath("~/_doc/CONTRACT/" & DirectCast(vItem.FindControl("rcbproject"), RadComboBox).SelectedValue.ToString & "/"))
                                End If
                                Dim uploadpath As String = Server.MapPath("~/_doc/CONTRACT/" & DirectCast(vItem.FindControl("rcbproject"), RadComboBox).SelectedValue.ToString & "/") & filename 'fullfilename
                                If IO.File.Exists(uploadpath) Then
                                    IO.File.Delete(uploadpath)
                                    file.SaveAs(uploadpath)
                                Else
                                    file.SaveAs(uploadpath)
                                End If
                                trans.Commit()
                                myConn.Close()
                                Info = filename & " : File was Uploaded"
                            Else
                                Info = filename & " : Error"
                            End If
                            MsgBox1.alert(Info)
                            x = x + 1
                            rgFILE.MasterTableView.IsItemInserted = False
                            rgFILE.MasterTableView.Rebind()
                        Catch ex As IOException
                            MsgBox1.alert("Error uploading file : " & ex.Message)
                            trans.Rollback()
                            myConn.Close()
                        End Try
                    Next
                End If
            Case "cmdDelete"
                myConn.Open()
                trans = myConn.BeginTransaction
                Dim filesname As String = Trim("" & e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("FILE_NAME"))
                delete_file(e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("DOC_ID"), e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("PROJECT_ID"),
                               Trim("" & e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("FILE_NAME")))
                MsgBox1.alert("File " & filesname & " deleted !")
                rgFILE.DataBind()
            Case RadGrid.EditCommandName
                Dim vItem As GridEditableItem = CType(e.Item, GridEditableItem)
                dsAttach.SelectParameters("DOC_ID").DefaultValue = vItem.OwnerTableView.DataKeyValues(vItem.ItemIndex)("DOC_ID").ToString()
            Case "Update"
                Dim vItem As GridEditFormItem = CType(e.Item, GridEditFormItem)
                If DirectCast(vItem.FindControl("fuDocument"), RadAsyncUpload).UploadedFiles.Count > 0 Then
                    For Each file As UploadedFile In CType(vItem.FindControl("fuDocument"), RadAsyncUpload).UploadedFiles
                        myConn.Open()
                        trans = myConn.BeginTransaction
                        Try
                            System.Threading.Thread.Sleep(1000)
                            filename = DirectCast(vItem.FindControl("rtbdocno"), RadTextBox).Text & "_" & DirectCast(vItem.FindControl("rtbrev"), RadTextBox).Text & file.GetExtension
                            If Mako.update_contract(e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("DOC_ID"), DirectCast(vItem.FindControl("rcbproject"), RadComboBox), DirectCast(vItem.FindControl("rtbdocno"), RadTextBox),
                                                    DirectCast(vItem.FindControl("rtbdocname"), RadTextBox), DirectCast(vItem.FindControl("rcbcategory"), RadComboBox),
                                                    DirectCast(vItem.FindControl("rtbrev"), RadTextBox),
                                                    DirectCast(vItem.FindControl("rcbrelated"), RadComboBox), filename,
                                                    Session(CData.sesUSERID).ToString, Session(CData.sesUSERNAME).ToString) Then
                                If Not (Directory.Exists(Server.MapPath("~/_doc/CONTRACT/" & DirectCast(vItem.FindControl("rcbproject"), RadComboBox).SelectedValue.ToString & "/"))) Then
                                    IO.Directory.CreateDirectory(Server.MapPath("~/_doc/CONTRACT/" & DirectCast(vItem.FindControl("rcbproject"), RadComboBox).SelectedValue.ToString & "/"))
                                End If
                                Dim uploadpath As String = Server.MapPath("~/_doc/CONTRACT/" & DirectCast(vItem.FindControl("rcbproject"), RadComboBox).SelectedValue.ToString & "/") & filename 'fullfilename
                                If IO.File.Exists(uploadpath) Then
                                    IO.File.Delete(uploadpath)
                                    file.SaveAs(uploadpath)
                                Else
                                    file.SaveAs(uploadpath)
                                End If
                                trans.Commit()
                                myConn.Close()
                                Info = filename & " : File was Uploaded"
                            Else
                                Info = filename & " : Error"
                            End If
                            MsgBox1.alert(Info)
                            rgFILE.MasterTableView.IsItemInserted = False
                            rgFILE.MasterTableView.Rebind()
                        Catch ex As IOException
                            MsgBox1.alert("Error uploading file : " & ex.Message)
                            trans.Rollback()
                            myConn.Close()
                        End Try
                    Next
                Else
                    filename = ""
                    Mako.update_contract(e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("DOC_ID"), CType(vItem.FindControl("rcbproject"), RadComboBox), CType(vItem.FindControl("rtbdocno"), RadTextBox),
                      CType(vItem.FindControl("rtbdocname"), RadTextBox), DirectCast(vItem.FindControl("rcbcategory"), RadComboBox), CType(vItem.FindControl("rtbrev"), RadTextBox),
                                                    CType(vItem.FindControl("rcbrelated"), RadComboBox), filename,
                                                    Session(CData.sesUSERID).ToString, Session(CData.sesUSERNAME).ToString)
                End If
            Case "cmdRevise"
                Mako.revise_contract(e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("DOC_ID"), Session(CData.sesUSERID).ToString, Session(CData.sesUSERNAME).ToString)
                MsgBox1.alert(e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("DOC_NO") & " Has been revise. Please upload file revision using edit feature.")
                rgFILE.Rebind()
        End Select
    End Sub
    Function delete_file(ByVal doc_id As String, ByVal project_id As String, ByVal filename As String) As Boolean
        Dim files As CONTRACTDOCUMENT = DbContext.CONTRACTDOCUMENTs.Where(Function(p) p.DOC_ID = doc_id).FirstOrDefault
        Try
            DbContext.CONTRACTDOCUMENTs.Remove(files)
            DbContext.SaveChanges()
            db.SP_UPDATECONTRACTPARENT(doc_id)
            Dim filepath As String = Server.MapPath("~/_doc/CONTRACT/" & project_id) & "/" & filename
            If File.Exists(filepath) Then
                Try
                    File.Delete(filepath)
                    trans.Commit()
                    myConn.Close()
                    Return True
                Catch ex As IOException
                    MsgBox1.alert("Error deleting file : " & ex.Message)
                    trans.Rollback()
                    myConn.Close()
                    Return False
                End Try
            Else
                MsgBox1.alert("Error deleting file : File not exist")
                trans.Rollback()
                myConn.Close()
                Return False
            End If
        Catch ex As SqlException
            MsgBox1.alert("Error deleting file : " & ex.Message)
            Return False
        End Try

    End Function
    Protected Sub rgAttach_DeleteCommand(sender As Object, e As GridCommandEventArgs)
        Dim editedItem As GridEditableItem = TryCast(TryCast(sender, RadGrid).NamingContainer, GridEditableItem)
        Dim fname, doc_id, project_id As String
        Dim item As GridEditableItem
        item = e.Item
        fname = item.GetDataKeyValue("FILE_NAME").ToString
        doc_id = item.GetDataKeyValue("DOC_ID").ToString
        project_id = item.GetDataKeyValue("PROJECT_ID").ToString
        DeleteDoc(project_id, fname)
        Mako.deletedocument(doc_id, Session(CData.sesUSERID).ToString, Session(CData.sesUSERNAME).ToString)
    End Sub
    Sub DeleteDoc(ByVal project_id As String, ByVal name As String)
        Dim Dir As String = "~/_doc/CONTRACT/" & project_id & "/"
        System.Threading.Thread.Sleep(1000)
        Dim uploadpath As String = Server.MapPath(Dir) & name
        If IO.File.Exists(uploadpath) Then
            IO.File.Delete(uploadpath)
        End If
    End Sub
End Class
