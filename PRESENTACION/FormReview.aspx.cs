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

        protected void gvReviews_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvReviews.EditIndex = -1;
            cargarGrilla();
        }

        protected void gvReviews_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvReviews.EditIndex = e.NewEditIndex;
            cargarGrilla();
        }

        protected void gvReviews_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String s_detalle = ((TextBox)gvReviews.Rows[e.RowIndex].FindControl("txtDetalle_edit")).Text;
            String s_fecha = ((TextBox)gvReviews.Rows[e.RowIndex].FindControl("txtFecha_edit")).Text;
            String s_cod = ((Label)gvReviews.Rows[e.RowIndex].FindControl("lblCod")).Text;

            Review review = new Review();
            review.cod_review = int.Parse(s_cod);
            review.fecha_review = DateTime.Parse(s_fecha);
            review.detalle = s_detalle;
            review.estado = true;

            n_Review n_review = new n_Review();
            n_review.editarReview(review);

            gvReviews.EditIndex = -1;
            cargarGrilla();
        }
    }
}