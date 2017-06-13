using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EliminarSucursal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Consultas.getGridSucursal(GridView1);
    }

    protected void BtnEliminarSucursal_Click(object sender, EventArgs e)
    {
       
            Consultas.eliminarSucursal(txtID.Text);
            Consultas.getGridSucursal(GridView1);
       
        
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = GridView1.SelectedIndex;
        txtID.Text = GridView1.Rows[i].Cells[1].Text;
       
    }
}