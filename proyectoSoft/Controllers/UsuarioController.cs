using CapaEntidad;
using CapaNegocio;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace proyectoSoft.Controllers
{
    [Authorize]
    public class UsuarioController : Controller
    {
        private CN_Usuario objUsuarioNegocio = new CN_Usuario();

        // Acción para mostrar la vista de usuarios
        public ActionResult Usuarios()
        {
            return View();
        }

        // Método para listar usuarios (GET)
        [HttpGet]
        public JsonResult ListarUsuarios()
        {
            List<Usuarios> lista = objUsuarioNegocio.Listar();
            var result = lista.Select(u => new
            {
                UsuarioID = u.UsuarioID,
                Cedula = u.Cedula,
                Apellido = u.Persona.Apellido,
                Nombre = u.Persona.Nombre,
                Rol = u.Rol.Rol,
                Correo = u.Persona.Correo,
                Activo = u.Activo,
                FechaCreacion = u.FechaCreacion.ToString("yyyy-MM-dd")
            }).ToList();
            return Json(new { data = result }, JsonRequestBehavior.AllowGet);
        }

        // Método para guardar un usuario (POST)
        [HttpPost]
        public JsonResult GuardarUsuario(Usuarios usuario)
        {
            string mensaje = string.Empty;
            object resultado;
            if (usuario.UsuarioID == 0)
            {
                // Nuevo registro
                resultado = objUsuarioNegocio.Registrar(usuario, out mensaje);
            }
            else
            {
                // Edición de usuario existente
                resultado = objUsuarioNegocio.Editar(usuario, out mensaje);
            }
            return Json(new { resultado = resultado, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }

        // Método para eliminar un usuario (POST)
        [HttpPost]
        public JsonResult EliminarUsuario(int usuarioID)
        {
            string mensaje = string.Empty;
            bool resultado = objUsuarioNegocio.Eliminar(usuarioID, out mensaje);
            return Json(new { resultado, mensaje }, JsonRequestBehavior.AllowGet);
        }

        // Método para desactivar un usuario (POST)
        [HttpPost]
        public JsonResult DesactivarUsuario(int usuarioID)
        {
            string mensaje = string.Empty;
            bool resultado = objUsuarioNegocio.DesactivarUsuario(usuarioID, out mensaje);
            return Json(new { resultado, mensaje }, JsonRequestBehavior.AllowGet);
        }

        // Método para restablecer la contraseña de un usuario (POST)
        [HttpPost]
        public ActionResult RestablecerContrasena(int UsuarioID)
        {
            Usuarios oUsuario = objUsuarioNegocio.Listar().FirstOrDefault(u => u.UsuarioID == UsuarioID);

            if (oUsuario == null)
            {
                ViewBag.Error = "No se encontró el usuario";
                return View();
            }

            string mensaje = string.Empty;
            bool respuesta = objUsuarioNegocio.RestablecerContrasena(oUsuario.UsuarioID, oUsuario.Persona.Correo, out mensaje);

            if (respuesta)
            {
                ViewBag.Error = null;
                return RedirectToAction("Index", "Acceso");
            }
            else
            {
                ViewBag.Error = mensaje;
                return View();
            }
        }

        // Método para listar roles (GET)
        public JsonResult ListarRoles()
        {
            List<Roles> lista = new CN_Roles().Listar();
            var result = lista.Select(r => new
            {
                r.RolID,
                r.Rol
            }).ToList();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

      
    }
}
