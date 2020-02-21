using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NEGOCIO;

namespace PRESENTACION
{
    public partial class FormCompraIndividual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGrilla();
            }
        }

        public void cargarGrilla()
        {
            n_JuegosUsuarios juego_usuario = new n_JuegosUsuarios();
            String cod = Request.QueryString["cod"];
            System.Diagnostics.Debug.WriteLine(cod);
            gvCompraIndividual.DataSource = juego_usuario.getTablaCompraIndividual(int.Parse(cod));
            gvCompraIndividual.DataBind();
        }
    }
}