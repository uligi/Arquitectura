using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;

namespace CapaNegocio
{
    public class CN_RegistroVentas
    {
        private CD_RegistroVentas objCapaDatos = new CD_RegistroVentas();

        public List<RegistroVentas> Listar()
        {
            return objCapaDatos.Listar();
        }

        public int Registrar(RegistroVentas obj, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Descripcion) || obj.Monto <= 0 || obj.FechaVenta == DateTime.MinValue)
            {
                mensaje = "Todos los campos son obligatorios.";
                return 0;
            }

            return objCapaDatos.Registrar(obj, out mensaje);
        }

        public bool Editar(RegistroVentas obj, out string mensaje)
        {
            mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Descripcion) || obj.Monto <= 0 || obj.FechaVenta == DateTime.MinValue)
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
