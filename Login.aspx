<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EXAMEN.Login" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Examen primer parcial</title>
    <style>
        body {
            text-align:center;
            font-family:Rockwell;
            background-color:#eceff1;
        }

        h1 {
            text-shadow:2px 2px 0 rgba(255, 213, 79,.7);
            color:#ff5722;
        }

        .container {
            width:300px;
            margin: 20px auto;
            background:#ffd54f;
            box-shadow:5px 5px 0 0 rgba(255, 87, 34,.7);
            border-radius:10px;
        }

        .container table {
            margin:0 auto;
            padding:10px;
            height: 350px; 
        }

        #user,#pass {
            width:250px;
            height:32px;
            font-size:25px;
            font-weight:bold;
            border:none;
            border-radius:3px;
        }

        #enter {
            font-size:25px;
            font-weight:bolder;
            border:none;
            border-radius:3px;
            background: linear-gradient(#ffab91 50%,#ff7043 0);
            color:#eeeeee;
        }

        .warning {
            margin:20px auto;
            font-size:35px;
            font-weight:bold;
            color:#f44336;
            text-shadow:2px 2px 0 rgba(255, 241, 118,.7);
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <h1>Bienvenidos al login!</h1>
    <div class="container">
        <table>
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
   <asp:RequiredFieldValidator CssClass="warning" ID="RequiredFieldValidator1" runat="server" ErrorMessage="WARNING: Es nesesario un nombre de usuario!!!" ControlToValidate="user"></asp:RequiredFieldValidator><br/>
   <asp:RequiredFieldValidator CssClass="warning" ID="RequiredFieldValidator2" runat="server" ErrorMessage="WARNING: Es nesesario una contraseña!!!" ControlToValidate="pass"></asp:RequiredFieldValidator>
   <div>
       <asp:Label CssClass="warning" ID="noExist" runat="server" Text="WARNING: usuario o contraseña incorrectos!" Visible="false"></asp:Label>
   </div>
   </form>
</body>
</html>
