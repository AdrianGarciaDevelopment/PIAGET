using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace ExamenAdriansilloEfraFinal
{
    public partial class cajeros : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("Server=localhost; Database=examen_efrain_adrian; uid=root; pwd=laverga; ");

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
                con.Open();
                MySqlCommand consulta = con.CreateCommand();
                consulta.CommandText = "SELECT A.id_caj, A.nom_caj, A.ap_caj, A.am_caj, A.foto_caj, A.tel_caj, A.dir_caj, A.contrato_caj, A.descanso_caj,B.nom_suc " +
                                       "FROM cajero A,sucursal B WHERE A.nom_caj LIKE '" + nombre.Text + "%' AND " +
                                                        // "A.ap_caj LIKE '" + app.Text + "%' AND " +
                                                         //"A.am_caj LIKE '" + apm.Text + "%' AND " +
                                                         //"foto_caj LIKE '" + foto.Text + "%' AND " +
                                                         //"A.tel_caj LIKE '" + tel.Text + "%' AND " +
                                                         //"A.dir_caj LIKE '" + dir.Text + "%' AND " +
                                                         //"A.contrato_caj LIKE '" + contrato.Text + "%' AND " +
                                                         //"A.descanso_caj LIKE '" + descanso.Text + "%' AND " +
                                                         "A.id_caj LIKE '" + id.Text + "%' AND  " +
                                                         "A.FKid_suc LIKE '" + sucursal.Text + "%' AND A.FKid_suc=B.id_suc";

                MySqlDataAdapter adapter = new MySqlDataAdapter(consulta);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (MySqlException)
            {
                mensage.Text = " sucedio un error";
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
            app.Text = "";
            apm.Text = "";
            //foto.Text = "";
            tel.Text = "";
            dir.Text = "";
            contrato.Text = "";
            descanso.Text = "";
            sucursal.Text = "";
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
          // foto.Text = System.Net.WebUtility.HtmlDecode(row.Cells[5].Text); 
            tel.Text = System.Net.WebUtility.HtmlDecode(row.Cells[5].Text);
            dir.Text = System.Net.WebUtility.HtmlDecode(row.Cells[6].Text);
            contrato.Text = System.Net.WebUtility.HtmlDecode(row.Cells[7].Text);
            descanso.Text = System.Net.WebUtility.HtmlDecode(row.Cells[8].Text);
            sucursal.Text = System.Net.WebUtility.HtmlDecode(row.Cells[9].Text);
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                MySqlCommand cmd = con.CreateCommand();

                //INSERTAMOS EL VALOR
                MemoryStream ms = new MemoryStream();
                Stream fs = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                byte[] bytes = br.ReadBytes((Int32)fs.Length);
                cmd.CommandText = "INSERT INTO cajero (nom_caj, ap_caj, am_caj, foto_caj, tel_caj, dir_caj, contrato_caj, descanso_caj,FKid_suc) " +
                "VALUES('" + nombre.Text + "','" + app.Text + "','" + apm.Text + "','" + bytes + "','" + tel.Text + "','" + dir.Text + "','" + contrato.Text + "','" + descanso.Text + "','" + sucursal.Text + "')";
                cmd.ExecuteNonQuery();

                mensage.Text = "insertado con exito!";
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
            consulta.CommandText = "SELECT A.id_caj, A.nom_caj, A.ap_caj, A.am_caj, A.tel_caj, A.dir_caj, A.contrato_caj, A.descanso_caj,B.nom_suc " +
                                   "FROM cajero A,sucursal B WHERE A.FKid_suc=B.id_suc";

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
                cmd.CommandText = "DELETE FROM cajero WHERE id_caj = '" + id.Text + "'";
                cmd.ExecuteNonQuery();

                mensage.Text = "Se elimino correctamente";

            }
            catch (MySqlException)
            {
                mensage.Text = "ocurrio un error";
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
                MemoryStream ms = new MemoryStream();
                Stream fs = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                byte[] bytes = br.ReadBytes((Int32)fs.Length);

                cmd.CommandText = "UPDATE cajero SET nom_caj='" + nombre.Text + "', ap_caj='" + app.Text + "',"
                                                    + "am_caj='" + apm.Text + "', foto_caj='" + bytes + "',"
                                                    + "tel_caj='" + tel.Text + "',dir_caj='" + dir.Text + "',"
                                                    + "contrato_caj='" + contrato.Text + "',descanso_caj='" + descanso.Text + "',FKid_suc='" + sucursal.Text + "' "
                                + "WHERE id_caj = " + id.Text ;
                cmd.ExecuteNonQuery();

                mensage.Text = "Se modifico con exito";

            }
            catch (MySqlException)
            {
                mensage.Text = "ocurrio un error";
            }
            finally
            {
                con.Close();
                actualizarData();
            }
        }
    }
}
