using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NEGOCIO;
using ENTIDAD;
using System.Data;
using System.Data.SqlClient;

namespace PRESENTACION
{
    public partial class perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String usuario;

                if (Session["clickPerfil"] != null)
                {
                    usuario = Request.QueryString["usu"];

                }
                else
                {
                    usuario = Session["UsuarioLogeado"].ToString();                    
                }
                cargarLabelUsuario(usuario);
                cargarListDetalles(usuario);
                //cargarListComprados(usuario);
                Session["clickPerfil"] = null;
            }
        }

        public void cargarLabelUsuario(String usuario)
        {      
            n_Usuario n_usuario = new n_Usuario();
            dlUsuario.DataSource = n_usuario.cargarUsuario(usuario);
            dlUsuario.DataBind();
        }

        public void cargarListDetalles(String usuario)
        {
            n_Usuario n_usuario = new n_Usuario();
            dlDetalles.DataSource = n_usuario.cargarUsuario(usuario);
            dlDetalles.DataBind();
        }

        //public void cargarListComprados(String usuario)
        //{
        //    n_Usuario n_usuario = new n_Usuario();
        //    lvComprados.DataSource = n_usuario.getJuegosComprados(usuario);
        //    lvComprados.DataBind();
        //}

        protected void ImageButton2_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Click")
            {
                Response.Redirect("juego.aspx?cod=" + e.CommandArgument.ToString());
            }
        }

        protected void dlDetalles_ItemCommand(object source, DataListCommandEventArgs e)
        {
            String usuario = Session["UsuarioLogeado"].ToString();
            if (e.CommandName == "editar")
            {
                dlDetalles.EditItemIndex = e.Item.ItemIndex;
                cargarListDetalles(usuario);
            }
            if (e.CommandName == "cancelar-edit")
            {
                dlDetalles.EditItemIndex = -1;
                cargarListDetalles(usuario);
            }
            if (e.CommandName == "aceptar-edit")
            {                
                Usuario usu = new Usuario();
                n_Usuario n_usuario = new n_Usuario();
                
                usu = armarUsuario();
                if (n_usuario.editarUsuario(usu))
                {
                    Response.Redirect("perfil.aspx");
                }                
            }
        }

        public Usuario armarUsuario()
        {
            Usuario usuario = new Usuario();
            n_Usuario n_usuario = new n_Usuario();            
            var dataListItem = dlDetalles.Items[dlDetalles.EditItemIndex];
            usuario.usuario = Session["UsuarioLogeado"].ToString();
            usuario.nombre = ((TextBox)dataListItem.FindControl("txtNombre")).Text;
            usuario.apelido = ((TextBox)dataListItem.FindControl("txtApellido")).Text;
            usuario.email = ((TextBox)dataListItem.FindControl("txtEmail")).Text;
            usuario.telefono = ((TextBox)dataListItem.FindControl("txtTelefono")).Text;
            usuario.estado = true;
            usuario.contra = ((TextBox)dataListItem.FindControl("txtContra")).Text;
            String cod = ((DropDownList)dataListItem.FindControl("ddlContra")).SelectedValue;
            usuario.cod_pais = int.Parse(cod);
            usuario.administrador = n_usuario.esAdministrador(Session["UsuarioLogeado"].ToString());

            return usuario;
        }

        protected void dlDetalles_ItemDataBound(object sender, DataListItemEventArgs e)
        {                        
            if(e.Item.ItemType == ListItemType.Item && Session["clickPerfil"] != null)
            {
                Button btn = (Button)e.Item.FindControl("Button1");
                btn.Visible = false;
            }
        }
    }
}