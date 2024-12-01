using CapaEntidad;
using CapaNegocio;
using System.Collections.Generic;
using System.Web.Mvc;

namespace proyectoSoft.Controllers
{

    [Authorize]
    public class RegistroGastosController : Controller
    {
        private CN_RegistroGastos objNegocio = new CN_RegistroGastos();

        public ActionResult VistaRegistroGastos()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListarGastos()
        {
            List<RegistroGastos> lista = objNegocio.Listar();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GuardarGasto(RegistroGastos obj)
        {
            string mensaje = string.Empty;
            int resultado = obj.GastoID == 0
                ? objNegocio.Registrar(obj, out mensaje)
                : objNegocio.Editar(obj, out mensaje) ? obj.GastoID : 0;

            return Json(new { resultado, mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EliminarGasto(int GastoID)
        {
            string mensaje = string.Empty;
            bool respuesta = objNegocio.Eliminar(GastoID, out mensaje);

            return Json(new { resultado = respuesta, mensaje }, JsonRequestBehavior.AllowGet);
        }
    }
}
