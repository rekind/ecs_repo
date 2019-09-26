<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="images/lconMasterLogo.png" rel="shortcut icon" type="image/x-icon" />
    <title>Material Management System of Rekayasa Industri</title>
    <meta charset="utf8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/themes.css" />
    <script src="js/jquery.min.js"></script>
    <script src="js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/eakroko.js"></script>
    <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
    <link rel="stylesheet" href="SRM/css/responsive.css" />
   </head>
<body class='login'>

    <div class="wrapper">
        <div class="radgridresponsive">
            <h1><a href="LandingPage.aspx">
                <img src="img/logo-big.png" alt="" class='retina-ready' width="59" height="49" />MASTER</a></h1>
        </div>
        <div class="login-body">
            <div>
                <h2>Sign In</h2>
            </div>
            <form id="form1" runat="server">
                <div >
                    <cc1:msgBox ID="MsgBox1" runat="server" />
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <div class="email">
                        <asp:TextBox ID="rtbUserName" runat="server" class='input-block-level' placeholder="NPK Baru" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="pw">
                        <asp:TextBox ID="rtbPassword" runat="server" TextMode="Password" class='input-block-level' placeholder="Password ESS"></asp:TextBox>
                    </div>
                    <div class="submit">
                        <table style="float: right">
                            <tr>
                                <td style="padding-right: 10px;">
                                    <asp:Button ID="btnLogin" runat="server" Text="   Login   " class='btn btn-primary'></asp:Button>
                                </td>
                                <td>
                                    <asp:Button ID="btnRegister" runat="server" Text="Register" class='btn btn-default'></asp:Button>
                                </td>
                            </tr>
                        </table>
                        <telerik:RadNotification ID="RadNotification1" runat="server"></telerik:RadNotification>
                    </div>
                </div>
             </form>
            <div class="radgridresponsive">
                <div class="forget" style="font-weight: bold;">
                    <a href="Page/SubmitEmail.aspx"><span>Forgot password?</span></a>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
