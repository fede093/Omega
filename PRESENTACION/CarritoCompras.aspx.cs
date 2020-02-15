using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace PRESENTACION
{
    public partial class CarritoCompras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                actualizarCarrito();
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

        }

        public void actualizarCarrito()
        {
            gvCarrito.DataSource = (DataTable)Session["carritoCompras"];
            gvCarrito.DataBind();
        }
    }
}
