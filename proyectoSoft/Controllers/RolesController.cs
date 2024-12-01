using CapaEntidad;
using CapaNegocio;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Mvc;

namespace proyectoSoft.Controllers
{
    [Authorize]
    public class RolesController : Controller
    {
        private CN_Roles objRolesNegocio = new CN_Roles();

        // Acción para mostrar la vista de roles
        public ActionResult Roles()
        {
            return View();
        }

        // Método para listar roles (GET)
        [HttpGet]
        public JsonResult ListarRoles()
        {
            List<Roles> lista = objRolesNegocio.Listar();
            var result = lista.Select(r => new
            {
                RolID = r.RolID,
                Rol = r.Rol,
                Descripcion = r.Descripcion
            }).ToList();
            return Json(new { data = result }, JsonRequestBehavior.AllowGet);
        }

        // Método para guardar un rol (POST)
        [HttpPost]
        public JsonResult GuardarRol(Roles rol)
        {
            if (rol == null)
            {
                // Registrar el contenido del cuerpo para depuración
                string body = new StreamReader(Request.InputStream).ReadToEnd();
                return Json(new { resultado = false, mensaje = $"El objeto rol no puede ser nulo. Body: {body}" }, JsonRequestBehavior.AllowGet);
            }

            string mensaje = string.Empty;
            object resultado;

            if (rol.RolID == 0)
            {
                // Nuevo registro
                resultado = objRolesNegocio.Registrar(rol, out mensaje);
            }
            else
            {
                // Edición de rol existente
                resultado = objRolesNegocio.Editar(rol, out mensaje);
            }

            return Json(new { resultado = resultado, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }




        // Método para eliminar un rol (POST)
        [HttpPost]
        public JsonResult EliminarRol(int RolID)
        {
            string mensaje = string.Empty;
            bool resultado = objRolesNegocio.Eliminar(RolID, out mensaje);
            return Json(new { resultado, mensaje }, JsonRequestBehavior.AllowGet);
        }
    }
}
