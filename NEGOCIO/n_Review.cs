using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTIDAD;
using DATOS;
using System.Data;


namespace NEGOCIO
{
    public class n_Review
    {
        public DataTable getTabla()
        {
            DatosReview da = new DatosReview();
            return da.getTablaReviews();
        }

        public int eliminarReview(Review review)
        {
            DatosReview da = new DatosReview();
            return da.eliminarReviews(review);
        }

        public bool insertarReview(Review review)
        {
            DatosReview dr = new DatosReview();
            return dr.insertarReview(review);
        }

        public Review ObtenerUltimoReview()
        {
            DatosReview dr = new DatosReview();
            return dr.ObtenerUltimoReview();
        }

        public int editarReview(Review review)
        {
            DatosReview dr = new DatosReview();
            return dr.editarReview(review);
        }
    }
}
