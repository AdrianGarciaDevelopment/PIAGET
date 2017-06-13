using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing.Imaging;

/// <summary>
/// Descripción breve de Consultas
/// </summary>
public class Consultas
{
    private static MySqlConnection BD = new MySqlConnection(ConfigurationManager.ConnectionStrings["EFRAIN"].ToString());
    public Consultas()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    #region LOGIN
    public static bool setLogin(string usuario, string contra)
    {
        try
        {
                     BD.Open();
                     MySqlCommand cmd = BD.CreateCommand();
                     cmd.CommandText = ("SELECT * FROM usuario WHERE alias_usu= @usu AND pwd_usu= @contra ");
                     cmd.Parameters.AddWithValue("usu", usuario);
                     cmd.Parameters.AddWithValue("contra", contra);
                     cmd.ExecuteNonQuery();
                     MySqlDataReader reader = cmd.ExecuteReader();
                     if (reader.Read())
                     {
                         BD.Close();
                         reader.Close();
                         return true;

                     }
                     else
                     {
                         BD.Close();
                         reader.Close();
                         return false;
                     }
                     if (!reader.IsClosed)
                     {
                         reader.Close();
                         BD.Close();
                     }
                     return false;
                 } catch(Exception ex)
                 {
                     BD.Close();
                     return false;
                 }
        }//cierre metodo
    #endregion



    #region CAJERO

    public static void setCajero(int id,string nombre, string ap,string am, string imagen,string telefono,string direccion, string contrato, Label lbl)
    {
        try
        {
            BD.Open();
            MySqlCommand cmd = BD.CreateCommand();
            cmd.CommandText = ("INSERT INTO cajero values(@id, @nombre, @apaterno, @amaterno,@foto, @telefono, @direccion, @contrato)");
            cmd.Parameters.AddWithValue("id", id);
            cmd.Parameters.AddWithValue("nombre", nombre);
            cmd.Parameters.AddWithValue("apaterno", ap);
            cmd.Parameters.AddWithValue("amaterno", am);
            cmd.Parameters.AddWithValue("foto", imagen);
            cmd.Parameters.AddWithValue("telefono",telefono );
            cmd.Parameters.AddWithValue("direccion",direccion);
            cmd.Parameters.AddWithValue("contrato", contrato);

            cmd.ExecuteNonQuery();
            lbl.Text = "CAJERO REGISTRADO EXITOSAMENTE";
            BD.Close();
        }
        catch (Exception ex)
        {
            lbl.Text = "CAJERO YA REGISTRADO";
            BD.Close();
        }
    } //CIERRE METODO SET CAJERO
    
    public static void getGridCajero(GridView gv)
    {
        try
        {
            BD.Open();
            MySqlCommand cmd = BD.CreateCommand();
            cmd.CommandText = "SELECT id_cajero AS 'ID',nombre_cajero AS 'Nombre', ap_cajero AS 'Apellido paterno', am_cajero AS 'Apellido materno', tel_cajero AS 'Telefono', direc_cajero AS 'Direccion', contrato_cajero AS 'Contrato' FROM cajero";
            // cmd.Parameters.AddWithValue("@usu", idusu.Text);
            cmd.ExecuteNonQuery();
            gv.DataSource = cmd.ExecuteReader();
            gv.DataBind();
            BD.Close();


        }
        catch (Exception ex)
        {

      
        }
    }//cierre metodo

    public static void buscarCajero(string buscar, GridView gv)
    {
        try
        {
            BD.Open();
            MySqlCommand cmd = BD.CreateCommand();
            cmd.CommandText = "SELECT id_cajero AS 'ID',nombre_cajero AS 'Nombre', ap_cajero AS 'Apellido paterno', am_cajero AS 'Apellido materno', tel_cajero AS 'Telefono', direc_cajero AS 'Direccion', contrato_cajero AS 'Contrato' FROM cajero WHERE id_cajero=@buscar OR nombre_cajero=@buscar OR ap_cajero=@buscar OR am_cajero=@buscar OR tel_cajero=@buscar OR direc_cajero=@buscar OR contrato_cajero=@buscar";
            cmd.Parameters.AddWithValue("@buscar", buscar);


            cmd.ExecuteNonQuery();
            gv.DataSource = cmd.ExecuteReader();
            gv.DataBind();
            BD.Close();

        }
        catch (Exception ex)
        {
            BD.Close();
        }
    }//CIERRE METODO

