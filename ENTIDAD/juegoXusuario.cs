using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class juegoXusuario
    {
        private int i_cod_compar;
        private int i_id_juego;
        private String s_usuario;

        public int cod_compra
        {
            set { i_cod_compar = value; }
            get { return i_cod_compar; }
        }


        public int id_juego
        {
            set { i_id_juego = value; }
            get { return i_id_juego; }
        }

        public String usuario
        {
            set { s_usuario = value; }
            get { return s_usuario; }
        }
    }
}
