using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class Review
    {
        private int i_codReview;
        private String s_detalle;
        private DateTime d_fechaReview;
        private bool b_estado;

        public int cod_review
        {
            set { i_codReview = value; }
            get { return i_codReview; }
        }

        public  String detalle
        {
            set { s_detalle = value; }
            get { return s_detalle; }
        }

        public DateTime fecha_review
        {
            set { d_fechaReview = value; }
            get { return d_fechaReview; }
        }

        public bool estado
        {
            set { b_estado = value; }
            get { return b_estado; }
        }
    }
}
