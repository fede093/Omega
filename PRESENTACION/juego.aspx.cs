using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NEGOCIO;

namespace PRESENTACION
{
    public partial class juego : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioLogeado"] == null)
            {
                compra.Visible = false;
            }
            else
            {
                compra.Visible = true;
            }

            if (!IsPostBack)
            {
                String id = Request.QueryString["cod"];
                //System.Diagnostics.Debug.WriteLine(id);

                cargarImagen(int.Parse(id));
                cargarDetalles(int.Parse(id));
                cargarDescripcion(int.Parse(id));
                //cargarddlMedios();
                //cargarPrecio(int.Parse(id));
            }
        }

        public void cargarImagen(int id)
        {
            n_Juego n_juego = new n_Juego();
            dlImagen.DataSource = n_juego.getTabla(id);
            dlImagen.DataBind();
        }

        public void cargarDetalles(int id)
        {
            n_Juego n_juego = new n_Juego();
            dlDetalles.DataSource = n_juego.getTabla(id);
            dlDetalles.DataBind();
        }

        public void cargarDescripcion(int id)
        {
            n_Juego n_Juego = new n_Juego();
            dlDescripcion.DataSource = n_Juego.getTabla(id);
            dlDescripcion.DataBind();
        }

        //public void cargarddlMedios()
        //{
        //    n_Medio n_medio = new n_Medio();
        //    ddlMedios.DataTextField = "Descripcion";
        //    ddlMedios.DataValueField = "Cod_MPago";
        //    ddlMedios.DataSource = n_medio.getTabla();
        //    ddlMedios.DataBind();
        //    ddlMedios.Items.Insert(0, "---Nada selecionado---");
        //}

        //public void cargarPrecio(int id)
        //{
        //    n_Juego n_juego = new n_Juego();
        //    dlPrecio.DataSource = n_juego.getTabla(id);
        //    dlPrecio.DataBind();
        //}

        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "ClickComprar")
            {
                Response.Redirect("inicio.aspx");
            }
        }
    }
}