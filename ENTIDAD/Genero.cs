using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class Genero
    {
        private String s_nombre;
        private int i_codGenero;
        private bool b_estado;

        public bool estado
        {
            set { b_estado = value; }
            get { return b_estado; }
        }

        public String nombre
        {
            set { s_nombre = value; }
            get { return s_nombre; }
        }

        public int cod_genero
        {
            set { i_codGenero = value; }
            get { return i_codGenero; }
        }
    }
}
