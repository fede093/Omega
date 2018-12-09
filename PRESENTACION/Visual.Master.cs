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
    public partial class Visual : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioLogeado"] != null)
            {
                userLogin.Visible = false;
                n_Usuario n_usuario = new n_Usuario();
                if (n_usuario.esAdministrador(Session["UsuarioLogeado"].ToString()))
                {
                    adminLink.Visible = true;
                }
                else
                    adminLink.Visible = false;
            }
            else
            {
                perfilUsuario.Visible = false;
                adminLink.Visible = false;
                log_out.Visible = false;
            }

        }

        protected void lbLogOut_Click(object sender, EventArgs e)
        {
            Session["UsuarioLogeado"] = null;
            //Page.Response.Redirect(Page.Request.Url.ToString(), true);
            Response.Redirect("inicio.aspx");
        }
    }
}