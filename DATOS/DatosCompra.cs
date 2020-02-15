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

        public static DataTable CrearCarrito()
        {
            DataTable dt = new DataTable();
            //el DataTable de la cesta tendrá
            //tres campos: idLibro, titulo y precio
            DataColumn dc = new DataColumn("Nombre juego", System.Type.GetType("System.String"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Precio", System.Type.GetType("System.Decimal"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Desarrollador", System.Type.GetType("System.String"));
            dt.Columns.Add(dc);
            dc = new DataColumn("Genero", System.Type.GetType("System.Int32"));
            dt.Columns.Add(dc);
            return dt;
        }

        public void EjecutarCompra(DataTable carrito, Compra compra)
        {
            AccesoDatos datos = new AccesoDatos();
            SqlConnection conexion = datos.ObtenerConexion();
            //inserta un registro en la tabla de ventas
            //por cada elemento del DataTable cesta
            for (int i = 0; i < carrito.Rows.Count; i++)
            {
                String sql = "Insert into Compra ";
                sql += "(cod_medio, fecha_compra, Numero_juegos, Estado) ";
                sql += "values (";
                sql += compra.cod_medio + ",";
                sql += "'" + compra.fecha_compra + "'";   ////POSIBLEMENTE DE ERROR FECHA==STRING??
                sql += "," + compra.numero_juegos + ",";
                sql += "'" + compra.estado + "')";
                SqlCommand cmd = new SqlCommand(sql, conexion);
                cmd.ExecuteNonQuery();
            }
            conexion.Close();
        }

        public void AgregarCarrito(DataTable Carrito, Juego juego)
        {
            DataRow dr = Carrito.NewRow();
            dr["Nombre juego"] = juego.nombre;
            dr["Precio"] = juego.precio;
            dr["Desarrollador"] = juego.desarrollador;
            dr["Genero"] = juego.cod_genero;
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
