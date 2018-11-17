using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PRESENTACION
{
    public partial class Admi : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbGeneros_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormGenero.aspx");
        }

        protected void lbPais_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormPais.aspx");
        }

        protected void lbMedio_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormMedio.aspx");
        }

        protected void lbJuegos_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormJuegos.aspx");
        }

        protected void lbUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormUsuarios.aspx");
        }

        protected void lbCompras_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormCompras.aspx");
        }

        protected void lbReview_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormReview.aspx");
        }
    }
}