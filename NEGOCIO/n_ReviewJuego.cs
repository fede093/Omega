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
    public class n_ReviewJuego
    {
        public bool InsertarReviewJuego(Review_Juego review_juego)
        {
            DatosReviewJuego rj = new DatosReviewJuego();
            return rj.InsertarReviewJuego(review_juego);
        }

        public bool ExisteReviewJuego(Review_Juego review_juego)
        {
            DatosReviewJuego djr = new DatosReviewJuego();
            return djr.ExisteReviewJuego(review_juego);
        }
    }
}
