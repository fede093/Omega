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
    public class DatosReviewJuego
    {
        AccesoDatos ds = new AccesoDatos();

        public bool InsertarReviewJuego(Review_Juego review_juego)
        {
            SqlConnection cn = ds.ObtenerConexion();

            if (cn != null)
            {
                SqlCommand cmd;
                String sql = "INSERT INTO RevXJue (Cod_Review, Cod_Usuario, Id_juego) values(" + 
                    review_juego.cod_review + ", '" + review_juego.cod_usuario + "', " + review_juego.cod_juego +")";

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

        public bool ExisteReviewJuego(Review_Juego review_juego)
        {
            SqlConnection cn = ds.ObtenerConexion();
            SqlCommand cmd;
            SqlDataReader dr;
            String sql =
            "select * from RevXJue where Id_juego=" + review_juego.cod_juego + "AND Cod_Usuario='" + review_juego.cod_usuario + "'";
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
