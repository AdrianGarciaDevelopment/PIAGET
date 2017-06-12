using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsultarSucursal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Consultas.getGridSucursal(GridView1);
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        Consultas.buscarSucursal(txtBusqueda.Text, GridView1);
        if (string.IsNullOrEmpty(txtBusqueda.Text))
        {
            Consultas.getGridSucursal(GridView1);
        }
        txtBusqueda.Text = "";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}