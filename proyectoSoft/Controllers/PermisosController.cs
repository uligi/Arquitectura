using CapaEntidad;
using CapaNegocio;
using System.Collections.Generic;
using System.Web.Mvc;

namespace proyectoSoft.Controllers
{
    [Authorize]
    public class PermisosController : Controller
    {
        private CN_Permisos objNegocio = new CN_Permisos();

        // GET: Permisos
        public ActionResult VistaPermisos()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListarPermisos()
        {
            List<Permisos> lista = objNegocio.Listar();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GuardarPermiso(Permisos obj)
        {
            string mensaje = string.Empty;
            int resultado = 0;

            if (obj.ModuloID == 0)
            {
                resultado = objNegocio.Registrar(obj, out mensaje);
            }
            else
            {
                bool respuesta = objNegocio.Editar(obj, out mensaje);
                resultado = respuesta ? obj.ModuloID : 0;
            }

            return Json(new { resultado, mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EliminarPermisos(int ModuloID)
        {
            string mensaje = string.Empty;
            bool respuesta = objNegocio.Eliminar(ModuloID, out mensaje);

            return Json(new { resultado = respuesta, mensaje }, JsonRequestBehavior.AllowGet);
        }
    }
}
