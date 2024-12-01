using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;

namespace CapaNegocio
{
    public class CN_OrdenesProduccion
    {
        private CD_OrdenesProduccion objCapaDatos = new CD_OrdenesProduccion();

        public List<OrdenesProduccion> Listar()
        {
            return objCapaDatos.Listar();
        }

        public int Registrar(OrdenesProduccion obj, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.DescripcionOrden) || obj.FechaInicio == DateTime.MinValue || obj.CostoTotal <= 0 || obj.MateriaPrima <= 0)
            {
                mensaje = "Todos los campos son obligatorios.";
                return 0;
            }

            return objCapaDatos.Registrar(obj, out mensaje);
        }

        public bool Editar(OrdenesProduccion obj, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.DescripcionOrden) || obj.FechaInicio == DateTime.MinValue || obj.CostoTotal <= 0 || obj.MateriaPrima <= 0)
            {
                mensaje = "Todos los campos son obligatorios.";
                return false;
            }

            return objCapaDatos.Editar(obj, out mensaje);
        }

        public bool Eliminar(int id, out string mensaje)
        {
            return objCapaDatos.Eliminar(id, out mensaje);
        }
    }
}
