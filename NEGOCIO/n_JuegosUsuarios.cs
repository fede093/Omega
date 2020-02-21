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

        public bool ExisteCompra(String usuario, int cod)
        {
            DatosJuegosUsuarios Datosjuego_usuario = new DatosJuegosUsuarios();
            juegoXusuario juego_usuario = new juegoXusuario();
            juego_usuario.cod_compra = 0; ///NO SE USA
            juego_usuario.id_juego = cod;
            juego_usuario.usuario = usuario;
            return Datosjuego_usuario.JuegoUsuarioExiste(juego_usuario);
        }
    }
}
