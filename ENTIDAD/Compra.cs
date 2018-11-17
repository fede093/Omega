using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class Compra
    {
        private int i_codCompra;
        private int i_idJuego;
        private String i_codUsuario;
        private int i_codMedio;
        private DateTime d_fechaCompra;

        public int cod_compra
        {
            set { i_codCompra = value; }
            get { return i_codCompra; }
        }

        public int id_juego
        {
            set { i_idJuego = value; }
            get { return i_idJuego; }
        }

        public String cod_usuario
        {
            set { i_codUsuario = value; }
            get { return i_codUsuario; }
        }

        public int cod_medio
        {
            set { i_codMedio = value; }
            get { return i_codMedio; }
        }

        public DateTime fecha_compra
        {
            set { d_fechaCompra = value; }
            get { return d_fechaCompra; }
        }
    }
}
