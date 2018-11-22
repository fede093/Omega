﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ENTIDAD;

namespace DATOS
{
    public class DatosJuego
    {
        AccesoDatos ds = new AccesoDatos();
        public DataTable getTablaJuegos()
        {
            DataTable tabla = ds.ObtenerTabla("Juego", "Select * from Juego inner join Genero on Juego.Genero = Genero.Cod_Genero;");
            return tabla;
        }

        public void armarParametros(ref SqlCommand Comando, Juego juego)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@COD_JUEGO", SqlDbType.Int);
            SqlParametros.Value = juego.id_juego;
            SqlParametros = Comando.Parameters.Add("@NOMBRE", SqlDbType.NVarChar, 50);
            SqlParametros.Value = juego.nombre;
            SqlParametros = Comando.Parameters.Add("@DESCRIPCION", SqlDbType.NVarChar, 50);
            SqlParametros.Value = juego.descripcion;
            SqlParametros = Comando.Parameters.Add("@FECHA", SqlDbType.Date);
            SqlParametros.Value = juego.fecha_lanzamiento;
            SqlParametros = Comando.Parameters.Add("@DESARROLLADOR", SqlDbType.NVarChar, 50);
            SqlParametros.Value = juego.desarrollador;
            SqlParametros = Comando.Parameters.Add("@DISTRIBUIDOR", SqlDbType.NVarChar, 50);
            SqlParametros.Value = juego.distribuidor;
            SqlParametros = Comando.Parameters.Add("@GENERO", SqlDbType.Int);
            SqlParametros.Value = juego.cod_genero;
            SqlParametros = Comando.Parameters.Add("@IDIOMA", SqlDbType.NVarChar, 50);
            SqlParametros.Value = juego.idioma;
            SqlParametros = Comando.Parameters.Add("@PRECIO", SqlDbType.Float);
            SqlParametros.Value = juego.precio;
            SqlParametros = Comando.Parameters.Add("@RUTA_IMAGEN", SqlDbType.NVarChar, 100);
            SqlParametros.Value = juego.ruta_imagen;
            SqlParametros = Comando.Parameters.Add("@CLASIFICACION", SqlDbType.NVarChar, 50);
            SqlParametros.Value = juego.clasificacion;
            SqlParametros = Comando.Parameters.Add("@PAGINA_OFICIAL", SqlDbType.NVarChar, 50);
            SqlParametros.Value = juego.pagina;
        }

        public bool ActualizarJuegos(Juego juego)
        {
            SqlCommand Comando = new SqlCommand();
            armarParametros(ref Comando, juego);
            int filasInsertadas = ds.EjecutarProcedimientoAlmacenado(Comando, "spActualizarJuego");
            if (filasInsertadas == 1)
                return true;
            else
                return false;
        }

        public int eliminarJuegos(Juego juego)
        {
            SqlCommand comando = new SqlCommand();
            armarParametros(ref comando, juego);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarJuego");
        }

        public bool insertarJuego(Juego juego)
        {
            SqlCommand Comando = new SqlCommand();
            armarParametros(ref Comando, juego);
            int filasInsertadas = ds.EjecutarProcedimientoAlmacenado(Comando, "spInsertarJuego");
            if (filasInsertadas == 1)
                return true;
            else
                return false;
        }
    }
}