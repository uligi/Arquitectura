using CapaEntidad;
using CapaNegocio;
using System.Collections.Generic;
using System.Web.Mvc;

namespace proyectoSoft.Controllers
{

    [Authorize]
    public class CuentasContablesController : Controller
    {

        private CN_CuentasContables objNegocio = new CN_CuentasContables();

        // GET: CuentasContables
        public ActionResult VistaCuentasContables()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ListarCuentas()
        {
            List<CuentaContable> lista = objNegocio.Listar();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GuardarCuenta(CuentaContable obj)
        {
            string mensaje = string.Empty;
            int resultado = obj.CuentaID == 0
                ? objNegocio.Registrar(obj, out mensaje)
                : objNegocio.Editar(obj, out mensaje) ? obj.CuentaID : 0;

            return Json(new { resultado, mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EliminarCuenta(int CuentaID)
        {
            string mensaje = string.Empty;
            bool respuesta = objNegocio.Eliminar(CuentaID, out mensaje);

            return Json(new { resultado = respuesta, mensaje }, JsonRequestBehavior.AllowGet);
        }
    }
}