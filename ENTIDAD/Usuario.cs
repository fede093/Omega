using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDAD
{
    public class Usuario
    {
        private String s_usuario;
        private String s_nombre;
        private String s_apellido;
        private String s_email;
        private String s_contra;
        private String s_telefono;
        private int i_codPais;
        
        public String usuario
        {
            set { s_usuario = value; }
            get { return s_usuario; }
        }

        public String nombre
        {
            set { s_nombre = value; }
            get { return s_nombre; }
        }

        public String apelido
        {
            set { s_apellido = value; }
            get { return s_apellido; }
        }

        public String email
        {
            set { s_email = value; }
            get { return s_email; }
        }

        public String contra
        {
            set { s_contra = value; }
            get { return s_contra; }
        }

        public String telefono
        {
            set { s_telefono = value; }
            get { return s_telefono; }
        }

        public int cod_pais
        {
            set { i_codPais = value; }
            get { return i_codPais; }
        }
    }
}
