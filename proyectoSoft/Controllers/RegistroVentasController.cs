using CapaEntidad;
using CapaNegocio;
using System.Collections.Generic;
using System.Web.Mvc;

namespace proyectoSoft.Controllers
{
    [Authorize]
    public class RegistroVentasController : Controller
    {
        private CN_RegistroVentas objNegocio = new CN_RegistroVentas();

        public ActionResult VistaRegistroVentas()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListarVentas()
        {
            List<RegistroVentas> lista = objNegocio.Listar();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GuardarVenta(RegistroVentas obj)
        {
            string mensaje = string.Empty;
            int resultado = obj.VentaID == 0
                ? objNegocio.Registrar(obj, out mensaje)
                : objNegocio.Editar(obj, out mensaje) ? obj.VentaID : 0;

            return Json(new { resultado, mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EliminarVenta(int VentaID)
        {
            string mensaje = string.Empty;
            bool respuesta = objNegocio.Eliminar(VentaID, out mensaje);

            return Json(new { resultado = respuesta, mensaje }, JsonRequestBehavior.AllowGet);
        }
    }
}
