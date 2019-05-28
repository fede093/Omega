﻿using ENTIDAD;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DATOS
{
    public class DatosGenero
    {
        AccesoDatos ds = new AccesoDatos();
        public DataTable getTablaGeneros()
        {
            DataTable tabla = ds.ObtenerTabla("Genero", "Select * from Genero where estado=1");
            return tabla;
        }

        public bool agregarGenero(Genero gen)
        {
            SqlConnection cn = ds.ObtenerConexion();

            if (cn != null)
            {
                SqlCommand cmd;
                String sql = "INSERT INTO Genero (Nombre, Estado)" +
                              "VALUES('" + gen.nombre + "', 'true')";

                cmd = new SqlCommand(sql, cn);
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
                    cn.Close();
                }
            }
            else
                return false;
        }

        public void armarParametros(ref SqlCommand Comando, Genero gen)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@COD_GENERO", SqlDbType.Int);
            SqlParametros.Value = gen.cod_genero;
            SqlParametros = Comando.Parameters.Add("@NOMBRE", SqlDbType.NVarChar, 50);
            SqlParametros.Value = gen.nombre;
            SqlParametros = Comando.Parameters.Add("@ESTADO", SqlDbType.Bit);
            SqlParametros.Value = gen.estado;
        }

        public bool ActualizarGeneros(Genero gen)
        {
            SqlCommand Comando = new SqlCommand();
            armarParametros(ref Comando, gen);
            int filasInsertadas = ds.EjecutarProcedimientoAlmacenado(Comando, "spActualizarGenero");
            if (filasInsertadas == 1)
                return true;
            else
                return false;
        }

        public int eliminarGeneros(Genero gen)
        {
            SqlCommand comando = new SqlCommand();
            armarParametros(ref comando, gen);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarGenero");
        }
    }
}
