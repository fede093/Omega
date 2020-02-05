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
    public partial class FormUsuarios : System.Web.UI.Page
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
            n_Usuario n_usuario = new n_Usuario();
            gvUsuarios.DataSource = n_usuario.getTabla();
            gvUsuarios.DataBind();
        }

        public void cargarDDL()
        {
            n_Pais n_pais = new n_Pais();
            
            ddlPais.DataTextField = "Nombre";
            ddlPais.DataValueField = "Cod_Pais";
            ddlPais.DataSource = n_pais.getTabla();          
            ddlPais.DataBind();
            ddlPais.Items.Insert(0, "---Nada selecionado---");
        }

        protected void gvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsuarios.PageIndex = e.NewPageIndex;
            cargarGrilla();
            lblExito.Text = "";
        }

        protected void gvUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsuarios.EditIndex = e.NewEditIndex;
            cargarGrilla();
        }

        protected void gvUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsuarios.EditIndex = -1;
            cargarGrilla();
        }

        protected void gvUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String s_Usuario = ((Label)gvUsuarios.Rows[e.RowIndex].FindControl("lblUsuario_edit")).Text;
            String s_Nombre = ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("txtNombre_edit")).Text;
            String s_Apellido = ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("txtApellido_edit")).Text;
            String s_Email = ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("txtEmail_edit")).Text;
            String s_Telefono = ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("txtTelefono_edit")).Text;
            String s_Cod = ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("txtPais_edit")).Text;
            String s_Administrador = ((TextBox)gvUsuarios.Rows[e.RowIndex].FindControl("txtAdmi_edit")).Text;

            Usuario usuario = new Usuario();
            usuario.usuario = s_Usuario;
            usuario.nombre = s_Nombre;
            usuario.apelido = s_Apellido;
            usuario.email = s_Email;
            usuario.contra = "";
            usuario.telefono = s_Telefono;
            usuario.cod_pais = int.Parse(s_Cod);
            usuario.administrador = bool.Parse(s_Administrador);
            usuario.estado = true;

            n_Usuario n_usuario = new n_Usuario();
            n_usuario.editarUsuario(usuario);

            gvUsuarios.EditIndex = -1;
            lblExito.Text = "";
            lblValidacion.Text = "";
            cargarGrilla();
        }

        protected void gvUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String s_Usuario = ((Label)gvUsuarios.Rows[e.RowIndex].FindControl("lblUsuario")).Text;

            Usuario usuario = new Usuario();
            usuario.usuario = s_Usuario;
            usuario.nombre = "";
            usuario.apelido = "";
            usuario.telefono = "";
            usuario.email = "";
            usuario.cod_pais = 0;
            usuario.contra = "";
            usuario.administrador = false;

            n_Usuario n_usuario = new n_Usuario();
            n_usuario.eliminarUsuario(usuario);

            lblExito.Text = "";
            lblValidacion.Text = "";
            cargarGrilla();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (rfv1.IsValid && rfv2.IsValid && rfv3.IsValid && rfv4.IsValid && rfv5.IsValid && rfv6
                .IsValid && rfv7.IsValid && rfv8.IsValid && rfv9.IsValid && cmv1.IsValid)
            {
                Usuario usuario = new Usuario();
                usuario.usuario = txtUsuario.Text;
                usuario.nombre = txtNombre.Text;
                usuario.apelido = txtApellido.Text;
                usuario.contra = txtContra.Text;
                usuario.email = txtEmail.Text;
                usuario.telefono = txtTelefono.Text;
                usuario.administrador = bool.Parse(rblAdmi.SelectedItem.ToString());
                usuario.cod_pais = int.Parse(ddlPais.SelectedValue);
                usuario.estado = true;

                n_Usuario n_usuario = new n_Usuario();

                //////////////////  AGREGAR ACA CORRECCION

                if (n_usuario.agregarUsuario(usuario))
                {
                    lblExito.Text = "Exito al agregar";
                    lblExito.ForeColor = System.Drawing.Color.Green;
                    lblValidacion.Text = "";
                    cargarGrilla();
                }
                else
                {
                    lblExito.Text = "Error al agregar.";
                    lblExito.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (!cmv1.IsValid)
            {
                lblValidacion.Text = "";
            }
            else
                lblValidacion.Text = "Campos Obligatorios";
        }
    }
}