using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using ENTIDAD;
using DATOS;

namespace NEGOCIO
{
    public class n_Pais
    {
        public DataTable getTabla()
        {
            DatosPais da = new DatosPais();
            return da.getTablaPaises();
        }

        public bool editarPais(Pais pais)
        {
            DatosPais da = new DatosPais();
            return da.ActualizarPaises(pais);
        }

        public int eliminarPais(Pais pais)
        {
            DatosPais da = new DatosPais();
            return da.eliminarPais(pais);
        }

        public bool agregarPais(Pais pais)
        {
            DatosPais da = new DatosPais();
            return da.agregarPais(pais);
        }

        public bool existePais(String pais)
        {
            DatosPais da = new DatosPais();
            return da.paisExiste(pais);
        }

        public String getTablaPorNombre(String nombre)
        {
            String cod = "";
            DatosPais da = new DatosPais();
            DataTable dt = da.getTablaPaisNombre(nombre);
            cod = dt.Rows[0][0].ToString();
            return cod;
        }
    }
}
