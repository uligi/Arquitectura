using CapaEntidad;
using CapaNegocio;
using System.Collections.Generic;
using System.Web.Mvc;

namespace proyectoSoft.Controllers
{
    [Authorize]
    public class OrdenesProduccionController : Controller
    {
        private CN_OrdenesProduccion objNegocio = new CN_OrdenesProduccion();

        public ActionResult VistaOrdenesProduccion()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListarOrdenes()
        {
            List<OrdenesProduccion> lista = objNegocio.Listar();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GuardarOrden(OrdenesProduccion obj)
        {
            string mensaje = string.Empty;
            int resultado = obj.OrdenProduccionID == 0
                ? objNegocio.Registrar(obj, out mensaje)
                : objNegocio.Editar(obj, out mensaje) ? obj.OrdenProduccionID : 0;

            return Json(new { resultado, mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EliminarOrden(int OrdenProduccionID)
        {
            string mensaje = string.Empty;
            bool respuesta = objNegocio.Eliminar(OrdenProduccionID, out mensaje);

            return Json(new { resultado = respuesta, mensaje }, JsonRequestBehavior.AllowGet);
        }
    }
}
