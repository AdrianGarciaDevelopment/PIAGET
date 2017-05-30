<%@ Page Language="C#" AutoEventWireup="true" CodeFile="principal.aspx.cs" Inherits="principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="divCentrado">
            <p class="titulo1">RH System</p>
        </div>
        <div class="divCentrado">
    
        <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" CssClass="popout" DataSourceID="menu" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Medium" ForeColor="#284E98" MaximumDynamicDisplayLevels="1" Orientation="Horizontal" ScrollUpText="" StaticDisplayLevels="2" StaticSubMenuIndent="10px">
            <DataBindings>
                <asp:MenuItemBinding DataMember="Menu" TextField="Text" />
            </DataBindings>
            <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#B5C7DE" />
            <DynamicSelectedStyle BackColor="#507CD1" />
            <DynamicItemTemplate>
                <%# Eval("Text") %>
            </DynamicItemTemplate>
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#507CD1" />
            <StaticItemTemplate>
                <%# Eval("Text") %>
            </StaticItemTemplate>
        </asp:Menu>
        <asp:XmlDataSource ID="menu" runat="server" DataFile="~/menu.xml"></asp:XmlDataSource>
    
    </div>
    </form>
</body>
</html>
