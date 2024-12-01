using CapaNegocio;
using System.Web.Mvc;

namespace proyectoSoft.Controllers
{
    [Authorize]
    public class SistemaCostosController : Controller
    {
        private CN_SistemaCostos objNegocio = new CN_SistemaCostos();

        public ActionResult VistaCostos()
        {
            return View();
        }

        [HttpGet]
        public JsonResult ResumenCostos()
        {
            var lista = objNegocio.ObtenerResumenCostos();
            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }
    }
}
