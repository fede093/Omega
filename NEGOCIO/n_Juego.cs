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
    public class n_Juego
    {
        public DataTable getTabla()
        {
            DatosJuego da = new DatosJuego();
            return da.getTablaJuegos();
        }

        public bool editarJuego(Juego juego)
        {
            DatosJuego da = new DatosJuego();
            return da.ActualizarJuegos(juego);
        }
    }
}
