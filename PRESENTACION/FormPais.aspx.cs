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
    public partial class FormPais : System.Web.UI.Page
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
            n_Pais n_pa = new n_Pais();
            gvPaises.DataSource = n_pa.getTabla();
            gvPaises.DataBind();
        }

        protected void gvPaises_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPaises.PageIndex = e.NewPageIndex;
            cargarGrilla();
            lblExito.Text = "";
        }

        protected void gvPaises_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPaises.EditIndex = e.NewEditIndex;
            cargarGrilla();
        }

        protected void gvPaises_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPaises.EditIndex = -1;
            cargarGrilla();
        }

        protected void gvPaises_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String s_Nombre = ((TextBox)gvPaises.Rows[e.RowIndex].FindControl("txtPais_edit")).Text;
            String s_Cod = ((Label)gvPaises.Rows[e.RowIndex].FindControl("lblCod_edit")).Text;
            Pais pais = new Pais();
            pais.nombre = s_Nombre;
            pais.cod_pais = int.Parse(s_Cod);

            n_Pais n_pais = new n_Pais();
            n_pais.editarPais(pais);

            gvPaises.EditIndex = -1;
            cargarGrilla();
            lblExito.Text = "";
        }

        protected void gvPaises_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String s_Nombre = ((Label)gvPaises.Rows[e.RowIndex].FindControl("lblNombre")).Text;
            String s_Cod = ((Label)gvPaises.Rows[e.RowIndex].FindControl("lblCod")).Text;
            Pais pais = new Pais();
            pais.nombre = s_Nombre;
            pais.cod_pais = int.Parse(s_Cod);

            n_Pais n_pais = new n_Pais();
            n_pais.eliminarPais(pais);

            cargarGrilla();
            lblExito.Text = "";
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (rfvNombre.IsValid == true)
            {
                Pais pais = new Pais();
                pais.nombre = txtPais.Text;
                pais.cod_pais = 0;

                n_Pais n_pais = new n_Pais();
                if (n_pais.agregarPais(pais))
                {
                    lblExito.Text = "Exito al agregar";
                    lblExito.ForeColor = System.Drawing.Color.Green;
                    cargarGrilla();
                }

                else
                {
                    lblExito.Text = "Error al agregar.";
                    lblExito.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}