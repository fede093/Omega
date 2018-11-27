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
    public partial class inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.WebForms;
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "/Scripts/jquery-1.8.0.js"
            });

            if (!IsPostBack)
            {
                cargarDataList();
                cargarList();
            }          
        }

        public void cargarDataList()
        {
            n_Genero n_genero = new n_Genero();
            dlGeneros.DataSource = n_genero.getTablaG();
            dlGeneros.DataBind();
        }

        public void cargarList(String nombre)
        {
            n_Juego n_juego = new n_Juego();
            lvJuegos.DataSource = n_juego.getTabla(nombre);
            lvJuegos.DataBind();
        }

        public void cargarList(int id)
        {
            n_Juego n_juego = new n_Juego();
            lvJuegos.DataSource = n_juego.getTabla(id);
            lvJuegos.DataBind();
        }

        public void cargarList()
        {
            n_Juego n_juego = new n_Juego();
            lvJuegos.DataSource = n_juego.getTabla();
            lvJuegos.DataBind();
        }

        protected void lbGeneros_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "comando")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                //txtBuscar.Text = e.CommandArgument.ToString();
                cargarList(id);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String nombre = txtBuscar.Text;
            cargarList(nombre);
        }

        protected void ButtonRefresh_Click(object sender, EventArgs e)
        {
            cargarList();
            txtBuscar.Text = "";
        }
    }
}