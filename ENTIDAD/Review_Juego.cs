using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class Review_Juego
    {
        private int i_codReview;
        private int i_codJuego;
        private String s_codUsuario;

        public int cod_review
        {
            set { i_codReview = value; }
            get { return i_codReview; }
        }

        public int cod_juego
        {
            set { i_codJuego= value; }
            get { return i_codJuego; }
        }

        public String cod_usuario
        {
            set { s_codUsuario = value; }
            get { return s_codUsuario; }
        }
    }
}
