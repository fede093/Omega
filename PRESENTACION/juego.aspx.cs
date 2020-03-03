using System;
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
    public partial class juego : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioLogeado"] == null)
            {                
                controles_compra.Visible = false;
            }
            else
            {                
                controles_compra.Visible = true;
            }

            VisibilidadReview();

            if (!IsPostBack)
            {
                String id = Request.QueryString["cod"];

                cargarImagen(int.Parse(id));
                cargarDetalles(int.Parse(id));
                cargarDescripcion(int.Parse(id));
                cargarListReview(int.Parse(id));
            }
        }

        public void cargarListReview(int cod)
        {
            n_Review n_review = new n_Review();
            lvReview.DataSource = n_review.getTablaReviewJuego(cod);
            lvReview.DataBind();
        }

        public void VisibilidadReview()
        {
            n_ReviewJuego n_reviewJuego = new n_ReviewJuego();
            n_JuegosUsuarios n_juego_usuario = new n_JuegosUsuarios();
            Review_Juego review_juego = new Review_Juego();            

            String id = Request.QueryString["cod"];
            review_juego.cod_juego = int.Parse(id);

            if (Session["UsuarioLogeado"] != null)
                review_juego.cod_usuario = Session["UsuarioLogeado"].ToString();
            else
                review_juego.cod_usuario = "";
           
            if (Session["UsuarioLogeado"] != null && n_reviewJuego.ExisteReviewJuego(review_juego) == false 
                && n_juego_usuario.ExisteCompra(review_juego.cod_usuario, review_juego.cod_juego))            
                EscribirReview.Visible = true;            
            else
                EscribirReview.Visible = false;
        }

        public void cargarImagen(int id)
        {
            n_Juego n_juego = new n_Juego();
            dlImagen.DataSource = n_juego.getTabla(id);
            dlImagen.DataBind();
        }

        public void cargarDetalles(int id)
        {
            n_Juego n_juego = new n_Juego();
            dlDetalles.DataSource = n_juego.getTabla(id);
            dlDetalles.DataBind();
        }

        public void cargarDescripcion(int id)
        {
            n_Juego n_Juego = new n_Juego();
            dlDescripcion.DataSource = n_Juego.getTabla(id);
            dlDescripcion.DataBind();
        }

        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "ClickComprar")
            {
                Response.Redirect("inicio.aspx");
            }
        }

        protected void btnAgregarCarrito_Click(object sender, EventArgs e)
        {
            String id_juego = Request.QueryString["cod"];
            Response.Redirect("CarritoCompras.aspx?cod=" + id_juego);
        }

        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            n_Review n_review = new n_Review();
            Review review = new Review();
            n_ReviewJuego n_reviewJuego = new n_ReviewJuego();
            Review_Juego review_juego = new Review_Juego();

            review = armarReview();

            if (!existeReview())
            {
                n_review.insertarReview(review);

                review_juego = armarReviewJuego();
                if (n_reviewJuego.InsertarReviewJuego(review_juego))
                {
                    lblEstadoReview.Text = "Exito al publicar el review";
                    lblEstadoReview.ForeColor = System.Drawing.Color.Green;                    
                    txtReview.Text = "";                   
                }
                else
                {
                    lblEstadoReview.Text = "Un error inesperado a ocurrido";
                    lblEstadoReview.ForeColor = System.Drawing.Color.Red;
                    txtReview.Text = "";                    
                }
            }
            else
            {
                lblEstadoReview.Text = "Un error inesperado a ocurrido";
                lblEstadoReview.ForeColor = System.Drawing.Color.Red;                
                txtReview.Text = "";
                Response.AppendHeader("Refresh", "5");
            }
        }

        public bool existeReview()
        {
            n_ReviewJuego n_reviewJuego = new n_ReviewJuego();
            Review_Juego review_juego = new Review_Juego();

            review_juego.cod_juego = int.Parse(Request.QueryString["cod"]);
            review_juego.cod_usuario = Session["UsuarioLogeado"].ToString();
            review_juego.cod_review = 0;

            return n_reviewJuego.ExisteReviewJuego(review_juego);
        }

        public Review armarReview()
        {
            Review review = new Review();
            review.cod_review = 0; ///NO SE USA
            review.detalle = txtReview.Text;
            review.estado = true;
            review.fecha_review = DateTime.Now;
            return review;
        }

        public Review_Juego armarReviewJuego()
        {
            Review_Juego review_juego = new Review_Juego();
            n_Review n_review = new n_Review();
            Review review = new Review();

            String id = Request.QueryString["cod"];
            review = n_review.ObtenerUltimoReview();

            review_juego.cod_juego = int.Parse(id);
            review_juego.cod_usuario = Session["UsuarioLogeado"].ToString();
            review_juego.cod_review = review.cod_review;

            return review_juego;
        }       
    }
}