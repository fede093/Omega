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
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaCompraIndividual(int cod)
        {
            DataTable tabla = datos.ObtenerTabla("Pais", "select juegoXusuario.Cod_Compra, juegoXusuario.Cod_Usuario, Juego.Nombre from juegoXusuario " +
                "inner join Juego on juegoXusuario.Id_juego = Juego.Id_juego where Cod_Compra =" + cod);
            return tabla;
        }

        public bool InsertaCompra(DataTable carrito, juegoXusuario juego_usuario)
        {            
            SqlConnection conexion = datos.ObtenerConexion();
            if (conexion != null)
            {
                try
                {
                    for (int i = 0; i < carrito.Rows.Count; i++)
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
                    return true;
                }
                catch(SqlException ex)
                {
                    return false;
                }
                finally
                {
                    conexion.Close();
                }                
            }
            else
                return false;
        }

        public bool JuegoUsuarioExiste(juegoXusuario juego_usuario)
        {
            SqlConnection cn = datos.ObtenerConexion();
            SqlCommand cmd;
            SqlDataReader dr;
            String sql =
            "select * from juegoXusuario where Id_juego=" + juego_usuario.id_juego + "AND Cod_Usuario='" + juego_usuario.usuario + "'";
            if (cn != null)
            {
                cmd = new SqlCommand(sql, cn);
                try
                {
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                        return true;
                    else
                        return false;
                }
                catch (SqlException ex)
                {
                    return false;
                }
                finally
                {
                    cn.Close();
                }
            }
            else
                return false;
        }
    }
}
