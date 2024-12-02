using System.Web.Mvc;
using CapaNegocio;
using CapaEntidad;

namespace proyectoSoft.Controllers
{
    [Authorize]
    public class ProyeccionesController : Controller
    {
        private CN_Proyecciones objNegocio = new CN_Proyecciones();

        public ActionResult ProyeccionesGastos()
        {
            return View();
        }

        public ActionResult ProyeccionesVentas()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ObtenerProyeccionesGastos()
        {
            var data = objNegocio.ObtenerProyeccionesDeGastos();
            return Json(new { data }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult ObtenerProyeccionesVentas()
        {
            var data = objNegocio.ObtenerProyeccionesDeVentas();
            return Json(new { data }, JsonRequestBehavior.AllowGet);
        }
    }
}
