<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cargar_imagen.aspx.cs" Inherits="cargar_imagen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="div_cargarimagen">
        <table class="table_cargarimagen">
        <tr>
            <td>
                ID Cajero:</td>
            <td>
                 <div style="width:50%;margin-left:auto;margin-right:auto">
               
                    <asp:TextBox ID="tb_id" runat="server" Width="196px"></asp:TextBox>
                
                 </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            <td>Selecciona la Imagen:</td>
            <td> 
                <div style="width:50%;margin-left:auto;margin-right:auto">
                
                    <asp:FileUpload ID="archivo" runat="server" Width="200px"   />
               
                 </div>

            </td>
        </tr>
        
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        
        <tr>
            <td>&nbsp;</td>
            <td style="text-align:center">
        <asp:Button ID="b_Guardar" runat="server" OnClick="Button1_Click" Text="Guardar" />
    
            </td>
        </tr>
        
        <tr>
            <td>&nbsp;</td>
            <td style="text-align:center">
        <asp:Label ID="msg" runat="server"></asp:Label>
            </td>
        </tr>
        
    </table>
    
    
        <asp:Image ID="foto" runat="server" />
    
    </div>
    </form>
</body>
</html>
