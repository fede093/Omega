﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NEGOCIO;
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
    }
}