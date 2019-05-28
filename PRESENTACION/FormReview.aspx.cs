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
    public partial class FormReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGrilla();
            }
        }

        public void cargarGrilla()
        {
            n_Review n_review = new n_Review();
            gvReviews.DataSource = n_review.getTabla();
            gvReviews.DataBind();
        }

        protected void gvReviews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvReviews.PageIndex = e.NewPageIndex;
            cargarGrilla();
        }

        protected void gvReviews_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //String s_CodJuego = ((Label)gvReviews.Rows[e.RowIndex].FindControl("lblJuego")).Text;
            //String s_CodReview = ((Label)gvReviews.Rows[e.RowIndex].FindControl("lblCod")).Text;
            //String s_Usuario = ((Label)gvReviews.Rows[e.RowIndex].FindControl("lblUsuario")).Text;
            //String s_Review = ((Label)gvReviews.Rows[e.RowIndex].FindControl("lblReview")).Text;
            //Review review = new Review();
            //review.id_juego = int.Parse(s_CodJuego);
            //review.cod_review = int.Parse(s_CodReview);
            //review.cod_usuario = s_Usuario;
            //review.review = s_Review;

            //n_Review n_review = new n_Review();
            //n_review.eliminarReview(review);

            //cargarGrilla();
        }
    }
}