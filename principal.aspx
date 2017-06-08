<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Principal.aspx.cs" Inherits="Principal" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <LINK REL="stylesheet" TYPE="text/css" HREF="misestilos.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <h1>Bienvenido al Menú principal</h1>
       <!-- <a href="InsercionUsuario.aspx">Control de usuarios</a><br />
        <a href="Cajeros.aspx">Control de Cajeros</a><br />
        <a href="Sucursal.aspx">Control de Sucursales</a><br />-->

        <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#7C6F57" StaticSubMenuIndent="10px" Orientation="Horizontal">
            <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#F7F6F3" />
            <DynamicSelectedStyle BackColor="#5D7B9D" />
            <Items>
                <asp:MenuItem NavigateUrl="~/Cajeros.aspx" Text="Cajeros" Value="Cajeros"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/InsercionUsuario.aspx" Text="Usuarios" Value="Usuarios"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Sucursal.aspx" Text="Sucursal" Value="Sucursal"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="Incidentes.aspx" Text="Incidentes" Value="Incidentes"></asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#5D7B9D" />
            </asp:Menu>
        

    
    </div>
        <div style="text-align: center; width:100%;"><img src="http://icon-icons.com/icons2/67/PNG/512/shop_13338.png"</div>

        
    </form>
</body>
</html>
