using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class asignacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // CONFIGURACIÓN LOCAL

        //String cs = "server=localhost;" + "uid=root;" + "database=topicos;";            

        // CONFIGURACIÓN EN LINEA

        String cs = System.Configuration.ConfigurationManager.ConnectionStrings["EFRAIN"].ToString();

        using (MySqlConnection conexion = new MySqlConnection(cs))
        {
            String qs = "SELECT PKid_suc, nom_suc FROM sucursal";

            MySqlDataAdapter adapter = new MySqlDataAdapter(qs, conexion);

            DataTable dt = new DataTable();

            adapter.Fill(dt);

            ddl_sucursales.DataTextField = "nom_suc";

            ddl_sucursales.DataValueField = "PKid_suc";

            ddl_sucursales.DataSource = dt;

            ddl_sucursales.DataBind();
        }

        c_fecha.SelectedDate = c_fecha.TodaysDate;

    }

    protected void ib_buscar_Click(object sender, ImageClickEventArgs e)
    {
        // CONFIGURACIÓN LOCAL

        // String cs = "server=localhost;" + "uid=root;" + "database=topicos;";

        // CONFIGURACIÓN EN LINEA

        String cs = System.Configuration.ConfigurationManager.ConnectionStrings["EFRAIN"].ToString();

        using (MySqlConnection conexion = new MySqlConnection(cs))
        {
            String qs = "SELECT nom_caj" +
                        "FROM cajero " +
                        "WHERE (id_caj =" + tb_id.Text + ")";

            MySqlDataAdapter adapter = new MySqlDataAdapter(qs, conexion);

            DataTable dt = new DataTable();

            adapter.Fill(dt);

            if (dt.Rows.Count == 1)
            {
                tb_nombre.Text = dt.Rows[0][0].ToString();

               // tb_apaterno.Text = dt.Rows[0][1].ToString();

 //               tb_amaterno.Text = dt.Rows[0][2].ToString();

            }
            else
            {
                l_msg.Visible = true;

                l_msg.Text = "El usuario no existe";

            }

        }

    }

    protected void ib_guardar_Click(object sender, ImageClickEventArgs e)
    {
        // CONFIGURACIÓN LOCAL

        // String cs = "server=localhost;" + "uid=root;" + "database=topicos;";

        // CONFIGURACIÓN EN LINEA

        String cs = System.Configuration.ConfigurationManager.ConnectionStrings["EFRAIN"].ToString();

        using (MySqlConnection conexion = new MySqlConnection(cs))
        {
            String qs = "INSERT INTO incidentes VALUES (NULL," +
                        tb_id.Text + "," +
                        ddl_sucursales.SelectedValue + "," +
                        "'" + c_fecha.SelectedDate.ToString("yyyy-MM-dd") + "'," +
                        "'" + tb_motivo.Text + "')";
            conexion.Open();

            MySqlCommand cmd = conexion.CreateCommand();

            cmd.CommandText = qs;

            cmd.ExecuteNonQuery();

            l_msg.Visible = true;

            l_msg.Text = "Datos Guardados";

        }




    }


    protected void ib_modificar_Click(object sender, ImageClickEventArgs e)
    {
        String cs = System.Configuration.ConfigurationManager.ConnectionStrings["EFRAIN"].ToString();

        using (MySqlConnection conexion = new MySqlConnection(cs))
        {
            String qs = "update incidencias set (NULL," +
                        tb_id.Text + "," +
                        ddl_sucursales.SelectedValue + "," +
                        "'" + c_fecha.SelectedDate.ToString("yyyy-MM-dd") + "'," +
                        "'" + tb_motivo.Text + "')";
            conexion.Open();

            MySqlCommand cmd = conexion.CreateCommand();

            cmd.CommandText = qs;

            cmd.ExecuteNonQuery();

            l_msg.Visible = true;

            l_msg.Text = "Datos Modificados";

        }

    }
}