using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

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
            List<ProyeccionGastos> lista = objNegocio.ObtenerProyeccionesGastos();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult ObtenerProyeccionesVentas(string mes)
        {
            // Convertir "yyyy-MM" a DateTime con el primer día del mes
            if (DateTime.TryParseExact(mes + "-01", "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out DateTime fechaInicio))
            {
                // Pasar el valor convertido al método de negocio
                List<ProyeccionVentas> lista = objNegocio.ObtenerProyeccionesVentas(fechaInicio);
                return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { data = new List<ProyeccionVentas>() }, JsonRequestBehavior.AllowGet);
            }
        }

    }
}
