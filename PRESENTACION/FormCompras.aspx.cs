using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NEGOCIO;
using ENTIDAD;


namespace PRESENTACION
{
    public partial class FormCompras : System.Web.UI.Page
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
            n_Compra n_compra= new n_Compra();
            gvCompras.DataSource = n_compra.getTablaCompra();
            gvCompras.DataBind();
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "cod_compra")
            {
                Response.Redirect("FormCompraIndividual.aspx?cod=" + e.CommandArgument.ToString());
            }
        }

        protected void gvCompras_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCompras.PageIndex = e.NewPageIndex;
            cargarGrilla();
        }
    }
}