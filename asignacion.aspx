<%@ Page Language="C#" AutoEventWireup="true" CodeFile="asignacion.aspx.cs" Inherits="asignacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        }
        .auto-style4 {
            width: 143px;
            height: 37px;
        }
        .auto-style5 {
            height: 37px;
        }
        .auto-style6 {
            width: 143px;
            height: 36px;
        }
        .auto-style7 {
            height: 36px;
        }
        .auto-style8 {
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
        <div class="divCentrado">
            <p class="titulo1">RH System</p>
        </div>
        <div class="divCentrado" style="width:400px;margin-left:auto;margin-right:auto">
    
            <table style="width:89%;">
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">ID Cajero</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="tb_id" runat="server" Width="55px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Nombre</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="tb_nombre" runat="server" Width="187px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Apellido Paterno</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="tb_apaterno" runat="server" Width="187px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Apellido Materno</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="tb_amaterno" runat="server" Width="187px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Sucursal Asignada</td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddl_sucursales" runat="server" Height="25px" Width="190px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Fecha Asignación</td>
                    <td>
                        <asp:Calendar ID="c_fecha" runat="server" Height="151px" Width="130px"></asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Motivo Asignación</td>
                    <td>
                        <asp:TextBox ID="tb_motivo" runat="server" Height="84px" TextMode="MultiLine" Width="187px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="2" style="text-align:center">
                        <asp:Label ID="l_msg" runat="server" style="text-align: center" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2" style="text-align:center">
                        <asp:ImageButton ID="ib_buscar" runat="server" Height="48px" ImageUrl="~/imgs/buscar.jpg" Width="50px" OnClick="ib_buscar_Click" />
                        <asp:ImageButton ID="ib_guardar" runat="server" Height="48px" ImageUrl="~/imgs/guardar.jpg" Width="50px" OnClick="ib_guardar_Click" />
                    </td>
                </tr>
            </table>
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        </div>
    </form>
</body>
</html>
