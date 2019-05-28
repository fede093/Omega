using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ENTIDAD;

namespace DATOS
{
    public class DatosCompra
    {
        AccesoDatos ds = new AccesoDatos();
        public DataTable getTablaCompras()
        {
            ///////////////MODIFICAR ESTO
            List<Compra> lista = new List<Compra>();
            DataTable tabla = ds.ObtenerTabla("Compra", "SELECT DetallesCompra.cod_compra, cod_medio, fecha_compra, Id_juego, Cod_Usuario " +
                "FROM DetallesCompra INNER JOIN juegoXusuario ON DetallesCompra.cod_compra = juegoXusuario.Cod_Compra;");
            return tabla;
        }
    }
}
