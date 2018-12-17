using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class MedioPago
    {
        private String s_descripcion;
        private int i_codMedio;
        private bool b_estado;

        public bool estado
        {
            set { b_estado = value; }
            get { return b_estado; }
        }

        public String descripcion
        {
            set { s_descripcion = value; }
            get { return s_descripcion; }
        }

        public int cod_medio
        {
            set { i_codMedio = value; }
            get { return i_codMedio; }
        }
    }
}
