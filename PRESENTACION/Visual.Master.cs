﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NEGOCIO;
using ENTIDAD;
using System.Data;

namespace PRESENTACION
{
    public partial class Visual : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioLogeado"] != null)
            {
                userLogin.Visible = false;
                n_Usuario n_usuario = new n_Usuario();
                if (n_usuario.esAdministrador(Session["UsuarioLogeado"].ToString()))
                {
                    adminLink.Visible = true;
                }
                else
                    adminLink.Visible = false;

                visibleCarrito();
            }
            else
            {
                perfilUsuario.Visible = false;
                adminLink.Visible = false;
                log_out.Visible = false;
                carritoCompras.Visible = false;
            }
        }

        public void visibleCarrito()
        {
            if (Session["carritoCompras"] == null || ((DataTable)Session["carritoCompras"]).Rows.Count == 0)
            {
                carritoCompras.Visible = false;
            }
            else
            {
                carritoCompras.Visible = true;
            }
        }

        protected void lbLogOut_Click(object sender, EventArgs e)
        {
            Session["UsuarioLogeado"] = null;            
            Response.Redirect("inicio.aspx");
        }

        protected void ButtonCarrito_Click(object sender, EventArgs e)
        {
            Session["ClickCarrito"] = true;
            Response.Redirect("CarritoCompras.aspx");            
        }
    }
}