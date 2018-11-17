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
            List<Review> lista = new List<Review>();
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
    }
}
