Imports Microsoft.VisualBasic

Imports System.Linq
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Imports System.Net.Mail
Imports System.Configuration.ConfigurationManager
Imports System.IO
Imports System.Data.SqlClient
Imports System.Data
Public Class MakoCode
    Private db As New SIMAMAT_DEVEntities

    Private Function Revise_increment(ByVal mark As String) As String
        'Const ALPHA_BET As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        Dim increment As String = ""
        'Dim intLetter As Integer
        'Dim intNum As Integer
        'intNum = CInt(mark)
        'For intLetter = 1 To Len(ALPHA_BET)
        '    If intLetter = intNum Then
        '        increment = UCase(Mid(ALPHA_BET, intLetter, 1))
        '        Exit For
        '    End If
        'Next


        increment = Chr(Asc(mark) + 1)
        Return increment
    End Function
    Public Function upload_contract(ByVal rcbproject As RadComboBox, ByVal rtbdocno As RadTextBox, ByVal rtbdocname As RadTextBox, ByVal rcbcategory As RadComboBox,
                                    ByVal rtbrev As RadTextBox, ByVal rcbrelated As RadComboBox, ByVal filename As String,
                                    ByVal create_by As String, ByVal create_byname As String) As Boolean
        Dim sFile As New CONTRACTDOCUMENT
        With sFile
            .DOC_ID = System.Guid.NewGuid.ToString()
            .PROJECT_ID = rcbproject.SelectedValue
            .DOC_NO = rtbdocno.Text
            .DOC_NAME = rtbdocname.Text.ToString.ToUpper
            .REVISION = rtbrev.Text.ToString.ToUpper
            If rcbrelated.SelectedValue <> "" And rcbrelated.SelectedValue <> "NULL" Then
                .DOC_PARENT_ID = rcbrelated.SelectedValue
            End If
            .FILE_NAME = filename
            .DOC_CATEGORY = rcbcategory.SelectedValue
            .CURRENT = True
            .CREATED_BY = create_by
            .CREATED_BYNAME = create_byname
            .CREATED_DATE = Now
            .MODIFIED_BY = create_by
            .MODIFIED_BYNAME = create_byname
            .MODIFIED_DATE = Now
        End With
        Try
            db.CONTRACTDOCUMENTs.Add(sFile)
            db.SaveChanges()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function


    Sub revise_contract(ByVal DOC_ID As String, ByVal create_by As String, ByVal create_byname As String)
        Dim doc_id_revise As String = ""
        Dim update As CONTRACTDOCUMENT = db.CONTRACTDOCUMENTs.Where(Function(p) p.DOC_ID = DOC_ID).FirstOrDefault
        With update
            .CURRENT = False
        End With
        db.SaveChanges()
        Dim getdetail = (From a In db.CONTRACTDOCUMENTs Where a.DOC_ID = DOC_ID)
        If getdetail.Count > 0 Then
            doc_id_revise = System.Guid.NewGuid.ToString()
            Dim sFile As New CONTRACTDOCUMENT
            With sFile
                .DOC_ID = doc_id_revise
                .PROJECT_ID = Trim("" & getdetail.FirstOrDefault.PROJECT_ID)
                .DOC_NO = Trim("" & getdetail.FirstOrDefault.DOC_NO)
                .DOC_NAME = Trim("" & getdetail.FirstOrDefault.DOC_NAME)
                .REVISION = Revise_increment(Trim("" & getdetail.FirstOrDefault.REVISION.ToString))
                If getdetail.FirstOrDefault.DOC_PARENT_ID IsNot Nothing Then
                    .DOC_PARENT_ID = Trim("" & getdetail.FirstOrDefault.DOC_PARENT_ID)
                End If
                .DOC_CATEGORY = Trim("" & getdetail.FirstOrDefault.DOC_CATEGORY)
                .CURRENT = True
                .CREATED_BY = Trim("" & getdetail.FirstOrDefault.CREATED_BY)
                .CREATED_BYNAME = Trim("" & getdetail.FirstOrDefault.CREATED_BYNAME)
                .CREATED_DATE = Trim("" & getdetail.FirstOrDefault.CREATED_DATE)
                .MODIFIED_BY = create_by
                .MODIFIED_BYNAME = create_byname
                .MODIFIED_DATE = Now
            End With
            Try
                db.CONTRACTDOCUMENTs.Add(sFile)
                db.SaveChanges()
            Catch ex As Exception
            End Try
            db.SP_UPDATECONTRACTREVISE(DOC_ID, doc_id_revise)
        End If
    End Sub

    Sub deletedocument(ByVal DOC_ID As String, ByVal create_by As String, ByVal create_byname As String)
        Dim update As CONTRACTDOCUMENT = db.CONTRACTDOCUMENTs.Where(Function(p) p.DOC_ID = DOC_ID).FirstOrDefault
        With update
            .FILE_NAME = Nothing
            .MODIFIED_BY = create_by
            .MODIFIED_BYNAME = create_byname
            .MODIFIED_DATE = Now
        End With
        db.SaveChanges()
    End Sub
    Public Function update_contract(ByVal DOC_ID As String, ByVal rcbproject As RadComboBox, ByVal rtbdocno As RadTextBox, ByVal rtbdocname As RadTextBox, ByVal rcbcategory As RadComboBox,
                                    ByVal rtbrev As RadTextBox, ByVal rcbrelated As RadComboBox, ByVal filename As String,
                                    ByVal create_by As String, ByVal create_byname As String) As Boolean
        Dim update As CONTRACTDOCUMENT = db.CONTRACTDOCUMENTs.Where(Function(p) p.DOC_ID = DOC_ID).FirstOrDefault
        With update
            .PROJECT_ID = rcbproject.SelectedValue
            .DOC_NO = rtbdocno.Text
            .DOC_NAME = rtbdocname.Text.ToString.ToUpper
            .REVISION = rtbrev.Text.ToString.ToUpper
            If rcbrelated.SelectedValue <> "" And rcbrelated.SelectedValue <> "NULL" Then
                .DOC_PARENT_ID = rcbrelated.SelectedValue
            End If
            If filename <> "" Then
                .FILE_NAME = filename
            End If
            .DOC_CATEGORY = rcbcategory.SelectedValue
            .MODIFIED_BY = create_by
            .MODIFIED_BYNAME = create_byname
            .MODIFIED_DATE = Now
        End With
        Try
            db.SaveChanges()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function
    Public Sub get_detailcontract(ByVal DOC_ID As String, ByVal lblproject As Label, ByVal lblprojectid As Label, ByVal lbldocno As Label, ByVal lbldocname As Label,
                                   ByVal lblrev As Label, ByVal filename As Label,
                                   ByVal lblmodifdate As Label, ByVal lblmodifby As Label)
        Dim getdetail = (From a In db.CONTRACTDOCUMENTs Where a.DOC_ID = DOC_ID)
        If getdetail.Count > 0 Then
            With getdetail.FirstOrDefault
                lblproject.Text = (From a In db.PROJECTs Where a.PROJECT_CODE = Trim("" & .PROJECT_ID)).FirstOrDefault.PROJECT_NAME.ToString
                lblprojectid.Text = Trim("" & .PROJECT_ID)
                lbldocno.Text = Trim("" & .DOC_NO)
                lbldocname.Text = Trim("" & .DOC_NAME)
                lblrev.Text = Trim("" & .REVISION)
                filename.Text = Trim("" & .FILE_NAME)
                lblmodifdate.Text = Trim("" & .MODIFIED_BYNAME)
                lblmodifby.Text = Trim("" & .MODIFIED_DATE.Value.ToString("dd-MMMM-yyyy"))
            End With
        End If
    End Sub
End Class
