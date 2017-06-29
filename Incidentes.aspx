
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Incidentes.aspx.cs" Inherits="Incidentes" %>

<!DOCTYPE html>




<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
            <link rel="stylesheet" type="text/css" href="misestilos.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {
            width: 143px;
            height: 40px;
        }
        .auto-style3 {
            height: 40px;
            width: 218px;
        }
        .auto-style8 {
        }
        .auto-style9 {
            width: 218px;
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
        <div class="divCentrado">
            <p class="titulo1"></p>
            <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#7C6F57" Orientation="Horizontal" StaticSubMenuIndent="10px">
                <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#F7F6F3" />
                <DynamicSelectedStyle BackColor="#5D7B9D" />
                <Items>
                    <asp:MenuItem NavigateUrl="~/Cajeros.aspx" Text="Cajeros" Value="Cajeros"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/InsercionUsuario.aspx" Text="Usuarios" Value="Usuarios"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Sucursal.aspx" Text="Sucursal" Value="Sucursal"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="Incidentes.aspx" Text="Incidentes" Value="Incidentes"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="asignacion.aspx" Text="Asignacion" Value="Asignacion"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#5D7B9D" />
            </asp:Menu>
        </div>
        <div class="divCentrado" style="width:400px;margin-left:auto;margin-right:auto">
    
            <table style="width:89%;">

                <tr>
                    <td class="auto-style6">ID Incidente</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="tb_id" runat="server" Width="55px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Fecha"></asp:Label>
                    </td>
                    <td>
                        <asp:Calendar ID="c_fecha" runat="server" Height="151px" Width="130px" OnSelectionChanged="c_fecha_SelectionChanged" ></asp:Calendar>
                    </td>

                </tr>


  
                <tr>
                    <td class="auto-style2">Monto</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Informacion</td>
                    <td class="auto-style9">
                    <asp:TextBox ID="TextBox2" runat="server" Height="16px" Width="199px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Cajero</td>
                    <td class="auto-style9">
                        <asp:DropDownList ID="dd_Cajero" runat="server" Height="19px" Width="189px" OnSelectedIndexChanged="Page_Load">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr><td>Sucursal</td><td>
                        <asp:DropDownList ID="ddl_sucursales" runat="server" Height="25px" Width="190px" OnSelectedIndexChanged="Page_Load">
                        </asp:DropDownList>
                    </td></tr>
                <tr>
                    <td class="auto-style8" colspan="2" style="text-align:center">
                        <asp:Label ID="Error" runat="server" style="text-align: center" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2" style="text-align:center">
                        <asp:ImageButton ID="ib_buscar" runat="server" ImageUrl="~/Image/Buscar.png" OnClick="ib_buscar_Click" AlternateText="Buscar" />
                        <asp:ImageButton ID="ib_guardar" runat="server"  ImageUrl="~/Image/Guardar.png"  OnClick="ib_guardar_Click" AlternateText="Guardar" />
                        <asp:ImageButton ID="ib_modificar" runat="server"  ImageUrl="~/Image/Editar.png"  OnClick="ib_modificar_Click" AlternateText="Modificar" />
                        <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Eliminar" ImageUrl="~/Image/Eliminar.png" OnClick="ImageButton1_Click" />
                    </td>
                </tr>
            </table>
    
 
    
        </div>
    </form>
</body>
</html>
