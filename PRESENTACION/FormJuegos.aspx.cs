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
    public partial class FormJuegos : System.Web.UI.Page
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
                cargarGrilla();
            }
        }

        public void cargarGrilla()
        {
            n_Juego n_juego = new n_Juego();
            gvJuegos.DataSource = n_juego.getTabla();
            gvJuegos.DataBind();
        }

        protected void gvMedios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvJuegos.PageIndex = e.NewPageIndex;
            cargarGrilla();
            lblExito.Text = "";
        }

        protected void gvJuegos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvJuegos.EditIndex = e.NewEditIndex;
            cargarGrilla();
        }

        protected void gvJuegos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvJuegos.EditIndex = -1;
            cargarGrilla();
        }

        protected void gvJuegos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String s_Nombre = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtNombre_edit")).Text;
            String s_Cod = ((Label)gvJuegos.Rows[e.RowIndex].FindControl("lblEditCod")).Text;
            String s_Descripcion = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtDescrip_edit")).Text;
            String s_Fecha = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtFecha_edit")).Text;
            String s_Desarrollador = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtDesarrollador_edit")).Text;
            String s_Distribuidor = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtDestribuidor_edit")).Text;
            String s_Genero = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtGenero_edit")).Text;
            String s_Idioma = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtIdioma_edit")).Text;
            String s_Precio = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtPrecio_edit")).Text;
            String s_Ruta = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtRuta_edit")).Text;
            String s_Clasificacion = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtClasificacion_edit")).Text;
            String s_Pagina = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtPagina_edit")).Text;

            Juego juego = new Juego();
            juego.nombre = s_Nombre;
            juego.id_juego = int.Parse(s_Cod);
            juego.descripcion = s_Descripcion;
            juego.fecha_lanzamiento = DateTime.Parse(s_Fecha);
            juego.desarrollador = s_Desarrollador;
            juego.distribuidor = s_Distribuidor;
            juego.cod_genero = int.Parse(s_Genero);
            juego.idioma = s_Idioma;
            juego.precio = float.Parse(s_Precio);
            juego.ruta_imagen = s_Ruta;
            juego.clasificacion = s_Clasificacion;
            juego.pagina = s_Pagina;

            n_Juego n_juego = new n_Juego();
            n_juego.editarJuego(juego);

            gvJuegos.EditIndex = -1;
            cargarGrilla();
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    String pathCarpeta = @"img\covers\";
        //    String savePath = Server.MapPath("~") + pathCarpeta;
        //    String fileName = fileImagen.FileName;
        //    String pathCompleta = savePath + fileName;

        //    fileImagen.SaveAs(pathCompleta);
        //}
    }
}