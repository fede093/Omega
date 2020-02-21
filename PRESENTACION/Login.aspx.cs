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
    public partial class login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            String usuario = txtNombre.Text;
            String clave = txtContra.Text;
            n_Usuario n_usuario = new n_Usuario();
            if (n_usuario.estaRegistrado(usuario, clave))
            {
                Session["UsuarioLogeado"] = txtNombre.Text;
                Response.Redirect("inicio.aspx");                
            }              
            else
            {
                lblError.Text = "Usuario no registrado o contraseña incorrecta";
            }             
        }
    }
}