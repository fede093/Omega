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
