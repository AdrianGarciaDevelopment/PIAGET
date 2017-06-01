using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace EXAMEN
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void enter_Click(object sender, EventArgs e)
        {
            String conexion = "server=64.62.211.131; Database=efrain_basenube; Uid=efrain_efrain; pwd=123456789efra;";
            var mysql = new MySqlConnection(conexion);

            try
            {
                mysql.Open();
                MySqlCommand consulta = mysql.CreateCommand();
                consulta.CommandText = "SELECT * FROM usuarios WHERE (alias_usr = '" + user.Text +
                "') AND (psw_usr='" + pass.Text + "')";
                MySqlDataAdapter adapter = new MySqlDataAdapter(consulta);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count == 1)
                {
                    Response.Redirect(""); //<<<----AQUI VA LA PAGINA A QUE REDIRIGIRA EN CASO DE QUE SI PUEDA ENTRAR
                }
                else
                {
                    noExist.Visible = true;
                }
            }
            catch (Exception)
            {
                noExist.Visible = true;
            }
        }
    }
}
