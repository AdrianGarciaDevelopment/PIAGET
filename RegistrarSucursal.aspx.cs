using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrarSucursal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegistrarSucursal_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt16( txtID.Text);
        string nombre = txtNombre.Text;
        string direccion = txtDireccion.Text;
        string telefono = txtTelefono.Text;
        Consultas.setSucursal(id, nombre, direccion, telefono, lblRES);
    }
}