using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATOS;
using ENTIDAD;
using System.Data;

namespace NEGOCIO
{
    public class n_JuegosUsuarios
    {
        public bool InsertaCompra(DataTable carrito, juegoXusuario juego_usuario)
        {
            DatosJuegosUsuarios datosJuegoUsuario = new DatosJuegosUsuarios();
            return datosJuegoUsuario.InsertaCompra(carrito, juego_usuario);
        }
    }
}
