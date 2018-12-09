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
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDDL();
            }
        }

        public void cargarDDL()
        {
            n_Pais n_pais = new n_Pais();

            ddlPais.DataTextField = "NombrePais";
            ddlPais.DataValueField = "Cod_Pais";
            ddlPais.DataSource = n_pais.getTabla();
            ddlPais.DataBind();
            ddlPais.Items.Insert(0, "");
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            if (rfv1.IsValid && rfv2.IsValid && rfv3.IsValid && rfv4.IsValid && rfv5.IsValid && rvf6.IsValid && rfv7.IsValid)
            {
                Usuario usuario = new Usuario();
                usuario.usuario = txtUsuario.Text;
                usuario.nombre = txtNombre.Text;
                usuario.apelido = txtApellido.Text;
                usuario.contra = txtContra.Text;
                usuario.email = txtEmail.Text;
                usuario.telefono = txtTelefono.Text;
                usuario.administrador = false;
                usuario.cod_pais = int.Parse(ddlPais.SelectedValue);

                n_Usuario n_usuario = new n_Usuario();

                if (n_usuario.agregarUsuario(usuario))
                {
                    lblError.Text = "Exito al agregar";
                    lblError.ForeColor = System.Drawing.Color.Green;
                    //lblValidacion.Text = "";
                }
                else
                {
                    lblError.Text = "Error al agregar.";
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
            }

        }
    }
}