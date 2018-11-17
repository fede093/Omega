using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class Juego
    {
        private int i_idJuego;
        private String s_nombre;
        private String s_descripcion;
        private DateTime d_fechaLanzamiento;
        private String s_desarrollador;
        private String s_distribuidor;
        private int i_codGenero;
        private String s_idioma;
        private float f_precio;
        private String s_rutaImagen;
        private String s_clasificacion;
        private String s_pagina;

        public Juego()
        {

        }

        public int id_juego
        {
            set { i_idJuego = value; }
            get { return i_idJuego; }
        }

        public String nombre
        {
            set { s_nombre = value; }
            get { return s_nombre; }
        }

        public String descripcion
        {
            set { s_descripcion = value; }
            get { return s_descripcion; }
        }

        public DateTime fecha_lanzamiento
        {
            set { d_fechaLanzamiento = value; }
            get { return d_fechaLanzamiento; }
        }

        public String desarrollador
        {
            set { s_desarrollador = value; }
            get { return s_desarrollador; }
        }

        public String distribuidor
        {
            set { s_distribuidor = value; }
            get { return s_distribuidor; }
        }

        public int cod_genero
        {
            set { i_codGenero = value; }
            get { return i_codGenero; }
        }

        public String idioma
        {
            set { s_idioma = value; }
            get { return s_idioma; }
        }

        public float precio
        {
            set { f_precio = value; }
            get { return f_precio; }
        }

        public String ruta_imagen
        {
            set { s_rutaImagen = value; }
            get { return s_rutaImagen; }
        }

        public String clasificacion
        {
            set { s_clasificacion = value; }
            get { return s_clasificacion; }
        }

        public String pagina
        {
            set { s_pagina = value; }
            get { return s_pagina; }
        }
    }
}
