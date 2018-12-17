using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class DetallesCompra
    {
        private int i_codCompra;
        private int i_codMedio;
        private DateTime d_fecha_modificacion;
        private bool b_estado;

        public int cod_compra
        {
            set { i_codCompra = value; }
            get { return i_codCompra; }
        }

        public int cod_medio
        {
            set { i_codMedio = value; }
            get { return i_codMedio; }
        }

        public DateTime fecha_modificacion
        {
            set { d_fecha_modificacion = value; }
            get { return d_fecha_modificacion; }
        }

        public bool estado
        {
            set { b_estado = value; }
            get { return b_estado; }
        }
    }
}
