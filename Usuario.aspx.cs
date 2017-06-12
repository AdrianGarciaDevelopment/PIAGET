using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace ExamenAdriansilloEfraFinal
{
    public partial class Usuario : System.Web.UI.Page
    {
		
        MySqlConnection con = new MySqlConnection("server=64.62.211.131; Database=efrain_basenube; Uid=efrain_efrain; pwd=123456789efra; ");
 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                con.Open();

                MySqlCommand consultar = con.CreateCommand();
                consultar.CommandText = "Select * From sucursal;";
                MySqlDataAdapter adapter = new MySqlDataAdapter(consultar);

                DataTable dt = new DataTable();
                adapter.Fill(dt);

                sucursal.DataTextField = "nom_suc";
                sucursal.DataValueField = "id_suc";
                sucursal.DataSource = dt;
                sucursal.DataBind();
               sucursal.Items.Insert(0, new ListItem("", ""));
                con.Close();
            }
        }

        protected void buscar_Click(object sender, EventArgs e)
        {

            try
            {
                if (sucursal.Text == "0")
                {
                    sucursal.Text = "";
                }

                con.Open();
                MySqlCommand consulta = con.CreateCommand();
                consulta.CommandText = "SELECT id_usr, nom_usr, app_usr, apm_usr, alias_usr, nom_suc, psw_usr " +
                                       "FROM usuarios, sucursal WHERE nom_usr LIKE '" + nombre.Text + "%' AND " +
                                                                    "app_usr LIKE '" + app.Text + "%' AND " +
                                                                    "apm_usr LIKE '" + apm.Text + "%' AND " +
                                                                    "Sucursal_id_suc LIKE '" + sucursal.Text + "%' AND " +
                                                                    "alias_usr LIKE '" + alias.Text + "%' AND " +
                                                                    "id_suc = Sucursal_id_suc";

                MySqlDataAdapter adapter = new MySqlDataAdapter(consulta);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (MySqlException)
            {
                mensage.Text = "Hubo un error compa";
            }
            finally
            {
                con.Close();
            }
        }

        protected void limpiar_Click(object sender, EventArgs e)
        {
            id.Text = "";
            nombre.Text = "";
            alias.Text = "";
            app.Text = "";
            apm.Text = "";
            pass.Text = "";
            sucursal.SelectedIndex = sucursal.Items.IndexOf(sucursal.Items.FindByText(""));
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            buscar_Click(sender, e);
        }

        protected void SelectNdx(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            id.Text = System.Net.WebUtility.HtmlDecode(row.Cells[1].Text);
            nombre.Text = System.Net.WebUtility.HtmlDecode(row.Cells[2].Text);
            app.Text = System.Net.WebUtility.HtmlDecode(row.Cells[3].Text);
            apm.Text = System.Net.WebUtility.HtmlDecode(row.Cells[4].Text);
            alias.Text = System.Net.WebUtility.HtmlDecode(row.Cells[5].Text);
            string nom = System.Net.WebUtility.HtmlDecode(row.Cells[6].Text);
            sucursal.SelectedIndex = sucursal.Items.IndexOf(sucursal.Items.FindByText(nom));
            pass.Text = System.Net.WebUtility.HtmlDecode(row.Cells[7].Text);
        }

        protected void agregar_Click(object sender, EventArgs e)
        {

            try
            {
                con.Open();
                MySqlCommand cmd = con.CreateCommand();

                //INSERTAMOS EL VALOR
                cmd.CommandText = "INSERT INTO usuarios (nom_usr,app_usr,apm_usr,Sucursal_id_suc,alias_usr,psw_usr) " +
                "VALUES('" + nombre.Text + "','" + app.Text + "','" + apm.Text + "'," + sucursal.Text + ",'" + alias.Text + "','" + pass.Text + "')";
                cmd.ExecuteNonQuery();
                
                mensage.Text = "Se inserto bien!";
            }
            catch (MySqlException)
            {
                mensage.Text = "hay un error";
            }
            finally
            {
                con.Close();
                actualizarData();
            }
        }

        protected void actualizarData()
        {
            

            con.Open();
            MySqlCommand consulta = con.CreateCommand();
            consulta.CommandText = "SELECT id_usr, nom_usr, app_usr, apm_usr, alias_usr, nom_suc, psw_usr " +
                                   "FROM usuarios, sucursal WHERE id_suc = Sucursal_id_suc";

            MySqlDataAdapter adapter = new MySqlDataAdapter(consulta);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void eliminar_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                MySqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "DELETE FROM usuarios WHERE id_usr = '" + id.Text + "'";
                cmd.ExecuteNonQuery();
                
                mensage.Text = "Se elimino";
                  
            }
            catch (MySqlException)
            {
                mensage.Text = "ah ocurrido un error";
            }
            finally
            {
                con.Close();
                actualizarData();
            }
        }

        protected void modificar_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                MySqlCommand cmd = con.CreateCommand();

                //ACTUALIZANDO EL VALOR
                cmd.CommandText = "UPDATE usuarios SET nom_usr='" + nombre.Text + "', app_usr='" + app.Text + "',"
                                                    + "apm_usr='" + apm.Text + "',Sucursal_id_suc=" + sucursal.Text + ","
                                                    + "alias_usr='" + alias.Text + "',psw_usr='" + pass.Text + "' "
                                + "WHERE id_usr = '" + id.Text + "'";
                cmd.ExecuteNonQuery();

                mensage.Text = "Se ah modificado";
                 
            }
            catch (MySqlException)
            {
                mensage.Text = "hubo un error";
            }
            finally
            {
                con.Close();
                actualizarData();
            }
        }
    }
}