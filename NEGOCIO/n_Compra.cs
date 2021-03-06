﻿using System;
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
        public DataTable getTablaCompra()
        {
            DatosCompra dc = new DatosCompra();
            return dc.getTablaCompra();
        }

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

        public bool ejecutarCompra(Compra compra)
        {           
            DatosCompra dc = new DatosCompra();            
            return dc.InsertaCompra(compra);
        }

        public Compra ObtenerUltimaCompra()
        {
            DatosCompra dc = new DatosCompra();
            return dc.ObtenerUltimaCompra();
        }
    }
}
