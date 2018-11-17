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
    }
}
