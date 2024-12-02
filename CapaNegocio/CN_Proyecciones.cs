using System.Collections.Generic;
using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class CN_Proyecciones
    {
        private CD_Proyecciones objDatos = new CD_Proyecciones();

        public List<ProyeccionGastos> ObtenerProyeccionesDeGastos()
        {
            return objDatos.ObtenerProyeccionesDeGastos();
        }

        public List<ProyeccionVentas> ObtenerProyeccionesDeVentas()
        {
            return objDatos.ObtenerProyeccionesDeVentas();
        }
    }
}
