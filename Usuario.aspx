 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="ExamenAdriansilloEfraFinal.Usuario" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>
<script runat="server">

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Document</title>
        <style>
            body{
                margin:0;
                text-align: center;
                background: #A1887F;
                color:#F5F5F5;
                font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            }
            
            div.titulo{
                margin: 0;
                line-height: 100px;
                background: #AED581;
                border-width: 10px;
                border-style:groove;
            }
            
            div.titulo h1{
                margin: 0;
            }
            
            div.titulo img{
                width: 100px;
                height: 100px;
                float: left;
                margin-left: 150px;
            }
            
            div.table{
                width:100%;
                display: table;
                height: 465px
            }
            
            div.cell{
                display: table-cell;
                border-width: 7px;
                border-style:groove;
                border-color:#AED581;
                position: relative;
            }
            
            div.cell:nth-child(2){
                width: 80%;
            }
            
            ul{
                list-style: none;
                padding: 0;
            }
            
            li::before{
                content: "★";
            }
            
            div.pie{
                line-height: 70px;
                background: #AED581;
            }
            
            div.pie p{
                margin: 0;
            }
            
            div.cell img{
                margin: 0 auto;
                display: block;
            }
            
            div.cell > table{
                display: inline-block;
            }
            
            div.grid{
                height:200px;
                width:650px;
                border:dashed;
                display: inline-block;
            }
            
            div.menu{
                position: absolute;
                top:0;
            }
            
           div.cell:nth-child(2){
               padding-top:50px;
            }
            
            h1{
                width: 80%;
                margin-left: 800px;
            }
        </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div class="titulo">
          &nbsp;<h1>★ USUARIOS ★</h1>
       </div>
        <div class="table">
            <div class="cell">
            </div>
            <div class="cell">
                <table>
                   <tr>
                        <td>Id Usuario</td>
                        <td><asp:TextBox ID="id" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo necesario" ControlToValidate="id" ValidationGroup="grupoELI"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><asp:TextBox ID="nombre" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo necesario" ControlToValidate="nombre" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Apellido paterno</td>
                        <td><asp:TextBox ID="app" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo necesario" ControlToValidate="app" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Apellido materno</td>
                        <td><asp:TextBox ID="apm" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo necesario" ControlToValidate="apm" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Sucursal</td>
                        <td><asp:DropDownList ID="sucursal" runat="server"></asp:DropDownList></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo necesario" InitialValue=""  ControlToValidate="sucursal" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Alias</td>
                        <td><asp:TextBox ID="alias" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo necesario" ControlToValidate="alias" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Contraseña</td>
                        <td><asp:TextBox ID="pass" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo necesario" ControlToValidate="pass" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
                    </tr>
                </table>
                <div class="grid">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="5" OnPageIndexChanging="OnPageIndexChanging" AutoGenerateSelectButton="True" OnSelectedIndexChanged="SelectNdx"></asp:GridView>
                </div>
                <div class="obciones">
                    <asp:Button ID="buscar" runat="server" Text="buscar" OnClick="buscar_Click" CausesValidation="false"/>
                    <asp:Button ID="agregar" runat="server" Text="agregar" OnClick="agregar_Click" ValidationGroup="grupoAE"/>
                    <asp:Button ID="eliminar" runat="server" Text="eliminar" OnClick="eliminar_Click" ValidationGroup="grupoELI"/>
                    <asp:Button ID="modificar" runat="server" Text="modificar" OnClick="modificar_Click" ValidationGroup="grupoAE"/>
                    <asp:Button ID="limpiar" runat="server" Text="limpiar" OnClick="limpiar_Click" CausesValidation="false"/>
                </div>
                <div class="mensage">
                    <asp:Label ID="mensage" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <div class="pie">
            <p>&nbsp;</p>
        </div>
    </form>
</body>
</html>
