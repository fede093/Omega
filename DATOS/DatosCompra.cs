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

        public DataTable getTablaCompra()
        {            
            DataTable tabla = ds.ObtenerTabla("Pais", "Select * from Compra inner join MedioPago on " +
                "Compra.cod_medio = MedioPago.Cod_MPago where Compra.Estado=1");
            return tabla;
        }

        public Compra ObtenerUltimaCompra()
        {
            SqlConnection conexion = ds.ObtenerConexion();
            SqlDataReader dr;
            String consulta = "select top 1 * from Compra order by cod_compra desc";
            if (conexion != null)
            {
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                try
                {
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Compra com = new Compra();
                        com.cod_compra = (int)dr["cod_compra"];
                        com.cod_medio = (int)dr["cod_medio"];
                        com.fecha_compra = (DateTime)dr["fecha_compra"];
                        com.numero_juegos = (int)dr["Numero_juegos"];
                        com.estado = (bool)dr["Estado"];

                        return com;
                    }
                    else
                        return null;
                }
                catch (SqlException ex)
                {
                    return null;
                }
                finally
                {
                    conexion.Close();
                }
            }
            else
                return null;
        }

        public static DataTable CrearCarrito()
        {
            DataTable dt = new DataTable();
            //el DataTable de la cesta tendrá
            //tres campos: idLibro, titulo y precio
            DataColumn dc = new DataColumn("Codigo del juego", System.Type.GetType("System.Int32"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Nombre juego", System.Type.GetType("System.String"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Precio", System.Type.GetType("System.Decimal"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Desarrollador", System.Type.GetType("System.String"));
            dt.Columns.Add(dc);
            return dt;
        }

        public bool InsertaCompra(Compra compra)
        {
            AccesoDatos datos = new AccesoDatos();
            SqlConnection conexion = datos.ObtenerConexion();
            if (conexion != null)
            {
                String sql = "Insert into Compra ";
                sql += "(cod_medio, fecha_compra, Numero_juegos, Estado, PrecioTotal) ";
                sql += "values (";
                sql += compra.cod_medio + ",";
                sql += "'" + compra.fecha_compra + "'";
                sql += "," + compra.numero_juegos + ",";
                sql += "'" + compra.estado + "'";
                sql += "," + compra.precioTotal + ")";
                SqlCommand cmd = new SqlCommand(sql, conexion);

                try
                {
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (SqlException ex)
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

        public void AgregarCarrito(DataTable Carrito, Juego juego)
        {
            DataRow dr = Carrito.NewRow();
            dr["Codigo del juego"] = juego.id_juego;
            dr["Nombre juego"] = juego.nombre;
            dr["Precio"] = juego.precio;
            dr["Desarrollador"] = juego.desarrollador;
            Carrito.Rows.Add(dr);
        }

        public void EliminaCarrito(DataTable Carrito, int posicion)
        {
            Carrito.Rows.RemoveAt(posicion);
            if (Carrito.Rows.Count == 0)
                Carrito = null;
        }
    }
}
