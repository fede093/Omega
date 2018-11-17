using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class Review
    {
        private int i_codReview;
        private int i_idJuego;
        private String s_codUsuario;
        private String s_review;

        public int cod_review
        {
            set { i_codReview = value; }
            get { return i_codReview; }
        }

        public int id_juego
        {
            set { i_idJuego = value; }
            get { return i_idJuego; }
        }

        public String cod_usuario
        {
            set { s_codUsuario = value; }
            get { return s_codUsuario; }
        }

        public String review
        {
            set { s_review = value; }
            get { return s_review; }
        }
    }
}
