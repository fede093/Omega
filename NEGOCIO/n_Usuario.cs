using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTIDAD;
using DATOS;
using System.Data;
using System.Data.SqlClient;

namespace NEGOCIO
{
    public class n_Usuario
    {
        public DataTable getTabla()
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.getTablaUsuarios();
        }

        public DataTable getTabla(String usuario)
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.getTablaUsuarios(usuario);
        }

        public DataTable getTabla(int cod_pais)
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.getTablaUsuarios(cod_pais);
        }

        public DataTable getJuegosComprados(String usuario)
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.getJuegosComprados(usuario);
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

        public DataTable cargarUsuario(String usuario)
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.getTablaUsuario(usuario);
        }

        public bool estaRegistrado(String usuario, String clave)
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.estaRegistrado(usuario, clave);
        }

        public bool esAdministrador(String usuario)
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.esAdministrador(usuario);
        }

        public bool enBaseDatos(String usuario)
        {
            DatosUsuarios da = new DatosUsuarios();
            return da.enBaseDatos(usuario);
        }
    }
}
