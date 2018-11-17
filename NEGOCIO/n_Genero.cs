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
    public class n_Genero
    {
        public DataTable getTablaG()
        {
            DatosGenero da = new DatosGenero();
            return da.getTablaGeneros();
        }

        public bool agregarGen(Genero gen)
        {
            DatosGenero da = new DatosGenero();
            return da.agregarGenero(gen);
        }

        public bool editarGenero(Genero genero)
        {
            DatosGenero da = new DatosGenero();
            return da.ActualizarGeneros(genero);
        }

        public int eliminarGenero(Genero genero)
        {
            DatosGenero da = new DatosGenero();
            return da.eliminarGeneros(genero);
        }
    }
}
