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

        public DataTable getTabla(String nombre)
        {
            DatosJuego da = new DatosJuego();
            return da.getTablaJuegos(nombre);
        }

        public DataTable getTabla(int id)
        {
            DatosJuego da = new DatosJuego();            
            return da.getTablaJuegos(id);
        }

        public DataTable getTablaPorGenero(int id)
        {
            DatosJuego da = new DatosJuego();
            return da.getTablaJuegosPorGenero(id);
        }

        public bool editarJuego(Juego juego)
        {
            DatosJuego da = new DatosJuego();
            return da.ActualizarJuegos(juego);
        }

        public int eliminarJuego(Juego juego)
        {
            DatosJuego da = new DatosJuego();
            return da.eliminarJuegos(juego);
        }

        public bool agregarJuego(Juego juego)
        {
            DatosJuego da = new DatosJuego();
            return da.insertarJuego(juego);
        }

        public String getTablaPorNombre(String nombre)
        {
            String cod = "";
            DatosJuego da = new DatosJuego();
            DataTable dt = da.getTablaJuegoNombre(nombre);
            cod = dt.Rows[0][0].ToString();
            return cod;
        }

        public bool existeJuego(String juego)
        {
            DatosJuego da = new DatosJuego();
            return da.juegoExiste(juego);
        }
    }
}
