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
    public partial class usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarList();
                cargarDataList();
            }
        }

        public void cargarList()
        {
            n_Usuario n_usuario = new n_Usuario();
            lvUsuarios.DataSource = n_usuario.getTabla();
            lvUsuarios.DataBind();
        }

        public void cargarList(int cod)
        {
            n_Usuario n_usuario = new n_Usuario();
            lvUsuarios.DataSource = n_usuario.getTabla(cod);
            lvUsuarios.DataBind();
        }

        public void cargarList(String usuario)
        {
            n_Usuario n_usuario = new n_Usuario();
            lvUsuarios.DataSource = n_usuario.getTabla(usuario);
            lvUsuarios.DataBind();
        }

        public void cargarDataList()
        {
            n_Pais n_Pais = new n_Pais();
            dlPaises.DataSource = n_Pais.getTabla();
            dlPaises.DataBind();
        }

        protected void ButtonRefresh_Click(object sender, EventArgs e)
        {
            cargarList();
            txtBuscar.Text = "";
        }

        protected void lbPais_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "comando")
            {
                int cod = int.Parse(e.CommandArgument.ToString());
                cargarList(cod);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String usuario = txtBuscar.Text;
            cargarList(usuario);
        }

        protected void lb_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "LB")
            {
                Session["clickPerfil"] = true;
                Response.Redirect("perfil.aspx?usu=" + e.CommandArgument.ToString());
            }
        }
    }
}