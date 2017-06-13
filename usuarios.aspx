<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usuarios.aspx.cs" Inherits="usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
            body{
                margin:0;
                text-align: center;
                background:;
                color:;
                font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
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
                height: 465px;
            }
            
            div.cell{
                display: table-cell;
                border-width: 7px;
                border-style:groove;
                border-color:;
                position: relative;
                margin:auto;
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

            }
            
            div.cell > table{
                display: inline-block;
            }
            
            div.grid{
                height:200px;
                width:49%;
                display: inline-block;
                float:right;
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
        .auto-style2 {
            height: 204px;
            width: 437px;
        }
        .auto-style3 {
            width: 100%;
        }
        .titulo{
            color:sandybrown;
        }
        .auto-style4 {
            height: 89px;
        }
        .auto-style5 {
            float: left;
            height: 225px;
            width: 48%;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="titulo">
          &nbsp;<h1 class="auto-style3">★ USUARIOS ★</h1>
          <p class="auto-style3" style="background:aqua">&nbsp;</p>
       </div>
        <div class="table" style="height: 255px;">
            <div class="cell" style="left: 0px; top: 0px; height: 234px; width: 1092px;">
                <div class="auto-style5" ">
                <center>
                <table class="auto-style1" style="color: black">
                   <tr>
                        <td>
                    <br />
                    Id Usuario</td>
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
                    </center>
                </div>
                <div class="grid" style="height: 223px; width:49%; margin-left: 0px; margin-right: 38px;">
                    <center class="auto-style2">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="5" OnPageIndexChanging="OnPageIndexChanging" AutoGenerateSelectButton="True" OnSelectedIndexChanged="SelectNdx" CellPadding="4" ForeColor="#333333" GridLines="None" Width="433px">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </center>
               </div>

                
            </div>
            </div>
                <div class="auto-style4" style="background:aqua">
                    <p></p>
                    <asp:Button ID="buscar" runat="server" Text="Buscar" OnClick="buscar_Click" CausesValidation="false"/>
                    <asp:Button ID="agregar" runat="server" Text="Agregar" OnClick="agregar_Click" ValidationGroup="grupoAE"/>
                    <asp:Button ID="eliminar" runat="server" Text="Eliminar" OnClick="eliminar_Click" ValidationGroup="grupoELI"/>
                    <asp:Button ID="modificar" runat="server" Text="Modificar" OnClick="modificar_Click" ValidationGroup="grupoAE"/>
                    <asp:Button ID="limpiar" runat="server" Text="Limpiar" OnClick="limpiar_Click" CausesValidation="false"/>
                   
                </div>
            <div class="auto-style6">
                    <br />
                    <asp:Label ID="mensage" runat="server" Text=""></asp:Label>
                    <br />
                    <br />
                    <br />
                </div>
        
    </form>
</body>
</html>