    public static void modificarCajero(string id, string nombre,string apaterno,string amaterno,string telefono, string direc, string contrato)
    {
        try
        {
            BD.Open();
            MySqlCommand cmd = BD.CreateCommand();
            cmd.CommandText = ("UPDATE cajero SET nombre_cajero= @nombre, ap_cajero= @ap ,am_cajero= @am, tel_cajero= @tel, direc_cajero= @direc, contrato_cajero=@contrato WHERE id_cajero= @id");
            cmd.Parameters.AddWithValue("id", id);
            cmd.Parameters.AddWithValue("nombre", nombre);
            cmd.Parameters.AddWithValue("ap", apaterno);
            cmd.Parameters.AddWithValue("am", amaterno);
            cmd.Parameters.AddWithValue("tel", telefono);
            cmd.Parameters.AddWithValue("contrato", contrato);
            cmd.Parameters.AddWithValue("direc", direc);

            cmd.ExecuteNonQuery();
            System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('ACTUALIZADO EXITOSAMENTE!')</SCRIPT>");

            BD.Close();
        }
        catch (Exception ex)
        {
            BD.Close();
        }
    } //CIERRE METODO

    public static void eliminarCajero(string id)
    {

        try
        {
            BD.Open();
            MySqlCommand cmd = BD.CreateCommand();
            cmd.CommandText = "DELETE FROM cajero WHERE id_cajero=@id";
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
            System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('ELIMINADO EXITOSAMENTE!')</SCRIPT>");
            BD.Close();
        }
        catch (Exception ex)
        {

            BD.Close();
        }
    }
    #endregion

    #region SUCURSALES
    public static void setSucursal(int id, string nombre, string direccion, string telefono, Label lbl)
    {
        try
        {
            BD.Open();
            MySqlCommand cmd = BD.CreateCommand();
            cmd.CommandText = ("INSERT INTO sucursal values(@id, @nombre,@direccion,@telefono )");
            cmd.Parameters.AddWithValue("id", id);
            cmd.Parameters.AddWithValue("nombre", nombre);
            cmd.Parameters.AddWithValue("direccion", direccion);
            cmd.Parameters.AddWithValue("telefono", telefono);
           
            cmd.ExecuteNonQuery();
            lbl.Text = "SUCURSAL REGISTRADA EXITOSAMENTE";
            BD.Close();
        }
        catch (Exception ex)
        {
            lbl.Text = "SUCURSAL YA REGISTRADA";
            BD.Close();
        }
    }

    public static void getGridSucursal(GridView gv)
    {
        try
        {
            BD.Open();
            MySqlCommand cmd = BD.CreateCommand();
            cmd.CommandText = "SELECT id_sucursal AS 'ID', nombre_sucursal AS 'Sucursal', direccion_sucursal AS 'Direccion', telefono_sucursal AS 'Telefono' FROM sucursal";
            cmd.ExecuteNonQuery();
            gv.DataSource = cmd.ExecuteReader();
            gv.DataBind();
            BD.Close();


        }
        catch (Exception ex)
        {


        }
    }//cierre metodo

    public static void buscarSucursal(string buscar, GridView gv)
    {
        try
        {
            BD.Open();
            MySqlCommand cmd = BD.CreateCommand();
            cmd.CommandText = "SELECT id_sucursal AS 'ID', nombre_sucursal AS 'Sucursal', direccion_sucursal AS 'Direccion', telefono_sucursal AS 'Telefono' FROM sucursal WHERE id_sucursal=@buscar OR nombre_sucursal=@buscar OR direccion_sucursal=@buscar OR telefono_sucursal=@buscar";
            cmd.Parameters.AddWithValue("@buscar", buscar);


            cmd.ExecuteNonQuery();
            gv.DataSource = cmd.ExecuteReader();
            gv.DataBind();
            BD.Close();

        }
        catch (Exception ex)
        {
            BD.Close();
        }
    }//CIERRE METODO

    public static void modificarSucursal(string id, string nombre, string direccion,string telefono)
    {
        try
        {
            BD.Open();
            MySqlCommand cmd = BD.CreateCommand();
            cmd.CommandText = ("UPDATE sucursal SET nombre_sucursal= @nombre, direccion_sucursal= @direc, telefono_sucursal=@telefono WHERE id_sucursal= @id");
            cmd.Parameters.AddWithValue("id", id);
            cmd.Parameters.AddWithValue("nombre", nombre);
            cmd.Parameters.AddWithValue("direc", direccion);
            cmd.Parameters.AddWithValue("telefono", telefono);
           
            cmd.ExecuteNonQuery();
            System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('ACTUALIZADO EXITOSAMENTE!')</SCRIPT>");

            BD.Close();
        }
        catch (Exception ex)
        {
            BD.Close();
        }
    } //CIERRE METODO

    public static void eliminarSucursal(string id)
    {

        try
        {
            BD.Open();
            MySqlCommand cmd = BD.CreateCommand();
            cmd.CommandText = "DELETE FROM sucursal WHERE id_cajero=@id";
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
            System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('ELIMINADO EXITOSAMENTE!')</SCRIPT>");
            BD.Close();
        }
        catch (Exception ex)
        {

            BD.Close();
        }
    }
    #endregion
} //cierre clase