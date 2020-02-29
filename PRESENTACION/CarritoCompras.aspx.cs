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
    public partial class CarritoCompras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["carritoCompras"] == null)
            {
                Session["carritoCompras"] = n_Compra.CrearCarrito();
            }

            if (!IsPostBack)
            {
                if (Session["ClickCarrito"] == null || (bool)Session["ClickCarrito"] == false)
                {
                    agregarCarrito();
                }
                else
                {
                    Session["ClickCarrito"] = false;
                }
                
                cargarDropDown();
                actualizarCarrito();
                cargarLabelPrecio();
            }
        }

        public void cargarLabelPrecio()
        {
            DataTable carrito = (DataTable)Session["carritoCompras"];
            lblTotal.Text = precioTotal(carrito).ToString();
        }

        public void agregarCarrito()
        {
            n_Compra n_compra = new n_Compra();
            n_Juego n_juego = new n_Juego();

            String id_juego = Request.QueryString["cod"];
            n_compra.agregarCarrito((DataTable)Session["carritoCompras"], n_juego.ObtenerJuegoId(int.Parse(id_juego)));
        }

        public void actualizarCarrito()
        {
            gvCarrito.DataSource = (DataTable)Session["carritoCompras"];
            gvCarrito.DataBind();
        }

        public void cargarDropDown()
        {
            n_Medio n_medioPago = new n_Medio();
            ddlMedios.DataTextField = "Descripcion";
            ddlMedios.DataValueField = "Cod_MPago";
            ddlMedios.DataSource = n_medioPago.getTabla();
            ddlMedios.DataBind();
            ddlMedios.Items.Insert(0, "---Nada selecionado---");
        }

        protected void gvCarrito_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int pos = int.Parse(e.CommandArgument.ToString());
                n_Compra n_compra = new n_Compra();
                n_compra.eliminarCarrito((DataTable)Session["carritoCompras"], pos);
                lblEstado.Text = "";
                actualizarCarrito();
            }
        }

        protected void btnEjecutarCompra_Click(object sender, EventArgs e)
        {
            n_Compra n_compra = new n_Compra();
            n_JuegosUsuarios n_JuegoUsuario = new n_JuegosUsuarios();
            Compra compra = new Compra();
            juegoXusuario juego_usuario = new juegoXusuario();

            if (rfvMedio.IsValid)
            {
                if (!exiteCompra(Session["UsuarioLogeado"].ToString(), (DataTable)Session["carritoCompras"]))
                {
                    DataTable carrito = (DataTable)Session["carritoCompras"];
                    compra = armarCompra((DataTable)Session["carritoCompras"]);
                    n_compra.ejecutarCompra(compra); /////AGREGA LA COMPRA A LA BASE DE DATOS

                    compra = n_compra.ObtenerUltimaCompra();
                    juego_usuario = armarJuegoUsuario(compra.cod_compra);

                    if (n_JuegoUsuario.InsertaCompra((DataTable)Session["carritoCompras"], juego_usuario))
                    {
                        lblEstado.Text = "Compra exitosa";
                        lblEstado.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblEstado.Text = "Error al comprar";
                        lblEstado.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblEstado.Text = "Juego o juegos ya comprados";
                    lblEstado.ForeColor = System.Drawing.Color.Red;
                }  
            }
        }

        public Compra armarCompra(DataTable carrito)
        {
            Compra compra = new Compra();
            compra.cod_compra = 0; //NO SE USA
            compra.cod_medio = int.Parse(ddlMedios.SelectedValue);
            compra.fecha_compra = DateTime.Now;
            compra.numero_juegos = carrito.Rows.Count;
            compra.estado = true;
            compra.precioTotal = int.Parse(lblTotal.Text);
            return compra;
        }

        public juegoXusuario armarJuegoUsuario(int cod)
        {            
            juegoXusuario juego_usuario = new juegoXusuario();

            juego_usuario.cod_compra = cod;
            juego_usuario.id_juego = 0; //NO SE USA
            juego_usuario.usuario = Session["UsuarioLogeado"].ToString();

            return juego_usuario;
        }

        public bool exiteCompra(String usuario, DataTable carrito)
        {
            bool bandera = false;            
            n_JuegosUsuarios n_juegoUsuario = new n_JuegosUsuarios();

            for(int i=0;i<carrito.Rows.Count;i++)
            {
                int cod = int.Parse(carrito.Rows[i]["Codigo del juego"].ToString());                
                bandera = n_juegoUsuario.ExisteCompra(usuario, cod);
                if (bandera == true)
                    break;                
            }
            return bandera;
        }

        public int precioTotal(DataTable carrito)
        {
            int precioTotal = 0;
            int precioIndividual = 0;
            for(int i = 0; i < carrito.Rows.Count; i++)
            {
                precioIndividual = int.Parse(carrito.Rows[i]["Precio"].ToString());
                precioTotal += precioIndividual;
            }
            return precioTotal;
        }
    }
}
