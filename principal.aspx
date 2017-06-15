

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="principal.aspx.cs" Inherits="principal" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        
    <title></title>
    <link href="css/StyleSheet.css" rel="stylesheet" />
</head>
<body class="body_2">
    <div class="alineacionPrincipal_2">
    <form id="form1" runat="server">
        <div class="tituloPrincipal_2">
            <h1>Bienvenido al Menú principal</h1>
        </div>
       <!-- <a href="InsercionUsuario.aspx">Control de usuarios</a><br />
        <a href="Cajeros.aspx">Control de Cajeros</a><br />
        <a href="Sucursal.aspx">Control de Sucursales</a><br />-->
        <div class="menuPrincipal_2">
        <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#7C6F57" StaticSubMenuIndent="10px" Orientation="Horizontal">
            <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#F7F6F3" />
            <DynamicSelectedStyle BackColor="#5D7B9D" />
            <Items>
                <asp:MenuItem NavigateUrl="cajeros.aspx" Text="Cajeros" Value="Cajeros"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="usuarios.aspx" Text="Usuarios" Value="Usuarios"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="sucursales.aspx" Text="Sucursales" Value="Sucursal"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="incidentes.aspx" Text="Incidentes" Value="Incidentes"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="asignacion.aspx" Text="Asignacion" Value="Asignacion"></asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#5D7B9D" />
            </asp:Menu>
        </div>
        

    
        <div class="cuerpoPrincipal_2"><img src="http://icon-icons.com/icons2/67/PNG/512/shop_13338.png" class="imagenPrincipal_2"/></div>

        
    </form>
        </div>
</body>
</html>
