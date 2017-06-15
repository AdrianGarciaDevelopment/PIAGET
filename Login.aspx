<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login"  UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>LOGIN</title>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body class="body_1">
    <form id="form1" runat="server">
   <h1 class="tituloPrincipal_1">!Bienvenidos al login!</h1>
    <div class="divCentrado_1">
        <table class="alineacionTable_1">
            <tr>
                <td><asp:TextBox ID="user" placeholder="Usuario" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:TextBox ID="pass" placeholder="Contraseña" TextMode="Password" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Button ID="enter" runat="server" Text="Entrar" OnClick="enter_Click" /></td>
            </tr>
        </table>
    </div>
   <asp:RequiredFieldValidator  ID="RequiredFieldValidator1" runat="server" ErrorMessage="WARNING: Es nesesario un nombre de usuario!!!" ControlToValidate="user"></asp:RequiredFieldValidator><br/>
   <asp:RequiredFieldValidator  ID="RequiredFieldValidator2" runat="server" ErrorMessage="WARNING: Es nesesario una contraseña!!!" ControlToValidate="pass"></asp:RequiredFieldValidator>
   <div>
       <asp:Label ID="noExist" runat="server" Text="WARNING: usuario o contraseña incorrectos!" Visible="false"></asp:Label>
   </div>
   </form>
</body>
</html>