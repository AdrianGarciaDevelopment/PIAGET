using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

/*
 * 1.- Proporcionar Diagrama de Workbench
 * 2.- Revisar Creación de BD remota con diagrama.
 * 3.- Exposición almacenamiento de cadenas de conexión en Web.config
 * 4.- Mostrar Ejemplo de merge.
 * 5.- Revisar ejecución del merge local / remoto.
 * 6.- Revisar ejecución del merge local / remoto en equipo.
 * 7.- Propuesta de optimización.
 * 8.- Generación de ID para inserción. 
 */


public partial class usuarios_DIS : System.Web.UI.Page
{
    String CS_Aleman = System.Configuration.ConfigurationManager.AppSettings["SUC_ALEMAN"]; // CANDENA DE CONEXIÓN EN ARCHIVO Web.config
    String CS_Bravo = System.Configuration.ConfigurationManager.AppSettings["SUC_BRAVO"]; // CANDENA DE CONEXIÓN EN ARCHIVO Web.config

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
        /*
         * 
         * CONEXIÓN A SUC. REMOTA 
         *  
         */
          
        DataSet ds = new DataSet();

        try
        {
            MySqlConnection conexion_Aleman = new MySqlConnection(CS_Aleman);
            
            String qs = "select id_suc, nom_suc from Sucursal";

            MySqlDataAdapter adapter_Aleman = new MySqlDataAdapter(qs, conexion_Aleman);
            
            DataTable dt_Aleman = new DataTable();
            
            adapter_Aleman.Fill(dt_Aleman);
            
         
            ds.Tables.Add(dt_Aleman);
            
            conexion_Aleman.Close();
            
        }
        catch(Exception ex)
        {
           // MANEJO DE EXCEPCIÓN 
        }

        /*
         * 
         * CONEXIÓN A SUC. LOCAL
         *  
         */

        try
        {
            MySqlConnection conexion_Bravo = new MySqlConnection(CS_Bravo);

            String qs = "select id_suc, nom_suc from Sucursal";

            MySqlDataAdapter adapter_Bravo = new MySqlDataAdapter(qs, conexion_Bravo);

            DataTable dt_Bravo = new DataTable();

            adapter_Bravo.Fill(dt_Bravo);

            ds.Tables.Add(dt_Bravo);

            conexion_Bravo.Close();

            ds.Tables[0].Merge(ds.Tables[1]);

        }
        catch (Exception ex)
        {
            // MANEJO DE EXCEPCIÓN
        }

        if (ds.Tables.Count > 1)
        {

            for (   int i = 1; i < ds.Tables.Count-1 ; i++)
            {
                ds.Tables[0].Merge(ds.Tables[i]);
            }
    
        }
        
        ddl_suc.DataTextField = "nom_suc";
        ddl_suc.DataValueField = "id_suc";

        ddl_suc.DataSource = ds.Tables[0];

        ddl_suc.DataBind();


    }
    protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        
        using (MySqlConnection conexion_Aleman = new MySqlConnection(CS_Aleman))
        {
            
            conexion_Aleman.Open();

            MySqlCommand cmd = conexion_Aleman.CreateCommand();

            MySqlTransaction transaction;

            transaction = conexion_Aleman.BeginTransaction(IsolationLevel.ReadCommitted);// ¿Cuales son los niveles de aislamiento?

            cmd.Connection = conexion_Aleman;

            cmd.Transaction = transaction;

            try
            {
                cmd.CommandText = "INSERT INTO Usuarios VALUES (" + tb_idusr.Text + "," 
                                                                  + ddl_suc.SelectedItem.Value  + ",'" 
                                                                  + tb_alias.Text + "','" 
                                                                  + tb_psw.Text   + "','" 
                                                                  + tb_nom.Text   + "','" 
                                                                  + tb_ap.Text    + "','" 
                                                                  + tb_am.Text    + "')";

                status.Text = cmd.CommandText;

                cmd.ExecuteNonQuery();

                transaction.Commit();
                
                status.Text ="Se insertó en la BD";

            }
            catch (Exception ex)
            {
                status.Text =status.Text+ "Commit Exception Type:{" + ex.GetType() + "}<br><br>";
                status.Text = status.Text+"Message: {"+ex.Message+"}";

                try
                {
                    transaction.Rollback();
                }
                catch (Exception ex2)
                {
                    status.Text= status.Text+"Rollback Exception Type: {0}"+ex2.GetType();
                }
            
            }

        }

    }
    protected void ibtn_eliminar_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        String cs = "server=localhost;" + "uid=root;" + "database=topicos;";

        MySqlConnection conexion = new MySqlConnection(cs);

        conexion.Open();

        String qs = "delete from usuarios where id_usr =  " + tb_idusr.Text;

        MySqlCommand cmd = new MySqlCommand(qs, conexion);

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