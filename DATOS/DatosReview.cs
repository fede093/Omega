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
            DataTable tabla = ds.ObtenerTabla("Review", "select RevXJue.Cod_Review, Juego.Nombre, RevXJue.Cod_Usuario, " +
                "Review.Detalle, Review.Fecha_review from Review inner join RevXJue on Review.Cod_review=RevXjue.Cod_Review " +
                "inner join Juego on Juego.Id_juego=RevXJue.Id_juego");
            return tabla;
        }

        public DataTable getTablaReviewJuego(int cod)
        {
            DataTable tabla = ds.ObtenerTabla("Review", "select Review.Detalle, Review.Fecha_review,  RevXJue.Cod_Usuario, RevXJue.Id_juego from Review " +
                "inner join RevXJue on Review.Cod_review=RevXJue.Cod_Review where Id_juego=" + cod);
            return tabla;
        }

        public int eliminarReviews(Review review)
        {
            SqlCommand comando = new SqlCommand();
            armarParametros(ref comando, review);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarReview");
        }

        public int editarReview(Review review)
        {
            SqlCommand comando = new SqlCommand();
            armarParametros(ref comando, review);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spActualizarReview");
        }

        public void armarParametros(ref SqlCommand Comando, Review review)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@COD_REVIEW", SqlDbType.Int);
            SqlParametros.Value = review.cod_review;
            SqlParametros = Comando.Parameters.Add("@FECHA", SqlDbType.Date);
            SqlParametros.Value = review.fecha_review;
            SqlParametros = Comando.Parameters.Add("@DETALLE", SqlDbType.NVarChar, 1000);
            SqlParametros.Value = review.detalle;
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

        public Review ObtenerUltimoReview()
        {
            SqlConnection conexion = ds.ObtenerConexion();
            SqlDataReader dr;
            String consulta = "select top 1 * from Review order by Cod_review desc";
            if (conexion != null)
            {
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                try
                {
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Review review = new Review();
                        review.cod_review = (int)dr["Cod_review"];
                        review.detalle = (string)dr["Detalle"];
                        review.fecha_review = (DateTime)dr["Fecha_review"];
                        review.estado = (bool)dr["Estado"];

                        return review;
                    }
                    else
                        return null;
                }
                catch (SqlException ex)
                {
                    return null;
                }
                finally
                {
                    conexion.Close();
                }
            }
            else
                return null;
        }
    }
}
