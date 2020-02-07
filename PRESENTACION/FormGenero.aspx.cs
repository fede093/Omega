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
    public partial class FormGenero : System.Web.UI.Page
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
            n_Genero n_gen = new n_Genero();
            gvGeneros.DataSource = n_gen.getTablaG();
            gvGeneros.DataBind();
        }

        protected void gvGeneros_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvGeneros.PageIndex = e.NewPageIndex;
            cargarGrilla();
            lblExito.Text = "";
        }

        protected void gvGeneros_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvGeneros.EditIndex = e.NewEditIndex;
            cargarGrilla();
        }

        protected void gvGeneros_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvGeneros.EditIndex = -1;
            cargarGrilla();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (rfvNombre.IsValid == true)
            {
                Genero gen = new Genero();
                n_Genero n_gen = new n_Genero();
                
                gen.nombre = txtNombre.Text;
                gen.cod_genero = 0;
                gen.estado = true;
                
                if (n_gen.existeGenero(gen.nombre))   ///////////ACA ENTRA SI EXSITE EL GENERO Y A LA VEZ ESTA DADO DE BAJA
                {
                    gen.cod_genero = int.Parse(n_gen.getTablaPorNombre(gen.nombre));
                    if (n_gen.editarGenero(gen))
                    {
                        lblExito.Text = "Exito al agregar";
                        lblExito.ForeColor = System.Drawing.Color.Green;
                        vaciarTextBox();
                        cargarGrilla();
                    }
                    else
                    {
                        lblExito.Text = "Error al agregar.";
                        lblExito.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    if (n_gen.agregarGen(gen))
                    {
                        lblExito.Text = "Exito al agregar.";
                        lblExito.ForeColor = System.Drawing.Color.Green;
                        vaciarTextBox();
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

        public void vaciarTextBox()
        {
            txtNombre.Text = "";
        }

        protected void gvGeneros_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String s_Nombre = ((TextBox)gvGeneros.Rows[e.RowIndex].FindControl("txtEdit_Nombre")).Text;
            String s_Cod = ((Label)gvGeneros.Rows[e.RowIndex].FindControl("lblEdit_Cod")).Text;
            Genero gen = new Genero();
            gen.nombre = s_Nombre;
            gen.cod_genero = int.Parse(s_Cod);
            gen.estado = true;

            n_Genero n_genero = new n_Genero();
            n_genero.editarGenero(gen);

            gvGeneros.EditIndex = -1;
            cargarGrilla();
            lblExito.Text = "";
        }

        protected void gvGeneros_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String s_Nombre = ((Label)gvGeneros.Rows[e.RowIndex].FindControl("lbl_nombre")).Text;
            String s_Cod = ((Label)gvGeneros.Rows[e.RowIndex].FindControl("lbl_Codigo")).Text;
            Genero gen = new Genero();
            gen.nombre = s_Nombre;
            gen.cod_genero = int.Parse(s_Cod);
            gen.estado = false;

            n_Genero n_gen = new n_Genero();
            n_gen.eliminarGenero(gen);

            cargarGrilla();
            lblExito.Text = "";
        }
    }
}