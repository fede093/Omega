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
    public class DatosMedios
    {
        AccesoDatos ds = new AccesoDatos();
        public DataTable getTablaMedios()
        {
            List<MedioPago> lista = new List<MedioPago>();
            DataTable tabla = ds.ObtenerTabla("MedioPago", "Select * from MedioPago where Estado=1");
            return tabla;
        }

        public DataTable getTablaMedioDescripcion(String descripcion)
        {
            DataTable tabla = ds.ObtenerTabla("MedioPago", "Select * from MedioPago where Descripcion='" + descripcion + "'");
            return tabla;
        }

        public void armarParametros(ref SqlCommand Comando, MedioPago medio)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@COD_MEDIO", SqlDbType.Int);
            SqlParametros.Value = medio.cod_medio;
            SqlParametros = Comando.Parameters.Add("@DESCRIPCION", SqlDbType.NVarChar, 50);
            SqlParametros.Value = medio.descripcion;
            SqlParametros = Comando.Parameters.Add("@ESTADO", SqlDbType.Bit);
            SqlParametros.Value = medio.estado;
        }

        public void armarParametrosCorto(ref SqlCommand Comando, MedioPago medio)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@COD_MEDIO", SqlDbType.Int);
            SqlParametros.Value = medio.cod_medio;            
            SqlParametros = Comando.Parameters.Add("@ESTADO", SqlDbType.Bit);
            SqlParametros.Value = medio.estado;
        }

        public bool ActualizarMedios(MedioPago medio)
        {
            SqlCommand Comando = new SqlCommand();
            armarParametros(ref Comando, medio);
            int filasInsertadas = ds.EjecutarProcedimientoAlmacenado(Comando, "spActualizarMedio");
            if (filasInsertadas == 1)
                return true;
            else
                return false;
        }

        public int eliminarMedios(MedioPago medio)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosCorto(ref comando, medio);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarMedio");
        }

        public bool agregarMedio(MedioPago medio)
        {
            SqlConnection cn = ds.ObtenerConexion();

            if (cn != null)
            {
                SqlCommand cmd;
                String sql = "INSERT INTO MedioPago (Descripcion, Estado)" +
                              "VALUES('" + medio.descripcion + "', 'true')";

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

        public bool medioExiste(String medio)
        {
            SqlConnection cn = ds.ObtenerConexion();
            SqlCommand cmd;
            SqlDataReader dr;
            String sql =
            "Select * From MedioPago Where Descripcion='" + medio + "'and Estado=0";
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
