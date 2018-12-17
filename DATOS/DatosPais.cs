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
            armarParametros(ref comando, pais);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarPais");
        }

        public bool agregarPais(Pais pais)
        {
            SqlConnection cn = ds.ObtenerConexion();

            if (cn != null)
            {
                SqlCommand cmd;
                String sql = "INSERT INTO Pais (NombrePais, Estado)" +
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
    }
}
