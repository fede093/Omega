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
    public class DatosMedios
    {
        AccesoDatos ds = new AccesoDatos();
        public DataTable getTablaMedios()
        {
            List<MedioPago> lista = new List<MedioPago>();
            DataTable tabla = ds.ObtenerTabla("MedioPago", "Select * from MedioPago");
            return tabla;
        }

        public void armarParametros(ref SqlCommand Comando, MedioPago medio)
        {
            SqlParameter SqlParametros = new SqlParameter();

            SqlParametros = Comando.Parameters.Add("@COD_MEDIO", SqlDbType.Int);
            SqlParametros.Value = medio.cod_medio;
            SqlParametros = Comando.Parameters.Add("@DESCRIPCION", SqlDbType.NVarChar, 50);
            SqlParametros.Value = medio.descripcion;
        }

        public bool ActualizarMedios(MedioPago medio)
        {
            SqlCommand Comando = new SqlCommand();
            armarParametros(ref Comando, medio);
            int filasInsertadas = ds.EjecutarProcedimientoAlmacenado(Comando, "spActualizarMedio");
            if (filasInsertadas == 1)
                return true;
            else
                return false;
        }

        public int eliminarMedios(MedioPago medio)
        {
            SqlCommand comando = new SqlCommand();
            armarParametros(ref comando, medio);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarMedio");
        }

        public bool agregarMedio(MedioPago medio)
        {
            SqlConnection cn = ds.ObtenerConexion();

            if (cn != null)
            {
                SqlCommand cmd;
                String sql = "INSERT INTO MedioPago (Descripcion)" +
                              "VALUES('" + medio.descripcion + "')";

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
    }
}