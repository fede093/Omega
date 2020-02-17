using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NEGOCIO;
using System.Data;

namespace PRESENTACION
{
    public partial class CarritoCompras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["carritoCompras"] == null)
            {
                Session["carritoCompras"] = n_Compra.CrearCarrito();
            }

            if (!IsPostBack)
            {            
                agregarCarrito();
                cargarDropDown();
                actualizarCarrito();
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

        }

        public void agregarCarrito()
        {
            n_Compra n_compra = new n_Compra();
            n_Juego n_juego = new n_Juego();

            String id_juego = Request.QueryString["cod"];
            n_compra.agregarCarrito((DataTable)Session["carritoCompras"], n_juego.ObtenerJuegoId(int.Parse(id_juego)));
        }

        public void actualizarCarrito()
        {
            gvCarrito.DataSource = (DataTable)Session["carritoCompras"];
            gvCarrito.DataBind();
        }

        public void cargarDropDown()
        {
            n_Medio n_medioPago = new n_Medio();
            ddlMedios.DataTextField = "Descripcion";
            ddlMedios.DataValueField = "Cod_MPago";
            ddlMedios.DataSource = n_medioPago.getTabla();
            ddlMedios.DataBind();
            ddlMedios.Items.Insert(0, "---Nada selecionado---");
        }

        protected void gvCarrito_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int pos = int.Parse(e.CommandArgument.ToString());
                n_Compra n_compra = new n_Compra();
                n_compra.eliminarCarrito((DataTable)Session["carritoCompras"], pos);
                actualizarCarrito();
            }
        }
    }
}
