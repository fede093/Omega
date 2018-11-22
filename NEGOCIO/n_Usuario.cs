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
    public class n_Usuario
    {
        public DataTable getTabla()
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.getTablaUsuarios();
        }

        public bool editarUsuario(Usuario usuario)
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.ActualizarUsuarios(usuario);
        }

        public int eliminarUsuario(Usuario usuario)
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.eliminarUsuarios(usuario);
        }

        public bool agregarUsuario(Usuario usuario)
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.insertarUsuario(usuario);
        }
    }
}
