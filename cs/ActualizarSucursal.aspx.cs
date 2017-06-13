using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ActualizarSucursal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Consultas.getGridSucursal(GridView1);
        ActualizarSucursalClick.Enabled = false;
    }



    protected void ActualizarSucursalClick_Click(object sender, EventArgs e)
    {
        Consultas.modificarSucursal(txtID.Text, txtNombre.Text, txtDireccion.Text, txtTelefono.Text);
        txtID.Text = "";
        txtNombre.Text = "";
        txtDireccion.Text = "";
        txtTelefono.Text = "";
        Consultas.getGridSucursal(GridView1);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = GridView1.SelectedIndex;
        txtID.Text = GridView1.Rows[i].Cells[1].Text;
        txtNombre.Text = GridView1.Rows[i].Cells[2].Text;
        txtDireccion.Text = GridView1.Rows[i].Cells[3].Text;
        txtTelefono.Text = GridView1.Rows[i].Cells[4].Text;
        if (!string.IsNullOrEmpty(txtID.Text))
        {
           ActualizarSucursalClick.Enabled = true;
        }
    }
}