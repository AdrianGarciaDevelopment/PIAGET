using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using MySql.Data.MySqlClient;
using System.Data;


public partial class cargar_imagen : System.Web.UI.Page
{
    String CS_Bravo = System.Configuration.ConfigurationManager.AppSettings["SUC_BRAVO"]; // CANDENA DE CONEXIÓN EN ARCHIVO Web.config

    protected void Button1_Click(object sender, EventArgs e)
    {   using (Stream fs = archivo.PostedFile.InputStream)
        {   using(BinaryReader br = new BinaryReader(fs))
            {   String qs = "INSERT INTO cajero VALUES (@id,@foto )";
                byte[] bytes = br.ReadBytes((Int32)fs.Length);
                using(MySqlConnection con = new MySqlConnection(CS_Bravo))
                {   using (MySqlCommand cmd = new MySqlCommand(qs))
                    {   cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@id", Convert.ToInt16(tb_id.Text));
                        cmd.Parameters.AddWithValue("@foto", bytes);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            } 
        }
    }
   
}



// qs = "SELECT * FROM cajero";

/*
 * byte[] imgbyte = archivo.FileBytes;
 * 
 * foto.ImageUrl = "data:image;base64," + Convert.ToBase64String(imgbyte);
 * 
 * /

 /*using (MySqlCommand cmd2 = new MySqlCommand(qs))
 {
     cmd2.Connection = con;

     MySqlDataAdapter adapter = new MySqlDataAdapter(cmd2);

     DataTable dt = new DataTable();

     adapter.Fill(dt);

     l_Ruta.Text = Convert.ToString(dt.Rows.Count);

     byte[] ImageByte = (byte[]) dt.Rows[0][1];
                  
     foto.ImageUrl = "data:image;base64," + Convert.ToBase64String(ImageByte);

                  
 }*/
