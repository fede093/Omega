using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ENTIDAD;

namespace DATOS
{
    public class DatosUsuarios
    {
        AccesoDatos ds = new AccesoDatos();
        public DataTable getTablaUsuarios()
        {
            DataTable tabla = ds.ObtenerTabla("Usuario", "Select * from Usuario");
            return tabla;
        }

        public DataTable getTablaUsuarios(String usuario)
        {
            DataTable tabla = ds.ObtenerTabla("Usuario", "Select * from Usuario where Usuario='" + usuario + "'");
            return tabla;
        }

        public DataTable getTablaUsuarios(int cod_pais)
        {
            DataTable tabla = ds.ObtenerTabla("Usuario", "Select * from Usuario where Cod_Pais=" + cod_pais);
            return tabla;
        }
        public DataTable getTablaUsuario(String Usuario)
        {
            DataTable tabla = ds.ObtenerTabla("Usuario", "Select * from Usuario INNER JOIN Pais on Usuario.Cod_Pais = Pais.Cod_Pais" +
                " where Usuario='" + Usuario + "'");
            return tabla;
        }

        public bool estaRegistrado(String usuario, String clave)
        {
            SqlConnection cn = ds.ObtenerConexion();
            SqlCommand cmd;
            SqlDataReader dr;
            String sql =
            "Select * From Usuario Where Usuario='" + usuario + "' AND Contraseña='" + clave + "'";
            if (cn != null)
            {
                cmd = new SqlCommand(sql, cn);
                try
                {
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                        return true;
                    else
                        return false;
                }
                catch (SqlException ex)
                {
                    return false;
                }
                finally
                {
                    cn.Close();
                }
            }
            else
                return false;
        }

        public bool esAdministrador(String usuario)
        {
            SqlConnection cn = ds.ObtenerConexion();
            SqlCommand cmd;
            SqlDataReader dr;
            String sql =
            "Select * From Usuario Where Usuario='"+usuario+"' AND Administrador='True'";
            if (cn != null)
            {
                cmd = new SqlCommand(sql, cn);
                try
                {
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                        return true;
                    else
                        return false;
                }
                catch (SqlException ex)
                {
                    return false;
                }
                finally
                {
                    cn.Close();
                }
            }
            else
                return false;
        }

        public void armarParametros(ref SqlCommand Comando, Usuario usuario)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@USUARIO", SqlDbType.NVarChar, 50);
            SqlParametros.Value = usuario.usuario;
            SqlParametros = Comando.Parameters.Add("@NOMBRE", SqlDbType.NVarChar, 50);
            SqlParametros.Value = usuario.nombre;
            SqlParametros = Comando.Parameters.Add("@APELLIDO", SqlDbType.NVarChar, 50);
            SqlParametros.Value = usuario.apelido;
            SqlParametros = Comando.Parameters.Add("@EMAIL", SqlDbType.NVarChar, 50);
            SqlParametros.Value = usuario.email;
            SqlParametros = Comando.Parameters.Add("@CONTRASEÑA", SqlDbType.NVarChar, 50);
            SqlParametros.Value = usuario.contra;
            SqlParametros = Comando.Parameters.Add("@TELEFONO", SqlDbType.NVarChar, 50);
            SqlParametros.Value = usuario.telefono;
            SqlParametros = Comando.Parameters.Add("@COD_PAIS", SqlDbType.Int);
            SqlParametros.Value = usuario.cod_pais;
            SqlParametros = Comando.Parameters.Add("@ADMINISTRADOR", SqlDbType.Bit);
            SqlParametros.Value = usuario.administrador;
        }

        public bool ActualizarUsuarios(Usuario usuario)
        {
            SqlCommand Comando = new SqlCommand();
            armarParametros(ref Comando, usuario);
            int filasInsertadas = ds.EjecutarProcedimientoAlmacenado(Comando, "spActualizarUsuario");
            if (filasInsertadas == 1)
                return true;
            else
                return false;
        }

        public int eliminarUsuarios(Usuario usuario)
        {
            SqlCommand comando = new SqlCommand();
            armarParametros(ref comando, usuario);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarUsuario");
        }

        public bool insertarUsuario(Usuario usuario)
        {
            SqlCommand Comando = new SqlCommand();
            armarParametros(ref Comando, usuario);
            int filasInsertadas = ds.EjecutarProcedimientoAlmacenado(Comando, "spInsertarUsuario");
            if (filasInsertadas == 1)
                return true;
            else
                return false;
        }
    }
}
