using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTIDAD;
using DATOS;
using System.Data;

namespace NEGOCIO
{
    public class n_Medio
    {
        public String getTablaPorDescripcion(String Descripcion)
        {
            String cod = "";
            DatosMedios da = new DatosMedios();
            DataTable dt = da.getTablaMedioDescripcion(Descripcion);
            cod = dt.Rows[0][0].ToString();
            return cod;
        }

        public DataTable getTabla()
        {
            DatosMedios da = new DatosMedios();
            return da.getTablaMedios();
        }

        public bool editarMedio(MedioPago medio)
        {
            DatosMedios da = new DatosMedios();
            return da.ActualizarMedios(medio);
        }

        public int eliminarMedio(MedioPago medio)
        {
            DatosMedios da = new DatosMedios();
            return da.eliminarMedios(medio);
        }

        public bool agregarMedio(MedioPago medio)
        {
            DatosMedios da = new DatosMedios();
            return da.agregarMedio(medio);
        }

        public bool existeMedio(String medio)
        {
            DatosMedios da = new DatosMedios();
            return da.medioExiste(medio);
        }
    }
}
