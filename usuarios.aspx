<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usuarios.aspx.cs" Inherits="usuarios" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        
        .auto-style6 {
            width: 308px;
            height: 54px;
        }
        .auto-style7 {
            width: 184px;
            height: 54px;
        }
        .auto-style8 {
            width: 93px;
            height: 54px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:900px;margin-left:auto;margin-right:auto;margin-top:10px">
    
       <div style="margin-bottom:30px">
           <img style="width:180px;height:100px" src="imgs/rh.jpg" /><label style="font-size:60px">RH Especial</label>
       </div>
        <div style="float:left;width:300px">
        <table style="width: 98%; height: 400px;">
            <tr>
                <td class="auto-style6">ID</td>
                <td class="auto-style7">
                    <asp:TextBox ID="tb_idusr" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" ImageAlign="Middle" ImageUrl="~/imgs/buscar.jpg" OnClick="ImageButton1_Click" ToolTip="Buscar" Width="40px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Sucursal</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="ddl_suc" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="40px" ImageAlign="Middle" ImageUrl="~/imgs/guardar.jpg" OnClick="ImageButton1_Click" ToolTip="Guardar" Width="40px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Alias</td>
                <td class="auto-style7">
                    <asp:TextBox ID="tb_alias" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:ImageButton ID="ibtn_eliminar" runat="server" Height="40px" ImageAlign="Middle" ImageUrl="~/imgs/eliminar.jpg" OnClick="ibtn_eliminar_Click" ToolTip="Eliminar" Width="40px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Password</td>
                <td class="auto-style7">
                    <asp:TextBox ID="tb_psw" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style6">Re-Password</td>
                <td class="auto-style7">
                    <asp:TextBox ID="tb_repsw" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">Nombre</td>
                <td class="auto-style7">
                    <asp:TextBox ID="tb_nom" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">A Paterno</td>
                <td class="auto-style7">
                    <asp:TextBox ID="tb_ap" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">A Materno</td>
                <td class="auto-style7">
                    <asp:TextBox ID="tb_am" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
        </table>
    </div>
    
       <div style="float:right;width:600px;height:400px">
        <asp:GridView ID="Grid" runat="server" CssClass="grid" AllowPaging="True" PageSize="4" OnPageIndexChanging="Grid_PageIndexChanging" AutoGenerateColumns="False" AutoGenerateSelectButton="True"  Height="450px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="Grid_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:BoundField DataField="ID Usuario" HeaderText="ID Usuario" >
                    <HeaderStyle Width="300px" Height="5px" />
                    <ItemStyle HorizontalAlign="Center" Width="20px"/>
                </asp:BoundField>
                
                <asp:BoundField DataField="Nombre" HeaderText="Nombre"  >
                     <HeaderStyle Width="300px" Height="5px" />
                     <ItemStyle HorizontalAlign="Center" Width="20px"/>
                </asp:BoundField>
                
                <asp:BoundField DataField="A.Paterno" HeaderText="A. Paterno" >
                    <HeaderStyle Width="300px" />
                    <ItemStyle Width="300px" />
                </asp:BoundField>
                
                <asp:BoundField DataField="A.Materno" HeaderText="A. Materno">
                    <HeaderStyle Width="300px" />
                    <ItemStyle Width="300px" />
                </asp:BoundField>
                
                <asp:BoundField DataField="Alias" HeaderText="Alias" >
                    <HeaderStyle Width="300px" />
                    <ItemStyle/>
                </asp:BoundField>
                <asp:BoundField DataField="id_suc" HeaderText="IDS" HtmlEncode="False">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="sucursal" HeaderText="Sucursal">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Width="300px" Font-Bold="True" ForeColor="White"/>
            <PagerStyle Height="10px" BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle Height="20px" />
            <SelectedRowStyle BackColor="#abb2b9" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
      </div>
    
    </div>
        
        <asp:SqlDataSource ID="DS" runat="server"></asp:SqlDataSource>
        
    </form>
</body>
</html>
