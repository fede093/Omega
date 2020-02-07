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
    public class DatosPais
    {
        AccesoDatos ds = new AccesoDatos();
        public DataTable getTablaPaises()
        {
            List<Pais> lista = new List<Pais>();
            DataTable tabla = ds.ObtenerTabla("Pais", "Select * from Pais where estado=1");
            return tabla;
        }

        public DataTable getTablaPaisNombre(String nombre)
        {
            DataTable tabla = ds.ObtenerTabla("Pais", "Select * from Pais where Nombre='" + nombre + "'");
            return tabla;
        }

        public void armarParametros(ref SqlCommand Comando, Pais pais)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@COD_PAIS", SqlDbType.Int);
            SqlParametros.Value = pais.cod_pais;
            SqlParametros = Comando.Parameters.Add("@NOMBRE", SqlDbType.NVarChar, 50);
            SqlParametros.Value = pais.nombre;
            SqlParametros = Comando.Parameters.Add("@ESTADO", SqlDbType.Bit);
            SqlParametros.Value = pais.estado;
        }

        public void armarParametrosCorto(ref SqlCommand Comando, Pais pais)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@COD_PAIS", SqlDbType.Int);
            SqlParametros.Value = pais.cod_pais;            
            SqlParametros = Comando.Parameters.Add("@ESTADO", SqlDbType.Bit);
            SqlParametros.Value = pais.estado;
        }

        public bool ActualizarPaises(Pais pais)
        {
            SqlCommand Comando = new SqlCommand();
            armarParametros(ref Comando, pais);
            int filasInsertadas = ds.EjecutarProcedimientoAlmacenado(Comando, "spActualizarPais");
            if (filasInsertadas == 1)
                return true;
            else
                return false;
        }

        public int eliminarPais(Pais pais)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosCorto(ref comando, pais);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarPais");
        }

        public bool agregarPais(Pais pais)
        {
            SqlConnection cn = ds.ObtenerConexion();

            if (cn != null)
            {
                SqlCommand cmd;
                String sql = "INSERT INTO Pais (Nombre, Estado)" +
                              "VALUES('" + pais.nombre + "', 'true')";

                cmd = new SqlCommand(sql, cn);
                try
                {
                    cmd.ExecuteNonQuery();
                    return true;
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

        public bool paisExiste(String pais)
        {
            SqlConnection cn = ds.ObtenerConexion();
            SqlCommand cmd;
            SqlDataReader dr;
            String sql =
            "Select * From Pais Where Nombre='" + pais + "'and Estado=0";
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
    }
}
