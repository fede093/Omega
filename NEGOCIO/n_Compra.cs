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
    public class n_Compra
    {
        public static DataTable CrearCarrito()
        {
            DataTable dt = new DataTable();
            dt = DatosCompra.CrearCarrito();
            return dt;
        }

        public void agregarCarrito(DataTable carrito, Juego juego)
        {
            DatosCompra dc = new DatosCompra();
            dc.AgregarCarrito(carrito, juego);
        }

        public void eliminarCarrito(DataTable carrito, int posicion)
        {
            DatosCompra dc = new DatosCompra();
            dc.EliminaCarrito(carrito, posicion);
        }

        public void ejecutarCompra(DataTable carrito, Compra compra)
        {
            DatosCompra dc = new DatosCompra();            
            dc.InsertaCompra(carrito, compra);
        }
    }
}
