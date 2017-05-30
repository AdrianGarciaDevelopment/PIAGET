using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Windows;


public partial class usuarios : System.Web.UI.Page
{

    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }
    
    protected void Grid_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
    {
        
        Grid.PageIndex = e.NewPageIndex;

        String cs = "server=localhost;" + "uid=root;" + "database=topicos;";

        MySqlConnection conexion = new MySqlConnection(cs);

        String qs = "select id_usr as 'ID Usuario', nom_usr as 'Nombre', app_usr as 'A.Paterno', apm_usr as 'A.Materno', alias_usr as 'Alias',";

        qs = qs + "psw_usr,id_suc, nom_suc as 'sucursal' from usuarios INNER JOIN  sucursal ON usuarios.Sucursal_id_suc = sucursal.id_suc";

        MySqlDataAdapter adapter = new MySqlDataAdapter(qs, conexion);

        DataTable ds = new DataTable();

        adapter.Fill(ds);

        Grid.DataSource = ds;

        Grid.DataBind();
        
        

    }

    protected void Grid_SelectedIndexChanged(object sender, EventArgs e)
    {
        tb_idusr.Text = Convert.ToString(Grid.Rows[Grid.SelectedIndex].Cells[1].Text);

        ddl_suc.Text = Convert.ToString(Grid.Rows[Grid.SelectedIndex].Cells[6].Text);

        tb_alias.Text = Convert.ToString(Grid.Rows[Grid.SelectedIndex].Cells[5].Text);

        tb_nom.Text = Convert.ToString(Grid.Rows[Grid.SelectedIndex].Cells[2].Text);

        tb_ap.Text = Convert.ToString(Grid.Rows[Grid.SelectedIndex].Cells[3].Text);

        tb_am.Text = Convert.ToString(Grid.Rows[Grid.SelectedIndex].Cells[4].Text);


    }
    protected void Page_Load(object sender, EventArgs e)
    {
       //String cs = "server=localhost;" + "uid=root;" + "database=topicos;";            // CADENA DE CONEXIÓN EN CÓDIGO
         
        String cs = System.Configuration.ConfigurationManager.AppSettings["SUC_ALEMAN"]; // CANDENA DE CONEXIÓN EN ARCHIVO Web.config

        MySqlConnection conexion = new MySqlConnection(cs);

        String qs = "select id_suc, nom_suc from Sucursal";

        MySqlDataAdapter adapter = new MySqlDataAdapter(qs, conexion);

        DataTable dt = new DataTable();

        adapter.Fill(dt);

        ddl_suc.DataTextField = "nom_suc";
        
        ddl_suc.DataValueField = "id_suc";

        ddl_suc.DataSource = dt;

        ddl_suc.DataBind();


    }
    protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        String cs = "server=localhost;" + "uid=root;" + "database=topicos;";

        MySqlConnection conexion = new MySqlConnection(cs);

        String qs = "select id_usr as 'ID Usuario', nom_usr as 'Nombre', app_usr as 'A.Paterno', apm_usr as 'A.Materno', alias_usr as 'Alias',";

        qs = qs + "psw_usr,id_suc,nom_suc as 'sucursal' from usuarios INNER JOIN  sucursal ON usuarios.Sucursal_id_suc = sucursal.id_suc";

        MySqlDataAdapter adapter = new MySqlDataAdapter(qs, conexion);

        DataTable ds = new DataTable();

        adapter.Fill(ds);

        Grid.DataSource = ds;

        Grid.DataBind();

    }
    protected void ibtn_eliminar_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        String cs = "server=localhost;" + "uid=root;" + "database=topicos;";

        MySqlConnection conexion = new MySqlConnection(cs);

        conexion.Open();

        String qs = "delete from usuarios where id_usr =  " + tb_idusr.Text;
        
        MySqlCommand cmd = new MySqlCommand(qs,conexion);

        cmd.ExecuteNonQuery();

        conexion.Close();

        conexion.Open();

        cs = "server=localhost;" + "uid=root;" + "database=topicos;";

        conexion = new MySqlConnection(cs);

        qs = "select id_usr as 'ID Usuario', nom_usr as 'Nombre', app_usr as 'A.Paterno', apm_usr as 'A.Materno', alias_usr as 'Alias',";

        qs = qs + "psw_usr,id_suc,nom_suc as 'sucursal' from usuarios INNER JOIN  sucursal ON usuarios.Sucursal_id_suc = sucursal.id_suc";

        MySqlDataAdapter adapter = new MySqlDataAdapter(qs, conexion);

        DataTable ds = new DataTable();

        adapter.Fill(ds);

        Grid.DataSource = ds; 

        Grid.DataBind();

    }
}