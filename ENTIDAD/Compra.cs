﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class Compra
    {
        private int i_codCompra;
        private int i_codMedio;
        private DateTime d_fechaCompra;
        private int i_numeroJuegos;
        private bool b_estado;
        private int i_precioTotal;

        public int cod_compra
        {
            set { i_codCompra = value; }
            get { return i_codCompra; }
        }

        public int cod_medio
        {
            set { i_codMedio = value; }
            get { return i_codMedio; }
        }

        public DateTime fecha_compra
        {
            set { d_fechaCompra = value; }
            get { return d_fechaCompra; }
        }

        public int numero_juegos
        {
            set { i_numeroJuegos = value; }
            get { return i_numeroJuegos; }
        }

        public bool estado
        {
            set { b_estado = value; }
            get { return b_estado; }
        }

        public int precioTotal
        {
            set { i_precioTotal = value; }
            get { return i_precioTotal; }
        }
    }
}