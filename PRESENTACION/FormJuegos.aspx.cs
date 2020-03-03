using System;
using System.IO;
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
                cargarDDL();
            }
        }

        public void cargarGrilla()
        {
            n_Juego n_juego = new n_Juego();
            gvJuegos.DataSource = n_juego.getTabla();
            gvJuegos.DataBind();
        }

        public void cargarGrilla(String nombre)
        {
            n_Juego n_juego = new n_Juego();
            gvJuegos.DataSource = n_juego.getTabla(nombre);
            gvJuegos.DataBind();
        }

        public void cargarDDL()
        {
            n_Genero n_genero = new n_Genero();
            ddlGenero.DataTextField = "NombreGenero";
            ddlGenero.DataValueField = "Cod_Genero";
            ddlGenero.DataSource = n_genero.getTablaG();
            ddlGenero.DataBind();
            ddlGenero.Items.Insert(0, "---Nada selecionado---");
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
            Juego juego = new Juego();

            String s_Nombre = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtNombre_edit")).Text;
            String s_Cod = ((Label)gvJuegos.Rows[e.RowIndex].FindControl("lblEditCod")).Text;
            String s_Descripcion = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtDescrip_edit")).Text;
            String s_Fecha = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtFecha_edit")).Text;
            String s_Desarrollador = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtDesarrollador_edit")).Text;
            String s_Distribuidor = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtDestribuidor_edit")).Text;
            String s_Genero = ((DropDownList)gvJuegos.Rows[e.RowIndex].FindControl("DDLGeneros")).SelectedValue;
            String s_Idioma = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtIdioma_edit")).Text;
            String s_Precio = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtPrecio_edit")).Text;            
            String s_Clasificacion = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtClasificacion_edit")).Text;
            String s_Pagina = ((TextBox)gvJuegos.Rows[e.RowIndex].FindControl("txtPagina_edit")).Text;

            String rutaBase;
            try
            {
                String pathCarpeta = @"img\covers\";
                String savePath = Server.MapPath("~") + pathCarpeta;
                String fileName = ((FileUpload)gvJuegos.Rows[e.RowIndex].FindControl("fuImagen_Edit")).FileName;
                String pathCompleta = savePath + fileName;
                ((FileUpload)gvJuegos.Rows[e.RowIndex].FindControl("fuImagen_Edit")).SaveAs(pathCompleta);
                rutaBase = "~/img/covers/" + fileName;
            }
            catch (DirectoryNotFoundException dirEx)
            {
                System.Diagnostics.Debug.WriteLine("Archivo no encontrado: " + dirEx.Message);
                rutaBase = ((Label)gvJuegos.Rows[e.RowIndex].FindControl("lblRutaEdit")).Text;
            }
                           
            juego.nombre = s_Nombre;
            juego.id_juego = int.Parse(s_Cod);
            juego.descripcion = s_Descripcion;
            juego.fecha_lanzamiento = DateTime.Parse(s_Fecha);
            juego.desarrollador = s_Desarrollador;
            juego.distribuidor = s_Distribuidor;
            juego.cod_genero = int.Parse(s_Genero);
            juego.idioma = s_Idioma;
            juego.precio = float.Parse(s_Precio);
            juego.clasificacion = s_Clasificacion;
            juego.pagina = s_Pagina;
            juego.estado = true;
            
            juego.ruta_imagen = rutaBase;            

            n_Juego n_juego = new n_Juego();
            n_juego.editarJuego(juego);

            gvJuegos.EditIndex = -1;
            cargarGrilla();
        }

        protected void gvJuegos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String s_Cod = ((Label)gvJuegos.Rows[e.RowIndex].FindControl("lblCod")).Text;
            DateTime nullValue = new DateTime();

            Juego juego = new Juego();
            juego.nombre = "";
            juego.id_juego = int.Parse(s_Cod);
            juego.descripcion = "";
            juego.fecha_lanzamiento = nullValue;
            juego.desarrollador = "";
            juego.distribuidor = "";
            juego.cod_genero = 0;
            juego.idioma = "";
            juego.precio = 0;
            juego.ruta_imagen = "";
            juego.clasificacion = "";
            juego.pagina = "";
            juego.estado = false;

            n_Juego n_juego = new n_Juego();
            n_juego.eliminarJuego(juego);

            cargarGrilla();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (rfv1.IsValid && rfv2.IsValid && rfv3.IsValid && rfv4.IsValid && rfv5.IsValid && rfv6.IsValid && rfv7.IsValid
                && rfv8.IsValid && rfv9.IsValid && rfv10.IsValid && rfv11.IsValid && revFecha.IsValid && revPrecio.IsValid)
            {
                String pathCarpeta = @"img\covers\";
                String savePath = Server.MapPath("~") + pathCarpeta;
                String fileName = fileImagen.FileName;
                String pathCompleta = savePath + fileName;

                Juego juego = new Juego();
                n_Juego n_juego = new n_Juego();

                juego.nombre = txtNombre.Text;
                juego.descripcion = txtDescripcion.Text;
                juego.clasificacion = txtClasificacion.Text;
                juego.desarrollador = txtDesarrollador.Text;
                juego.distribuidor = txtDistribuidor.Text;
                juego.fecha_lanzamiento = DateTime.Parse(txtFecha.Text);
                juego.cod_genero = int.Parse(ddlGenero.SelectedValue);
                juego.pagina = txtPagina.Text;
                juego.idioma = txtIdioma.Text;
                juego.precio = float.Parse(txtPrecio.Text);
                juego.id_juego = 0;
                juego.estado = true;

                String rutaBase = "~/img/covers/" + fileName;
                juego.ruta_imagen = rutaBase;

                if (n_juego.existeJuego(juego.nombre))
                {
                    juego.id_juego = int.Parse(n_juego.getTablaPorNombre(juego.nombre));
                    if (n_juego.editarJuego(juego))
                    {
                        lblExito.Text = "Exito al agregar";
                        lblExito.ForeColor = System.Drawing.Color.Green;
                        vaciarTextBox();
                        cargarGrilla();
                    }
                    else
                    {
                        vaciarTextBox();
                        lblExito.Text = "Error al agregar.";
                        lblExito.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    if (n_juego.agregarJuego(juego))
                    {
                        fileImagen.SaveAs(pathCompleta);
                        lblExito.Text = "Exito al agregar";
                        lblExito.ForeColor = System.Drawing.Color.Green;
                        lblValidacion.Text = "";
                        vaciarTextBox();
                        cargarGrilla();
                    }
                    else
                    {
                        vaciarTextBox();
                        lblExito.Text = "Error al agregar.";
                        lblExito.ForeColor = System.Drawing.Color.Red;
                    }
                }                
            }
            else if (!revFecha.IsValid)
            {
                lblValidacion.Text = "";
            }
            else
                lblValidacion.Text = "Campos obligatorios";
        }

        public void vaciarTextBox()
        {
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtFecha.Text = "";
            txtDesarrollador.Text = "";
            txtDistribuidor.Text = "";
            txtIdioma.Text = "";
            txtPrecio.Text = "";
            txtClasificacion.Text = "";
            txtPagina.Text = "";
            ddlGenero.SelectedIndex = 0;
            fileImagen.Dispose();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if(rfvBuscar.IsValid) 
            {
                String nombre = txtBuscar.Text;
                cargarGrilla(nombre);
            }            
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            cargarGrilla();
            txtBuscar.Text = "";
        }
    }
}