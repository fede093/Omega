using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTIDAD;
using System.Data;
using System.Data.SqlClient;

namespace DATOS
{
    public class DatosReview
    {
        AccesoDatos ds = new AccesoDatos();
        public DataTable getTablaReviews()
        {            
            DataTable tabla = ds.ObtenerTabla("Review", "Select * from Review");
            return tabla;
        }

        public int eliminarReviews(Review review)
        {
            SqlCommand comando = new SqlCommand();
            armarParametros(ref comando, review);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarReview");
        }

        public void armarParametros(ref SqlCommand Comando, Review review)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@COD_REVIEW", SqlDbType.Int);
            SqlParametros.Value = review.cod_review;
        }

        public bool insertarReview(Review review)
        {
            SqlConnection cn = ds.ObtenerConexion();

            if (cn != null)
            {
                SqlCommand cmd;
                String sql = "INSERT INTO Review(Detalle, Fecha_review, Estado) values('" 
                    + review.detalle + "', '" + review.fecha_review + "', '" + review.estado + "')";

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
