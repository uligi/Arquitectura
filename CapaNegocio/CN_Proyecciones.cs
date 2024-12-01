using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;

namespace CapaNegocio
{
    public class CN_Proyecciones
    {
        private CD_Proyecciones objDatos = new CD_Proyecciones();

        public List<ProyeccionGastos> ObtenerProyeccionesGastos()
        {
            return objDatos.ObtenerProyeccionesGastos();
        }

        public List<ProyeccionVentas> ObtenerProyeccionesVentas(DateTime mesSeleccionado)
        {
            return objDatos.ObtenerProyeccionesVentas(mesSeleccionado);
        }

    }
}
