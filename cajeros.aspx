<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cajeros.aspx.cs" Inherits="cajeros" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

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
                content: "?";
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
                margin-left:-50px;
                display: inline-block;
            }
            
            div.grid{
                height:200px;
                width:750px;
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
          <img src="usuario.png" alt=""/>
           <h1> CAJEROS </h1>
       </div>
        <div class="table">
            <div class="cell">
              <div class="menu">
               <h3>MENU DEL SISTEMA</h3>
               
              </div>
            </div>
            <div class="cell">
                <table>
                   <tr>
                        <td>Id Cajero</td>
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
                        <td>Foto</td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                      <!--  <td><asp:TextBox ID="foto" runat="server"></asp:TextBox></td> -->
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo necesario" InitialValue=""  ControlToValidate="foto" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Telefono</td>
                        <td><asp:TextBox ID="tel" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo necesario" ControlToValidate="tel" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Direccion</td>
                        <td><asp:TextBox ID="dir" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo necesario" ControlToValidate="dir" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Contrato</td>
                        <td><asp:TextBox ID="contrato" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Campo necesario" ControlToValidate="contrato" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Descanso</td>
                        <td><asp:TextBox ID="descanso" runat="server"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Campo necesario" ControlToValidate="descanso" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>ID_SUCURSAL</td>
                      <td><asp:DropDownList ID="sucursal" runat="server"></asp:DropDownList></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Campo necesario" ControlToValidate="sucursal" ValidationGroup="grupoAE"></asp:RequiredFieldValidator></td>
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
            <p>Derechos reservados efrain hernandez gutierrez 601</p>
        </div>
    </form>
</body>
</html>
