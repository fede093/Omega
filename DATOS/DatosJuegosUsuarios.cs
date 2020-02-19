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
    public class DatosJuegosUsuarios
    {
        public void InsertaCompra(DataTable carrito, juegoXusuario juego_usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            SqlConnection conexion = datos.ObtenerConexion();

            for(int i=0;i<carrito.Rows.Count;i++)
            {
                String sql = "Insert into juegoXusuario ";
                sql += "(Cod_Compra, Id_juego, Cod_Usuario) ";
                sql += "values (";
                sql += juego_usuario.cod_compra + ",";
                sql += carrito.Rows[i]["Codigo del juego"] + ",";                
                sql += "'" + juego_usuario.usuario + "')";
                SqlCommand cmd = new SqlCommand(sql, conexion);
                cmd.ExecuteNonQuery();
            }

            conexion.Close();
        }
    }
}
