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
    public partial class FormMedio : System.Web.UI.Page
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
            n_Medio n_medio = new n_Medio();
            gvMedios.DataSource = n_medio.getTabla();
            gvMedios.DataBind();
        }

        protected void gvMedios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedios.PageIndex = e.NewPageIndex;
            cargarGrilla();
            lblExito.Text = "";
        }

        protected void gvMedios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMedios.EditIndex = e.NewEditIndex;
            cargarGrilla();
        }

        protected void gvMedios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedios.EditIndex = -1;
            cargarGrilla();
        }

        protected void gvMedios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String s_Descripcion = ((TextBox)gvMedios.Rows[e.RowIndex].FindControl("txtDescripcion_edit")).Text;
            String s_Cod = ((Label)gvMedios.Rows[e.RowIndex].FindControl("lblCod_edit")).Text;
            MedioPago medio = new MedioPago();
            medio.descripcion = s_Descripcion;
            medio.cod_medio = int.Parse(s_Cod);
            medio.estado = true;

            n_Medio n_medio = new n_Medio();
            n_medio.editarMedio(medio);            

            gvMedios.EditIndex = -1;
            cargarGrilla();
            lblExito.Text = "";
        }

        protected void gvMedios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String s_Descripcion = ((Label)gvMedios.Rows[e.RowIndex].FindControl("lblDescripcion")).Text;
            String s_Cod = ((Label)gvMedios.Rows[e.RowIndex].FindControl("lblCodigo")).Text;
            MedioPago medio = new MedioPago();
            medio.descripcion = s_Descripcion;
            medio.cod_medio = int.Parse(s_Cod);
            medio.estado = false;

            n_Medio n_medio = new n_Medio();
            n_medio.eliminarMedio(medio);

            cargarGrilla();
            lblExito.Text = "";
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (rfvNombre.IsValid == true)
            {
                MedioPago medio = new MedioPago();
                n_Medio n_medio = new n_Medio();

                medio.descripcion = txtNombre.Text;
                medio.cod_medio = 0;
                medio.estado = true;

                if (n_medio.existeMedio(medio.descripcion))
                {                    
                    medio.cod_medio = int.Parse(n_medio.getTablaPorDescripcion(medio.descripcion));
                    if (n_medio.editarMedio(medio))
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
                    if (n_medio.agregarMedio(medio))
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
            }
        }

        public void vaciarTextBox()
        {
            txtNombre.Text = "";
        }
    }
}