using CapaDatos;
using CapaEntidad;
using System.Collections.Generic;

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
        public int Registrar(Usuarios obj, out string Mensaje)
        {
            // Generar clave y convertir a hash
            string clave = CN_Recursos.GenerarClave();
            obj.Contrasena = CN_Recursos.ConvertirSha256(clave); // Convertir contraseña a SHA-256
            int resultado = objCapaDato.Registrar(obj, out Mensaje);

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

        // Método para editar un usuario
        public bool Editar(Usuarios obj, out string Mensaje)
        {
            return objCapaDato.Editar(obj, out Mensaje);
        }

        // Método para eliminar un usuario
        public bool Eliminar(int id, out string Mensaje)
        {
            return objCapaDato.Eliminar(id, out Mensaje);
        }

        // Método para cambiar la clave de un usuario
        public bool CambiarClave(int UsuarioID, string nuevaClave, out string Mensaje)
        {
            return objCapaDato.CambiarClave(UsuarioID, nuevaClave, out Mensaje);
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
