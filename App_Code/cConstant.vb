Imports Microsoft.VisualBasic

Public Class cConstant

    'SESSION ALIAS =====================================================
    Public Const PROJECT_ID = "PROJECT_ID"
    Public Const MEMBER_ID = "MEMBER_ID"
    Public Const USERNAME = "USERNAME"
    Public Const ROLE = "ROLE"
    Public Const DISCIPLINE = "DISCIPLINE"
    Public Const POID = "POID"
    Public Const SHIPNO = "SHIPNO"
    Public Const BAPNO = "BAPNO"
    Public Const ADMNO = "ADMINNO"
    Public Const CLEARANCE = "CLEARANCEID"

   
    ' MAIL SETUP =======================================================
    Public Const MAIL_HOST As String = "mail.rekayasa.co.id"
    Public Const MAIL_PORT As String = "25"
    Public Const MAIL_FROM_ADDR As String = "admin@rekayasa.co.id"
    Public Const MAIL_USERNAME As String = ""
    Public Const MAIL_PASSWORD As String = ""
    Public Const MAIL_FROM_NAME As String = "CMS :: Notification Service"
    Public Const MAIL_SSL As Boolean = False

    ' PAGE SETTING =====================================================
    Public Const PAGETITLE As String = "Rekind - MASTER (PO)"

    'DOCUMENT NAME =====================================================
    Public Const SAP_PO_TEMPLATE As String = "SAP_PO_TEMPLATE.xls"
    Public Const PO_TEMPLATE As String = "MASTER_PO_TEMPLATE.xls"


    ' FOLDER PATH ======================================================

    Public Const DOCUMENTTEMP As String = "~/Document/Temp/"
    Public Const DOCUMENT As String = "~/Document/"

    Public Const AFIFOLDER As String = "~/Document/{PROJECTCODE}/AFI/"
    Public Const CSPROJECTFOLDER As String = "~/Document/{PROJECTCODE}/CHECKSHEET/"
    Public Const PSPROJECTFOLDER As String = "~/Document/{PROJECTCODE}/PRESERVATION/"
    Public Const TAGFOLDER As String = "~/Document/{PROJECTCODE}/TAG/"
    Public Const PUNCHLISTFOLDER As String = "~/Document/{PROJECTCODE}/PUNCHLIST/"
    Public Const ITPPROJECTFOLDER As String = "~/Document/{PROJECTCODE}/ITP/"
    Public Const CERTIFICATEFOLDER As String = "~/Document/{PROJECTCODE}/CERTIFICATE/"
    Public Const PROJECTLOGOFOLDER As String = "~/Document/{PROJECTCODE}/LOGO/"
    Public Const TAGDOCUMENTFOLDER As String = "~/Document/{PROJECTCODE}/DOCUMENT/"

    Public Const TEMPPROJECTFOLDER As String = "~/Document/{PROJECTCODE}/TEMP/"

    'REPORT CODE =======================================================
    Public Const TAGPOPULATION As String = "R01"
    Public Const TAGINSPECTION As String = "R02"
    Public Const SUMMARY As String = "R03"
    Public Const PUNCHLISTDICIPLINE As String = "R04"
    Public Const PUNCHLISTTAG As String = "R05"
    Public Const PUNCHLISTREPORT As String = "R06"
    Public Const PUNCHLISTDAILY As String = "R07"
    Public Const PUNCHLISTCHART As String = "R08"
    Public Const PUNCHLISTSYSTEM As String = "R09"
    Public Const PUNCHLISTREPORTSYSTEM As String = "R10"
    Public Const rptAFI As String = "R11"
    Public Const CHECKSHEETSUMMARY As String = "R12"
    Public Const MCINDEXREPORT As String = "R13"

    ' URL ==============================================================
    Public Const URLCMS As String = "http://10.9.32.5/cms"

    ' PARAMETER ========================================================
    Public Const MONTHINTERVAL As Integer = -1
    Public Const PO_TEMPLATE_STARTROW As Integer = 7
    Public Const GL_ACCOUNT As String = "510310999"

    'ROLE ==============================================================
    Public Const roleSUPERADMIN As String = "SA"
    Public Const rolePROJECTADMIN As String = "PA"
    Public Const roleAPPLICATIONADMIN As String = "AA"
    Public Const roleUSER = "OP"
    Public Const roleGUEST = "GU"
    Public Const roleCLIENT = "CLIENT"
    Public Const roleCONSTR = "CONSTR"
    Public Const roleQC = "QC"
    Public Const roleSUBC = "SUB"

    'RELEASE BQ STATUS============================================================
    Public Const bqREGISTERED As String = "Registered"
    Public Const bqPROPOSED As String = "Proposed"
    Public Const bqAPPROVED As String = "Approved"
    Public Const bqDECLINED As String = "Declined"
    Public Const bqREADY As String = "Ready"
    Public Const bqRELEASED As String = "Released"
    Public Const bqREVISED As String = "Revised"
    Public Const bqASSIGNED As String = "Assigned"
    Public Const bqINQUIRYSOME As String = "Inquiry Some"
    Public Const bqINQUIRY As String = "Inquiry"
    Public Const bqPOCreated As String = "PO Created"
    Public Const bqPOReleased As String = "PO Released"

    'RELEASE PO STATUS============================================================
    Public Const poREGISTERED As String = "Registered"
    Public Const poPROGRESS As String = "In Progress"
    Public Const poRELEASED As String = "Released"
    Public Const poINPROGRESSEXPEDITING As String = "In Progress Expediting"
    Public Const poEXPEDITINGCOMPLETE As String = "Completed"

    'DATA GROUP =====================================================================
    Public Const dtBQ As String = "BQ"
    Public Const dtMTO As String = "MTO"
    Public Const dtBQMATERIAL As String = "BQMATERIAL"
    Public Const dtINQUIRY As String = "INQUIRY"
    Public Const dtPO As String = "PO"

    'UploadFileSize===============
    Public Const MaxTotalBytesUpload As Int64 = 204800

    'Shipment Status
    Public Const Shipmentsend As String = "Sent"
    Public Const Shipmentdeliver As String = "Delivered"
End Class
