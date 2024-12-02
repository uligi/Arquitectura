using CapaDatos;
using CapaEntidad;
using System.Collections.Generic;
using System.Linq;

namespace CapaNegocio
{
    public class CN_Usuario
    {
        private CD_Usuario objCapaDato = new CD_Usuario();

        // Método para listar usuarios
        public List<Usuarios> Listar()
        {
            return objCapaDato.Listar();
        }

        // Método para registrar un nuevo usuario
        public int Registrar(Usuarios obj, out string mensaje)
        {

            if (!ValidarCedula(obj.Cedula.ToString(), out mensaje))
            {
                return 0; // Indica que la validación de la cédula falló
            }
            // Generar clave y convertir a hash
            string clave = CN_Recursos.GenerarClave();
            obj.Contrasena = CN_Recursos.ConvertirSha256(clave); // Convertir contraseña a SHA-256

            int resultado = objCapaDato.Registrar(obj, out mensaje);

            if (resultado > 0)
            {
                // Enviar correo al usuario con la contraseña generada
                if (obj.Persona != null && obj.Persona.Correo != null)
                {
                    string asunto = "Bienvenido al Sistema";
                    string mensajeCorreo = $"Su nueva contraseña es: {clave}";
                    CN_Recursos.EnviarCorreo(obj.Persona.Correo, asunto, mensajeCorreo);
                }
            }

            return resultado;
        }

        private bool ValidarContrasena(string contrasena, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrWhiteSpace(contrasena))
            {
                mensaje = "La contraseña no puede estar vacía.";
                return false;
            }
            if (contrasena.Length < 8)
            {
                mensaje = "La contraseña debe tener al menos 8 caracteres.";
                return false;
            }
            if (!System.Text.RegularExpressions.Regex.IsMatch(contrasena, "[A-Z]"))
            {
                mensaje = "La contraseña debe contener al menos una letra mayúscula.";
                return false;
            }
            if (!System.Text.RegularExpressions.Regex.IsMatch(contrasena, "[a-z]"))
            {
                mensaje = "La contraseña debe contener al menos una letra minúscula.";
                return false;
            }
            if (!System.Text.RegularExpressions.Regex.IsMatch(contrasena, "[0-9]"))
            {
                mensaje = "La contraseña debe contener al menos un número.";
                return false;
            }
            if (!System.Text.RegularExpressions.Regex.IsMatch(contrasena, "[^a-zA-Z0-9]"))
            {
                mensaje = "La contraseña debe contener al menos un carácter especial.";
                return false;
            }

            return true;
        }

        private bool ValidarCedula(string cedula, out string mensaje)
        {
            mensaje = string.Empty;

            // Verificar que no sea nula ni vacía
            if (string.IsNullOrWhiteSpace(cedula))
            {
                mensaje = "La cédula no puede estar vacía.";
                return false;
            }

            // Verificar que tenga 9 dígitos para nacionales o 10 dígitos para extranjeros
            if (cedula.Length == 9 || cedula.Length == 10)
            {
                if (!cedula.All(char.IsDigit))
                {
                    mensaje = "La cédula debe contener solo dígitos numéricos.";
                    return false;
                }
            }
            else
            {
                mensaje = "La cédula debe tener 9 dígitos para nacionales o 10 para extranjeros.";
                return false;
            }

            return true;
        }

        // Método para editar un usuario
        public bool Editar(Usuarios obj, out string Mensaje)
        {
            // Validar la cédula antes de editar
            if (!ValidarCedula(obj.Cedula.ToString(), out Mensaje))
            {
                return false; // Indica que la validación de la cédula falló
            }

            // Llamar al método de la capa de datos
            return objCapaDato.Editar(obj, out Mensaje);
        }


        // Método para eliminar un usuario
        public bool Eliminar(int id, out string Mensaje)
        {
            return objCapaDato.Eliminar(id, out Mensaje);
        }

        // Método para cambiar la clave de un usuario
        public bool CambiarClave(int UsuarioID, string nuevaClave, out string mensaje)
        {
            if (!ValidarContrasena(nuevaClave, out mensaje))
            {
                return false; // Indica que la validación falló
            }

            nuevaClave = CN_Recursos.ConvertirSha256(nuevaClave);
            return objCapaDato.CambiarClave(UsuarioID, nuevaClave, out mensaje);
        }
    

    // Método para desactivar un usuario (borrado lógico)
    public bool DesactivarUsuario(int id, out string Mensaje)
        {
            return objCapaDato.Eliminar(id, out Mensaje);
        }

        // Método para restablecer la contraseña de un usuario
        public bool RestablecerContrasena(int UsuarioID, string correo, out string Mensaje)
        {
            Mensaje = string.Empty;
            string nuevaClave = CN_Recursos.GenerarClave();
            bool resultado = objCapaDato.RestablecerContrasena(UsuarioID, CN_Recursos.ConvertirSha256(nuevaClave), out Mensaje);

            if (resultado)
            {
                string asunto = "Contraseña Reestablecida";
                string mensajeCorreo = "<h3>Su cuenta fue restablecida correctamente</h3><br><p>Su nueva contraseña es: !clave!</p>";
                mensajeCorreo = mensajeCorreo.Replace("!clave!", nuevaClave);

                bool correoEnviado = CN_Recursos.EnviarCorreo(correo, asunto, mensajeCorreo);

                if (!correoEnviado)
                {
                    Mensaje = "No se pudo enviar el correo";
                    return false;
                }
            }
            else
            {
                Mensaje = "No se pudo restablecer la contraseña";
                return false;
            }

            return resultado;
        }
    }
}
